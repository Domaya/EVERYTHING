import java.util.Scanner;

class Circle{
    private double x, y;
    private int radius;
    public Circle(double x, double y, int radius){
        //x, y, radius 초기화
        this.x = x;
        this.y = y;
        this.radius = radius;
    }
    public void show(){
        System.out.printf("(%.1f, %.1f) %d \n", x, y, radius);
    }
}

public class CircleManager{
    public static void main(String []args){
        Scanner scanner = new Scanner(System.in);//스캐너
        Circle c[] = new Circle[3];
        for(int i=0; i<3 ; i++){
            System.out.print("x, y, raidus >>");
            double x = Double.parseDouble(scanner.next());// x 값 읽기
            double y = Double.parseDouble(scanner.next());//  y값읽기
            int radius = Integer.parseInt(scanner.next());//반지름 읽기
            c[i] = new Circle(x, y, radius) ;
        }
        System.out.println();
        for(int i=0; i<c.length; i++){
            c[i].show();
        } //모든 서클 객체 출력
        scanner.close();
    }
}
