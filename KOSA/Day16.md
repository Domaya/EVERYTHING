# 컬렉션 Collection  
## 컬렉션 프레임워크란?  
프레임워크와 라이브러리의 차이는 무엇일까?  
프레임워크는 개발에 필요한 모든 도구를 포함하고 있는 개발 툴이고, 라이브러리는 활용가능한 단순한 도구 하나의 느낌  
예)스프링 프레임워크, 리액트 라이브러리  

**컬렉션 프레임워크는?** 
다수의 데이터를 쉽게 처리할 수 있는 방법을 제공하는 클래스들을 표준화한 설계  ...>컬렉션 클래스  
인터페이스는 인터페이스를 상속할 수 있다.  
컬렉션 프레임워크의 핵심 인터페이스... List, Set 이런 작은 인터페이스가 모여 컬렉션 인터페이스를 만든다.  
1. List : 순서가 있는 데이터의 집합. 데이터의 중복을 허용한다. ArrayList, LinkedList, Stack, Vector etc.
2. Set : 순서를 유지하지 않는 데이터의 집합. 중복을 허용하지 않는다. HashSet, TreeSet etc.
3. Map : Key와 value의 쌍(pair)으로 이루어진 데이터의 집합. 순서는 유지되지 않으며 키는 중복될 수 없다. 값은 중복될 수 있다.

Collection Framework...[다수의 데이터]를 다루는 [표준화된 인터페이스]를 구현하고 있는 [클래스의 집합] 

Collection 인터페이스 -> 상속 List(구현:ArrayListt), Set(구현:HashSet..)

>>ArrayList의 부모타입은 List이다. >> 다형성  
>>Collection 인터페이스는 ArrayList의 부모타입이다. >>다형성  


Map 인터페이스(key, value) 쌍의 배열. 구현: HashMap.  

1. List (줄을 서시오) 순서가 있다. 중복을 허용한다. 내부적으로 데이터(자료)를 배열로 관리한다. 
   ㄴ Vector(구버전) -> 동기화를 보장한다. (멀티스레드 필요) -> Lock(장치)보호 default-> 성능은 조금 약해짐
   ㄴ ArrayList(신버전) -> 동기화 보장(멀티 스레드) -> Lock 옵션(기본 Lock (x)) -> 성능 우선
   
기존에 다수의 데이터를 다루는 방법 : Array (정적 배열, 고정 배열)
--방의 개수가 한 번 정해지면 방의 **크기는 변경 불가능**하다.
```java
   int[] arr = new int[5];
   int[] arr2 = {10, 20, 30};
   //데이터가 많아지면 새로운 크기의 배열을 만들고 데이터를 이동시켜야 한다. 이를 개발자가 코드로 직접 구현해야 한다.
```
1. 배열의 크기가 고정되어있다.
2. 접근 방법 index(첨자)로 접근 : 0부터 시작, arr.length-1까지.

크기를 변경할 수 없다는 불편함을 극복한,,,List 인터페이스를 구현하고 있는 Vector, ArrayList  
1. 배열의 크기를 동적으로 확장 또는 축소가 가능하다. >**컴파일러가 새로운 배열을 만들고 데이터를 이동시킨다.**
2. 순서를 유지(내부적으로 배열을 사용)... 따라서 줒복값을 허용한다.
3. 데이터 저장 공간 : Array 사용.



### Vector
```java
public static void main(String[] args) {
		Vector v = new Vector();
		System.out.println("초기 default 용량: " + v.capacity()); //초기 default 용량 : 10
		System.out.println("size : " + v.size()); // size:0... 실제데이터의 크기
		
		v.add(null);
		System.out.println("size : " + v.size()); // size:1
		v.add("AA");
		v.add("AA");
		v.add("AA");
		v.add(10);
		System.out.println("size : " + v.size()); // size:5
		System.out.println(v.toString()); //[null, AA, AA, AA, 10] toString이 데이터를 출력하는 함수로 재정의되어있음
		
		for(int i=0;i<v.size(); i++) {
			System.out.println(v.get(i)); //get(index) 값 return
		}
		
		//개선된 for문
		for(Object value : v) {
			System.out.println(value);
		}
		//단점 : 작은 데이터(같은 타입의 데이터)를 넣으려해도 ... 가장 큰 타입을 사용하는 것
		//제너릭 >> 같은 타입을 강제 >> 추후에 배울 것!
		Vector<String> v2 = new Vector<String>();
		v2.add("hello");
		v2.add("World");
		//v2.add(10); 타입 강제 때문에 에러가 뜬다
		for(String s : v2) {
			System.out.println(s);
		}
		
		Vector v3 = new Vector();
		System.out.println(v3.capacity()); //10
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		System.out.println(v3.capacity());//20
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		System.out.println(v3.capacity());//40
		// 증명 : 그냥 쓰시면 돼요(지가 알아서 늘리고 하니...)
		
		
		
	}
```
```java
public static void main(String[] args) {
		//ArrayList : List 인터페이스 구현(순서 보장, 중복 허용)
		ArrayList arrayList = new ArrayList();
		//Object 타입으로 사용
		arrayList.add(100);
		arrayList.add(200);
		arrayList.add(300);
		for(int i=0; i<arrayList.size();i++) {
			System.out.println(arrayList.get(i));
		}
		System.out.println(arrayList.toString());//[100,200,300]
		
		//add함수는 순차적으로 데이터를 넣는다.
		arrayList.add(0, 0); // **자리 이동**
		System.out.println(arrayList.toString());//[0,100,200,300]
		arrayList.add(4, 400);
		System.out.println(arrayList.toString());//[0, 100, 200, 300, 400]
		
		//**비순차적인 데이터 추가, 삭제는 ArrayList에 적합하지 않다. 순서가 있는 데이터 집합을 쓰는 것이 적합하다.
		//순차적인 데이터 추가, 삭제 용도로 쓰는 것이 좋다.
		//arrayList.remove(400);
		//System.out.println(arrayList.toString()); // java.lang.IndexOutOfBoundsException
		System.out.println(arrayList.contains(200)); //true
		
		arrayList.clear();
		System.out.println(arrayList.size()); //0
		System.out.println(arrayList.isEmpty());//true
		arrayList.add(12);
		arrayList.add(13);
		arrayList.add(14);
		System.out.println(arrayList.isEmpty());//false
		System.out.println(arrayList.size());
		Object value = arrayList.remove(0); //12삭제됨
		System.out.println(value); //12
		
		//인터페이스 부모 타입
		//개발자 습관적으로 .. 다형성(확장성, 유연성)
		List li = new ArrayList(); //습관적으로 부모타입 사용하기
		//ArrayList li = new ArrayList();
		li.add("가");
		li.add("나");
		li.add("다");
		li.add("라");
		
		List li2 = li.subList(0,2); //subList함수는 내부적으로 new ARrayList()생성
		System.out.println(li2.toString()); //[가, 나]
		
		ArrayList alist = new ArrayList();
		alist.add(50);
		alist.add(1);
		alist.add(7);
		alist.add(40);
		alist.add(46);
		alist.add(3);
		alist.add(15);
		
		System.out.println(alist.toString());//[50, 1, 7, 40, 46, 3, 15]
		Collections.sort(alist); //내부적으로 정렬 > 초급개발자 프로젝트시 쓰면 감점...
		System.out.println(alist.toString());//[1, 3, 7, 15, 40, 46, 50]
		Collections.reverse(alist);
		System.out.println(alist.toString());//[50, 46, 40, 15, 7, 3, 1]
		
		
	}
```

```java
import java.util.ArrayList;

import kr.or.kosa.Emp;

public class Ex03_ArrayList_Object {

	public static void main(String[] args) {
		//1. 사원 1명을 만드세요
		Emp emp = new Emp(1000, "김유신", "장군");
		System.out.println(emp.toString());
		
		//2. 사원 2명을 만드세요
		Emp[] emplist = {new Emp(100, "전우치", "도사"), new Emp(200, "박씨부인", "주술사")};
		for(Emp e : emplist) {
			System.out.println(e.toString());
		}
		
		//3. 사원이 1명 더 입사했음. (300, "이씨", "IT")
		//이러면 3개짜리 배열을 생성해서 다 옮겨야 함...
		//그래서 우리는 ArrayList를 쓸 것임
		
		ArrayList elist = new ArrayList();
		elist.add(emplist[0]);
		elist.add(emplist[1]);
		elist.add(new Emp(300, "이씨", "IT"));
		
		for(int i=0; i<elist.size();i++) {
			System.out.println(elist.get(i).toString());
			//Emp e = (Emp)elist.get(i);//다운캐스팅
			//e.toString();
		}
		System.out.println(elist.toString());
		
		elist.add(new Emp(400, "최씨", "관리"));
		System.out.println(elist.toString());
		
		//toString사용하지말고 출력하기
		for(Object e : elist) {
			System.out.println(e);
		}
		for(int i=0; i<elist.size();i++) {
			Object obj = elist.get(i);
			//Object는 모든 타입의 부모타입이다
			Emp e = (Emp)obj;
			System.out.println(e.getEmpno() + " " + e.getEname() + " " + e.getJob());
			
		}
		
		//현업 개발자 ... (Object 타입)...항상 다운캐스팅 발생. 번거로움
		//Object 쓰지 말자 ... 대안
		//타입 강제(그 타입 쓰게 하자) 하나의 타입만을 가지고 데이터 관리
		//제너릭(객체 생성시 타입 강제하는 방법)
		
		ArrayList<Emp> list2 = new ArrayList<Emp>();
		list2.add(new Emp(1, "A", "IT"));
		//이제 for문에서 다운캐스팅 필요없음...왜냐면 어차피 배열(객체)은 Emp타입이니까!
		
		for(Emp e: list2) {
			System.out.println(e.getEmpno());
		}
	}
}
```

## ArrayList를 이용한 뱅크 과제
```java
package kr.or.kosa;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

class Bank {
	//Composition은 클래스 간에 포함(composite) 관계를 맺어주는 것,
	//즉, 한 클래스의 멤버변수로 다른 클래스 타입의 참조 변수를 선언하는 것을 의미한다.
	
	private int totalAccount = 0;
	List<Account> accounts = new ArrayList<Account>();
	

	void addAccount(String accountNo, String name) {
		Account account = new Account(accountNo, name);
		accounts.add(account);
		totalAccount++;
		return;
	}
	
	Account getAccount(String accountNo) {  //getter
		//accountNo를 파라미터로 받아서 해당 파라미터의 값을 가지는 계좌를 찾아 반환
//		Account value = new Account(accountNo, accountNo); //파라미터를 이렇게 해야되나????
		for(Account value1 : accounts) {
			if(value1.getAccountNo().equals(accountNo))
			{
				return value1;
			}
		}
		return null;
	}
	
	List<Account> findAccounts(String name){ //이름의 계좌를 찾는 메소드
		List<Account> nameList = new ArrayList();
		for(Account value : accounts) {
			if(value.getName().equals(name)) {
				//같은 이름
				nameList.add(value);
			}
		}
		return nameList;
		
	}
	
	List<Account> getAccounts(){ // 전체계좌목록 반환
		return accounts;
		
	}
	
	int getTotalAccount() {
		//총 계좌 개수 리턴
		return totalAccount;
	}	
}

class Account{
	Calendar today = Calendar.getInstance();
	
	private String accountNo;
	private String name;
	private long balance = 0;
	
	public Account(String accountNo, String name){
		this.accountNo = accountNo;
		this.name = name;
	}
	
	List<Transaction> T = new ArrayList<Transaction>();
	
	void deposit(long amount) {
		//입금
		balance += amount;
//		Transaction t = new Transaction(String.valueOf(today.get(Calendar.YEAR))+today.get(Calendar.MONTH)+today.get(Calendar.DATE), String.valueOf(today.get(Calendar.HOUR_OF_DAY))+today.get(Calendar.MINUTE), amount, balance);
		Transaction t = new Transaction(String.valueOf(today.get(Calendar.YEAR))+"년"+today.get(Calendar.MONTH)+"월"+today.get(Calendar.DATE)+"일",String.valueOf(today.get(Calendar.HOUR_OF_DAY))+"시"+today.get(Calendar.MINUTE)+"분","입금", amount, balance);
		T.add(t);
	};
	void withdraw(long amount) {
		//출금
		//Transaction(String transactionDate, String transactionTime, String kind, long amount, long balance)
		balance = balance - amount;
		Transaction t = new Transaction(String.valueOf(today.get(Calendar.YEAR))+"년"+today.get(Calendar.MONTH)+"월"+today.get(Calendar.DATE)+"일",String.valueOf(today.get(Calendar.HOUR_OF_DAY))+"시"+today.get(Calendar.MINUTE)+"분","출금", amount, balance);
		T.add(t);
	}
	long getBalance() {
		return balance;
	}

	List<Transaction> getTransactions(){
		return T;
	}
	
	//getter setter?
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getName() {
		return name;
	}

	@Override
	public String toString() {
		return "[계좌번호" + accountNo + " 계좌주:" + name + " 잔고:" + balance + "]\n";
	}

	
}

class Transaction{
	private String transactionDate;
	private String transactionTime;
	private String kind;
	private long amount;
	private long balance;
	
	public Transaction(String transactionDate, String transactionTime, String kind, long amount, long balance) {
		this.transactionDate = transactionDate;
		this.transactionTime = transactionTime;
		this.kind = kind;
		this.amount = amount;
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "거래일자:" + transactionDate + " 거래시간:" + transactionTime + ", "+ kind +" 거래금액:"
				+ amount + " 현재잔액:" + balance + "\n";
	}
	
	
}

public class myBank{
	public static void main(String[] args) {
		
		Bank bank = new Bank();
		bank.addAccount("1111", "kim");
	    bank.addAccount("2222", "lee");
	    bank.addAccount("3333", "park");
	    bank.addAccount("4444", "hong");
	    bank.addAccount("5555", "hong");
	    bank.addAccount("6666", "kim");
	    bank.addAccount("7777", "lee");
	    System.out.print("총 계좌 개수 ");
	    System.out.println(bank.getTotalAccount());
	    
	    System.out.print("\n3333이 계좌번호인 계좌 정보 ");
	    System.out.println(bank.getAccount("3333"));
	    System.out.println("\n***이름이 hong인 사람의 계좌 조회***");
        List<Account> findAccount = bank.findAccounts("hong");
        for(Account a : findAccount) {
            System.out.println(a);
        }
		System.out.println("\n***전체 계좌 조회***");
		System.out.println(bank.getAccounts().toString());
//		
		bank.getAccount("1111").deposit(2000);
		bank.getAccount("1111").deposit(2000);
		bank.getAccount("1111").deposit(2000);
		bank.getAccount("1111").withdraw(1000);


		Account kim = bank.getAccount("1111");
		List<Transaction> kimTransaction = kim.getTransactions();
	        for(int i = 0; i < kimTransaction.size(); i++) {
	            System.out.println(kimTransaction.get(i));
	        }
	}
}
```





## 8월 18일부터 지금까지의 회고  
>친구의 추천으로 갑작스럽게 해당 과정을 시작했다. 백엔드 지망이었던 적도 없고 늘 자바에 대해 막연한 두려움이 있었던지라 고민이 컸지만, 좋은 기회라는 것도 부정할 수 없어서 참여하였고 어느새 달이 바뀌었다. 자바를 다시 기초부터 빠르게 배우면서 역시 아직도 나는 자바를 잘 하지 못한다는 걸 느꼈다. 그러는 한 편 내가 자바에 대해 잘 몰랐던 점도 많단 걸 다시 한 번 느꼈다. 대학시절 주구장창 봤지만 여전히 어렵고 까다로운 언어를 다시 하나하나 되짚으며 자신감이 생기기도 겁이 나기도 했다. 하지만 대학시절 혼자 앉아 에러가 한가득 뜨는 화면만 멍하니 보던 것과, 지금 교육에서 조원들과 서로 돕고 이야기하며 하나의 코드를 만들어보는 것은 하늘과 땅 차이였다. 지금 내가 어느정도 막힘없이 코드를 짤 수 있는 것은 딱 대학 5년 동안 내가 배운 만큼이라고 생각한다. 프로그래밍은 처음 접하면 당연히 낯설고 어렵지만, 5년을 하면 누구나 나만큼은 하거나 나보다 훨씬 잘할 것이 당연하다. 그래서 나는 이 수업을 들으며 더 열심히 해야겠다고 느꼈다. 지금 내가 가진 것은 대학에 다니며 배운 5년 만큼의 여유고, 앞으로도 새로운 것을 배우며 계속 부딪힐 것이다. 자바를 끝내고 데이터베이스, 스프링, 프론트까지 배우게 될 것인데 그 과정에서 단 한 번도 포기하지 않고 지금만큼의 꾸준함을 유지하고 싶다.
