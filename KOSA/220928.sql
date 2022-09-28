--220928 수요일

select sysdate from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

create table member3(age number);

insert into member3(age) values(100);
insert into member3(age) values(200);
insert into member3(age) values(300);
insert into member3(age) values(400);

--데이터타입
--문자열 타입
--char(10) 고정길이문자열 10byte
--varchar2(10) 가변길이 문자열 10byte
--unicode(2byte):한글,영문자,특수문자,공백>>2byte
--nchar(20)>>20자 >>40byte
--nvarchar2(20)>>20자.

--오라클 함수 ......
select * from SYS.NLS_DATABASE_PARAMETERS;
--NLS_CHARACTERSET  : 	AL32UTF8  한글 3byte 인식
--KO16KSC5601 2Byte (현재 변환하면 한글 다깨짐)
select * from nls_database_parameters where parameter like '%CHAR%';
------------------------------------------------------------------------------
create table test2(name varchar2(2));

insert into test2(name) values('a');
insert into test2(name) values('aa');
insert into test2(name) values('가'); --한글 1자 3byte 인지
-----------------------------------------------------------------------------
rollback;
select * from member3;

-------------------------------------
--일반함수(프로그램 성격이 강한 함수)
--nvl(), vnl2() >> null 처리하는 함수
--decode() >>java if
--case() >> java switch

--오라클 SQL (변수, 제어문 개념이 없다)
--오라클 PL-SQL (변수, 제어문 있음) 고급 기능

select comm, nvl(comm, 0) from emp;

create table t_emp(
    id number(6), --정수 6자리
    job nvarchar2(20)--20자
);


insert into t_emp(id, job) values(100, 'IT');
insert into t_emp(id, job) values(200, 'SALES');
insert into t_emp(id, job) values(300, 'MGR');
insert into t_emp(id) values(400);
insert into t_emp(id, job) values(500, 'MGR');
commit;
select * from t_emp;

select id, decode(id, 100, '아이티', 200, '영업부', 300, '관리팀','기타부서') as 부서이름
from t_emp;

select empno, ename, deptno, decode(deptno, 10, '인사부',
                                            20, '관리부',
                                            30, '회계부',
                                            40, '부서',
                                            'ETC') as 부서이름
from emp;

CREATE TABLE t_emp2(
id NUMBER(2),
jumin CHAR(7)
);
INSERT INTO t_emp2(id, jumin) VALUES(1,'1234567');
INSERT INTO t_emp2(id, jumin) VALUES(2,'2234567');
INSERT INTO t_emp2(id, jumin) VALUES(3,'3234567');
INSERT INTO t_emp2(id, jumin) VALUES(4,'4234567');
INSERT INTO t_emp2(id, jumin) VALUES(5,'5234567');
COMMIT;

select * from t_emp2;
/*
t_emp2 테이블에서 id, jumin 데이터를 출력하되 jumin 컬럼의
앞자리가 1이면'남성' 출력 2이면 '여성' 3이면 '중성' 
그외는  '기타' 라고 출력하세요
컬럼명은 '성별'
*/

select id, decode(substr(jumin,1,1), 1, '남성', 2, '여성', 3, '중성', '기타')
as 성별
from t_emp2;

/*
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이라면 
HELLO 문자 출력하고
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이 아니라면 
WORLD 문자 출력하고
부서번호가 20번인 사원이 아니라면 ETC 라는 문자를 출력하세요
*/
select empno, deptno, decode(deptno, 20, decode(ename, 'SMITH', 'HELLO',
                                        'WORLD'),'ETC')
from emp;
--decode 다양한 통계
--CASE문
/*
CASE 조건식 WHEN 결과1 THEN 출력1
            WHEN 결과2 THEN 출력2
            ELSE 출력4
END "컬럼명"
*/
create table t_zip
(
    zipcode number(10)
);
select * from t_zip;

insert into t_zip(zipcode) values(2);
insert into t_zip(zipcode) values(31);
insert into t_zip(zipcode) values(32);
insert into t_zip(zipcode) values(41);
commit;

select * from t_zip;

select '0' || to_char(zipcode), case zipcode when 2 then '서울'
                                            when 31 then '경기'
                                            when 32 then '인천'
                                            else '기타지역'
                                            end "지역이름"
from t_zip;

/*
사원테이블에서 사원급여가 100달러 이하면 4급
1001달러 2000달러 이하면 3급
2001달러 3000달러 이하면 2급
3001달러 4000달러 이하면 1급
4001달러 이상이면 특급
--1.case 컬렴명 when 결과 then 출력
--2.비교식이 필요하다면
    case when 조건비교식 then
         when ....
         when ...
         
*/
select case when sal<=1000 then '4급'
            when sal between 2001 and 3000 then '3급'
            when sal between 3000 and 4000 then '2급'
            else '특급'
        end "급수", empno, ename
from emp;
-----------------------------------------------------
--문자함수, 숫자함수, 날짜함수, 변환함수(to_char, to_number, to_date)
--일반함수(nvl, decode(), case구문)
--기본함수 end
-------------------------------------------
--집계함수(그룹함수)
--오라클.pdf 75페이지
/*
1.count(*) >> row수, count(컬럼명) >> 데이터 건수 >> (null은 포함하지 않음)
2.sum()
3.avg()
4.max()
5.min()
--기타

1.집계함수는 group by절과 같이 사용
2.모든 집계함수는 null 무시
3.select절에 집계함수 이외에 다른 컬럼이 오면 반드시 그 컬럼은 group by절에 묶여야한다

*/

select count(*) from emp; --14개의 row

select count(empno) from emp; --14

select count(comm) from emp; -- 6
select comm from emp;

select count(nvl(comm, 0)) from emp; --POINT
--급여의 합
select sum(sal) as 급여의합 from emp;

select round(avg(sal),0) as 급여평균 from emp;

--사장님 우리회의 총 수당이 얼마나 지급되었나
select sum(comm) from emp;

--수당의 평균
select avg(comm) from emp;
select round(avg(comm),0) from emp;

select trunc(avg(nvl(comm,0))) from emp; --309


select max(sal) from emp;
select min(sal) from emp;

select empno, count(empno) from emp;--ORA-00937: not a single-group group function
--empno는 14열, empno는 1열이 나오므로 오류가 난다

select sum(sal), avg(sal), max(sal), min(sal), count(sal) from emp;

--부서별 평균 급여
select deptno, avg(sal) --3
from emp                --1
group by deptno;        --2

--직종별 평균 급여
select job, trunc(avg(sal))
from emp
group by job;

--직종별 평균급여, 급여합, 최대급여, 최소급여, 건수 출력
select job, round(avg(sal),0), sum(sal), max(sal), min(sal), count(sal)
from emp
group by job;

/*
그룹
distinct 컬럼명1, 컬럼명2
order by 컬럼명1, 컬럼명2
group by 컬럼명1, 컬럼명2
*/
--부서별, 직종별 급여의 합을 구하세요
select deptno, job, sum(sal)
from emp
group by deptno, job;
/*
select 절    --4
from 절      --1
where 절     --2
group by 절  --3
order by 절  --5
*/

--직종별 평균급여가 3000달러 이상인 사원의 직종과 평균급여를 출력
select job, avg(sal)
from emp
group by job
having avg(sal)>=3000; --group by 조건절
                        --having절에서는 select 가명칭 사용x(실행순서때문에)

--1.from 조건절 where
--2.group by 조건절 having
/*
select  --5
from    --1
where   --2
group by--3
having  --4
order by--6
*/

/*
사원테이블에서 직종별 급여합을 출력하되
수당은 지급받고 급여의 합이 5000 이상인
사원의 목록을
급여 합이 낮은 순으로 출력하세요
*/
select * from emp;

select job, sum(sal)
from emp
where comm is not null
group by job
having sum(sal)>=5000
order by sum(sal);
/*
사원테이블에서 부서 인원이 4명보다 많은 부서의
부서번호, 인원수, 급여의 합을 출력하세요
*/
select deptno, count(empno), sum(sal)
from emp
group by deptno
having count(*)>4;

/*
사원테이블에서 직종별 급여의 합이 5000을 초과하는 직종과
급여의 합을 출력하세요.
단 판매직(salesman)은 제외하고
급여합 내림차순 정렬하세요
*/

select job, sum(sal)
from emp
where job != 'SALESMAN' --이게 더 성능 좋음
group by job
having sum(sal)>5000
order by sum(sal) desc;

---------------------------------------------
--단일 테이블의 데이터를 가져오는 것은 여기까지...END
---------------------------------------------

--여러 개의 테이블에서 원하는 데이터를 추출하는 방법
--JOIN(조인) pdf 85페이지
--다중 테이블로부터 데이터 검색

--Equijoin Join 조건이 정확히 일치하는 경우 사용(일반적으로 PK와 FK사용)
--Non-Equijoin Join 조건이 정확히 일치하지 않는 경우에 사용(등급, 학점)
--Outer Join Join 조건이 정확히 일치하지 않는 경우에도 모든 행들을 출력
--Self Join 하나의 테이블에 행들을 Join하고자 할 경우에 사용

--RDBMS(관계형 데이터베이스)
/*
관계(테이블과 테이블과의 관계)
1:1
1:N (대부분 이 관계 사용)
M:N

create table M (M1 char(6) , M2 char(10));
create table S (S1 char(6) , S2 char(10));
create table X (X1 char(6) , X2 char(10));

insert into M values('A','1');
insert into M values('B','1');
insert into M values('C','3');
insert into M values(null,'3');
commit;

insert into S values('A','X');
insert into S values('B','Y');
insert into S values(null,'Z');
commit;

insert into X values('A','DATA');
commit;

*/

select * from m;
select * from s;
select * from x;

/*
1.등가조인(equi join)
원테이블과 대응되는 테이블에 있는 컬럼의 데이터를 1:1 매핑
1.1 문법
-SQL JOIN 문법(오라클 문법) > 간단
-ANSI문법(표준) 권장 > 무조건 > [inner] join on 조건절
*/

select*
from m, s
where m.m1 = s.s1;

select *
from m inner join s
on m.m1 = s.s1;

select *
from m join s --구문
on m.m1 = s.s1;--on 조인의 조건절

select m.m1, m.m2, s.s2
from m join s
on m.m1 = s.s1;

--사원번호, 사원 이름, 부서번호, 부서 이름
select emp.empno, emp.ename, dept.deptno, dept.dname
from emp join dept
on emp.deptno = dept.deptno;

select e.empno, e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;

select m.m1, m.m2, x.x2
from m join x
on m.m1 = x.x1;


--join
--테이블 2개, 3개, 4개
--SQL JOIN
select m.m1, m.m2, s.s2, x.x2
from m, s, x
where m.m1 = s.s1 and s.s1 = x.x1;
--a = b, b = c, a = c
--ANSI문법
select *
from m join s on m.m1 = s.s1
       join x on s.s1 = x.x1;
       
--HR계정으로 이동
show user;
select * from employees;
select * from departments;
select * from locations;

--사번, 이름(last_name), 부서번호, 부서이름을 출력하세요
select e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;
--문제점
--사원수 107명(누군가 누락)
select * from employees where department_id is null;
--등가조인 null 처리 불가 >> 다른 조인 >> 잠시 후에

--1.사번, 이름(last_name),부서번호,부서이름,지역코드,도시명
select e.employee_id, e.last_name, d.department_id, d.department_name, l.location_id, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

--kosa계정으로 전환
show user;

--2.비등가 조인 non-equi join
select * from emp;
select * from salgrade;

select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal;

--3.outer join(equi join 선행하고 나서 + 남아있는 데이터 가져옴)
--outer join 주종관계를 파악
--주인이 되는 테이블의 남은 데이터를 가져올 수 있다
--문법
--3.1 left outer join
--3.2 right outer join
--3.3 full outer join(left, right >> union)

select *
from m join s
on m.m1 = s.s1;

select *
from m full outer join s
on m.m1 = s.s1;

--hr
show user;
--사번, 이름(last_name), 부서번호, 부서이름을 출력하세요
select e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;
--누군가 누락
select * from employees where department_id is null;
select e.last_name, e.department_id, d.department_name
from employees e left join departments d
on e.department_id = d.department_id;
--이러면 널인 애도 나옴 레프트 조인

-----------------------------------
--kosa로 전환
show user;
select * from emp;

--3.self join(자기참조) -> 문법 x, 의미만 존재 >> 등가조인(문법)
--하나의 테이블에 있는 컬럼이 자신의 테이블에 있는 다른 컬럼을 참조하는 경우
select e.empno, e.ename, m.empno, m.ename
from emp e left join emp m
on e.mgr = m.empno;

------------------------------------------------------------
/*
-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
*/

select e.ename, e.deptno, d.dname
from emp e left join dept d
on e.deptno = d.deptno;
/*
-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라.
*/
select * from emp;
select * from dept;

select e.ename, e.job, e.deptno, d.dname, d.loc
from emp e left join dept d
on e.deptno=d.deptno
where d.loc = 'DALLAS';

/*
-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.
*/

select e.ename, d.dname
from emp e left join dept d
on e.deptno = d.deptno
where e.ename like '%A%';

​
/*
-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.
*/

select e.ename, d.dname, e.sal
from emp e left join dept d
on e.deptno = d.deptno
where e.sal>=3000;​

/*
-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라.
*/
​
select e.job, e.ename, d.dname
from emp e left join dept d
on e.deptno = d.deptno
where job='SALESMAN';
​
/*
-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다
*/
select * from emp;
select * from salgrade;

select e.empno as "사원번호", e.ename as "사원이름", e.sal*12 as "연봉", e.sal*12+nvl(e.comm,0) as "실급여", s.grade as "급여등급"
from emp e left join salgrade s
on e.sal between s.losal and s.hisal;
​
/*
-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하라.
*/

select d.deptno, d.dname, e.ename, e.sal, s.grade
from dept d left join emp e on d.deptno = e.deptno
            left join salgrade s on e.sal between s.losal and s.hisal
where e.deptno = 10;
​
/*
-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.
*/

select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e left join dept d on e.deptno = d.deptno
left join salgrade s on e.sal between s.losal and s.hisal
where e.deptno = 10 or e.deptno = 20
order by deptno, sal desc;

/*
-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)
*/
select * from emp;
select e.empno as 사원번호, e.ename as 사원이름, m.empno as 관리자번호, m.ename as 관리자이름
from emp e left join emp m
on e.mgr = m.empno;


------------------
--기타
--NATURAL JOIN
--Equijoin과 동일하다고 보시면 됩니다
--[두 테이블]의 [동일한 이름]을 가지는 컬럼은 [모두 조인]이 됩니다
SELECT empno, ename, deptno, dname FROM emp NATURAL JOIN dept;

--Join ~ USING
--NATURAL JOIN의 단점은 동일한 이름을 가지는 컬럼은 모두 조인이 되는데
--USING문을 사용하면 컬럼을 선택해서 조인 할 수 있다
SELECT e.empno, e.ename, deptno, dname FROM emp e JOIN dept d
USING(deptno);

--조인 조건이 없는 조인 결과
select * from emp, dept; --카타시안 곱
select * from emp cross join dept;
---------------------------------------
select * from dept;
