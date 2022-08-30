### 다른 생성자 호출: this()
생성자 오버로딩이 많아질 경우 생성자 간의 중복된 코드가 발생할 수 있습니다. 매개 변수의 수만 달리하고 필드 초기화 내용이 비슷한 생성자에서 이러한 현상을 많이 볼 수 있습니다.
이 경우에는 필드 초기화 내용은 한 생성자에만 집중적으로 작성하고 나머지 생성자는 초기화 내용을 가지고 있는 생성자를 호출하는 방법으로 개선할 수 있습니다.
this()는 자신의 다른 생성자를 호출하는 코드로 반드시 생성자의 첫 줄에서만 허용됩니다. this()의 매개값은 호출되는 생성자의 매개 변수에 맞게 제공해야 합니다.

this의 두가지 용법...하나는 객체 자기 자신을 가리키는 것이고 여기서 this()로 사용하는 것은
**자신이 속한 클래스 내부의 다른 생성자를 호출하는 명령**

```java
Car(String model){
    this.model = model;
    this.color = "은색";
    thismaxSpeed = 250;
}

Car(String model, String color){
    this.model = model;
    this.color = color;
    thismaxSpeed = 250;
}

Car(String model, String color, int maxSpeed){
    this.model = model;
    this.color = color;
    thismaxSpeed = maxSpeed;
}
```
위 코드의 중복된 부분을 다른 생성자를 호출하여 줄여본다면

```java
Car(){}

Car(String model){
    this(model, "은색", 250);
}
Car(String model, String color){
    this(model, color, 250);
}
Car(String model, Stringcolor, int maxSpeed){
    this.model = model;
    this.color = color;
    this.maxSpeed = maxSpeed;
}
```
이 부분 좀 어렵구 난감함 나중에 다시 읽어보기 !!




# Array
배열은 객체다.
1. new를 통해서 생성
2. heap 메모리에 생성된다(관리자원..내가 명시적으로 해제하거나 할 필요 없음)
3. 고정배열(정적배열) : 배열을 한 번 선언하면(크기가 정해지면) 변경할 수 없다. <=> collection(동적)
4. 자료구조(알고리즘)의 가장 기초적인 단계

```java
int[] arr = new int[5]; //basic
int[] arr2 = new int[] {1, 2, 3}; //초기값을 통해서 배열의 개수 정의, 값 할당
int[] arr3 = {11, 22, 33};
```
위와 같이 선언한다.


```java
int[] arr4;
arr4 = new int[]{21, 22, 23, 24, 25};
System.out.println(arr4); //arr4의 주소값

int[] arr5 = arr4;
System.out.println(arr5); //arr4와 같은 주소값
```

```java
public class Ex02_Array_Quiz {

	public static void main(String[] args) {
		//국문과 학생들의 기말고사 시험점수입니다
		int[] score = new int[] {79,88,97,54,56,95};
		int max = score[0]; //max<=79
		int min = score[0]; //min<=79
		
		for(int i=0;i<score.length;i++) {
			if(score[i]>max) {
				max = score[i];
			}else if(score[i]<min) {
				min = score[i];
			}
      
      //삼항연산자
      max = (score[i] > max) ? score[i] : max;
			min = (score[i] < min) ? score[i] : min;
		}
		System.out.println("max "+max+" min "+min); //max 97 min 54

	}

}
```

### 난수 발생과 버블정렬을 이용한 과제
```java
import java.util.Arrays;

/*
 * 1~45까지의 난수를 6개 배열에 담으세요
 * 중복값 검증
 * 배열에 있는 여섯 개의 값은 낮은 순으로 정렬시킨다
 * (int)(Math.random()*(44)+1);
 */
public class Ex03_Array_Lotto {
	
	static int ran() { //범위 내의 난수 생성 메소드
		return (int)(Math.random()*(44)+1);
	}
	
	static boolean verify(int[] copy, int num) { //중복값 검증 메소드
		for(int i=0;i<copy.length;i++) {
			if(num == copy[i]) {
//				System.out.println("중복 발생");
				return false;
			}
		}
		return true;
	}
	
	static int[] bubbleSort(int[] arr) {
		int length = arr.length;
		int temp = 0;
//		System.out.print("초기값");
		System.out.println(Arrays.toString(arr));
		for(int i = 0; i<length; i++) {
			for(int j = 0; j<length-1-i;j++) {
				if(arr[j] > arr[j+1]) {
					temp = arr[j];
					arr[j] = arr[j+1];
					arr[j+1] = temp;
				}
//				System.out.println("정렬중..." + Arrays.toString(arr) + " ["+j+"]");
			}
//			System.out.println(Arrays.toString(arr));
		}
		
		return arr;
	}

	public static void main(String[] args) {
		int temp = 0;
		int num = 0;
		int[] lotto = new int[6];
		
		for(int i=0; i<lotto.length; i++) {
			while(true){
				num = ran();//난수 추출
				//난수를 배열에 있는 건지 비교 -> 비교 함수따로 (파라미터로 현재 인덱스, 값)
				if(verify(lotto, num)){
					lotto[i] = num;//없으면 배열에 넣음
					break;
				}
			}
			
		}
		System.out.println(Arrays.toString(lotto));
		System.out.print("정렬결과>>>");
		System.out.println(Arrays.toString(bubbleSort(lotto)));
		
		//버블 정렬
		
		
	}

}
```
### 개선된 for문  
파이썬이랑 비슷한 듯
```java
	int[] arr = {5, 6, 7, 8, 9};
	for(int i=0; i<arr.length; i++) {
		System.out.println(arr[i]);
	}
	// 개선된 for문
	for(int value : arr) {
		System.out.println(value);
	}
		
	String[] strarr = {"A", "B", "C", "D", "FFF"};
	for(String value : strarr) {
		System.out.println(value);
	}
```


### 객체 배열
참조타입(클래스 등)배열은 각 항목에 객체의 번지를 가지고 있다.

#### 객체 배열을 만드는 법
```java
	//1. int[] arr = new int[10
	Person[] parray = new Person[10];
	for(int i=0; i<parray.length; i++) {
		parray[i] = new Person();
		System.out.println("주소값 : "+ parray[i]);
	}
	//2. int[] arr = new int []{10, 20, 30}
	Person[] parray2 = new Person[] {new Person(), new Person(), new Person()};
		
	//3.int[] arr = {10, 20, 30}
	Person[] parray3 = {new Person(),new Person(), new Person()};
```


### 다차원 배열(2차원)  
[행][열]
영화관 좌석, 지도 좌표값, 오목, 엑셀
예) 영화관 예매 취소 ... 관리 프로그램

```java

public class Ex08_Array_Rank {
	
	public static void main(String[] args) {
		/*
		 다차원 배열(2차원)
		 [행][열]
		 영화관 좌석, 지도 좌표값, 오목, 엑셀
		 
		 영화관 예매 취소 ... 관리 프로그램
		 
		 */
		int[][] score = new int[3][2];
		score[0][0] = 100;
		score[0][1] =  200;
		
		score[1][0] = 300;
		score[1][1] = 400;
		
		score[2][0] = 500;
		score[2][1] = 600;
		
		//for문 (중첩 for)
		//행의 개수 : 배열이름.length
		//열의 개수 : 배열이름[i].length >> 열의 개수
		
		for(int i=0; i<score.length; i++) {
			for(int j=0; j< score[i].length; j++) {
				System.out.printf("score[%d][%d] = %d\t", i, j, score[i][j]);
			}
			System.out.println();
		}
		//개선된 for문
		for(int[] i : score){
			for(int j : i) {
				System.out.println(j);
			}
		}
		
	}
}
```

