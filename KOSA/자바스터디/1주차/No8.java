import java.util.Scanner;
class Grade{
    int math;
    int science;
    int english;
    public Grade(int math, int science, int english){
        this.math = math;
        this.science = science;
        this.english = english;
    }
    public int average(){
        return (int)((math + science + english)/3);
    }
}

public class No8{
    public static void main(String []args){
        Scanner scanner = new Scanner(System.in);
        System.out.print("math, science, english>>");
        int math = scanner.nextInt();
        int science = scanner.nextInt();
        int english = scanner.nextInt();
        Grade me = new Grade(math,science,english);
        System.out.println("평균은 "+me.average());
        scanner.close();
    }
}
