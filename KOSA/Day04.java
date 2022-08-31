
public class Ex06_Operation {
	public static void main(String[] args) {
		int result = 100/100;
		System.out.println(result); // 1
		
		result = 13/2; //몫
		System.out.println(result);//6
		
		//나머지를 구하는 연산자(%)
		result = 13 % 2;
		System.out.println(result);
		
		//증가, 감소 연산자(++, --)
		int i = 10;
		++i; //전치증가
		System.out.println("전치 : " + i);
		i = 10;
		i++; //후치증가
		System.out.println("후치 : " + i);
		//혼자 쓰이면 전치, 후치의 이미가 없다
		//증가감 연산자가 다른 연산자와 결합되면 전치 후치의 의미가 생긴다
		int i2 = 5;
		int j2 = 4;
		int result2 = i2 + (++j2);
		System.out.println("result2 : " + result2); //10
		System.out.println("j2 : " + j2); //5
		
		result2 = i2 + j2++;
		System.out.println("result2 : " + result2 + ", j2 : " + j2);// result2 : 10, j2 : 6
		
		byte b = 100;
		byte c = 1;
//		byte d = b + c; //Type mismatch: cannot convert from int to type
		//연산시 4byte 공간을 사용해서 연산을 하기 때문에 int + int가 된다.
		//byte d = (byte) (b + c); //손실이 나더라도 캐스팅
		int d = b + c; //손실 발생하지 않는다
		System.out.println("d값 출력 : " + d);
		
		/*
		 1.정수의 모든 연산은 [int] 타입 변환 후 처리
		 ex) byte + short => 컴파일러가 내부적으로 int + int로 처리
		 char + char => 컴파일러가 내부적으로 int + int로 처리
		 연산 처리시 정수의 연산에서 int보다 작은 타입은 int로 변환시켜서 연산(long 제외)
		 byte, char, short >> 연산시에는 int에 넣어서 계산
		 
		 char + int >> int + int
		 int + long >> long + long 예외적으로...
		 
		 정수 + 실수 >> 타입의 크기와 상관없이 >> 실수
		 */
		
		long ln = 1000000000000l;
		float f1 = 1.2f;
		//long lnresult = ln + f1;
		long lnresult = (long)(ln + f1);;//손실 발생
		System.out.println(lnresult); //999999995904
		
		float num2 = 10.45f;
		int num3 = 20;
		//float + int => float + float
		float result5 = num2 + num3;
		System.out.println(result5); // 30.45
		
		char c2 = '!';//33
		char c3 = '!';//33
		//c2 + c3
		int result6 = c2 + c3;
		System.out.println(result6); //66
		System.out.println((char)result6); //B
		
		//제어문
		int sum = 0; //local variable
		for(int j = 1; j <= 100; j++) {
//			sum += j;
			if(j % 2 == 0) {
				sum+=j;
			}
		}
		System.out.println(sum); //2550	
		
		
		//==연산자 (값을 비교하는 연산자)
		if(10 == 10.0f) { //타입을 비교하지 않고 가진 값을 비교함
			System.out.println(true);
		}else {
			System.out.println(false);
		}
		
		//부정 연산자 !
		if('A' != 65){
			System.out.println(true);
		}else {
			System.out.println(false);
		}
		
		//연산자 중에서 제어문 역할을 하는 것
		//삼항 연산자
		//(조건)?(true면 쓸 값 또는 연산식):(false면 쓸 값 또는 연산식)
		
		int p = 10;
		int k = -10;
		int result8 = (p == k)?p:k;
		System.out.println(result8); //-10
		
		int result9 = 0;
		if(p==k) {
			result9 = p;
		}else {
			result9 = k;
		}	
		System.out.println(result9); //-10
		
		int data = 80;
		switch(data) {
		case 100 : System.out.println("100점");
			break;
		case 90 : System.out.println("90점");
			break;
		case 80 : System.out.println("80점");
			break;
		default:System.out.println("일치하는 값 없음");
		}
		
		data=90;
		switch(data) {
		case 100 : System.out.println("100점");//출력x
		case 90 : System.out.println("90점");
		case 80 : System.out.println("80점");
		default:System.out.println("일치하는 값 없음");
		}
		
		//난수 : 랜덤값. 임의의 추출값
		//java가 기능이나 자원을 미리 생성해둬서 찾아서 사용하면 되는 것 ... JAVA API
		//쓰고자 하는 자원이 있는 폴더를 oepn
		//import java.lang.*>> java폴더 안에 lang폴더 안에 모든 것 불러오기
		//생략되어있음
		
		//0~9
		System.out.println("Math : "+ (Math.random()*10));
		System.out.println("Math : "+ ((int)(Math.random()*10)));
		
		
//		
//		우리는 백화점 경품 시스템을 만들려고 한다
//
//		   경품 시스템은 나오는 점수에 따라 경품을 지급하는 시스템이다
//
//		   경품 추첨시 1000 점수가 나오면
//
//		   경품으로 TV , NoteBook , 냉장고 , 한우세트 , 휴지
//
//		   경품 추첨시 900 점수가 나오면
//
//		   경품으로  NoteBook , 냉장고 , 한우세트 , 휴지
//
//		   경품 추첨시 800 점수가 나오면
//
//		   경품으로  냉장고 , 한우세트 , 휴지
//
//		   경품 추첨시 700 점수가 나오면
//
//		   경품으로  한우세트 , 휴지
//
//		   경품 추첨시 600 점수가 나오면
//
//		   경품으로  휴지
//
//		   그외 점수는 100 ~ 500 까지는 칫솔 
//
//		   경품시스템의 점수 범위는 100 ~ 1000 점까지 한정되어 있다
//
//		   사용자가 경품 시스템을 사용시 랜덤하게 100 ~ 1000까지의 값이 나오게 되어 있습니다.

	
		int score = (int)((Math.random()*901)+100);	
		System.out.println("점수 : "+score);
		int ranScore = score/100;
		switch(ranScore){
			case 10: System.out.print("TV, ");
			case 9: System.out.print("NoteBook, ");
			case 8: System.out.print("냉장고, ");
			case 7: System.out.print("한우세트, ");
			case 6: System.out.print("휴지, ");			
			default : System.out.println("칫솔");
		}
		
		
		//				[1번 문제]
//				알파벳(A~Z) 까지 출력하는 프로그램을 작성하세요
//
//				(for 문을 사용하세요)
		
		for(int i = 65; i <= 90; i++) {
			System.out.print((char)i);
		}
		System.out.println();
//			[2번 문제]
//			1~100까지 10행 10열로 출력하는 프로그램을 작성하세요
//			(for문을 사용하세요)
//			ex)
//			1 2 3 4 5 6 7 8 9 10
//			11 12 13 .....
//			91 92 93 94 ... 100

		for(int i = 1; i <= 10; i++) {
			for(int j = 1; j <= 10; j++) {
				System.out.print(10*(i - 1) + j + " ");
			}
			System.out.println();
		}
		
//			[3번 문제]
//			두개의 주사위를 던졌을 때 눈의 합이 6이 되는 모든 경우의 수를 출력하는 프로그램을 작성하세요 
		
		for(int i = 1; i <= 6; i++) {
			for(int j = 1; j <= 6; j++) {
				if(i + j == 6) {
					System.out.println("주사위A : " + i + ", 주사위B : " + j);
				}
			}
		}
	}
}
