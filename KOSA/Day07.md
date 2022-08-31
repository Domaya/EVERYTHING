```java
/*

instance variable >> class Car{private String color;}
>>생성되는 객체마다 다른 색상을 가질 수 있다

local variable >> class Car{public void move(){ int speed;//반드시 초기화 }};

block variable >> class Car{ public void move(){ for(int i=0;//block variable)}}

static variable >> 공유자원(객체간), 객체 생성 이전에 memory에 올라가는 자원(영역 : Class area, method area)

객체를 만드는 유일한 방법 : new를 통해 메모리에 올리는 것
static은 new 없이도 메모리에 올라간다.

Ex06_Variable_Scope 클래스는 new로 메모리에 올린 적이 없다. 어떻게 메모리에 올라가 있을까? "static"

 */

class Variable{
	int iv;
	
	//1.member field, instance variable
	//2.iv 언제 사용 가능할까? 메모리에 언제 올라갈까? >> variable을 new할 때 >> heap 객체 생성>>객체 안에 iv 생성
	//3.목적 : 데이터(정보) 자료를 담을 목적
	//3.1 정보 : 고유, 상태, 부품(class)
	// - 생성되는 객체마다 다른 값을 가질 수 있다.
	// - 그래서 초기화로 값을 강제하지 않음
	// - default 값을 가지고 있다. int => 0, double => 0.0 char > '\u0000' boolean > false, String > null, object > null
	// - iv 변수의 생성ㅅ ㅣ점 : new 라는 연산자를 통해서 heap variable 이름의 객체가 만들어지고 나서 바로 생성
	
	
	static int cv;
	//1.class variable클래스변수 ..일반적으로는 static variable이라 부름 >> 객체 간 공유자원
	//2. 목적 : 정보를 담는 것(생성되는 모든 객체가 공유하는 자원)
	// >>heap영역에 생성된 객체를 공유하는 자원
	//3.접근 방법 class이름.static변수명 >> Variable.cv >> why(객체가 생성되기 전에 ... 접근)
	//   Variable v = new Variable();>> v.cv (같은 주소를 바라본다 : static 변수 주소)
	//4.생성시점
	//	Hello.java >> javac Hello.java >> Hello.class >> java.exe Hello >> RUN.... JVM이 Os에게 메모리 빌림 > 영역을 나눔 > class Loader System 분석
	//	>클래스 정보(metadata:설명) >> class area(method area) 메모리에 올림
	//	>클래스 static variable 또는 static method 있다면 그 둘을 class area에 할당
	//	>함수 이름이 main()이면 정해진 규칙에 따라 실행(Stack 영역에 메인 함수 자원을 할당)
	
	void method() {
		int lv = 0;
		//local variable 지역 변수(함수 안에...)초기화를 하고 사용할 수 있음
		
		//생명주기..함수가 호출되면 새엇ㅇ(stack)
		//함수가 끝나면, return을 만나면 같이 소멸
		
		for(int i=0;i<=10;i++) {
			//block variable. for문이 시작되면 생성되었다가 for문 끝나면 소멸
		}
	}
}

public class Ex06_Variable_Scope {
	public static void main(String args[]) {
		Variable.cv = 100;
		Ex06_Variable_Scope ex06 = new Ex06_Variable_Scope();
		
		Variable v = new Variable();
		v.cv = 200;
		Variable v2 = new Variable();
		v2.cv = 100;
		
		ex06.method();
		System.out.println("v.cv : " + v.cv);
	}
	
	public void method() {
		System.out.println("난 일반함수");
	}
}
```

### 자바 메모리 구조
#### Method Area(Class Area)
-JVM이 실행되면서 생기는 공간
-Class 정보, 전역변수 정보, static 변수 정보가 저장되는 곳
-모든 스레드에서 정보가 공유된다.

##### Heap
-new 연산자로 생성된 객체, array와 같은 동작으로 생성된 데이터가 저장되는 공간
-Reference Type의 데이터가 저장되는 공간
-모든 스레드에서 정보가 공유된다.

##### Stack
-지역변수, 메소드의 매개변수와 같이 잠시 사용되고 필요가 없어지는 데이터가 저장되는 공간
-만약 지역변수이지만 Reference Type일 경우에는 Heap에 저장된 데이터 주소값을 stack에 저장해서 사용하게 된다.
-스레드마다 하나씩 존재한다.

*************
### static
#### static 변수
static 키워드를 통해 생성된 정적멤버들은 Heap영역이 아닌 Static영역에 할당된다.
Static영역에 할당된 메모리는 모든 객체가 공유하여 하나의 멤버를 어디서든지 참조할 수 있는 장점을 가지지만,
Garbage Collector의 관리 영역 밖에 존재하기 때문에 프로그램이 종료될 때까지 메모리에 값이 유지된 채로 존재하게 된다.
그렇기에 static을 남발하게되면 성능에 악영향을 줄 수 있다.

#### static 메소드
static메소드는 객체의 생성 없이 호출이 가능하고, 객체에서는 호출이 불가능하다.또한 static메소드 안에서는 인스턴스 변수 접근이 불가능 하다.

**************
#### 초기자 블럭
```java
class InitTest{
	static int cv = 10;
	static int cv2;
	int iv = 9;
	//default값을 가지고 있어서 초기화를 하지 않아도 된다.
	{
		//초기자 블럭(member field 초기화)
		//객체가 생성되고 나서 int iv가 메모리에 올라간 직후에 초기자 블럭이 호출된다.
		iv = 2222;
		//인위적인 코드가 가능하다. if(iv>10) iv=100;
		System.out.println("초기자");
		if(iv > 10) iv = 1000;
		
		cv = 1000;
		//이 블럭은 객체가 new되지 않으면 실행되지 않는다.(static에대해서)
		
	}
	static {
		//static자원의 초기화 블럭
		//static변수가 메모리에 올라간 직후 실행되는 블럭
		cv = 1111;
		cv2 = cv+2222;
	}
	
}
```

#### static method
```java

	//static member field : 객체간 공유자원...
	//static method 
	//1.객체 생성 없이 호출이 가능하다.
	//2.많이 사용한다
	//3.설계도를 만들 때
	//4.자원을 많이 쓰니 편하게 쓰도록 미리 할당


class StaticClass{
	int iv;
	static int cv;
	void m() {
		//일반 함수에서 iv 제어 가능
		//일반 함수가 static 변수를 바꿀 수 있다.
		cv = 100;
		//why? static 자원은 객체 셍성 이전에 메모리에 로드되므로...사용할 수 있음
	}
	static void print() {
		//static 함수
		//1.cv를 가지고 놀 수 있다
		//2.일반변수 iv를 제어할 수 없다...
		//Cannot make a static reference to the non-static field iv
		//iv = 19;
		cv = 1024125;
	}
}

public class Ex10_Static_Method {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StaticClass.print();
		System.out.println(StaticClass.cv);
		
		//일반자원(객체 생성)
		StaticClass sc = new StaticClass();
		sc.m();
		sc.print();
	}

}
```
