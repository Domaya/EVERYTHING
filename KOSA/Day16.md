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








## 8월 18일부터 지금까지의 회고  
