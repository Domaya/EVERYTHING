# HTML GRAPHICS 
## HTML SVG

- SVG태그는 Scalable Vector Graphics의 약자로 벡터 기반 그래픽을 XML 형식으로 정의하는 것을 의미  
- SVG태그는 SVG그래픽을 담기 위한 요소  
- SVG태그 내부에 담을 수 있는 것은 원, 사각형, 다각형, 라인,  path 등이 있다  
- SVG태그는 파일의 모든 요소와 모든 속성에 애니메이션을 적용할 수 있다  
 
 ```html
 <!DOCTYPE html>
<html>
<body>

<h1>My first SVG</h1>

<svg width="100" height="100">
   <circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" />
   Sorry, your browser does not support inline SVG.
</svg> 
 
</body>
</html>
```
##### 실행결과 
 ![image](https://user-images.githubusercontent.com/51879052/194763369-69fa1a8a-d2cf-45ab-b431-4e5a815adc4c.png)

참고 링크 : https://nykim.work/35

## HTML Canvas  
<canvas>태그는 자바스크립트를 통해 다양한 그림을 그릴 수 있는 공간을 제공해준다. 해상도 독립적으로 SVG 그래픽을 활용하고 있어서 그래프를 그리거나 게임 그래픽이나 다른 기타 이미지를 실시간으로 그려서 사용할 수 있는 기능을 제공해준다. 기존의 HTML은 매우 정적인 느낌이라면, canvas는 이러한 정적인 느낌을 동적으로 느끼게 해줄 수 있는 HTML5의 커다란 기능 중 하나이다.
 
 참고링크 : https://unikys.tistory.com/274
