//"안녕하세요"라고 표시하는 hello 메서드 작성. 7-5 (270p)
// !!!main 함수에서 scanner와 반복문을 사용하여, hello 메소드를 10번 이상 호출하여 출력하기)!!!!

import java.util.Scanner;

public class No4 {
    public static void hello(){
        System.out.println("안녕하세요");
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int count = scanner.nextInt();
        for(int i=0;i<count;i++){
            hello();
        }

    }
}
