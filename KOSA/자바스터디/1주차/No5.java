import java.util.Scanner;

//5. 1부터 n까지의 정수의 합을 구해서 반환하는 메서드 작성. 7-4 (268p)
// 메서드 작성시 패키지는 각자 마음대로.
public class No5 {
    static int accumulate(int a){
        int sum = 0;
        for(int i=1;i<=a;i++){
            sum+=i;
        }
        return sum;
    }
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("정수를 입력하세요>>");
        int num = scanner.nextInt();
        System.out.println(accumulate(num));
    }
}
