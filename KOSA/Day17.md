220913 : 컬렉션  

**지난 주 복습**  
List : ArrayList, Vector, linked List  
어레이르스트와 벡터의 차이? 벡터는 동기화를 지원한다. 벡터는 개별 원소에 접근할 수 있으나 어레이리스트는 그럴 수 없다. 벡터는 자원을 보호한다는 강점이 있고 어레이리스트는 순차적인 데이터 처리라는 장점을 가진다.  


# Generic  
제너릭은 jdk 1.5부터 등장했다. C#에도 있고 자바에도 있는 필수 기능이다.  
콜렉션 타입의 클래스는 기본 저장 공간 타입이 Object다. 어떤 값을 넣어도 다 소화하는 장점(String, Emp, int)이지만, 다시 뱉을 때는 매번 다운캐스팅을 해야 하는 단점이 있다.  

1. 타입을 처음부터 강제
2. 타입 안정성(타입 강제)
3. 강제 형변호나 필요 없다 : (Car)Object (필요없다)

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

