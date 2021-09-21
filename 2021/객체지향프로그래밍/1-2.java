import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        int count = 0;
        while (count < 3) {
        Scanner scanner = new Scanner(System.in);
        int x1 = scanner.nextInt();
        int y1 = scanner.nextInt();
        int x2 = scanner.nextInt();
        int y2 = scanner.nextInt();


            int check = 0; //점이 사각형 안에 있는지 확인
            if (100 <= x1 && x1 <= 200 && 100 <= y1 && y1 <= 200) {
                check += 1;
                if (100 <= x2 && x2 <= 200 && 100 <= y2 && y2 <= 200) {
                    check += 1;
                }
            } else {
                if (x2 >= 100 && x2 <= 200 && y2 >= 100 && y2 <= 200) {
                    check += 1;
                }
            }

            if (check == 0) {
                System.out.println("두 사각형은 겹치지 않습니다.");
            } else if (check == 1) {
                System.out.println("두 사각형은 겹칩니다.");
            } else if (check == 2) {
                System.out.println("이 사각형은 큰 사각형 안에 포함됩니다.");
            }
            count += 1;
        }
    }
}
