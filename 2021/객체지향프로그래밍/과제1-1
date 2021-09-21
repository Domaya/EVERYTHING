import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        int count = 0;
        while(count < 3) {
            Scanner scanner = new Scanner(System.in);
            int a = scanner.nextInt();
            int b = scanner.nextInt();
            int c = scanner.nextInt();
            //삼각형이 가능한가?
            int max = a;
            int same = 0; //같은 길이의 변이 몇 번 나오는지
            if(a <= b){
                max = b;
                if(a == b) {
                    same += 1;
                }
                if(b <= c){
                    max = c;
                    if( b == c){
                        same += 1;
                    }
                }
            }
            if(same == 2){
                System.out.println("정삼각형");
            }else{
                if (max == a) {
                    if (b + c < a) {
                        System.out.println("삼각형이 될 수 없습니다.");
                    } else if (b * b + c * c == a * a) {
                        System.out.println("직각삼각형");
                    } else {
                        System.out.println("일반삼각형");
                    }
                } else if (max == b) {
                    if (a + c < b) {
                        System.out.println("삼각형이 될 수 없습니다.");
                    } else if (a * a + c * c == b * b) {
                        System.out.println("직각삼각형");
                    } else {
                        System.out.println("일반삼각형");
                    }
                } else {
                    if (a + b < c) {
                        System.out.println("삼각형이 될 수 없습니다.");
                    } else if (a * a + b * b == c * c) {
                        System.out.println("직각삼각형");
                    } else {
                        System.out.println("일반삼각형");
                    }
                }
            }
        count++;
        }
    }
}
