import java.util.Scanner;

public class Ex14 {
    public static void main(String[] args) {
        String course[] = {"JAVA", "C++", "HTML5", "Computer Structure", "Android"};
        int score[] = {95, 88, 76, 62, 55};
        String stop = "그만";
        boolean find = false;
        Scanner scanner = new Scanner(System.in);
        while(true){
            find = false;
            System.out.print("Course name >> ");
            String user = scanner.nextLine();
            if(stop.equals(user)) break; //문자열 비교 방법 검색해보기...
            for(int i=0; i<course.length; i++){
                if(course[i].equals(user)){
                    System.out.printf("%s의 점수는 %d점\n", user, score[i]);
                    find = true;
                    break;
                }
            }
            if(find == false){
                System.out.println("없는 과목입니다.");
            }
        }
    }
}
