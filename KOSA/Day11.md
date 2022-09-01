OOP 특징 : 여러 개의 조각(클래스)들을 조합해서 하나의 큰 제품을 만드는 행위  
1.상속  
2.캡슐화 private  
3.다형성(상속 관계에서 부모 타입이 자식 타입 주소를 가질 수 있다.)  



상속
java : child extends Base
C# : child : Base


특징  
1.다중 상속 불가능  
2.단일 상속(계층적 상속)가능(어럭 ㅐ의 클래스를 상속)  
3.다중 상속을 지원(interface)  


## 상속   
1.진정한 의미 : 재사용성  
2.단점 : 초기 설계 비용  



설계도 1장으로 모든 업무를 구분하는 것은 현실적으로 불가능하다.
설계도를 여러개로 나눌 때 기준이나 관계에 따라 문제가 발생할 수 있다.

쇼핑몰 : 결재관리, 배송관리, 판매처, 회원관리, 관리자관리, 상품관리 >> 각각의 업무 > 별도의 설계도

여러개의 설계도를 관계...이어주는 기준

1.상속(is ~ a : 상속) 은 ~ 이다(부모를 뒤에)  
2.포함(has ~ a : 포함) 은 ~ 틀 가지고 있다  

원은 도형이다
원 extends 도형
삼각형은 도형이다
삼각형 extends 도형

원과 점 관계...
원은 점이다(x)
원은 점을 가지고 있다(o)
has ~ a (부품정보)
->class 원(점이라는 부품이 member field)

경찰과 권총
경찰은 권총이다(x)
경찰은 권총을 가지고 있다(o)
class 권총()
class 경찰(권총 member field)

원은 도형이다
삼각형은 도형이다
사각형은 도형이다

도형은 분모(공통적) 공통자원 : 추상화, 일반화 (그리다, 색상)
원은 구체화, 특수화된 내용을 가지고 있어야 함(본인만의 특징) (반지름. 한 점)

점 : 좌표값(x, y)
원은 점을 가지고 있다
삼각형은 점을 가지고 있다
사각혐은 점을 가지고 있다

class Shape(그리다, 색상) > 상속관계에서 부모로 둔다
class Point(좌표값) > 포함관계.

구체화, 특수화 : Circle, Triangle


```java

  //원을 만드세요(원의 정의 : 원은 한 점과 반지름을 가지고 있다)
  //1.원은 도형이다 (is ~ a) : shape
  //2. 원은 점을가지고 있다(has ~ a) : point >>member field
  //3.원은 반지름을 가지고 있다(특수, 구체화) : radius

  //원의 반지름은 초기값 10을 가진다
  //점의 좌표는 초기값 (10, 15)를 가진다
  //초기값을 설정하지 않으면 반지름과 점의 값을 입력을 받을 수 있다(원이 만들어질 때)
class Circle extends Shape{ //상속
	Point point; //포함
	int radius; //특수성
	public Circle() {
     //this.radius = 10;
     //this.point = new Point(10, 15);
		this(10, new Point(10, 15));
	}
	public Circle(int radius, Point point) {
		this.radius = radius;
		this.point = point;
	}
}



public class Ex02_Inherit_Composition {

	public static void main(String[] args) {
		Circle c = new Circle();
		System.out.println(c.radius);
		System.out.println(c.color);
		System.out.println(c.point.x);
		System.out.println(c.point.y);
		c.draw();;
		
		//반지름, 원값을 내가 입력
	  //Point point = new Point(100, 200);
		Circle c2 = new Circle(50, new Point(100, 200));
		
		

	}

}
```
