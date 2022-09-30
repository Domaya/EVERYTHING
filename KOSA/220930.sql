
alter table temp9
add ename varchar2(50);

desc temp9;

--ename not null 제약 추가
alter table temp9
modify(ename not null);

desc temp9;


select * from user_constraints where lower(table_name)='temp9';
-------------
CHECK(CK)       참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정)
--where 조건과 동일한 형태의 제약
--where gender in ('남','여')
create table temp10(
 id number constraint pk_temp10_id primary key,
 name varchar2(20) not null,
 jumin char(6) constraint uk_temp10_jumin unique,
 addr varchar2(20), 
 age number constraint ck_temp10_age check(age >= 19) -- where age >= 19
);

select * from user_constraints where lower(table_name)='temp10';

insert into temp10(id,name,jumin,addr,age)
values(100,'홍길동','123546','서울시',25);

select * from temp10;
commit;

insert into temp10(id,name,jumin,addr,age)
values(200,'홍길동','123546','서울시',15);
--check constraint (KOSA.CK_TEMP10_AGE) violated


--FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다.
--참조제약 (테이블과 테이블의 관계 설정)
create table c_emp -- ()
as
  select empno , ename , deptno from emp where 1=2;  --테이블의 구조(스키마)

--create table 테이블명 as  select ...
select * from c_emp;

create table c_dept
as
  select deptno , dname from dept where 1=2;
  
select * from c_emp;
select * from c_dept;

--c_emp 테이블에 있는 deptno 는 c_dept테이블에 있는 deptno 컬럼에 있는 데이터만
--쓰겠다

--제약(참조) fk

alter table c_emp
add constraint fk_c_emp_deptno foreign key(depto) references c_dept(deptno);

--foreign key(depto) 성립하기 위해서는 >> c_dept(deptno) >> 믿음을 >> 내 데이터는
-- 무결성해 (중복,null) >> pk >> c_dept(deptno) >> unqiue , primary key

--반드시 c_dept 에 PK 설정되어 있어야 한다
alter table c_dept
add constraint pk_c_dept_deptno primary key(deptno); --신용확보

select * from user_constraints where lower(table_name)='c_dept';

--pk선행되고 나서
alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);

--제약
insert into c_dept(deptno,dname) values(100,'인사팀');
insert into c_dept(deptno,dname) values(200,'관리팀');
insert into c_dept(deptno,dname) values(300,'회계팀');
commit;

select * from c_dept;
select * from c_emp;
--신입사원 입사
insert into c_emp(empno, ename) values(100,'홍길동');
----------------------------------------------------------------------
--deptno 컬럼에 FK 설정되어 있어도 not null 강제하지 않으면 null 허용
--요구사항 정의에 따라서 ....
--입사시 부서를 가지지 않을 수 도 있다

--신입사원은 반드시 부서를 가져야 한다
--create table c_emp(deptno not null  ...fk)

insert into c_emp(empno, ename ,deptno) values(1,'홍길동',100);
select * from c_emp;

insert into c_emp(empno, ename ,deptno) values(2,'김유신',600); 
--ORA-02291: integrity constraint (KOSA.FK_C_EMP_DEPTNO) violated - parent key not found 
commit; 
--------------------------------------------------------------------------------
/*
개발자
테이블과의 주종관계 (부모 , 자식)
c_emp , c_dept [deptno] 관계로 해석하면
부모 (master) : PK (deptno)
자식 (detail) : FK (deptno))

c_dept 에서 100번 부서를 삭제할수 있을까요

100번삭제 .... 순서대로 ....
*/
select * from c_emp;
select * from c_dept;
delete from c_dept where deptno=100;
--ORA-02292: integrity constraint (KOSA.FK_C_EMP_DEPTNO) violated - child record found

--자식에서 ....
delete from c_emp where empno=1;
delete from c_dept where deptno=100;
rollback;

select * from c_emp;
select * from c_dept;

/*
column datatype [CONSTRAINT constraint_name]
 REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE])
column datatype,
. . . . . . . ,
[CONSTRAINT constraint_name] FOREIGN KEY (column1[,column2,..])
 REFERENCES table_name (column1[,column2,..] [ON DELETE CASCADE])


ON DELETE CASCADE : 부모테이블과 생명을 같이 하겠다
--100 번 부서 삭제 : 네
--delete from c_dept where deptno=100
--참조하는 자식테이터 같이 삭제
*/
alter table c_emp
drop constraint fk_c_emp_deptno;

alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno)
ON DELETE CASCADE;

select * from user_constraints where lower(table_name)='c_dept';

select  * from c_emp;
delete from c_emp where deptno=100;
commit;



select * from user_constraints where lower(table_name)='c_emp';
select * from user_constraints where lower(table_name)='c_dept';

select * from c_dept;
select * from c_emp;

insert into c_emp(empno, ename, deptno) values(1,'김유신',100);
commit;

delete from c_dept where deptno=100;

--TIP)
--MS-SQL
--ON DELETE CASCADE
--ON UPDATE CASCADE
--------------------------------------------------------------------------------
--EMP empno  pk
--DEPT deptno pk
--EMP deptno FK



/*
--영문테이블 , 영문 컬럼명
--[학생 성적 테이블]
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다
--이름 NULL 값을 허용하지 않는다
--국어
--영어
--수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--값을 입력하지 않으면 default로 0값을 갖는다
--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다
--학과코드는 학과 테이블에 학과코드를 참조한다
--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드


--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명 은 null값을 허락하지 않는다

--학과코드 , 학과명

--샘플 데이터 insert ..
--그리고 select 결과는
--학번 , 이름 , 총점, 평균 , 학과코드 , 학과명 을 출력하세요

create table grade(
  s_number number ,
  s_name varchar2(20) not null,
  k_score number default 0,
  e_score number default 0,
  m_score number default 0,
  m_code number ,
  avg_score number GENERATED always as (round((k_score + e_score + m_score)/3,2)) VIRTUAL,
  sum_score number GENERATED always as (k_score + e_score + m_score) VIRTUAL,
  
  constraint pk_grade_snum primary key(s_number),
  constraint fk_grade_mcode foreign key(m_code) references major(m_code) 
  --나중에 걸거나 (테이블 생성 후에)
);
 
create table major(
  m_code number,
  m_name varchar2(20) not null,
  constraint pk_major_mcode primary key(m_code)
);
select * from emp;


/* 사원 */
CREATE TABLE EMP (
	empno NUMBER NOT NULL, /* 사번 */
	ename VARCHAR2(20), /* 이름 */
	sal NUMBER, /* 급여 */
	deptno NUMBER /* 부서번호 */
);



/* 부서 */
CREATE TABLE DEPT (
	deptno NUMBER, /* 부서번호 */
	dname VARCHAR2(20) /* 부서명 */
);

ALTER TABLE EMP
ADD CONSTRAINT PK_EMP_EMPNO	PRIMARY KEY (empno);

ALTER TABLE DEPT
ADD CONSTRAINT PK_DEPT_DEPTNO 	PRIMARY KEY (deptno);

ALTER TABLE EMP
ADD CONSTRAINT FK_DEPT_TO_EMP 	FOREIGN KEY (deptno)	REFERENCES DEPT (deptno);

select * from user_constraints where lower(table_name)='emp';
--
--요기까지 초급 과정 완료
--------------------------------------------------------------------------------
--중급( View )
--View 객체 (가상테이블)
--create 생성 ... 생성된 view 영속적으로 저장
/*
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
AS Subquery 
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY]

OR REPLACE       이미 존재한다면 다시 생성한다.
FORCE            Base Table 유무에 관계없이 VIEW 을 만든다.
NOFORCE          기본 테이블이 존재할 경우에만 VIEW 를 생성한다.
view_name         VIEW 의 이름
Alias Subquery 를 통해 선택된 값에 대한 Column 명이 된다.
Subquery SELECT 문장을 기술한다.
WITH CHECK OPTION VIEW 에 의해 액세스 될 수 있는 행만이 입력,갱신될 수 있다. 
Constraint CHECK OPTON 제약 조건에 대해 지정된 이름이다.
WITH READ ONLY 이 VIEW 에서 DML 이 수행될 수 없게 한다
*/
create  view view001
as
  select * from emp;
  
select * from view001;  

--view는 테이블처럼 사용가능한 가상테이블 : 데이터를 가지고 있지 않아요
--view 메모리상에만 존재하는 가상테이블
--subquery -> in line view > from (.....)

--view 가상테이블 
--사용법 : 일반테이블과 사용법이 동일 (select , insert , update , delete)
--단 view가 볼수 있는 데이터에 한해서
--DML(insert , update , delete) -> 단일테이블에 대한 view > DML가능

create OR REPLACE view v_001
as 
   select empno , ename from emp;

select * from v_001; --view가 가지고 있는 sql 문장이 실행

--view  목적
--1. 개발자 편리성 : join, subquery >> view 사용 >> 성능(x) >> 개발자 편리성
--2. 쿼리 단순화 (편리성) : 복잡한 쿼리를 미리 만들어 두고 사용
--3. 보안성 (특정 컬럼만 노출)

--신입사원 입사 >> DBA 권한 부여 부탁 >> 인사정보 >> 특정 컬럼만 노출 >> view
create or replace view v_emp
as
   select empno , ename , job , hiredate from emp;
   
--출근
select * from v_emp;

select * from v_emp where empno=7902;

select * from v_emp where job='CLERK';

--편리성
create  or replace view v_002
as
  select e.empno, e.ename, e.deptno , d.dname
  from emp e join dept d
  on e.deptno = d.deptno;

select * from v_002;  

create view v_003  --자존심 나도 테이블처럼 사용되는데 (컬럼며은 있어야)
as
  select deptno , avg(sal) as avgsal
  from emp
  group by deptno;

select * from v_003; --직종별 평균 급여를 볼 수 있는 view
/*
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
AS Subquery 
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY]

OR REPLACE              이미 존재한다면 다시 생성한다.
FORCE                  Base Table 유무에 관계없이 VIEW 을 만든다.
NOFORCE                기본 테이블이 존재할 경우에만 VIEW 를 생성한다.
view_name                    VIEW 의 이름
Alias Subquery              를 통해 선택된 값에 대한 Column 명이 된다.
Subquery                    SELECT 문장을 기술한다.
WITH CHECK OPTION VIEW      에 의해 액세스 될 수 있는 행만이 입력,갱신될 수 있다. 
Constraint CHECK OPTON      제약 조건에 대해 지정된 이름이다.
WITH READ ONLY              이 VIEW 에서 DML 이 수행될 수 없게 한다
*/
create or replace view v_004
as
  select round(avg(sal),0) as avgsal from emp;
  
select * from v_004;  

/*
view 는 가상 테이블 그런데 view통해서 insert, update , delete가능
단 단일테이블
*/
select * from v_emp;

update v_emp
set sal=0;  --v_emp 는 sal컬럼의 데이터를 볼 수 없어요

update v_emp
set job='IT';

select * from v_emp;
select * from emp;
rollback;
/*
create or replace view v_emp
as
   select empno , ename , job , hiredate from emp;
*/
select * from v_emp;


-- 30번 부서 사원들의  직종, 이름, 월급을 담는 VIEW를 만드는데,
-- 각각의 컬럼명을 직종, 사원이름, 월급으로 ALIAS를 주고 월급이
-- 300보다 많은 사원들만 추출하도록 하라.
create or replace view view101(직종,사원이름,월급)
as
   select job , ename , sal
   from emp
   where deptno=30 and sal > 300;

select * from view101;

--부서별 평균월급을 담는 VIEW를 만들되, 평균월급이 2000 이상인
--부서만 출력하도록 하라.
create or replace view view102
as
  select deptno , avg(sal) as avgsal
  from emp
  group by deptno
  having avg(sal) >=2000;
  
create or replace view view103
as  
  select deptno , avg(sal) as avgsal
  from emp
  group by deptno;

select v.deptno , v.avgsal, d.dname 
from dept d join view103 v
on d.deptno = v.deptno;

----------------------------------------------------------------------------
show user;
--Quiz 
--아래 3개의 테이블 이용하여  문제 3개를 만드세요 
--필수사항) 함수 및 JOIN 퀴리는 반드시 필수 .....
--좋은 문제가 나온 조에게 포상 할게요 ^^
select * from employees;
select * from departments;
select * from locations;

--
