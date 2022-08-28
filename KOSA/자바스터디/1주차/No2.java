import java.util.Scanner;

//2자리의 정수값(10~99)을 맞추는 '숫자 맞추기 게임'을 만들자. 난수생성과 if문 그리고 do 문을 사용할것. 문제4-3 (110p)
public class No2 {
    public static void main(String[] args) {
        //(int) Math.random() * (최댓값-최소값+1) + 최소값
        int correct = (int)(Math.random()*(90)+10);
        int num = 0;
        int count = 0;
        Scanner scanner = new Scanner(System.in);
        do{
            System.out.print("정답을 맞춰보세요>>");
            num = scanner.nextInt();
            if(num == correct){
                System.out.println("정답입니다!");
                break;
            }else{
                count++;
            }
        }while((num != correct)&&(count < 10));
        if(count>=10) System.out.printf("정답은 %d였습니다.", correct);
    }
}
