# 해쉬맵을 이용한 도서관리클래스
```java
package kr.or.kosa;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;


class Book{
	int ISBN;
	String name;
	int price;
	public Book(int iSBN, String name, int price) {
		super();
		ISBN = iSBN;
		this.name = name;
		this.price = price;
	}
	@Override
	public String toString() {
		return "[ISBN:" + ISBN + ", 제목:" + name + ", 가격:" + price + "]";
	}
	
	
}

class BookManager{
	HashMap<Integer, Book> bookmap = new HashMap();
	Scanner scanner = new Scanner(System.in);
	
	public void addBook() {
		System.out.print("도서 ISBN번호 >>");
		int isbn = scanner.nextInt();
		System.out.print("도서 제목 >>");
		String title = scanner.next();
		System.out.print("도서 가격 >>");
		int price = scanner.nextInt();
		bookmap.put(isbn, new Book(isbn, title, price));
	}
	
	public void delBook() {
		scanner.nextLine();
		System.out.print("도서 ISBN번호 >>");
		int isbn = Integer.parseInt(scanner.nextLine());
		if(bookmap.containsKey(isbn)){
			bookmap.remove(isbn);
			System.out.println("삭제 완료");
		}else {
			System.out.println("존재하지 않는 책입니다");
		}
	}
	
	public void searchBook() {
		System.out.print("도서 ISBN번호 >>");
		int isbn = scanner.nextInt();
		if(bookmap.containsKey(isbn)) {
			System.out.println(bookmap.get(isbn).toString());
		}
		else {
			System.out.println("존재하지 않는 책입니다.");
			return;
		}
	}
	public void show() {
		System.out.println("도서 수 : " + bookmap.size());
		for(Book book : bookmap.values()) {
			System.out.println(book.toString());
		}
	}
	
	public void isbnShow() {
		Iterator it = bookmap.keySet().iterator();
		while(it.hasNext()) {
			System.out.println("ISBN LIST...");
			System.out.println(it.next());
		}
	}
	
	public void run() {
		theloop:
		while(true) {
			System.out.println("1.도서추가 2.도서삭제 3.도서검색 4.도서목록 0.종료");
			int choice = scanner.nextInt();
			switch(choice) {
			case 1:
				addBook();
				break;
			case 2:
				delBook();
				break;
			case 3:
				
				break;
			case 4:
				show();
				break;
			case 5:
				isbnShow();
				break;
			case 0:
				System.out.println("종료됩니다.");
				break theloop;
			default:
				System.out.println("잘못된 입력");
			}
	}
	
	}	
}


public class BookEx {
		public static void main(String[] args) {
			BookManager manager = new BookManager();
			manager.run();
		
	}
}
```
**피드백** : main함수 안에서는 로직이나 동작보다는 만들어준 메소드만 사용하는 것이 좋다. 원래 main함수 안에서 switch문을 돌렸는데 피드백을 받아 북매니저 클래스에 run함수를 따로 만들었다.

# Property
```
import java.util.Properties;

/*
Map 인터페이스를 구현한 클래스
특수한 목적 : <String><String>   (key ,value)타입이 고정 ...
Properties prop = new Properties();

사용목적
1. App 전체에 사용되는 자원 관리
2. 환경변수
3. 프로그램 버전
4. 파일 경로
5. 공통변수 


*/
public class Ex17_Properties {

	public static void main(String[] args) {
		Properties prop = new Properties();
		prop.setProperty("admin", "kosa@or.kr");
		prop.setProperty("version", "2.x.x.x");
		prop.setProperty("downpath", "C:\\Temp\\images");
		//각각의 개발 페이지에서
		System.out.println(prop.getProperty("admin"));
		System.out.println(prop.getProperty("version"));
		System.out.println(prop.getProperty("downpath"));
	}

}
```

# WrapperClass
```java
import java.util.List;
import java.util.ArrayList;


//https://cafe.naver.com/kosait

//자바 8가지 기본타입(값타입) : JAVA API
//8가지 기본 타입에 대해서 객체 형태로 사용 가능하도록 만든 클래스 -> Wrapper Class

public class Ex08_Wrapper_Class {
	public static void main(String[] args) {
		int i = 100;
//		Integer n = new Integer(500);
//		System.out.println(n);//500
//		System.out.println(Integer.MAX_VALUE);
//		System.out.println(Integer.MIN_VALUE);
		
		//POINT
		//parameter 활용
		//제너릭(generic) : 객체를 만들 때 타입을 강제하는 방식
		List<Integer> li = new ArrayList<Integer>();
		li.add(100);
		//li.add("A");
		for(int value : li) {
			System.out.println(value);
		}
		
		Integer i2 = new Integer(100);
		Integer i3 = new Integer(100);
		System.out.println(i2 == i3); //false
		System.out.println(i2.equals(i3));//true
		
		//String >> 문자열값 비교 >> equals (주소값이 아닌 주소가 가진 실제 값을 비교하도록 재정의 되어있음)
		int i4 = 100;
		int i5 = 100;
		System.out.println(i4 == i5); //true
	}
	
	static void iMethod(Integer i) {
		
	}
}

```

# Calendar
```java
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import kr.or.kosa.util.Edu_Date;

/*
* Calendar 를 상속받아 완전히 구현한 클래스는
* GregorianCalendar
buddhisCalendar 있는데 getInstance()는 [시스템의 국가와 지역설정]을 [확인]해서
태국인 경우 buddhisCalendar 의 인스턴스를 반환하고 그 외에는 GregorianCalendar
의 인스턴스를 반환한다
GregorianCalendar 는 Calendar를 상속받아 오늘날 전세계 공통으로 사용하고 있는 
그레고리력에 맞게 구현한 것으로 태국을 제외한 나머지 국가에서는 GregorianCalendar 사용
그래서 인스턴스를 직접 생성해서 사용하지 않고 메서드를 통해서 인스턴스를 반환받게하는
이유는 최소의 변경으로 프로그램 동작을 하도록 하기 위함
class MyApp{
	static void main(){
	Calendar cal = new GregorianCalendar();
다른 종류의 역법의 사용하는 국가에서 실행하면 변경...... } }
class MyApp{
	static void main(){
	Calendar cal = new getInstance();
다른 종류의 역법의 사용하는 국가에서 실행하면 변경...... } }
API : 생성자 Protected Calendar() 
*/
public class Ex09_Calendar {
	public static void main(String[] args) {
		Date dt = new Date(); //구버전
		System.out.println(dt.toString());//Wed Sep 14 16:46:05 KST 2022
		
		Calendar cal = Calendar.getInstance(); //태국인 경우와 그렇지 않은경우를 위해서 이렇게 작성함
		//추상클래스니까 new하지 않음
		Calendar cal2 = new GregorianCalendar(); //원래는 이게맞음
		
		System.out.println(cal.toString());//상수값이 들어있음 이를 뽑아내서 내가 원하는대로 조합하면됨
		//당신이 필요한 형식을 추출해서 조립하세요.
		System.out.println("년도 : " + cal.get(Calendar.YEAR));
		System.out.println("월 : " + (cal.get(Calendar.MONTH) + 1)); //0월~11월임 ;;;
		System.out.println("일 : " + cal.get(Calendar.DATE));
		
		System.out.println("이 달의 몇째주 : " + cal.get(Calendar.WEEK_OF_MONTH));
		System.out.println(":" + cal.get(Calendar.DAY_OF_WEEK));
		
		//시,분,초
		System.out.println(cal.get(Calendar.HOUR));
		System.out.println(cal.get(Calendar.MINUTE));
		System.out.println(cal.get(Calendar.SECOND));
		System.out.println(cal.get(Calendar.AM_PM)); //1 오후
		
		//학사관리시스템
		//웹 : 페이지 본수 : 200page
		//150page 날짜정보 각 페이지 하단 출력
		System.out.println(Edu_Date.DateString(cal));
		System.out.println(Edu_Date.DateString(cal, "-"));
		System.out.println(Edu_Date.DateString(cal, "/"));
		System.out.println(Edu_Date.monthFormat_DateString(cal));
		
	}
}
```
## Edu_Date class
```java
package kr.or.kosa.util;

import java.util.Calendar;

//설계도
//날짜를 적용하는 함수는 많이 사용돼서 편하게 쓰고싶다
//static 오버로딩
public class Edu_Date {
	public static String DateString(Calendar date) {
		return date.get(Calendar.YEAR) + "년" + (date.get(Calendar.MONTH)+1) + "월" + date.get(Calendar.DATE) + "일";
	}
	public static String DateString(Calendar date, String opr) {
		return date.get(Calendar.YEAR) + opr + (date.get(Calendar.MONTH)+1) + opr + date.get(Calendar.DATE);
	}
	
	//요구사항
	//2020-09-14 와 같이 두자리 숫자로 나오도록.
	public static String monthFormat_DateString(Calendar date) {
		
		String month = "";
		if(date.get(Calendar.MONTH)+1 < 10) {
			month = "0"+(date.get(Calendar.MONTH)+1);
		}else {
			month += date.get(Calendar.DATE);;
		}
		String day = "";
		if(date.get(Calendar.DATE) < 10) {
			day = "0"+date.get(Calendar.DATE);
		}else {
			day+=date.get(Calendar.DATE);
		}
		
		return date.get(Calendar.YEAR)+"-"+month+"-"+day;
	}
}
```
