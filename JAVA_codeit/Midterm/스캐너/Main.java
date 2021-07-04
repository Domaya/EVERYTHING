import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        while(true){
            System.out.println("(I)ntro (C)ourses (E)xit");
            Scanner scanner = new Scanner(System.in);
            String input = scanner.next();
            if(input.equals("i") || input.equals("I")){
                System.out.println("안녕하세요! 우리는 코드잇입니다.\n" + "함께 공부합시다!");
                continue;
            }else if(input.equals("E") || input.equals("e")){
                System.out.println("안녕히 가세요.");
                break;
            }else if(input.equals("C") || input.equals("c")){
                while(true){
                    System.out.println("코드잇 수업을 소개합니다.\n" +
                            "(P)ython (J)ava (i)OS (B)ack");
                    String input2 = scanner.next();
                    if(input2.equals("P") || input2.equals("p")) {
                        System.out.println("Python 언어를 통해 컴퓨터 사이언스의 기초를 배웁니다.\n" +
                                "강사: 강영훈\n" +
                                "추천 선수과목: 없음");
                    }else if(input2.equals("j") || input2.equals("J")) {
                        System.out.println("Java의 기본 문법과 객체지향적 프로그래밍을 배웁니다.\n" +
                                "강사: 김신의\n" +
                                "추천 선수과목: Python");
                    }else if(input2.equals("i") || input2.equals("I")){
                        System.out.println("최신 Swift 언어를 통해 iOS 개발을 시작할 수 있습니다.\n" +
                                "강사: 성태호\n" +
                                "추천 선수과목: Python, Java");
                    }else if(input2.equals("b") || input2.equals("B")){
                        break;
                    }
                }
            }
        }
    }
}
