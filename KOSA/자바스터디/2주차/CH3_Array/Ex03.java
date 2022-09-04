package CH3_Array;

import java.util.Scanner;

public class Ex03 {
    public static void main(String[] args) {
        int number;
        Scanner scanner = new Scanner(System.in);
        System.out.print("정수를 입력하세요>>");
        number = scanner.nextInt();
        for(int i=1; i<=number; i++){
            for(int j=1;j<=i;j++) System.out.print("*");
            System.out.println();
        }
    }
}
