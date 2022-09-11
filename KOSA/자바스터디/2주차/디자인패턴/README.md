# 팩토리 메소드 패턴 Factory Method Pattern  
객체를 생성하기 위해 인터페이스를 만든다. 어떤 클래스의 인스턴스를 만들지를 서브클래스에서 결정하도록 한다.
팩토리 메소드를 이용하면 인스턴스를 만드는 일을 서브클래스로 미룰 수 있다.  

![image](https://user-images.githubusercontent.com/51879052/189471481-7d4c3af3-f80d-4562-8123-84d50c477dac.png)

## 피자를 주문하는 예제
![image](https://user-images.githubusercontent.com/51879052/189516140-9ece4824-1d63-46ee-a2cf-990b20c3161e.png)


```
preparing~~ NYStyleCheesePizza
baking~~
boxing~~
preparing~~ NYStyleClamPizza
baking~~
boxing~~
preparing~~ ChicagoStyleCheessePizza
baking~~
boxing~~
preparing~~ ChicagoStyleClamPizza
baking~~
boxing~~

Process finished with exit code 0

```
Creator 클래스인 PizzaStore. 이 클래스는 createPizza라는 팩토리 메소드를 실행해서 pizza를 생성한다.
main메소드는 지점과 주어진 타입에 따라 다른 피자를 만든다
