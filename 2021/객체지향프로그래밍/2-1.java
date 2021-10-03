
public class Main {
    public static void main(String[] args) {
        TV myTV = new TV("LG", 2017, 32); //LG에서 만든 2017년 32인치
        myTV.show();
    }
}

class TV{
    String name;
    int year;
    int size;

    public TV(String name, int year, int size) {
        this.name = name;
        this.year = year;
        this.size = size;
    };
    public void show(){
        System.out.println(name + "에서 만든 "+year+"년 "+size+"인치 TV");
    }
}
