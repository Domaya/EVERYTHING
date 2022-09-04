package CH3_Array;

import java.util.Arrays;
import java.util.Scanner;

//정수를 몇 개 저장할지 입력 받은 후 배열 생성, 범위의 정수를 랜덤하게 삽입하라
//단 중복이 없게 하라
public class Ex08 {
    static boolean verify(int[] copy, int num) { //중복값 검증 메소드
        for(int i=0;i<copy.length;i++) {
            if(num == copy[i]) {
//				System.out.println("중복 발생");
                return false;
            }
        }
        return true;
    }
    public static void main(String[] args) {
        int[] arr = new int[100];
        System.out.println("100이하의 양의 정수 입력 >>");
        Scanner scanner = new Scanner(System.in);
        int count = scanner.nextInt();
        int num = 0;
        int sum = 0;
        for(int i=0; i<count; i++){
            while(true){
                num = (int)(Math.random()*100+1);//난수 추출
//                System.out.println(num);
                if(verify(arr, num)){
                    arr[i] = num;//없으면 배열에 넣음
                    System.out.print(num + " ");
                    sum+= num;
                    break;
                }
            }
        }
        System.out.println();
//        System.out.println(Arrays.toString(arr));
        System.out.println("AVERAGE " + sum/count);
    }
}
