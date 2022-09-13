220913 : 제너릭, 스택, Iterator, HashSet, HashMap  

**지난 주 복습**  
List : ArrayList, Vector, linked List  
어레이르스트와 벡터의 차이? 벡터는 동기화를 지원한다. 벡터는 개별 원소에 접근할 수 있으나 어레이리스트는 그럴 수 없다. 벡터는 자원을 보호한다는 강점이 있고 어레이리스트는 순차적인 데이터 처리라는 장점을 가진다.  


# Generic  
제너릭은 jdk 1.5부터 등장했다. C#에도 있고 자바에도 있는 필수 기능이다.  
콜렉션 타입의 클래스는 기본 저장 공간 타입이 Object다. 어떤 값을 넣어도 다 소화하는 장점(String, Emp, int)이지만, 다시 뱉을 때는 매번 다운캐스팅을 해야 하는 단점이 있다.  

1. 타입을 처음부터 강제
2. 타입 안정성(타입 강제)
3. 강제 형변환 필요 없다 : (Car)Object (필요없다)

제너릭 적용을 위해서는 설계도부터 적용.  


# STACK 
Last In First Out의 자료구조.  
**내가 직접 구현해보기**
```java


//JAVA API가 제공하는 스택을 직접 구현해보기
//1.stack 저장공간(Array), 저장공간 타입(Object)
//2.위치정보. 저장되는 값이 있는 위치를 알아햐함(index)
//3.기능 : push(), pop(), boolean empty(), full()
public class MyStack {
	private Object[] stackarr;
	private int maxsize;
	private int top; //index
	public MyStack(int maxsize) {
		this.maxsize = maxsize;
		stackarr = new Object[maxsize];
		top = -1;
	}
	
	public void push(Object obj) {
		try {
			stackarr[++top] = obj;
			
		}catch(Exception e) {
			System.out.println(e);
			top = maxsize-1;
		}
	}
	public Object pop() {
		try{
			Object value = stackarr[top];
			stackarr[top--] = null;
			return value;
		}catch(Exception e) {
			System.out.println(e);
			top = -1;
			return false;
		}
	}
		public boolean isEmpty() {
		return (top == -1);
	}
	public boolean isFull() {
		return (top == maxsize - 1);
	}
}
```

# Iterator  
Iterator 인터페이스. Iterator는 반복자. [나열된 자원에 대해서 순차적으로 접근해서 값을 리턴하는 표준을 정의]  
이를 추상함수로 정의하고 있다. 누군가는 이 추상함수를 구현했을 것이고...그 주체가 바로 ArrayList.
Iterator인터페이스를 가지고 있는 추상함수 > hasNext(), Next(), remove() 추상 > ArrayList implements Iterator(hasNext()를 재정의하여 구현하고 있다)
```java
//표준화된 출력 방식(순서대로 나열된 데이터에 대해서)
		Iterator it = list.iterator(); //호출하면 인터페이스를 구현하는 객체가 생성되고 그 주소를 리턴한다.
		//Iterator it 부모타입
		while(it.hasNext()) {
			System.out.println(it.next());
		}
```

# Set  
Set 인터페이스... 순서보장x, 중복 허용x. 순서가 없고 중복을 허락하지 않는 데이터 집합.  
set을 구현하는 클래스는 HashSet, TreeSet(자료구조에서 중요함)
HashSet의 다형성...HashSet의 부모는 Set.
```java
	Set set2 = new HashSet();
```
**Set 실습코드**
```java
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Ex10_Set {
	public static void main(String[] args) {
		HashSet<Integer> hs = new HashSet<Integer>();
		
		//순서가 없는 [중복되지 않은] 데이터 집합
		hs.add(1);
		hs.add(100);
		boolean bo = hs.add(55);
		System.out.println("정상 " + bo);
		bo = hs.add(55);
		System.out.println("이미 원 안에 중복데이터가 있음 " + bo);
		
		//중복 ... 로또, 차량번호
		System.out.println(hs.toString()); //toString재정의되어있음. [1, 100, 55]
		
		HashSet<String> hs2 = new HashSet<String>();
		hs2.add("b");
		hs2.add("A");
		hs2.add("f");
		hs2.add("H");
		hs2.add("b");
		hs2.add("Z");
		System.out.println(hs2.toString()); // [A, b, f, H, Z]
		
		String[] strobj = {"A", "B", "C", "D", "B", "A"};
		HashSet<String> hs3 = new HashSet<String>();
		for(int i=0;i<strobj.length;i++) {
			hs3.add(strobj[i]); //중복데이터는 add하지 않는다.
		}
		System.out.println(hs3); // [A, B, C, D]
		
		
		Set<Integer> lotto = new HashSet<Integer>(6);
//		while(lotto.size()<6) {    //중복없는 여섯개의 숫자를 받는 두가지 방법..while과 for
		for(int i=0; lotto.size()<6;i++) {
			lotto.add((int)(Math.random()*45+1));
		}
		System.out.println(lotto);
		
		Set<String> set3 = new HashSet<String>();
		set3.add("AA");
		set3.add("BB");
		set3.add("FFF");
		set3.add("DDABCV");
		System.out.println(set3.toString());
		
		Iterator<String> st = set3.iterator();
		while(st.hasNext()) {
			System.out.println(st.next());
		}
				
	}
}
```
# TreeSet  
Set : 순서x, 중복x  
TreeSet : 순서x, 중복x, 정렬기능o. 검색하거나 정렬을 필요로 하는 자료구조(데이터 집합). 중복 데이터 .... 출력 정렬(낮은 값부터)  
특징
1. 이진 트리 구조(나무를 거꾸로 뒤집은 모양) root ... leaf
2. 데이터 저장시 정렬기능이 제공  

```java
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

public class Ex12_Set_TreeSet {
	public static void main(String[] args) {
		//Set : 순서x, 중복x
		
		//TreeSet
		//순서x, 중복x, 정렬기능o
		//검색하거나 정렬을 필요로 하는 자료구조(데이터 집합)
		//중복 데이터 .... 출력 정렬(낮은 값부터)
		
		//특징
		HashSet<String> hs = new HashSet<String>();
		hs.add("B");
		hs.add("A");
		hs.add("F");
		hs.add("K");
		hs.add("G");
		hs.add("D");
		hs.add("P");
		System.out.println(hs.toString()); //[P, A, B, D, F, G, K]... 정렬x
		
		Set<Integer> lotto = new TreeSet<Integer>();
		for(int i=0;lotto.size()<6;i++) {
			lotto.add((int)(Math.random()*45+1));
		}
		System.out.println(lotto.toString());//[4, 11, 13, 14, 25, 36] 정렬된 로또번호
		
		
	}
}
```
# Map  
(key, value)쌍의 구조를 갖는 배열  
ex) 지역번호..([02,서울][032,인천][064,제주])  
key 중복(x) ... Set의특징
value 중복(o)   ...List의특징  
Generic 지원한다. 
Map 인터페이스를 구현하는 클래스에는...
구버전으로는 HashTable(동기화 지원), lock을 가져 자원을 보호할 수 있지만 성능은 조금 떨어지는 버전.  
신버전에는 **HashMap**(동기화 강제x), 성능고려... (Thread를 배우면 더 잘 이해할 수 있다.)  

```java
import java.util.HashMap;

public class Ex13_Map_Interface {
	public static void main(String[] args) {
		HashMap map = new HashMap();
		map.put("Tiger", "1004"); //id, pw
		map.put("Scott", "1004");
		map.put("Superman", "1007");
		map.put("Smile", "1004");
		
		System.out.println(map.containsKey("tiger")); //대소문자 구별 false
		System.out.println(map.containsKey("Scott"));
		System.out.println(map.containsKey("1004")); //false 1004는 value임
		System.out.println(map.containsValue("1004"));//true
		
		System.out.println(map.get("Tiger")); //1004 .. key를 제공하면 value 반환
		System.out.println(map.get("hong")); //null 없는 key면 null리턴
		
		map.put("Tiger", "1006"); //value replace
		System.out.println(map.get("Tiger")); //1006
		System.out.println(map.size());//3
		System.out.println(map.toString());//{Superman=1007, Tiger=1006, Scott=1004}
		
		Object value = map.remove("Superman");
		System.out.println("삭제된 value : " + value);//삭제 된 데이터 : 1007
		System.out.println(map.toString());//{Tiger=1006, Scott=1004}
		
		//응용(이해)
		Set set = map.keySet(); // Set인터페이스를 구현하고 있는 객체를 생성해서 주소를 리턴
		//중복x
		Iterator it = set.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		
		Collection clist = map.values(); //중복데이터o
		System.out.println(clist.toString());//[1004, 1006, 1004]
		
		
	}
}
```

# HashMap Quiz
```java
import java.util.HashMap;
import java.util.Scanner;

public class Ex14_Map_Quiz {
	public static void main(String[] args) {
		//Map 사용 구현하는 데이터 집합
		//지역번호,우편번호, 회원가입(id, pwd) 정보
		
		HashMap loginmap = new HashMap();
		loginmap.put("kim", "kim1004");
		loginmap.put("scott", "tiger");
		loginmap.put("lee", "kim1004");
		
		/*
		 * 우리 시스템은 가입한 회원의 id, pwd정보를 가지고 있다.
		 * 이 사람들이 로그인시 아이디와 비밀번호를 확인해서 회원이라면 접속 가능하게끔...
		 */
		Scanner sc = new Scanner(System.in);
		boolean flag = true;
		bigloop:
		while(flag) {
			//id 와 pwd받으세요
			//id는 공백제거>>소문자 변환String함수로
			//pwd공백제거
			/*
			 * id o, pw o >> dd
			 * id o, pw x .. x 비밀번호만 재입력
			 * id x, pwd d ... x둘 다 재입력
			 * id x, pwd x, ... x둘 다 재입력
			 */
			System.out.print("ID>>");
			String id = sc.next().trim().toLowerCase();
			System.out.print("PW>>");
			String pw = sc.next().trim().toLowerCase();
			if(loginmap.containsKey(id)) {
				while(true) {
					if(loginmap.get(id).equals(pw)) {
						System.out.println("로그인 성공");
						break bigloop;
					}
					else {
						System.out.print("비밀번호를 확인하세요 >>");
						pw = sc.next().trim().toLowerCase();
					}
				}
			}
			else {
				System.out.println("둘 다 틀림 재확인하셈");
			}
			
		}
		
	}
}
```
위 코드를 작성할 때, 이중 while문을 사용하였는데 안쪽 while문 안에서 바깥의 while문까지 break하는 법이 궁금해 검색해보았다.
내가 원하는 분기에 'bigloop:'라는 키워드를 썼고, 원하는 탈출 부분에서 break bigloop;라고 작성하니 원하는 대로 됐다.
