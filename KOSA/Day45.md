# Ex20_Session_Login.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 UI</title>
</head>
<body>
<!-- 
순수한 JSP사이트 제작
Model1 방식 개발 (JSP 요청받고 처리 ....)
UI + 처리 (2개의 페이지 설계)
login.jsp -> loginok.jsp
action = "Ex20_Session_ok.jsp"
 -->
	<form action="Ex20_Session_ok.jsp" method="post">
		<input type="text" name="uid"><br>
		<input type="password" name="pwd"><br>
		
		<input type="submit" value="로그인">
		<input type="reset" value="취소">
	</form>
	<hr>
	<h3>회원 전용 페이지</h3>
	<a href="Ex20_Session_Member.jsp">회원접속</a>
</body>
</html>
```

# Ex20_Session_ok.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
      //1.  한글처리
      request.setCharacterEncoding("UTF-8");

      //2.  데이터 받기
      String uid = request.getParameter("uid");
      String pwd = request.getParameter("pwd");
      
      //3.  업무처리(로직처리) >> 개발자 로직 제어
      //JDBC  >>  DB연결  >> CRUD 구문생성  >>  실행  >> 결과 >> 처리
      //Model  >>  DTO  ,  DAO  >>  DAO객체만 생성 가지고 놀기

      //DB 연결  >>  회원테이블 >> id , pwd >> 회원여부인지 검증
      //쿼리문) select count(*) from member where id=? and pwd=?
      //쿼리문) select id , pwd from member where id=? 
            
      //수행되었다 치고
      boolean success =  false;
      if(uid.equals(pwd)){
         //로그인 성공
         //Session 객체 >> Scope >> WAS >> 내에서 사용가능 (WEBAPP 내에서 모든 페이지가 사용)
         //POINT >> session 객체 >> (WEBAPP 내에서 모든 페이지가 사용)
         session.setAttribute("memberid", uid);
          //memberid 세션변수는 모든 페이지에서 사용 가능해짐
            success = true;
      }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
         <%
               if(success == true){
                  //로그인 성공 ....
                  out.print("<b>로그인 성공</b><br>");
                  String user = (String)session.getAttribute("memberid");
                  out.print(user + "님 로그인 되었습니다^^<br>");
                  out.print("<a href='Ex20_Session_Member.jsp'>회원전용</a>");
               }else{
         %>
               <!-- 로그인 실패 -->
               <script type="text/javascript">
                     alert("다시 로그인 해주세요");
                     location.href="Ex20_Session_Login.jsp"; //F5 (새로고침)
                     //window.history.go(-1)
                     
               </script>
         <%
               }
         %>      
</body>
</html>
```

# Ex20_Session_Member.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
            //이 페이지는 회원전용
            //로그인하지 않는 사용자는 올 수 없어요
            //session >> memberid 유무 >> 성공(id ....)
            String memberid = (String)session.getAttribute("memberid");
            boolean loginstate = (memberid == null)  ?  false  :  true ;
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <%
            if(loginstate == true){
               out.print(memberid + "님 로그인 상태입니다<br>");
               out.print("당신은 이 페이지를 볼 수 있습니다<br>");
               //로그아웃
               out.print("<a href='Ex20_Session_Logout.jsp'>로그아웃</a>");
            }else{
               out.print("<script>location.href='EX20_Session_Login.jsp'</script>");
               
            }
      
      %>
</body>
</html>
```

# Ex20_Session_Logout.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//로그아웃(session 객체 소멸)
    	session.invalidate();
    	out.print("<script>location.href='Ex20_Session_Login.jsp'</script>");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
```


![image](https://user-images.githubusercontent.com/51879052/197672221-b1e6c89e-3712-43b7-b745-281e84314ca2.png)
![image](https://user-images.githubusercontent.com/51879052/197672298-c3786181-1e27-4bc1-8057-4d408f5cfc70.png)
![image](https://user-images.githubusercontent.com/51879052/197672323-da274a2b-a538-406b-81cb-c50b0f47ddf0.png)
