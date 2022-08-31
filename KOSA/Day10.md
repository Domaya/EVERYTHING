#### Lotto.java
```java
	package kr.or.bit;
	import java.util.Scanner;

	public class Lotto {
		Scanner scanner;
		boolean event2Verify(int a, int b, int[] arr) { //내가 입력한 2개 번호는 추출하지 않는다
		boolean flag = true;
		for(int value : arr) {
			if(value == a || value == b) {
				flag = false;
				break;
				}
			}
			return flag;
		}
	
		public int[] event2() {
			System.out.print("제외할 번호를 두 개 입력하세요 ");
			scanner = new Scanner(System.in);
			int a = scanner.nextInt();
			int b = scanner.nextInt();
			int[] arr = new int[6];
			while(true) {
				arr = ran();
				if(event2Verify(a, b, arr))
					break;
			}
			scanner.close();
			return arr;
		}

		static int[] ran() {
			int[] arr = {(int)(Math.random()*(44)+1),(int)(Math.random()*(44)+1),(int)(Math.random()*(44)+1),(int)(Math.random()*(44)+1),(int)(Math.random()*(44)+1),(int)(Math.random()*(44)+1)};
			return arr;
		}
	
	}
```
#### Lotto_Quiz.java
메인함수
```java
	import java.util.Arrays;
	import kr.or.bit.Lotto;
	public class Lotto_Quiz {

		public static void main(String[] args) {
			Lotto lotto = new Lotto();
			System.out.println(Arrays.toString(lotto.event2()));
		
		}

	}
```
