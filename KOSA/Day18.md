220914 : 

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
	
	public void addBook(int isbn, String name, int price) {
		bookmap.put(isbn, new Book(isbn, name, price));
	}
	public void delBook(int isbn) {
		if(bookmap.containsKey(isbn)){
			bookmap.remove(isbn);
			System.out.println("삭제 완료");
		}else {
			System.out.println("존재하지 않는 책입니다");
		}
	}
	public Book searchBook(int isbn) {
		if(bookmap.containsKey(isbn)) {
			return bookmap.get(isbn);
		}
		else {
			System.out.println("존재하지 않는 책입니다.");
			return null;
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
	
	
}


public class BookEx {
	public static void main(String[] args) {
		BookManager manager = new BookManager();
		Scanner scanner = new Scanner(System.in);
		int isbn;
		String title;
		int price;
		
		
		theloop:
		while(true) {
			System.out.println("1.도서추가 2.도서삭제 3.도서검색 4.도서목록 0.종료");
			int choice = scanner.nextInt();
			switch(choice) {
			case 1:
				System.out.print("도서 ISBN번호 >>");
				isbn = scanner.nextInt();
				System.out.print("도서 제목 >>");
				title = scanner.next();
				System.out.print("도서 가격 >>");
				price = scanner.nextInt();
				manager.addBook(isbn, title, price);
				break;
			case 2:
				System.out.print("도서 ISBN번호 >>");
				isbn = scanner.nextInt();
				manager.delBook(isbn);
				break;
			case 3:
				System.out.print("도서 ISBN번호 >>");
				isbn = scanner.nextInt();
				System.out.println(manager.searchBook(isbn));
				break;
			case 4:
				manager.show();
				break;
			case 5:
				manager.isbnShow();
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
```
