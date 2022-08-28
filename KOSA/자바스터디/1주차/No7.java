import java.util.Scanner;
class TV{
    String brand;
    int year = 0;
    int inch =0;
    public TV(String brand, int year, int inch){
        this.brand = brand;
        this.year = year;
        this.inch = inch;
    }
    public void show(){
        System.out.printf("%s에서 만든 %d년형 %d TV", brand, year, inch);
    }
}

public class No7{
     public static void main(String []args){
        TV myTV = new TV("LG", 2017, 32);
        myTV.show();
     }
}
