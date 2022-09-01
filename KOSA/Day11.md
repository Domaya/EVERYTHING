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


## 오버라이드  
상속 관계에 있는 부모 클래스에서 이미 정의된 메소드를 자식 클래스에서 같은 시그니처를 갖는 메소드로 다시 정의하는 것이다. 상속받은 메소드를 그대로 사용하기도 하지만, 자식 클래스 자신에 맞게 변경해야 하는 경우가 많은데 이럴 때 부모의 메소드를 오버라이딩한다.

상속 관계에서 재정의

1.부모함수 이름 동일  
2.부모함수 파라미터 동일  
3.부모함수 return type 동일  
4. 결국 {안에 실행 블럭안에 코드만 변경 가능}


```java

class Test2{
	int x = 100;
	void print() {
		System.out.println("부모 함수 TEST2");
	}
}

class Test3 extends Test2{
	int x = 300; //부모 무시하기(C#) //이런 방식은 쓰지 마세요
	//재정의 (검증)
	@Override
	void print() {
		System.out.println("자식 함수 TEST3... 자식이 부모의 함수를 재정의");
	}
	
	//이름은 같은데 파라미터가 다르다... 오버라이딩 아니고 오버로딩임
	void print(String str) {
		System.out.println("이건 오버로딩 함수임");
	}
}

public class Ex05_Inherit_Override {
	
	public static void main(String[] args) {
		Test3 t3 = new Test3();
		t3.print();// 자식함수 TEST3...
		t3.print("hello") // 이건 오버로딩 함수임
	}
}
```

## Super

```java
//this:객체 자신을 가리키는 지시어 this
//혹은 다른 생성자를 호출하는 함수 this()

/*
 * 상속관계
 * 부모, 자식
 * 
 * super(현재 자식이 부모에 접근할 수 있는 주소값) : 상속관계에서의 부모에 접근할 수 있는 방법
 * !!부모 객체의 주소값!!
 * 
 * 1.super >> 상속관계에서 부모 자원에 접근
 * 2.super >> 상속관계에서 부모의 생성자를 명시적으로 호출할 수 있음
 * 
 * C#에서는 이런 걸 base로 만들었음 super말고
 * 
 * 
 * 
 */

class Base{
	String basename;
	Base(){
		System.out.println("Base 기본 생성자 함수");
	}
	Base(String basename){
		this.basename = basename;
		System.out.println("오버로딩 생성자 함수...basename : " + this.basename);
	}
	void method() {
		System.out.println("부모 메소드입니다");
	}
}

class Derived extends Base{
	String dname;
	Derived(){
		super(); // default로 부르니까ㅣ 생략한다 보통
		System.out.println("Derived 기본 생성자 함수");
	}
	Derived(String dname){
		super(dname); //부모 생성자 호출
		this.dname = dname;
		System.out.println("dname : " + this.dname);
	}
	
	
	void method() {
		System.out.println("재정의");
	}
	//어느 날 부모님이 생각날 때...super
	void pmethod() {
		super.method();
		//재정의 상태에서 부모자원을 부를 수 있는 유일한방법이다 !!!!!
	}
}


public class Ex06_Inherit_super {
	public static void main(String[] args) {
		Derived d = new Derived("홍길동");
		d.method(); //자식이 재정의를 하지 않으면 부모 자원을 부름..하지만 여기선재정의했으므로 '재정의'가 나온다
		d.pmethod(); //부모메소드입니다
	}
}
```


## 예외 처리
```java
import java.io.IOException;

/*
 * try{
 * 
 * }catch(Exception e){
 * 
 * }finally{
 * 	//예외 발생여부에 상관없이 강제 실행
 * 
 * }
 * 
 * 나는 예외가 있든 없든 강제적으로 실행되야하는 코드를 가지고 있다.
 * 
 * 1.게임파일 설치... C:\Temp 에 복사
 * 2.복사한 파일로 게임 설치
 * 3.설치되면 Temp삭제
 * 4.설치 오류 발생해도 Temp삭제
 * 
 */
public class Ex03_finally {
	static void startInstall() {
		System.out.println("install");
		
	}
	static void copyFiles() {
		System.out.println("copy");
	}
	static void fileDelete() {
		System.out.println("delete");
	}
	
	//실제로 예외는 아니지만 개발자가 필요에 따라서 어떤 상황을 예외적인 상황이라 정의하고 예외를 발생시킬 수 있음 >> 사용자 정의 예외 처리
	//throw new IOException
	public static void main(String[] args) {
		try {
			copyFiles();
			startInstall();
			throw new IOException("install 중 문제 발생");
		}catch (Exception e) {
			System.out.println("예외 메시지 출력 : " + e.getMessage());
		}finally {//강제적인 실행 블럭에 대한 예외가 발생해도 실행...안 발생해도 실행
			//함수의 강제종료 return을 만나도 finally가 먼저 실행됨
			fileDelete();
		}
		/*
		 * try { ExClass ex = new ExClass("Temp"); } catch (NullPointerException e) { //
		 * TODO Auto-generated catch block e.printStackTrace(); } catch (Exception e) {
		 * //상위 예외가 하위 예외보다 뒤로 ..................... // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
		
		try {
			ExClass ex = new ExClass("TEMP");
		} catch (NullPointerException | IOException e) {
			e.printStackTrace();
		}
	}
}
```
