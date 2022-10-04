# JDBC
Java Database Connectivity
자바 프로그램이 데이터베이스와 연결되어 데이터를 주고받을 수 있게 해주는 프로그래밍 인터페이스.
응용프로그램과 DBMS간의 통신을 중간에서 번역해주는 역할을 한다.


java.sql 패키지

-java.sqlDriver : DB와 연결하는 Driver class를 만들 때 반드시 implements해야 하는 interface로 JDBC 드라이버의 중심이 되는 itnerface입니다.
-java.sql.Connection : 특정 데이터베이스와 연결을 가지는 interface. DriverManager로부터 Connection 객체를 가져옵니다.
-java.sql.Statement : sql query문을 DB에 전송하는 방법을 정의한 interface입니다. Connection을 통해 가져옵니다.
-java.sql.ResultSet : SELECT구문 실행 결과를 조회할 수 있는 방법을 정의한 interface입니다.
-java.sql.PreparedStatement : Statement의 하위 인터페이스. SQL문을 미리 컴파일하여 실행속도를 높입니다.
-java.sql.CallableStatement : PreparedStatmene의 하위 인터페이스. DBMS의 Stored procedure를 호출합니다.

## JDBC 개발 단계
1. JDBC Driver loading : 데이터베이스 벤더에 맞는 드라이버를 호출. 디비 연결을 위해 드라이버 로딩
2. Connection : DB와 연결을 위해 URL과 계정정보를 필요로 한다. DriverManger.getConnection(rul,id,pwd):Connection
3. Statement/PreparedStatement : SQL구문을 정의하고 변경될 값은 치환문자 (?)를 이용해 쿼리 전송 전에 값을 setting한다.
4. executeUpdate() or executeQuery() : SQL문이 Insert,delete,update일 때...return int/ SELECT문일 때....return ResultSet
5. ResultSet(SELECT의 경우) : 데이터베이스 조회 결과집합에 대한 표준. next()를 통해 DB의 table안의 row 한 줄을 불러온다. getString(), getInt()를 통해 한 행의 특정 Column값을 가져온다.
6. close(Connection, Statement, ResultSet)
