import java.util.Scanner;

public class No9{
    public static void main(String []args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("small letter>>");
        String s = scanner.next();
        char little = s.charAt(0);
        for(int i = little;i>=97;i--){
            for(int j = 97; j<=i; j++){
                System.out.print((char)j);
            }
            System.out.println();
        }
        scanner.close();
    }
}
