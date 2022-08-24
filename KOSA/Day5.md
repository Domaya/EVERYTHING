#### 연산자 과제

```java
import java.util.Scanner;
public class Ex09_Operation_quiz{
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		간단한 사칙 연산기 (+ , - , * , /)
		입력값 3개 (입력값은 nextLine() 받아서 필요하다면 숫자 변환)
		목적 : Integer.parseInt() ,  **equals() 활용**
		화면
		>입력값:숫자
		>입력값(기호): +
		>입력값:숫자 
		>연산결과 :200
		-------------
		>입력값:100
		>입력값(기호): -
		>입력값:100
		>연산결과 :0
		*/
		
		Scanner sc = new Scanner(System.in);
		System.out.print("입력값 : ");
		int num1 = Integer.parseInt(sc.nextLine());
		System.out.print("연산자 : ");
		String operation = sc.nextLine();
		System.out.print("입력값 : ");
		int num2 = Integer.parseInt(sc.nextLine());
		int result = 0;
		Boolean flag = true;
		switch(operation) {
			case "+" : result = num1 + num2;
				break;
			case "-" : result = num1 - num2;
				break;
			case "/" : result = num1/num2;
				break;
			case "*" : result = num1 * num2;
				break;
			default : flag = false;
		}
		if(flag == true) {
			System.out.printf("연산결과 : %d \n", result);			
		}else {
			System.out.println("연산자 입력이 잘못 되었습니다.");
		}

	}

}
```

#### 피보나치 수열
```java
//피보나치 수열 for문으로... (n-1) + (n-2)
		// 1 1 2 3 5
		int fb=0, fb1=0, fb2=0;
		int temp = 0;
		for(int i=1;i<=10;i++) {
			if(i<=2) {
				fb1 = 1;
				fb2 = 1;
				System.out.print("1 ");
			}else { //3번째부터
				fb = fb1 + fb2;
				System.out.print(fb + " ");
				temp = fb2;
				fb2 = fb1;
				fb1 += temp;
				
			}
		}
    

    //while문을 사용한 구구단
    int i = 2;
		int j = 1;
		while(i<=9) {
			while(j<=9) {
				System.out.printf("[%d]*[%d]=[%d]	", i, j, i*j);
				j++;
			}
			i++;
			j = 1;
			System.out.println();
		}
```
    
#### 가위바위보 (세 가지 방법)
    
```
    public static void main(String[] args) {
		int user = 0; //유저의 수
		int computer = 0; //승패여부(난수 부여)

		Scanner sc = new Scanner(System.in);

		//단순 난수(수를 비교하지 않고, 랜덤하게 이기고 지고 비겼는지만 띄워주면 될 때)
		System.out.print("1.가위 2.바위 3.보>>>>");
		user = Integer.parseInt(sc.nextLine());
		computer = (int) (Math.random()*(3));
		if(computer == 0) System.out.println("졌습니다.");
		else if(computer == 1) System.out.println("비겼습니다.");
		else if(computer == 2) System.out.println("이겼습니다.");

		
		//굳이 컴퓨터의 수와 비교해줘야 한다면
		System.out.print("1.가위 2.바위 3.보>>>>");
		user = Integer.parseInt(sc.nextLine());
		computer = (int) (Math.random()*(3)) + 1;
		if(user==computer) {
			System.out.println("비겼습니다.");
		}else if(user==1) {
			if(computer==2) System.out.println("사용자가 가위, 컴퓨터가 바위를 내 졌습니다.");
			else if(computer==3) System.out.println("사용자가 가위, 컴퓨터가 보를 내 이겼습니다.");
		}else if(user==2) {
			if(computer==1) System.out.println("사용자가 바위, 컴퓨터가 가위를 내 이겼습니다");
			else if(computer==3) System.out.println("사용자가 바위, 컴퓨터가 보를 내 졌습니다.");
		}else if(user==3) {
			if(computer==1) System.out.println("사용자가 보, 컴퓨터가 가위를 내 졌습니다.");
			else if(computer==2) System.out.println("사용자가 보, 컴퓨터가 바위를 내 이겼습니다.");
		}
		
		//양수 음수 규칙을 찾아 해보기 ??? 
		System.out.print("1.가위 2.바위 3.보>>>>");
		user = Integer.parseInt(sc.nextLine());
		computer = (int) (Math.random()*(3)) + 1;
		int winner = user - computer;
		if(winner == 0)System.out.println("비겼습니다.");
		else if(winner == -1 || winner == 2)System.out.println("짐");
		else if(winner == -2 || winner == 1)System.out.println("이김");
	}
```
  
