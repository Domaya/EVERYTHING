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
