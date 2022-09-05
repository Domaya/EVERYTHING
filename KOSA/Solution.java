import java.util.Scanner;
import java.io.FileInputStream;
class Solution {
    static int AnswerN;
    static int N = 10;
    static Scanner sc = new Scanner(System.in);
    static int[][] vector = {{1,0}, {-1,0}, {0,-1}, {0,1}}; //벡터 = [↓,↑,←,→]
    static int y = 0; //
    static int x = 0;
    static String[][] setArr(){ //바둑판 입력받아서 초기화
        String[][] arr = new String[N][N];
        for(int i=0; i<N; i++){
            for(int j=0; j<N;j++){
                arr[i][j] = sc.next();
                if(arr[i][j].equals("X")){
                    y = i;
                    x = j;
                }
            }
        }
        return arr;
    }
    static int getAnswerN(String[][] arr){
        int count = 0;
        int tempX, tempY;
        for(int i=0; i< vector.length; i++){
            //System.out.println(y + vector[i][0]+ " " + (int)(x + vector[i][1]));
            tempY = y + vector[i][0];
            tempX = x + vector[i][1];

            if(arr[tempY][tempX].equals("H")){
                try {
                    while (arr[tempY][tempX].equals("H")) {
                        count++;
                        tempY += vector[i][0];
                        tempX += vector[i][1];
                    }
                }
                    catch(Exception e){
                       break;
                }
            }

        }
        return count;
    }



    public static void main(String args[]) throws Exception {
        //System.setIn(new FileInputStream("C:\sample_input.txt"));


        int T = sc.nextInt(); //테스트케이스 개수

        for(int test_case = 1; test_case <= T; test_case++) {
            N = sc.nextInt(); //바둑판 크기
            String[][] arr = setArr();//바둑판 초기화
//            for(int i=0;i<N;i++){
//                for(int j=0;j<N;j++){
//                    System.out.print(arr[i][j] + " ");
//                }
//                System.out.println();
//            }
//            System.out.println("[" + x + "," + y + "]");

            AnswerN = getAnswerN(arr);
            System.out.println("#"+test_case+" "+AnswerN);
        }
    }
}
