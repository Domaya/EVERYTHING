import java.util.EmptyStackException;
import java.util.Scanner;

public class Ex15 { //Multiply
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        while(true){
            try {
                System.out.print("곱하고자 하는 두 수 입력 >> ");
                int n = scanner.nextInt();
                int m = scanner.nextInt();
                System.out.printf("%d X %d = %d \n", n, m, n*m);
                scanner.close();
            }catch (Exception e){
                System.out.println("실수는 입력하면 안 됩니다.");
                scanner.nextLine();
                continue;
            }
            break;
        }


    }
}
