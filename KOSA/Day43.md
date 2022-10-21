```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
  crossorigin="anonymous">
<title>Student Home</title>
</head>
<body>

    <jsp:include page="/commonmodule/HJHeader.jsp" ></jsp:include>
    
    <main role="main">

      <jsp:include page="/commonmodule/HJTopContets.jsp"></jsp:include>
      <jsp:include page="/commonmodule/HJLogin.jsp"></jsp:include>
      <div class="album py-5 bg-light">
        <div class="container">

          <div class="row">
          	<jsp:include page="/commonmodule/HJCard.jsp"></jsp:include>
            <jsp:include page="/commonmodule/HJCard.jsp"></jsp:include>
            
            <jsp:include page="/commonmodule/HJCard.jsp"></jsp:include>

            <jsp:include page="/commonmodule/HJCard.jsp"></jsp:include>
            <jsp:include page="/commonmodule/HJCard.jsp"></jsp:include>
            <jsp:include page="/commonmodule/HJCard.jsp"></jsp:include>

            <jsp:include page="/commonmodule/HJCard.jsp"></jsp:include>
            <jsp:include page="/commonmodule/HJCard.jsp"></jsp:include>
            <jsp:include page="/commonmodule/HJCard.jsp"></jsp:include>
          </div>
        </div>
      </div>

    </main>
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
  <script
    src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
  <script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>  
</body>
</html>
```
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
  crossorigin="anonymous">
<title>Student Home</title>
</head>
<body>

    <jsp:include page="/commonmodule/HJHeader.jsp" ></jsp:include>
    
    <main role="main">

      <div class="container">
      <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        <h2>JOIN form</h2>
      </div>

      <div class="row">
<!--  		<jsp:include page="/commonmodule/HJCart.jsp"></jsp:include>-->
       </div>
        <jsp:include page="/commonmodule/HJForm.jsp"></jsp:include>
      </div>

    </main>
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
  <script
    src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
  <script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>  
</body>
</html>
```

리액트에서 컴포넌트를 나눴듯이 jsp로 요소를 나누는 실습을 진행했다
