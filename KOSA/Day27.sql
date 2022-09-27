--220927 화요일
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

select * from member;
insert into member(userid, hobby) values('hong', '농구');
--ORA-01400: cannot insert NULL into ("KOSA"."MEMBER"."NAME")

insert into member(userid,name) values('hong','홍길동');
select * from member;
--hobby >> null

--간단하게
--DB서버마다 설정
--DML(데이터 조작어) : insert, update, delete
--오라클에서는 실제 반영을 위해서는 개발자에게... : commit, rollback 강제
--Ms-sql, Mysql에서는 default commit >> begin 명시 DML 작업으로 커밋 롤백 강제

commit; --명령(insert, update, delete)실제 반영

--수당(comm)을 받지 않는 모든 사원의 정보
select *
from emp
where comm = null; -- 이런 문법은 존재하지 않는다

--null의 비교는 (is null, is not null) 암기**
select *
from emp
where comm is null;

select * from emp where comm is not null;

--사원테이블에서 사번, 이름, 급여, 수당, 총급여를 출력하세요
--총급여 정의(급여+수당)
select empno, ename, sal, comm, (sal+comm) as "총급여"
from emp;

/*
null...........
1.null과의 모든 연산의 결과는 null이다.
2.위 문제를 해결하기 위해서 함수 >> nvl(), nvl2() >> 암기
ex)nvl(컬럼명,대체값) >> 치환

Tip) ms-sql > null > convert()
     Mysql > null > IFNULL() >> SELECT IFNULL(NULL, "W3School.com");
*/

select empno, ename, sal, comm, sal + nvl(comm, 0) as "총급여"
from emp;

select 1000 + null from dual;

select 1000 + nvl(null, 0) from dual;

select comm, nvl(comm, 1111111) from emp;
select nvl(null, 'hello, world')from dual;


--사원의 급여가 1000달러 이상이고 수당을 받지 않는 사원의
--사번, 이름, 직종, 급여, 수당을 출력하세요
select empno, ename, job, sal, comm
from emp
where sal>=1000 and comm is null;


--DQL : 쿼리어 select
--DDL : 정의어. create, alter, drop
--DML : 조작어. insert, update, delete(반드시 commit, rollback)

--java : class Board(private int boardno)
--DB : create table Board(boardno number)

create table Board(
 boardid number not null, --숫자이면서 필수입력
 title varchar2(50) not null,
 content varchar2(2000) not null,
 hp varchar2(20) --default null O
);
desc board;

select * from board;

insert into Board(boardid, title, content)
values(100, 'oracle', 'mistake');

select * from board;
--데이터를 잘못 넣었다면
rollback;
select * from board;
commit;

select boardid, title, content, nvl(hp, 'empty') as HP
from board; --POINT

--문자열 검색
--예...주소 검색할 때 검색어 : 역삼 ...
--Like 패턴검색

--Like(문자열 패턴 검색 연산자)
--Like 연산자(와일드카드 문자 : %(모든 것), _(한문자) 결합 패턴...)
--검색이 한정적 >> java 정규표현식을 오라클 적용
SELECT last_name
FROM emp
WHERE REGEXP_LIKE (ename, '(*)n$');
SELECT last_name
FROM emp
WHERE REGEXP_LIKE (ename, '^A(*)');


select *
from emp
where ename like '%A%';--ename
select *
from emp
where ename like '%a%';--ename 대소문자 엄격히 구분
select *
from emp
where ename like 'A%';--ename
select *
from emp
where ename like '%E';--ename

--주소검색
--select * from zip where dong like '%역삼%'
--select * from member where name like '이%'

select *
from emp
where ename like '%LL%'; --ALLEN, MILLER

select *
from emp
where ename like '%A%A%'; --ADAMS

select ename
from emp
where ename like '_A%'; -WARD, MARTIN, JAMES

--regexp_like연산자 ... 정규표현식을 쓸 수 있다
select * from emp where regexp_like(ename, '[A-C]');
select * from emp where regexp_like(ename, '^A');
select * from emp where regexp_like(ename, 'C');
select regexp_substr(ename, 'a|e|i|o|u', 1, 1, 'i') from emp;

--데이터 정렬하기
--order by 컬럼명 : 문자, 숫자, 날짜 정렬
--오름차순 asc, 내림차순 desc

select *
from emp
order by sal; --default : asc

select *
from emp
order by sal desc;

--입사일이 가장 늦은 순으로 정렬해서 사번, 이름, 급여, 입사일을 출력하세요
select empno, ename, sal, hiredate
from emp
order by hiredate desc;

select empno, ename
from emp
order by ename;


select empno, ename, sal, job, hiredate
from emp
where job='MANAGER'
order by hiredate desc;

select job, deptno
from emp
order by job asc, deptno desc;
--order by 컬럼명 asc, 컬럼명 asc ...
--예)게시판 ... 답변 게시판

--연산자
--합집합(union): 테이블과 테이블의 데이터를 합치는 것 (중복값 배제)
--합집합(union all) : 중복값 허용

create table uta(name varchar2(20));
insert into uta(name) values('AAA');
insert into uta(name) values('BBB');
insert into uta(name) values('CCC');
insert into uta(name) values('DDD');
commit;

create table ut(name varchar2(20));
insert into ut(name) values('AAA');
insert into ut(name) values('BBB');
insert into ut(name) values('CCC');
commit;

select * from uta;
select * from ut;

select * from ut
union
select * from uta;

select * from ut
union all
select * from uta;

--union
--1.대응되는 컬럼의 타입이 동일
select empno, ename from emp --숫자, 문자열
union
select dname, deptno from dept; --문자열, 숫자

select empno, ename from emp
union
select deptno, dname from dept;

--2.대응되는 컬럼의 개수가 동일
--필요악 : null으로 컬럼을 대체
select empno, ename, job, sal from emp
union
select deptno, dname, loc, null from dept;
/* in line view(가상 테이블)
select m.empno, m.ename, m.job, m.sal
from(
select empno, ename, job, sal from emp 
union
select deptno, dname, loc, null from dept
) m
order by m.empno asc;
*/
-----------------
------------------------------------------------
---함수
--함수 사용하기
--

/*
 단일 행 함수의 종류 
1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다.
2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다.
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를
제외하고 모두 날짜 데이터형의 값을 RETURN 한다.
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다.
5) 일반적인 함수 : NVL, DECODE
*/
---문자열 함수
select initcap('the super man') from dual; --단어의 첫글자만 대문자

select lower('AAA'), upper('aaa') from dual;

select ename, lower(ename) as "ename" from emp;

select * from emp where lower(ename) = 'king';

select length ('abcd') from dual; -- 문자열의 개수
select length ('홍길동') from dual; 

select length ('     홍 길 동a') from dual;  --공백도 문자다

select concat('a', 'b') from dual;
select concat('a', 'b', 'c')from dual; --파라미터 2개만 받음
select 'a'||'b'||'c' from dual;

select ename||'          ' || job from emp; --결합연산자는 유연한 표현 가능
select concat(ename,job) from emp;

--부분문자 추출
--java : substring
--oracle : substr

select substr('ABCDE',2,3) from dual; --BCD
select substr('ABCDE',1,1) from dual; --A
select substr('ABCDE',3,1) from dual; --C

select substr('adlfkasfdsajdalfj',3) from dual;

select substr('ABCDE',-2,1) from dual; --D
select substr('ABCDE',-2,2) from dual; --DE

--사원테이블에서 ename 컬럼의 데이터에 대해서
--첫 글자는 소문자로 나머지 글자는 대문자로 출력하되
--하나의 컬럼으로 만들어 출력하세요
--컬럼의 별칭은 fullname이라 하고
--첫 글자와 나머지 문자 사이에는 공백 하나를 넣으세요
select substr(lower(ename),1,1)||' '||
substr(upper(ename),2) as "fullname" from emp;

select lpad('ABC',10,'*') from dual;--*******ABC
select rpad('ABC',10,'*') from dual;--ABC*******

--사용자의 비밀번호 : hong1007 or k1234
--화면 : 앞 두글자>>ho****** k1***
select rpad(substr('hong1007',1, 2),length('hong1007'),'*')
from dual;
select rpad(substr('k1234',1,2),length('k1234'),'*')
from dual;

--emp테이블에서 ename컬럼의 데이터를 출력하되
--첫 글자만 출력하고 나머지는 *로
select rpad(substr(ename,1,1),length(ename),'*') from emp;

create table member2(
    id number,
    jumin varchar2(14)
);

insert into member2(id, jumin) values(100, '123456-1234567');
insert into member2(id, jumin) values(200, '234567-1234567');
commit;

select * from member2;
--출력결과
--100 : 123456-*******
--alias "jumin number"
select id||
' : '||
rpad(substr(jumin,1,7), length(jumin), '*')
as "jumin number"
from member2;

--rtrim 함수
--오른쪽 문자를 지워라
select rtrim('MILLER','ER') from dual; --MILL
--ltrim 함수
--왼쪽 문자를 지워라
select ltrim('MILLLLLER', 'MIL') from dual; --ER

--공백제거
SELECT '>' || RTRIM('MILLER       ', ' ') || '<' FROM DUAL;
SELECT '>' || LTRIM('         MILLER', ' ') || '<' FROM DUAL;

--치환함수
SELECT ENAME, REPLACE(ENAME, 'A', '와우') FROM EMP;

------------------------------------------------------
--숫자 함수
--ROUND(반올림 함수)
--TRUNC(절삭 함수)
--MOD() 나머지를 구하는 함수

SELECT ROUND(12.3456,0) AS R FROM DUAL;--정수부만 남김 : 12
SELECT ROUND(12.567,0) AS R FROM DUAL;--13
SELECT ROUND(12.3456,1) AS R FROM DUAL;--12.3
SELECT ROUND(12.345,2) AS R FROM DUAL;--12.35
SELECT ROUND(12.345,-1) AS R FROM DUAL;--10
SELECT ROUND(15.345,-1) AS R FROM DUAL;--20
SELECT ROUND(15.345,-2) AS R FROM DUAL;--0

SELECT TRUNC(12.3456,0) AS T FROM DUAL;--12
SELECT TRUNC(12.567,0) AS T FROM DUAL;--12
SELECT TRUNC(12.3456,1) AS T FROM DUAL;--12.3
SELECT TRUNC(12.345,2) AS T FROM DUAL;--12.34
SELECT TRUNC(12.345,-1) AS T FROM DUAL;--10
SELECT TRUNC(15.345,-1) AS T FROM DUAL;--10
SELECT TRUNC(15.345,-2) AS T FROM DUAL;--0

--나머지
SELECT 12/10 FROM DUAL;--1.2
SELECT MOD(12,10) FROM DUAL;--2

---------------------------------------------------
--날짜함수
SELECT SYSDATE FROM DUAL;

--POINT(날짜 연산)
--1. DATE + NUMBER >> DATE
--2.DATE - NUMBER >> DATE
--3.DATE - DATE >> NUMBER (일수)

SELECT SYSDATE+100 FROM DUAL; --2023-01-05 16:04:25

SELECT HIREDATE FROM EMP;
SELECT MONTHS_BETWEEN('2022-09-27','2020-09-27') FROM DUAL;--24개월
SELECT MONTHS_BETWEEN(SYSDATE,'2010-09-27') FROM DUAL;--144개월
SELECT MONTHS_BETWEEN(SYSDATE, '1998-02-11') FROM DUAL;--295
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '1998-02-11')) FROM DUAL;--295
--POINT 변환함수 :문자를 날짜로 TO_DATE() [날짜형식을 가지는 문자]
SELECT TO_DATE('2022-01-01') + 100 FROM DUAL;

--사원 테이블에서 사원들의 입사일에서 현재 날짜까지의 근속월수
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS "근속월수" FROM EMP;


--2.한달이 31일이라는 기준에서 근속일수를 구하세요
SELECT ENAME, HIREDATE, TRUNC((SYSDATE-HIREDATE)/31) AS "근속월수" FROM EMP;

--------------------------------------
--[변환함수] POINT
--ORACLE 데이터 : 문자열, 숫자, 날짜
--TO_CHAR() : 숫자->문자로.(1000->$100,00) >>>FORMAT 출력형식 정의
--            날짜 -> 문자('2022-09-29' -> 2022년09월29일)
--TO_DATE() : 문자->날짜
--TO_NUMBER() :문자->숫자 >>>자동형변환때문에 많이 안 씀
--SELECT '100'+100 FROM DUAL;

SELECT '1' + 1 FROM DUAL; --2
--원칙
SELECT TO_NUMBER('1')+1 FROM DUAL; --2

--2
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY')||'년' AS "YYYY",
TO_CHAR(SYSDATE,'YEAR') AS "YYYY",
TO_CHAR(SYSDATE,'MM') AS "MM",
TO_CHAR(SYSDATE, 'DD') AS "DD",
TO_CHAR(SYSDATE, 'DAY') AS "DAY",
TO_CHAR(SYSDATE, 'DY') AS "DY"
FROM DUAL;

--입사일이 12월인 사원의 사번, 이름, 입사일, 입사년도, 입사월
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'DD') AS "일",TO_CHAR(HIREDATE, 'MM') AS "월", TO_CHAR(HIREDATE,'YYYY') AS "년" FROM EMP
WHERE to_char(HIREDATE,'MM')='12';
--to_char():날짜->형식문자 변환

select '>'||to_char(12345,'99999999999')||'<'
from dual;

select '>'||ltrim(to_char(12345,'99999999999'))||'<'
from dual;

select '>'||to_char(12345,'$999,999,999,990')||'<'
from dual;-->          $12,345<

select sal, to_char(sal, '$999,999') from emp;

----------------------------------------
--HR계정으로 변경
/*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서 fullname 별칭 부여해서 출력하고
입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 연봉의 10%(연봉 * 1.1)인상한 값을
출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/

SELECT first_name||' '||last_name as "fullname", to_char(hire_date, 'YYYY-MM-DD') as "입사일",
salary*12 as "연봉", to_char(salary*12*1.1, '$999,999') as "인상연봉"
FROM EMPLOYEES
where to_char(hire_date,'YYYY')>='2005' --hire_date>'2005-01-01'
order by 연봉 desc;
--order by절은 select 다음에 실행 >> select된 결과 컬럼값을 사용가능(alias)
