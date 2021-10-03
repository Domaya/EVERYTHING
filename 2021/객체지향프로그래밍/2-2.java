import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        Scanner sc = new Scanner(System.in);

        System.out.print("수학, 과학, 영어 순으로 3개의 정수 입력 >> ");
        int math = sc.nextInt();
        int science = sc.nextInt();
        int english = sc.nextInt();
        Grade me = new Grade(math, science, english);
        System.out.println("평균은 "+me.average()); // average()는 평균을 계산하여 리턴

        sc.close();
    }
}

class Grade {
    int math;
    int science;
    int english;
    //생성자
    public Grade(int math, int science, int english){
        this.math = math;
        this.science = science;
        this.english = english;
    }
    public int average(){
        int avg = (math + science + english)/3;
        return avg;
    }
}
