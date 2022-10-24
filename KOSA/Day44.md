221024  

# get Parameter  
<jsp:param>태그를 이용해서 포함할 JSP페이지에 파라미터를 추가할 수 있다.  
<jsp:param>액션 태그는 <jsp:include>나 <jsp:forward>액션 태그의 자식 태그로 추가한다.  
<jsp:param>은 ***String type***만의 값을 전달할 수 있다.  

```jsp
<jsp:forward page="forward 시킬 JSP 페이지">                                            
     <jsp:param name="파라미터키" value="값"/>
</jsp:forward>
```
```jsp
<%
     String value = "forwarding value"; //필요에 따라 동적인 값을 할당                
%>
 
 
<jsp:forward page="forwarding.jsp">
     <jsp:param name="파라미터키" value="<%= value %>"/>
</jsp:forward>
```
```jsp
<%
     String value1 = request.getParameter("파라미터키");                                
%>
```

http는 Stateless프로토콜, 즉 클라이언트의 상태를 유지하지 않는 프로토콜이다. 그러나 서비스에서는 Stateful한 방식이 필요한 경우가 있다. 이러한 Stateful을 가능하게 만드는 방법으로는 쿠키와 세션이 있다.  

# 쿠키Cookie  
웹브라우저가 보관하는 데이터이다. 웹브라우저는 웹 서버에 요청을 보낼 때 쿠키를 함께 전송하며, 웹 서버는 웹 브라우저가 전송한 쿠키를 사용해서 필요한 데이터를 읽을 수 있다. 쿠키는 웹 서버와 웹 브라우저 양쪽에서 생성할 수 있는데, JSP에서 생성하는 쿠키는 웹 서버에서 생성하는 쿠키이다.  

## 쿠키의 동작 방식  
1. 쿠키 생성 단계 : 최초 통신에서는 클라이언트가 서버의 쿠키를 가지고 있지 않은 상태에서 request한다. 그럼 웹서버는 request헤더에 쿠키가 포함되어 있지 않은 것을 판단하고, 웹 서버 측에서 통신의 상태(이름, 값, 유효시간, 도메인, 경로)를 담아 쿠키를 생성한다. 생성한 쿠키를 response데이터의 헤더에 저장해서 웹 브라우저에 전송한다.  
2. 쿠키 저장 단계 : 웹 브라우저는 응답 데이터에 포함된 쿠키를 쿠키 저장소에 보관한다. 쿠키의 종류에 따라 메모리나 파일에 저장한다.  
3. 쿠키 전송 단계 : 웹 브라우저는 저장한 쿠키를 request가 있을 때마다 웹 서버에 전송한다. 웹 서버는 웹 브라우저가 전송한 쿠키를 사용해서 필요한 작업을 수행한다.

```jsp
<%
  Cookie mycookie = new Cookie("cname", "1004");
  
  response.addCookie(mycookie);
%>
```
