### 오버로딩

OOP 객체 지향 프로그래밍(여러 개의 조각들을 만들어서 조합하는 행위)

여러개의 설계도를 재사용하는 방법  
1 상속(재사용성)  
2 캡슐화(은닉화) : private ... setter, getter (직접 할당을 막고 간접할당을 통해서 데이터를 보호)  
3다형성 : 하나의 타입으로 여러 개 객체의 주소를 가질 수 있는 것 -> method overloading(오버로딩)하나의 이름으로 여러가지 기능을 하는 함수

System.out.println() >> println()함수 이름은 한개인데 사용방법은 여러개  
1.오버로딩은 성능 향상과 무관하다.  
2.편하게 사용하려고... 설계자가 개발자를 배려  
3.오버로딩을 사용하지 않아도 문제 되지 않는다  


문법 ) 함수 이름은 같고 parameter의 개수와 타입이 다름  
1.함수 이름은 동일  
2.parameter 개수 또는 타입이 달라야 한다.  
3.return type은 오버로딩의 판단 기준이 아니다.  
4.parameter의 순서가 다름을 인정한다.  

오버로딩은 상속과 아무 관련이 없음!  
오버라이딩이 상속과 관련이 있음  

```java
class Human2{
	String name;
	int age;
}

class Test2{
	Human2 add(Human2 h) {
		h.name = "산신령";
		h.age = 200;
		return h;
		//return null; //human2는 주소를 가지고 있지 않아요
	}
	
	Human2 add(Human2 h, Human2 h2) {
		h2.name = h.name;
		h2.age = h.age;
		
		return null;
	}
}

public class Ex14_Method_Overloading {

	public static void main(String[] args) {
		
		Test2 t = new Test2();
		
		Human2 man = new Human2();
		Human2 man2 = t.add(man);
		
	}

}
```


### 생성자 함수(constructor)  
1.함수(특수한 목적)  
2.목적(member field초기화) >> static{}, {초기자 블럭}  
3.일반함수와 다른점  
3.1 함수의 이름이 고정(class이름과 동일)  
3.2 return type 없음 (객체 생성과 동시에 호출)...리턴 받을 대상이 없음  
3.3 실행시점 >> new로 객체 생성>> heap공간 생성>> member field 자리 >> 생성자 호출  
3.4 return type(x) >> void >> public void(생략) 클래스이름 >> public 클래스이름(){}  
4.쓰는 이유 : 생성되는 객체마다 [강제적으로] 멤버 필드를 초기화하기 위해서.  

>차량을 만들 때 무조건 색상을 입력하게 할 수 있는 방법 ....  
> 함수 ...., { } 강제성이 없거나 또는 입력값을 강제하지 못함  

5.생성자 함수(오버로딩 기법)  

6.생성자 오버로딩을 통해서 다양한 강제사항 구현 가능   

생성자(함수)를 쓰는 가장 중요한 목적은 강제적 초기화(member field)  

```java

class Car{
	String carName = "포니";
	//당신이 만약 Car 설계도를 만들 때...
	//컴파일러가 알아서 함수를 생성 ...
	//생성자 함수
	//public Car(){} 자동 생성
	
	
	//개발자가 직접 구현
	public Car() { 
		System.out.println("기본생성자 호출");
		carName = "내마음";
	}
}

class Car2{
	String carName; //null
	public Car2() {
		carName = "포니";
	}
}

class Car3{
	String carName;
	public Car3() {
		carName = "기본이름";
	}
	public Car3(String name) {
		carName = name;
	}
}

class Car4{
	String carName;

	public Car4(String name) {
		carName = name;
	}
	//개발자가 오버로딩된 생성자를 한 개라도 만든다면 컴파일러는 자동으로 default 생성자를 만들지 않는다.
	//만약 강제하고 싶지 않으면 default 생성자를 구현해줘야 한다.
}

public class Ex15_Constructor {

	public static void main(String[] args) {
		Car car = new Car(); //new Car() 괄호가 생성자 함수의 괄호...default constructor
		System.out.println(car.carName);
		
		Car3 car3 = new Car3();
		System.out.println(car3.carName);
		Car3 car3_2 = new Car3("mycar");
		System.out.println(car3_2.carName);
	}

}
```


또 다른 생성자 예제
```java
  /*
 책은 책 이름과 가격정보를 가지고 있다  
 책이 출판되면 반드시 책 이름과 책 가격 정보를 가지고 있어야 한다  
 책의 이름과 가격 정보는 특정 기능을 통해서만 볼 수 있고  
 출판된 이후에는 수정할 수 없다.
 책 이름과 가격 정보는 각각 확인할 수 있다.
  */

public class Book {
	String name;
	int price;
	public Book(String name, int price) {
		this.name = name;
		this.price = price;
	}
	public void show() {
		System.out.printf("[%s] : \\%d\n", name, price);
	}
	
	public String getBookName() {
		return name;
	}
	public int getPrice() {
		return price;
	}
}
```

### 예외처리
```java
/*
오류
1.에러error : 네트워크 장애, 메모리, 하드웨어 >> 개발자가 코드적으로 해결 불가
2.예외exception : 개발자의 실수에 의해 발생 >> 문제 코드 찾아서 수정, 배포
				>>프로그램 컴파일시가 아니라... 실행시 발생. 알 수 없어요
				>>문제가 발생하면(exception) 프로그램 강제 종료(웹에서 500번 오류)
3.예외처리 >> 에외발생에 대한 코드 수정이 아니고, 일단 임시 방편으로 문제가 생기더라도 프로그램이 안정적으로 종료되는 것을 처리
	>>결국 예외처리를 통해서 문제가 생긴 부분을 찾고 전체 코드 다시 수정, 배포
	
	try{
		>>문제가 의심되는 코드 실행
		>>문제가 발생(exception)
	}catch(Exception e){
		>>문제가 발생한 예외 부분을 파악
		>>처리(코드를 수정하는 것이 아님)
		1.관리자 email로 보고
		2.log 파일 남기는 것(장애 발생 기록)
		3.강제로 프로그램 종료되는 것을 막음(일단은)
	}finally{
		>>문제가 발생하든 않든 강제적으로 실행해야 될 코드
		>>DB작업 문제(특정 자원에 종료) 강제
	
	
	}

 */


public class Ex01_Exception {

	public static void main(String[] args) {
		System.out.println("main start");
		
		try {
			System.out.println(0/0);
			//연산예외가 발생
			//Exception클래스 사용(예외 클래스의 최상위 부모)
			//Exception e >> Exception 객체의 주소값...
			//ArithmeticException 문제가 발생
			//컴파일러에 의해 ArithmeticException 객체가 생성되고
			//그 객체에게 문제가 되는 메시지, 코드를 전달...
			}catch(Exception e) { //부모클래스는 자식타입의 주소값을 받을 수 있다.
			//어떤 문제인지를 파악하고 그 정보를 전달
			System.out.println(e.getMessage()); 
		};
		
		//main end 구문 화면에 출력되지 않음
		System.out.println("main end");
		

	}

}
```

### this
1.객체 자신을 가리키는 this(앞으로 생성될 객체의 주소를 담을 곳이라고 가정)
	인스턴스 자신을 가리키는 참조변수. 인스턴스의 주소가 저장되어 있음
	모든 인스턴스 메소드에 지역변수로 숨겨진 채로 존재
  
2.this객체자신의 주소(생성자 호출)>[원칙적으로 객체 생성시] [한개만 호출]
	그런데 this 학습하면 예외적으로 this()를 통해서 여러개의 생성자를 호출할 수 있다.


```java
class Zcar{
	String color;
	String geartype;
	int door;
	
	void print() {
		System.out.println(this.color + ", " + this.geartype + ", " + this.door);
		
	}
	Zcar(){
		this("red", "auto", 2);
		System.out.println("default");
	}
	Zcar(String color, String geartype, int door){
		this.color = color;
		this.geartype = geartype;
		this.door = door;
		System.out.println("overloading");
	}
	
}

public class Ex20_this {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Zcar zcar = new Zcar();
	}

}
```
