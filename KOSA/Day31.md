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


preparedStatement를 이용한 실습 예제...
try~catch를 사용시 가독성이 떨어질 것 같아 연습용으로
모든 예외는 throws했음!!
```java
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.or.kosa.ConnectionHelper;
/*
sdept 테이블에 대해서
전체조회
조건조회
삽입
삭제
수정
을 작업 하시면 됩니다
PreparedStatement
 */
public class HW01 {
	public static void main(String[] args) throws SQLException {
		Connection conn = null;
		conn = ConnectionHelper.getConnection("oracle"); //DB 연결!
		//System.out.println(conn.toString());
		
		PreparedStatement pstmt = null;
		ResultSet rs = null; //select문을 위한...
		String sql = null;
		
		
		//전체조회
		System.out.println("sdept 테이블 전체 조회");
		sql = "select * from sdept";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int deptno = rs.getInt("deptno");
			String dname = rs.getString("dname");
			String loc = rs.getString("loc");
			
			System.out.println(deptno + "/" + dname + "/" + loc);
		}
		System.out.println("============================================");
		//조건조회
		//DNAME이 SALES인 경우를 조회한다
		pstmt = null;
		rs = null;
		sql = "select * from sdept where dname = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "SALES");
		rs = pstmt.executeQuery();
		System.out.println("조건 조회... dname = SALES인경우");
		while(rs.next()) {
			System.out.println(rs.getInt("deptno") + "/" + rs.getString("dname")+"/"+rs.getString("loc"));
		}
		System.out.println("============================================");
		
		//삽입
		System.out.println("삽입 예제");
		pstmt = null;
		sql = "insert into sdept(deptno,dname,loc) values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, 50);
		pstmt.setString(2,"IT");
		pstmt.setString(3,"SEOUL");
		pstmt.executeUpdate();
		System.out.println("INSERT 성공");
		
		System.out.println("=============================================");
		//삭제
		System.out.println("삭제 예제");
		pstmt = null;
		sql = "delete from sdept where deptno = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, 60);
		pstmt.executeUpdate();
		System.out.println("DELETE 성공");
		System.out.println("==============================================");
		//수정
		System.out.println("수정 예제");
		pstmt = null;
		sql = "update sdept set deptno=?, dname=?, loc=? where deptno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, 80);
		pstmt.setString(2, "mt.Hallah");
		pstmt.setString(3, "JEJUDO");
		pstmt.setInt(4, 70);
		pstmt.executeUpdate();
		System.out.println("UPDATE 성공");

	}
}
```
