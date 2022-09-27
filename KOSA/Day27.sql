--220927
--비교연산자
--<    >  <=
--주의
--java 같다 (==) 할당(=), javascript(==, ===)
--oracle 같다(=) 같지않다(!=)

--논리연산자 AND, OR, NOT

select empno, ename, sal
from emp
where sal >= 2000;

--사번이 7788번인 사원의 사번, 이름, 직종, 입사일을 출력하시오
select empno, ename, job, hiredate  --3
from emp                            --1
where empno=7788;                   --2

--개발자 : CRUD(create(insert), read(select), update, delete)
--DB 작업 : Read(select) 70%

--관리자 : 백업과 복원, 장애(네트워크, 성능) 관리, 보안(사용자 권한, 암호화)
--튜닝 (쿼리튜닝, 하드웨어) >>문장튜닝 >> 시간을 줄이는 작업
--설계자(모델러) : 설계(요구사항 정의, 분석) : erd

--사원의 이름이 king인 사원의 사번, 이름, 급여 정보를 출력하세요
select empno, ename, sal
from emp
where ename='KING';
/*
이상, 이하, 초과, 미만
    |   AND OR
0 0 |   0   0
0 1 |   0   1
1 0 |   0   1
1 1 |   1   1

*/
--급여가 2000달러 이상이면서 직종이 manager인 사원의 모든 정보를 출력하세요
select *
from emp
where sal>=2000 and job='MANAGER';

--급여가 2000달러 초과면서 직종이 manager인 사원의 모든 정보 출력
select *
from emp
where sal>2000 and job='MANAGER';

--오라클 날짜(DB서버의 날짜)
--오라클 날짜(sysdate)
select sysdate from dual; --22/09/27

select * from nls_session_parameters;--시스템 테이블
--현재 접속한 사용자(session) 가지는 환경정보
--NLS_DATE_FORMAT
--NLS_DATE_LANGUAGE
--NLS_TIME_FORMAT

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select sysdate from dual; --2022-09-27 09:52:21
--변경 정보는 현재 오라클 서버에 접속한 사용자의 작업 환경 설정
--그래서 접속을 끊었다가 다시 연결하면 원래 상태로 복원 돼 있다.(RR-MM-DD)

select hiredate from emp;

select *
from emp
where hiredate = '1980-12-17';

/*
모든 시스템은 날짜가 필수
게시판
설계
글쓴이, 제목, 내용, 조회수, 작성날짜
insert into board(writer, title, content, hit, regdate)
values('홍길동','하이루','졸립다',0,sysdate);
regdate:컬럼의 데이터는 서버의 시간(DB서버)
--Tip) ms-sql : select getdate()
       Mysql : curdate(), curtime(), now(), sysdate()
       
*/

select *
from emp
where hiredate = '1980/12/17';
select *
from emp
where hiredate = '1980.12.17';

--사원의 급여가 2000달러 이상이고 4000달러 이하인 모든 사원의 정보
select *
from emp
where 2000<=sal and sal<=4000;

--연산자 : 컬럼명 between A and B (=포함)
select *
from emp
where sal between 2000 and 4000;

--사원의 급여가 2000초과 4000미만인 모든 사원의 정보를 출력하세요
select *
from emp
where sal>2000 and sal<4000;

--부서번호가 10번 또는 20번 또는 30번인 사원의 사번, 이름, 급여, 부서번호를 출력하세요
select empno, ename, sal, deptno
from emp
where deptno = 10 or deptno = 20 or deptno = 30;
--연산자(IN연산자)

select *
from emp
where deptno in(10,20,30);

--부서번호가 10번 또는 20번이 아닌 사원의 사번,이름,급여,부서번호
select empno, ename, sal, deptno
from emp
where deptno!=10 and deptno!=20;

--IN 부정 >> NOT IN
select empno, ename, sal, deptno
from emp
where deptno not in(10,20);
--not in >> != .... and

--POINT : null >> 값이 없다

create table member(
userid varchar2(20) not null, --null을 허용하지 않겠다(필수입력)
name varchar2(20) not null,
hobby varchar2(50) --default null허용: 선택적 입력사항
);
