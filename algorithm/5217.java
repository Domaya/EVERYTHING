import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Main {

    private static ArrayList<Integer> solveSumPairs(int target) {

        ArrayList<Integer> answer = new ArrayList<Integer>();

        /* ------------------- INSERT CODE HERE ---------------------*/

        // answer.add(x);		// adds x to ArrayList<Integer> answer
        //두 수는 항상 달라야 한다
        for(int i=1; i<target; i++){
            int num = target - i;
            if((num != i) && !(answer.contains(num))){
                answer.add(target - num);
                answer.add(num);

            }

        }

        /* -------------------- END OF INSERTION --------------------*/

        return answer;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int numCases = sc.nextInt(); //파라미터 개수

        for(int n = 0; n < numCases; n++)
        {
            int target = sc.nextInt(); //입력받은 수

            ArrayList<Integer> answer = solveSumPairs(target);

            System.out.print("Pairs for "+target+": ");

            for (int i = 0; i<answer.size(); i+=2 ) {
                if (i>0)
                    System.out.print(", ");
                System.out.print(answer.get(i) + " " + answer.get(i+1));
            }
            System.out.println();
        }
    }

}
