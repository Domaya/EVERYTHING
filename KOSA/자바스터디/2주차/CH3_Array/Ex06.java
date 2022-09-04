package CH3_Array;

import java.util.Scanner;

public class Ex06 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int[] unit = {50000, 10000, 1000, 500, 100, 50, 10, 1};
        System.out.print("금액을 입력하세요>>");
        int num = scanner.nextInt();
        int count;
        for(int value : unit){
            if(num>value){
                count = num/value;
                System.out.println(value +"원 짜리 " + count+"개");
                num%=value;
            }
        }

    }
}
