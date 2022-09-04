package CH3_Array;

import java.util.Scanner;

//양의정수 10개 입력받아 배열에 저장하고 3의 배수만 골라서 출력
public class Ex05 {
    public static void main(String[] args) {
        int[] arr = new int[10];
        System.out.print("양의 정수 10개 입력>>");
        Scanner scanner = new Scanner(System.in);
        for(int i=0; i<arr.length;i++){
            arr[i] = scanner.nextInt();
        }
        System.out.print("3의 배수는 ");
        for(int value : arr){
            if(value%3==0){
                System.out.print(value + " ");
            }
        }
    }
}
