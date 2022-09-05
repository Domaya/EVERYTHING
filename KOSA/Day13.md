# 다형성
-상속관계에서 존재  
-여러가지 성질(형태)을 가질 수 있는 능력

C#에서는 오버로딩, 오버라이드도 다형성으로 본다.  
하지만 자바는 이렇게 포괄적으로 보지 않는다.

JAVA : **상속관계**에서 **하나의 참조변수**가 **여러 개의 타입**을 가질 수 있다.  
->**[하나의 참조변수]** -> **[부모타입]**
->**[여러 개의 타입]** -> 부모를 상식받은 **[자식 타입]**  

다형성 : 현실에서는 부모가 자식에게 모든 것을 준다... 하지만 프로그래밍에서는  
         자식이 부모에게 조건 없이 드린다.  
         
상속관계에서 부모타입은 자식타입의 주소를 가질 수 있다.
단 부모는 자신의 자원만 접근 가능하다.
단 재정의는 제외하고....

```java


/*
 * 시나리오
 * A라는 전자제품 매장이 오픈된다
 * [클라이언트 요구사항]
 * 가전제품은 제품의 가격, 제품의 포인트 정보를 모든제품이 가지고 이다.
 * 각각의 가전제품은 제품별 고유한 이름을 가지고 있다.
 * 
 * ex)각각의 전자제품은 이름을 가지고 있다
 * 각각의 전자제품은 다른 가격정보를 가지고 있다
 * 제품의 포인트는 가격의 10퍼센트다
 * 
 * 시뮬레이션 시나리오
 * 구매자:제품을 구매하기 위한 금액 정보, 포인트 정보를 가지고 있다
 * ex)10만원, 포인트 0
 * 구매자는 제품을 구매할 수 있다. 구매행위를 하게 되면 돈은 감소하고 포인트는 증가한다.
 */

class Product{
	int price;
	int bonuspoint;
//	Product(){}
	Product(int price){
		this.price = price;
		this.bonuspoint = (int)(this.price/10.0);
		
	}
	
}
class KtTv extends Product{
	KtTv(){
		super(500);
	}
//	KtTv(int price){
//		super(price);
//	}
	//이름
	@Override
	public String toString() {
		return "KtTv";
	}
}

class Audio extends Product{
	Audio(){
		super(100);
	}
	@Override
	public String toString() {
		return "Audio";
	}
}

class NoteBook extends Product{
	NoteBook(){
		super(150);
	}
	@Override
	public String toString() {
		return "NoteBook";
	}
}

//구매자
class Buyer{
	int money = 1000;
	int bonuspoint;
	
	//구매자는 구매 행위릃 할 수 있다(기능) -> 메소드로
	//구매행위 (구매자 잔액 - 제품의 가격, 포인트 정보 갱신)
	//****구매자는 매장에 있는 모든 전자제품을 구매할 수 있다*****
	
	void buying(Product product) {
		if(this.money < product.price) {
			System.out.println("잔액 부족 :) 님 돈은 " + this.money + "이만큼밖에없삼..");
			return;
		}
		//돈이 있음
		this.money -= product.price;
		this.bonuspoint += (int)(product.price*0.1);
		System.out.println("구매한 물건은 " + product.toString());
	}
	
}

public class Ex12_Inherit_KeyPoint_Poly {
	public static void main(String[] args) {
		KtTv kt = new KtTv();
		Audio audio = new Audio();
		NoteBook notebook = new NoteBook();
		
		Buyer buyer = new Buyer();
		buyer.buying(kt);
		buyer.buying(audio);
		buyer.buying(kt);
	}
}
```
위 코드에 약간의 요구사항을 더 추가한다
```java
/*
요구사항
카트 (Cart)
카트에는 매장에 있는 모든 전자제품을 담을 수 있다 
카트의 크기는 고정되어 있다 (10개) : 1개  , 2개 담을 수 있고 최대 10개까지 담을 수 있다
고객이 물건을 구매 하면 ... 카트에 담는다

계산대에 가면 전체 계산
계산기능이 필요
summary() 기능 추가해 주세요
당신이 구매한 물건이름 과 가격정보 나열
총 누적금액 계산 출력

hint) 카트 물건을 담는 행위 (Buy() 함수안에서 cart  담는 것을 구현 )
hint) Buyer ..>> summary()  main 함수에서 계산할때

구매자는 default 금액을 가지고 있고 초기금액을 설정할 수 도 있다
 */
 
class Buyer2{
	int money = 10000;
	int bonuspoint;
	Product2[] cart;
	int cartCount = 0;
	
	
	//구매자는 구매 행위릃 할 수 있다(기능) -> 메소드로
	//구매행위 (구매자 잔액 - 제품의 가격, 포인트 정보 갱신)
	//****구매자는 매장에 있는 모든 전자제품을 구매할 수 있다*****
	
	Buyer2() {
		this(10000, 0);
	}
	Buyer2(int money, int bonuspoint){
		//초기화
		this.cart = new Product2[10];
		this.money = money;
		this.bonuspoint = bonuspoint;
	}
	
	void buying(Product2 product) {
		if(this.money < product.price) {
			System.out.println("잔액 부족 :) 님 돈은 " + this.money + "이만큼밖에없삼..");
			return;
		}
		if(cartCount>=10) {
			System.out.println("이미 살만큼 샀어요 ^0^");
			return;
		}
		//돈이 있음
		this.money -= product.price;
		this.bonuspoint += (int)(product.price*0.1);
		
		cart[cartCount++] = product;
		System.out.println("구매한 물건은 " + product.toString() + ", 잔액은 " + this.money);
	}
	
	void summary() {
		int totalPrice = 0;
		int totalBonus = bonuspoint;
//		for(int i=0; i<cart.length; i++) {
//			if(this.cart[i] == null) { //열개 다 사지 않았으면 null이므로...널값 만나면 break
//				break;
//			}
		for(int i=0; i<cartCount; i++) {
			System.out.print(cart[i].toString() + " ");
			totalPrice += cart[i].price;
		}
		System.out.println();
		System.out.println("==================================");
		System.out.println("총 구매 가격...>>" + totalPrice);
		System.out.println("총 포인트 ....>>" + totalBonus);
	}
	
}
```
# 싱글톤(디자인 패턴)
### Singleton.java
```java
package kr.or.kosa;
//디자인 패턴(생성 패턴) >> new

//싱글톤...(객체 하나를 만들어 공유)
//의도 : 하나의 객체를 공유하는 보장성 코드 제공

//공유IP
//공유프린터
//설계할 때 ...


public class Singleton {
	private static Singleton p; //p라는 변수가 주소를 가져야 한다....이러려면 new를 해야되는데...
	private Singleton() {
		//생성자에서 접근자를 private로 쓰면 생성자 함수를 호출하지 못한다... new 불가
		
	}
	public static Singleton getInstance() {
		if(p == null) {
			p = new Singleton(); //같은 클래스 내부에서는 public과 private은 의미가 없다
		}
		return p;
	}
}
/*
 * Singleton s = new Singleton(); <이거 못하게 막는 방법이 있을까?
 */
```

### Ex14_Singleton_main.java
```java
import kr.or.kosa.Singleton;

public class Ex14_Singleton_main {
	public static void main(String[] args) {
//		Singleton singleton = new Singleton(); //생성자의 접근자가 private이라 할 수 없음
		Singleton s = Singleton.getInstance();
		System.out.println(s);//kr.or.kosa.Singleton@6f2b958e
		Singleton s2 = Singleton.getInstance();
		System.out.println(s2);//kr.or.kosa.Singleton@6f2b958e
		Singleton s3 = Singleton.getInstance();
		System.out.println(s3);//kr.or.kosa.Singleton@6f2b958e
	}
}
```
# 추상 클래스
미완성 클래스(설계도)
1. 완성된 코드 + 미완성 코드  
2. 완성? 함수...실행 블록이 있는 함수 + 미완성(함수) 실행블록이 없는 함수
3. 완성된 클래스(new 가능) - 미완성클래스(스스로 객체 생성 불가)  

설계자 입장에서 왜 추상클래스를 만드는 걸까?
->재정의를 강제하기 위해서.... 강제적 구현을 목적으로 (믿지 못하니까)
