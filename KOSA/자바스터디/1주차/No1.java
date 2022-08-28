import java.util.Scanner;

public class No1 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        System.out.print("점수를 입력하세요>>");
        int score = scanner.nextInt();
        score /= 10;
        switch(score){
            case 10:
                System.out.println("수");
                break;
            case 9:
                System.out.println("수");
                break;
            case 8:
                System.out.println("우");
                break;
            case 7:
                System.out.println("미");
                break;
            case 6:
                System.out.println("양");
                break;
            default:
                System.out.println("가");
        }
    }
}
