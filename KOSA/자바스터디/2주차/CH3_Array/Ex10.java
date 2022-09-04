package CH3_Array;

import java.util.Arrays;

public class Ex10 {
    static int ran(){
        return (int)(Math.random()*11);
    }
    public static void main(String[] args) {
        int[][] arr = new int[4][4];
        int count = 0;
        boolean flag = true;

        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr[i].length; j++)
                arr[i][j] = 0;
        }

        while (true) {
            for (int i = 0; i < arr.length; i++) {
                for (int j = 0; j < arr[i].length; j++) {
                    int num = ran();
                    if (num != 0) count++;
                    if (count <= 10) {
                        arr[i][j] = num;
                    } else {
                        break;
                    }
                }
            }
            break;
        }
        for(int i=0;i<arr.length;i++){
            for(int j=0;j<arr[i].length;j++)
                System.out.print(arr[i][j] + " ");
            System.out.println();
        }
    }
}
