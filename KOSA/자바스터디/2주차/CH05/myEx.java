import java.util.Scanner;

abstract class Converter {
    abstract protected double convert(double src);//추상메소드
    abstract protected String getSrcString();;
    abstract protected String getDeString();
    protected double ratio;

    public void run(){
        Scanner scanner = new Scanner(System.in);
        System.out.println(getSrcString()+"을 "+ getDeString() +"로 바꿉니다");
        System.out.print(getSrcString()+"을 입력하세요>>");
        double val = scanner.nextDouble();
        double res = convert(val);
        System.out.println("변환 결과 : " + res + getDeString() + "입니다");
        scanner.close();

    }
}
class Km2Mile extends Converter{
    Km2Mile(double ratio){ this.ratio = ratio;}
    public double convert(double src){return src/ratio;}
    public String getSrcString(){return "KM";}

    @Override
    protected String getDeString() {
        return "MILE";
    }

}

class Won2 extends Converter{
    public Won2(double ratio) {
        this.ratio = ratio;
    }
    protected double convert(double src) {  return src/ratio;}
    protected String getSrcString() {
        return "원화";
    }
    protected String getDeString() {
        return "달러";
    }

}
public class myEx{
    public static void main(String args[]) {
        Won2 toDollar = new Won2(1200); // 1달러는 1200원
        toDollar.run();

        Km2Mile toMile = new Km2Mile(1.6);
        toMile.run();

    }
}
