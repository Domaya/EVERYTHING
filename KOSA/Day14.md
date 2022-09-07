# 추상화 Abstract

본체가 있는 메소드는 abstract 키워드를 가질 수 없다.
```java
  public abstract int c(){System.out.println("Hello");} //Abstract methods cannot have a body
```
위와 같이 사용할 수 없다.

```java
abstract class A{ //추상메소드를 가지고 있다면 추상 클래스가 된다.
    public abstract int b(); //body가 없는 abstract 메소드
    public void d(){
        System.out.println("world");
    }
}

class B extends A{ //abstract class 상속
    public int b(){ //abstract method의 오버라이딩
        return 1;
    }
}

public class AbstractDeom {
    public static void main(String[] args) {
        A obj = new B();
        //A obj2 = new A(); //'A' is abstract; cannot be instantiated
    }
}
```
클래스 내에 메소드가 하나라도 abstract라면 클래스도 추상 클래스가 된다.
추상클래스는 상속을 강제하기 위해 상요한다. 부모클래스에는 메소드의 시그니처만 정의해놓고 그 메소드의 실제 동작 로직은 이를 상속받은 하위 클래스의 책임으로 위임한다.
추상 클래스는 구체적인 메소드의 내용이 존재하지 않기 때문에 인스턴스화시켜서 사용할 수 없다. 추상클래스를 사용하려면 하위 클래스로 상속받은 후 추상클래스를 오버라이드해야한다.

# 인터페이스

인터페이스(interface)는 abstract, final과 함께 대표적인 규제다. 인터페이스는 어떤 객체가 있고, 그 객체가 특정한 인터페이스를 사용한다면 그 객체는 반드시 인터페이스의 메소드들을 구현해야 한다. 그렇지 않다면 컴파일되지 않는다.

 추상클래스와 인터페이스 차이점.
 1. 추상클래스(완성 + 미완성), 인터페이스 (모든것이 미완성)
 2. 원칙적으로 클래스는 다중상속(계층적상속)이 안되지만 인터페이스는 다중구현이 가능.
 >>여러개를 만들어서 >> 모아모아서 큰 약속 >> 너무 큰 약속을 만들면 사용성이 그리고 재사용성이 떨어짐.
 Ia, Ib, Ic
 class Test extends Object implement Ia, Ib, Ic
 Tip) 인터페이스와 인터페이스끼리는 상속가능 (extends) >> 약속을 크게 만들 수 있다.
 
 4. 인터페이스 (상수를 제외한 나머지는 미완성 추상(함수) >> JDK8 버전부터는 (Default 값, static값도 사용을 하지만 거의 안씀.)
 
  초급개발자의 시선으로
 1. 인터페이스를 [[[[다형성]]]] 입장으로 접근 (인터페이스는 부모타입) *************************************
 2. 서로 연관성이 없는 클래스를 하나로 묶어주는 기능(같은 부모를 가지게함)
 3. Java API 수 많은 (미리 만들어진) Interface 제공 (설계하지 않아도) 
 4. 인터페이스 (~able) : 날수있는, 수리할 수 있는, 
 5. 객체간 연결 고리(객체간 소통) > [[[ 다형성 ]]] 
 nterface
 1. 실제 구현부를 가지고 있지 않다 : 실행 블럭이 없다. : 규칙(약속)
 시스템에서 이동하는 것을 move 라는 이름을 사용하고 이동시에는 좌표값을 받아야 한다.
 >> 합의 >> void move(int x, int y); > {구현은 알아서} 클래스 알아서 ...... >> 재정의 >> 구현
 >> JAVA API 인터페이스 설계하고 구현하는 클래스를 이미 다 생성.
 >> Collection(동적배열) >> Vector, [[ArrayList]], HashSet, [[HashMap]]
 Collection 클래스는 수 많은 인터페이스 구현하고 있는 클래스
 
 2. 생성방법
 2.1 상수(final) : [public static final] int VERSION = 1 //변수 대문자!!! >> 실사용시 (int VERSION=1;)
 				  생략하면 컴파일러가 알아서 [public static final] 사용.
 2.2 추상함수(method) : public abstract void run() ;///// *접근제한자는 무조건 public 사용하자
 					  생략하면 컴파일러가 알아서 [public abstract] 사용.


```java
 
interface I{
    public void z();
}
 
class A implements I{
    public void z(){} //삭제시 에러...Class 'A' must either be declared abstract or implement abstract method 'z()' in 'I'
}
```
클래스 A 뒤의 implements I는 이 클래스가 인터페이스 I를 구현하고 있다는 의미다. 그것은 3행의 interface I의 멤버인 public void z() 메소드를 클래스 A가 반드시 포함하고 있어야 한다는 뜻이다. 따라서 위의 코드는 문제가 없다. 여기서 public void z()를 삭제하면 컴파일 에러가 발생한다.

상속은 하위클래스가 상위클래스의 기능을 물려받는 것이고, 인터페이스는 **하위 클래스에 특정한 메소드가 존재하도록 강제**한다.
사용하는 키워드도 다르다. 클래스를 선언 할 때는 class를 사용하지만 인터페이스는 interface를 사용한다.
상속은 extends를 사용하지만 인터페이스는 implements를 사용한다.

## 인터페이스의 규칙  
### 하나의 클래스가 여러 개의 인터페이스를 구현할 수 있다.
```java
interface I1{
    public void x();
}
 
interface I2{
    public void z();
}
 
class A implements I1, I2{
    public void x(){}
    public void z(){}   
}
```
클래스 A는 메소드 x와 z 중 하나라도 구현하지 않으면 오류가 발생한다. 즉 둘 다 구현해야만 함
### 인터페이스도 상속이 된다.
```java
interface I3{
    public void x();
}
 
interface I4 extends I3{
    public void z();
}
 
class B implements I4{
    public void x(){}
    public void z(){}   
}
```
이렇게 하면 클래스B는 x, z 모두 구현해야만 한다.
### 인터페이스의 맴버는 반드시 public이다.  
인터페이스는 그 인터페이스를 구현한 클래스를 어떻게 조작할 것인가를 규정한다. 그렇기 때문에 외부에서 제어할 수 있는 가장 개방적인 접근 제어자인 public만을 허용한다. public을 생략해도 default가 아닌 public이 된다.

인터페이스와 추상 클래스는 서로 비슷한 듯 다른 기능이다. 인터페이스는 클래스가 아닌 인터페이스라는 고유한 형태를 가지고 있는 반면 추상 클래스는 일반적인 클래스다. 또 인터페이스는 구체적인 로직이나 상태를 가지고 있을 수 없고, 추상 클래스는 구체적인 로직이나 상태를 가지고 있을 수 있다.



추상클래스와 인터페이스 모두 new를 사용할 수 없다. 
추상클래스는 상속을 통해서 자식클래스만을 만들 수 있고 인터페이스는 객체로 생성할 수 없기 때문에 생성자를 가질 수 없다.
인터페이스는 상수 필드와 추상 메소드만을 구성멤버로 가진다 .
