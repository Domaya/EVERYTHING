Single or Double Quotes?
Double quotes around attribute values are the most common in HTML, but single quotes can also be used.

In some situations, when the attribute value itself contains double quotes, it is necessary to use single quotes:

# Ex01_Basic.html
```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		1. HTML describes the structure of a Web page
		<br>
		2. 웹브라우저는 해석기다 (html, css, javascript)
		<br>
		<h3>제목</h3>
		<a href="http://www.naver.com">네이버 가기</a>
		<br>
		<img src="images/1.jpg" alt="경로가 없어요" width="100" height="100">
		<p>문단태그<br>엔터처리합니다</p>
		<p>
		아
		정
		말
		길
		다
		</p>
		<p title='John "ShotGun" Nelson'>데이터표현</p>
		<p title="John 'ShotGun' Nelson">데이터표현</p>
		<pre>
		*
		**
		***
		****
		*****
		*
		*
		</pre>
		<hr>
		<!-- html주석처리는 이렇게 합니다 -->
		<!-- ctrl+shitf+/ -->
		<h3>html은 전체적인 구조를 정의하는 언어...디자인 작업 한계가 있다</h3>
		<h3>CSS를 통해서 디자인 작업을 합니다</h3>
		<font style="color:gold;font-family:궁서체">스타일시트 글자정의</font>
		<hr>
		html도 속성을 사용하면 디자인.....
		<br>
		<font color="red" size="10px" face="명조체">글자연습...근데 우린 스타일시트 쓸거임</font>
	</body>
</html>
```


# Ex02_Css.html
```html
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
   <title>Css 적용하기</title>
   <!-- Internal..page 내부 적용 -->
   <style type="text/css">
      body {background-color:gray;}
      h3{color:pink;}
   </style>

	<link rel="stylesheet" href="css/common.css">
<title>Insert title here</title>
</head>
<body>
<!-- 
Cascading Style Sheets (CSS) is used to format the layout of a webpage.
CSS can be added to HTML documents in 3 ways:

Inline - by using the style attribute inside HTML elements
Internal - by using a <style> element in the <head> section
External - by using a <link> element to link to an external CSS file
 -->
 <h3>1. Inline 방식 (태그 안쪽)</h3>
 <p style="background-color: aqua;">문단태그</p>
 <h3 style="color:green;">나는 무슨 색</h3>
 <h3>핑크색인가?</h3>
 <h3>external</h3>
 <h1>외부파일을 참조합니다</h1>
 <h3>웹상에서의 절대 경로</h3>
 <img src="http://img.woowahan.com/www/common/baemin.jpg">
</body>
</html>
```

# common.css
```css
@charset "UTF-8";
h1{
	color: olive;
}
```
