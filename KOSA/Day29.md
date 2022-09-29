---------------------------------------------
--220929
/*
subquery 서브쿼리
오라클.pdf 7장 100p

sql의 꽃...만능 해결사

1.함수 > 단일테이블, 다중 테이블(join, union) >> subquery
*/

--사원테이블에서 사원들의 평균월급보다 많은 월급을 받는 사원의
--사번, 이름, 급여
select empno, ename, sal
from emp
where sal>(select avg(sal) from emp);

--subquery
/*
1.single row subquery : 실행결과가 단일 row 단일 column인 경우
ex) select avg(sal) from emp
연산자 : = != > <

2.multi row subquery : 실행결과가 단일 column, row 여러개인 경우
연산자 : IN, NOT IN, ANY, ALL
ALL : sal > 1000 and sal > 4000 and ...
ANY : sal > 1000 or sal > 4000 or ...
ex) select sal from emp

문법)
1. 괄호 안에 있어야 한다 >> (select max(sal) from emp)
2. 단일 컬럼으로 구성 >> select max(sal), sum(sal) from emp (x)
3. 단독으로 실행 가능

실행순서
1.서브쿼리 먼저 실행
2.결과를 가지고 메인쿼리 실행
--Tip)
select ...(subquery) >> 한개의 행만 반환할 경우(스칼라 서브쿼리)
from (subquery) >> 인라인 뷰
where (subquery) >> 조건절 서브쿼리. 
*/

--사원테이블에서 jones의 급여보다 더 많은 급여를 받는
--사원의 사번, 이름, 급여 출력
select empno, ename, sal
from emp
where sal > (select sal from emp where ename='JONES');


select *
from emp
where sal = (select sal from emp where deptno=30);
--ORA-01427: single-row subquery returns more than one row

select *
from emp
where sal in (select sal from emp where deptno=30);

select *
from emp
where sal not in (select sal from emp where deptno=30);
-- sal != 1600 or sal!=1250 or sal!=2050 or sal!=1500 or sal!=950

--부하직원이 있는 사원의 사번과 이름을 출력하세요
select empno, ename
from emp
where empno in (select mgr from emp);

select * from emp;
--부하직원이 없는 사원의 사번과 이름을 출력하세요
select empno, ename
from emp
where empno not in (select mgr from emp);
--where empno!=7902 and empno!=7788 and empno!=null
--and에서는 null 영향을 받아서 전부 null이 됨

select empno, ename
from emp
where empno not in (select nvl(mgr, 0) from emp);

--king에게 보고하는 즉 직속 상관이 king인 사원의 사번,이름,직종,매니저사번
select empno, ename, job, mgr
from emp
where mgr = (select empno from emp where ename = 'KING');

--20번 부서의 사원중에서 급여가 제일 높은 사원보다
--더 많은 급여를 받는 사원의 사번, 이름, 급여
select empno, ename, sal, deptno
from emp
where sal > (select max(sal) from emp where deptno=20);
------------------------------------------
--Scala subquery
select a.empno,
       a.ename,
       a.deptno,
       (select dd.dname
            from dept dd
            where dd.deptno = a.deptno) as dept_name
from emp a
where  a.sal >= 3000;
--join으로 해결가능

--자신의 월 급여에서 해당 직종의 평균 월 급영와 차이를 계산하는 쿼리
select a.empno,
       a.ename,
       a.job,
       a.sal,
       a.sal - (select round(avg(aa.sal))
                from emp aa
                where aa.job = a.job) as avg_sal_diff
from emp a
where a.deptno =20
order by 3, 1;
--order by a.job, a.empno

------------------------------
--자기 부서의 평균 월급보다 더 많은 월급을 받는 사원의 사번,이름,
--부서번호, 부서별 평균 월급을 출력하세요

select e.empno, e.ename, e.deptno, e.sal, m.부서평균월급
from emp e join (select deptno, round(avg(sal), 0) as 부서평균월급 from emp group by deptno) m
on e.deptno = m.deptno
where e.sal>m.부서평균월급
order by deptno desc, empno asc;
---------------------------------------------

--1.'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라
select ename, sal
from emp
where sal > (select sal from emp where ename='SMITH');


--2.10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급
--부서번호를 출력하라
select ename, sal, deptno
from emp
where sal in (select sal from emp where deptno = 10);

--3.'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
--Blake는 빼고 출력하라
select ename, hiredate
from emp
where deptno = (select deptno from emp where ename = 'BLAKE') and ename!='BLAKE';


--4.평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
--출력하되, 월급이 높은 사람 순으로 출력하라
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)
order by sal desc;


--5.이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고 있는
--사원의 사번과 이름을 출력하라
select empno, ename
from emp
where deptno in (select deptno from emp where ename like '%T%');


--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)
select ename, deptno, sal
from emp
where sal > ALL(select sal from emp where deptno = 30);

--답안
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
                FROM EMP
                WHERE DEPTNO=30);
 
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > ALL(SELECT SAL
  FROM EMP
  WHERE DEPTNO=30);
--

--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라.
select e.ename, e.deptno, e.job, d.loc
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';
--???
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO    -- = 이 맞는데  IN
                      FROM DEPT
                      WHERE LOC='DALLAS');

select * from dept;
select * from emp;

--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.
select e.deptno, e.ename, e.job
from emp e join dept d
on e.deptno = d.deptno
where d.dname = 'SALES';

--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)
select ename, sal
from emp
where mgr = (select empno from emp where ename='KING');

--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라.
select empno, ename, sal
from emp
where sal > (select round(avg(sal),0) from emp)
    and deptno in (select deptno from emp where ename like '%S%');

--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의
-- 이름, 월급, 부서번호를 출력하라.
select ename, sal, deptno
from emp
where deptno in (select deptno from emp where comm is not null)
and sal in (select sal from emp where comm is not null) --이 부분 어케 못함?
;
--select ename, deptno, sal  from emp where comm is not null;

--deptno in (select deptno from emp where comm is not null)
--and sal in (select sal from emp where comm is not null);

--12. 30번 부서 사원들과 월급과 커미션이 같지 않은
-- 사원들의 이름, 월급, 커미션을 출력하라.
select ename, sal, comm
from emp
where sal != all(select sal from emp where deptno=30) and comm != all(select nvl(comm,0) from emp where deptno=30);

select ename, sal, comm
from emp
where sal not in (select sal from emp where deptno=30) and comm not in (select nvl(comm,0) from emp where deptno=30);

-------------------------------------------------
/*

DML 데이터 조작어
오라클.pdf 168페이지

오라클 기준
DDL(데이터 정의어):[create, alter, drop, truncate], rename, modify
DML(데이터 조작어):insert, update, delete
DQL(데이터 질의어):select
DCL(데이터 제어어): 관리자 . grant, revoke
TCL(트랜잭션):commit, rollback, savepoint

DML (insert, update, delete) 작업
--TRANSACTION 트랜잭션 : 하나의 논리적인 작업단위


--A라는 계좌에서 B라는 계좌 이체 (100만원)

--계좌 1000만원
--A계좌(100)출금 : UPDATE 계좌 SET 금액....
--900
--B계좌 (100) 입금 : UPDATE 계좌 SET 금액
--1100
---------------------------------------------------------------
--A계좌에서 출금 B계좌 입금(업무) >> 하나의 논리적인 단위 묶어서 처리
--둘다 성공 OR 둘다 실패
--처리하는 방법(COMMIT, ROLLBACK)

*/

desc emp;
select * from tab;--현재 접속계정이 가지고 있는 테이블 목록

select * from tab where tname='BOARD';
select * from tab where tname='BOARD2'; --결과가 없으니 없는 테이블

select * from col where tname='EMP';

-------------------
--1 INSERT

create table temp(
    id number primary key, 
    name nvarchar2(20)
);

desc temp;
select * from tab where tname='TEMP';
select * from col where tname='TEMP';

--1.가장 일반적인 insert
insert into temp(id, name)
values(100,'홍길동');

select * from temp;
commit;

--2.컬럼 목록 생략 (쓰지마세요)
insert into temp values(200, '김유신');

rollback;

insert into temp(name) values('김유신');--기본키 null이라 오류

insert into temp(id, name)
values(100,'개똥이'); -- 기본키는 중복될 수 없음

-------------------------------------------
--TIP
--일반적인 SQL은 프로그램적인 요소x
--PL-SQL(변수, 제어문)
/*
create table temp2(id varchar2(50));
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO temp2(id) VALUES('A'||TO_CHAR(i));
    END LOOP;
END;
*/
SELECT * FROM temp2;

create table temp3(
 memberid number(3) not null,--3자리 정수
 name varchar2(10), --null 허용
 regdate date default sysdate --초기값 설정 (기본값)(시스템 날짜를 기본값 사용)
);

select * from col where tname='TEMP3';

select sysdate from dual;

insert into temp3(memberid, name, regdate)
values(100, '홍길동', '2022-09-29');

select * from temp3;
commit;

insert into temp3(memberid, name)
values(200, '김유신');
commit;

insert into temp3(memberid)
values(300);

commit;

insert into temp3(name)
values('who');--기본키 null 허용x

select * from temp3;
-----------------
--TIP)
--1.대량 데이터 삽입하기
create table temp4(id number);
create table temp5(num number);

insert into temp4(id) values(1);
insert into temp4(id) values(2);
insert into temp4(id) values(3);
insert into temp4(id) values(4);
insert into temp4(id) values(5);
insert into temp4(id) values(6);
insert into temp4(id) values(7);
insert into temp4(id) values(8);
insert into temp4(id) values(9);
insert into temp4(id) values(10);

select * from temp4;
commit;

select * from temp5;
--요구사항: temp4에 있는 모든 데이터를 temp5에 넣고 싶음
--insert into 테이블명(컬럼리스트) values
--insert into 테이블명(컬럼리스트) select 절

insert into temp5(num) select id from temp4;
--대량 데이터 삽입
select * from temp5;

--2.대량 insert
--담을 테이블이 없는 경우 >> 테이블 복제(구조:스키마)
--단 제약정보는 복제하지 않아요(FK, PK)
--순수한 데이터 구조 복제 + 데이터 복사

create table copyemp
as
    select * from emp;
    
select * from copyemp;

create table copyemp2
as select empno, ename, sal
    from emp
    where deptno=30;
select * from copyemp2;
--quiz
--틀(구조)만 복제하고 데이터는 복사하고 싶지 않아요
create table copyemp3
as select * from emp where 1=2;

select * from copyemp3;

-----------------------------------------------
--update
/*
update 테이블명
set 컬럼명 = 값, 컬럼명2 = 값 ...
where 조건절

update 테이블명
set 컬럼 = (서브쿼리)
where 컬럼명 = (서브쿼리)
*/

select * from copyemp;
update copyemp
set sal = 0;

rollback;

update copyemp
set sal=1111
where deptno=20;

rollback;

update copyemp
set sal = (select sum(sal) from emp);

rollback;

update copyemp
set ename='AAAA', job='BBB', hiredate = sysdate, sal = (select sum(sal) from emp)
where empno=7369;

select * from copyemp where empno = 7369;

rollback;
----------------------------------
--delete
delete from copyemp;
select * from copyemp;
rollback;

delete from copyemp where deptno=10;
select ename, deptno from copyemp order by deptno;
rollback;

------------------------------
/*
개발자(SQL)>>
1.CRUD관점
2.APP(JAVA) - JBDC API - ORACLE
3.insert, update, delete, select

하나의 테이블에 대해서 작업
JAVA에서 EMP테이블에 대해서 CRUD작업
APP(java)입장에서
1.전체조회 (함수) >> public List<Emp> getEmpList(){select * from emp}
2.조건조회 (함수)>>public Emp getEmpListByEmpno(int empno){select * from emp where empno=7788}
3.삽입 (함수)>>public int insertEmp(Emp emp){insert into emp(...) values(...)}
4.수정 (함수)
5.삭제 (함수)
개발>>자바 코드>>DAO

*/


--DDL(CREATE, ALTER, DROP, RENAME) 테이블을 생성, 수정, 삭제
--오라클.PDF 9장 138PAGE

*/

SELECT * FROM BOARD;

DROP TABLE BOARD

CREATE TABLE BOARD(
    BOARDID NUMBER,
    TITLE NVARCHAR2(50),
    CONTENT NVARCHAR2(2000),
    REGDATE DATE
);

DESC BOARD



SELECT * FROM USER_TABLES WHERE LOWER(TABLE_NAME) = 'BOARD';
SELECT * FROM COL WHERE LOWER(TNAME) = 'BOARD'; --개발자
--제약정보
SELECT * FROM USER_CONSTRAINTS WHERE LOWER(TABLE_NAME) = 'BOARD';



--oracle 11g>>가상컬럼(조합컬럼)
--학생 성적 테이블 : 국어, 영어, 수학
create table vtable(
    no1 number,
    no2 number,
    no3 number GENERATED ALWAYS as (no1 + no2) VIRTUAL
);
select * from col where lower(tname) = 'vtable';
insert into vtable(no1, no2) values(100,50);
select * from vtable;
insert into vtable(no1, no2, no3) values(10, 20, 30);
--no3은 항상 no1+no2라서 안됨

--실무에서 활용도는 코드
--제품정보(입고) : 분기별 데이터 추출(4분기)
--입고일(2022-09-10)

create table vtable2(
 no number, --순번
 p_code char(4), --제품코드(A001, B002...)
 p_date char(8), --입고일(20220922)
 p_qty number, --수량
 p_bungi number(1) GENERATED ALWAYS as (
                        CASE WHEN substr(p_date,5,2) in ('01','02','03') THEN 1
                             WHEN substr(p_date,5,2) in ('04','05','06') THEN 2
                             WHEN substr(p_date,5,2) in ('07','08','09') THEN 3
                             ELSE 4
                        END) VIRTUAL
);
/*교수님코드...
create table vtable2(
  no number , --순번
  p_code char(4) , --제품코드(A001 , B002)
  p_date char(8), --입고일(20220922)
  p_qty number, --수량
  p_bungi number(1) GENERATED ALWAYS as (
                    CASE WHEN substr(p_date,5,2) in ('01','02','03') THEN 1
                         WHEN substr(p_date,5,2) in ('04','05','06') THEN 2
                         WHEN substr(p_date,5,2) in ('07','08','09') THEN 3
                         ELSE 4
                     END )VIRTUAL
);
*/
drop table vtable2;
insert into vtable2(p_date) values('20190101');
insert into vtable2(p_date) values('20190405');
insert into vtable2(p_date) values('20190809');
insert into vtable2(p_date) values('20191201');
commit;
select* from vtable2;
select * from vtable2 where p_bungi = 1;


--------------------------------------------------------------
--DDL 테이블 만들고 수정, 삭제
--1.테이블 생성하기
create table temp6(id number);
desc temp6;

--2.테이블 생성 후에 컬럼을 추가하는 방법
alter table temp6 add ename varchar2(20);

--3.기존 테이블에 있는 컬럼 이름을 수정(rename)
alter table temp6 rename column ename to username;
desc temp6;

--4.기존 테이블에 있는 기존 컬럼의 타입 크기 수정(이건 기억하기 ~~)
alter table temp6 modify(username varchar2(2000));
desc temp6;

--5.기존 테이블에 있는 컬럼 삭제
alter table temp6 drop column username;
desc temp6;
--위 모든 작업은 툴을 사용해서 작업 가능하다

--6.테이블의 데이터 전체가 필요 없어요
--테이블 처음 만들면 처음 크기 >> 데이터 넣으면 점점 커짐 >> 데이터
--ex) 처음 크기 1M >> 데이터 10만건 >> 100M가 됨 >> delete 10만건 >> 테이블 크기는...여전히 100M
--테이블 삭제할 때 공간의 크기를 줄일 수 없을까?
--truncate (단점 where을 사용 못함)
--ex) 처음 1M >> 데이터 10만건 >>100M가 됨>>truncate로 10만건 삭제>>테이블 크기 1M
--truncate table emp

--테이블 삭제
--복원 불가
drop table temp6;

----------------------------------------------------------------------
--테이블에 제약 설정하기
--오라클 pdf 144쪽
--데이터 무결성 확보
--insert, update제약
/*
PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL 과 UNIQUE 조건을 만족)
where empno=7788 >> 데이터 1건 보장 >> 성능 >> 조회 >> index 자동 생성

제약을 만드는 방법(create talble 안에서 생성)
테이블이 생성된 다음 추가(alter table add constraint ....)많이 사용 >>툴..


Tip)
제약정보확인
*/
select * from user_constraints where table_name='EMP';

create table temp7(
 --id number primary key --권장하지않음(제약이름 자동생성>>SYS_C006997
                        --제약 삭제,수정시 찾기 어려움
 id number constraint pk_temp7_id primary key, --pk_temp7_id 관용적
 name varchar2(20) not null, --constraint 표현 쓰지 마세요
 addr varchar2(50)
);

select * from user_constraints where LOWER(table_name) = 'temp7';

--PK (not null 하고 unique한 제약)
--중복데이터 허용 x, not null
--테이블 당 한 개만 사용(컬럼 한 개 or 여러 개의 컬럼을 묶어서 1개...duplicate)

insert into temp7(name, addr) values('홍길동','서울시 강남구');--cannot insert NULL into ("KOSA"."TEMP7"."ID")

insert into temp7(id,name,addr) values(10,'홍길동','서울시 강남구');
select * from temp7;
commit;

insert into temp7(id,name,addr) values(10,'야무지개','서울시 강남구');
--ORA-00001 : unique constraint(KOSA.PK_TEMP7_ID) violated

--UNIQUE KEY(UK) 테이블의 모든 행을 유일하게 하는 값을 가진 열(널 허용)
--컬럼의 수 만큼 생성 가능
--null 허용
--not null, unique
create table temp8(
 id number constraint pk_temp8_id primary key,
 name nvarchar2(20) not null,
 jumin nchar(6) constraint uk_temp8_jumin unique, --null허용
 addr nvarchar2(1000)
);

select * from user_constraints where LOWER(table_name) = 'temp8';

insert into temp8(id, name, jumin, addr)
values(10,'홍길동','123456','경기도');

select * from temp8;
commit;

insert into temp8(id, name, jumin, addr)
values(20,'길동','123456','서울');--ORA-00001:unique constraint

insert into temp8(id, name, addr)
values(20, '김유신','강원도');--unique null 허용

select * from temp8;

--그럼 null도 중복체크를 할까?
insert into temp8(id, name, addr)
values(30, '이씨', '강원도');

select * from temp8;
--생성시
--jumin nchar(6) not null constraint uk_temp8_jumin unique

--테이블 생성 후에 제약 걸기
create table temp9 (id number);
--기존 테이블에 제약 추가하기
--제약 추가시 테이블에 있는 데이터를 검사 >> 중복데이터 >> 개발자 >> 중복데이터 강제 삭제
alter table temp9
add constraint pk_temp9_id primary key(id);

select * from user_constraints where lower(table_name) = 'temp9';


/*

FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다.
UNIQUE key(UK) 테이블의 모든 행을 유일하게 하는 값을 가진 열(NULL 을 허용)
NOT NULL(NN) 열은 NULL 값을 포함할 수 없습니다.
CHECK(CK) 참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정
*/
