import java.util.Scanner;

//양의정수값을 읽어서 그 자릿수를 출력하는 프로그램 작성.문제 4-9 (123p)
public class No3 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int num = scanner.nextInt();
        int count = 1;
        while(num/10!=0){
            count++;
            num/=10;
        }
        System.out.println("자릿수는 " + count);
    }
}
