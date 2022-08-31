package kr.or.bit;

import java.util.Scanner;

public class Lotto {
	static void start() {
		//메뉴 나오고 시작
	}
	
	
	void event1() {
		
	}
	
	public int[] event2() { //내가 입력한 2개 번호는 추출하지 않는다
		System.out.print("제외할 번호를 두 개 입력하세요 >>");
		Scanner scanner = new Scanner(System.in);
		int a = scanner.nextInt();
		int b = scanner.nextInt();
		
		int[] lotto = ran();
		while(true) {
			for(int value : lotto) {
				if(value == a || value == b) {
					//계속 재추첨
				}else
					break;
			}
		}
		return lotto;
	}
	
	static int[] ran() {
		int[] arr = {2, 3, 5, 6, 7, 8}; //예를 들어서...난수로 배열 만듦
		return arr;
	}
	
}
