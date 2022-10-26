오늘은 EL과 JSTL을 배웠다.  

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/*
	String name = request.getParameter("name");
	if(name.equals("kglim")){
		out.print("<b>" + name + "</b>");
	}else if(name.equals("hong")){
		out.print("<i>" + name + "</i>");
	}else{
		out.print("<h3>" + name + "</h3>");
	}
	out.print("<hr>");
*/
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  
위 코드를 EL 과 JSTL 변환 하세요
-->
<h3>EL과 JSTL</h3>

<c:set var="name" value="${param.name}" />
<c:if test="${param.name == 'kglim'}"><b>${param.name}</b></c:if>
<c:if test="${param.name == 'hong'}"><i>${param.name}</i></c:if>
<c:if test="${param.name!='kglim'&&param.name!='hong'}">${param.name}</c:if>



</body>
</html>
```
![image](https://user-images.githubusercontent.com/51879052/197985303-ef2c2f89-b077-4878-8b2d-16675458be8e.png)
링크 뒤에 ?name=kglim, ?name=hong 을 넣으면 각각 볼드체, 이탤릭체로 나오고 다른 이름을 넣으면 그냥 평범한 텍스트로만 나옴.  


```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%
	//request.getParameter(name)   >> jsp?id=kglim&pwd=1004
    //String[] hobby = request.getParameterValues("subject")  >>jsp?subject=농구&subject=축구

	//JSTL : paramValues   >> java : request.getParameterValues
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		subject 다중값을 받아서 choose 구문을 사용하여 값이 하나도 선택되지 않았다면
		"선택을 하세요" 라는 문자를 출력하고 
		값이 하나라도 넘어 왔다면 ... <ul><li>java-0-1</li><li>jsp-1-2</li></ul> 과 같은 형식으로
		출력하도록  forEach 를 작성하세요
		추가사항) 출력시  값-index-count 형식으로 나오게 출력하세요
	 -->
	 <c:if test="${paramValues.subject==null}">선택을 하세요</c:if>
	 <c:forEach items="${paramValues.subject}" var="item" varStatus="status">
       <ul><li>${item} - ${status.index}- ${status.count}</li></ul>
	 </c:forEach>
	 
</body>
</html>
```
![image](https://user-images.githubusercontent.com/51879052/197985598-d69d18ac-4cc3-459c-a207-1ac7434eb00d.png)
체크박스의 값을 받아와 인덱스와 함께 출력한다.  


```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@page import="DTO.Emp"%>
<%@page import="DAO.EmpDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="UTILS.SingletonHelper"%>
<%

	EmpDao ed = new EmpDao();
	List<Emp> emplist = ed.selectAllEmp();
	request.setAttribute("e", emplist);

%>
<!--  
종합 퀴즈 (조별 퀴즈)

EMP 테이블에서 사원전체 데이터를 출력하는 DTO , DAO 를 작성하세요 (JDBC 참고)
그리고 그 데이터 14건을 
EL & JSTL 을 사용해서 출력하세요
단)부트템플릿 사용하세요


-->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"><title>Insert title here</title>
</head>
<body>	

	<c:set var="emplist" value="${requestScope.e}"></c:set>
	<table class="table  table-striped">
	<thead>
	<tr>
		<th scope="col">EMPNO</th>
		<th scope="col">ENAME</th>
		<th scope="col">JOB</th>
		<th scope="col">MGR</th>
		<th scope="col">HIREDATE</th>
		<th scope="col">SAL</th>
		<th scope="col">COMM</th>
		<th scope="col">DEPTNO</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="e" items="${emplist}">
		<tr>
			<td>${e.empno}</td>
			<td>${e.ename}</td>
			<td>${e.job}</td>
			<td>${e.mgr}</td>
			<td>${e.hiredate}</td>
			<td>${e.sal}</td>
			<td>${e.comm}</td>
			<td>${e.deptno}</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	
	
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>
```
JDBC를 이용해서 부트스트랩 테이블 만들기
![image](https://user-images.githubusercontent.com/51879052/197985854-58752657-550c-4239-ae24-8247cf99af05.png)
