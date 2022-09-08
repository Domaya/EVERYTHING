class Point{
    private int x, y;
    public Point(int x, int y){this.x = x; this.y=y;}
    public int getX(){return x;}
    public int getY(){return y;}
    protected void move(int x, int y){this.x = x; this.y=y;}
}

//class ColorPoint extends Point{
//    private String color;
//    public ColorPoint(int x, int y, String color){
//        super(x, y);
//        this.color = color;
//    }
//    void setXY(int x, int y){
//        move(x, y);
//    }
//    void setColor(String color){
//        this.color = color;
//    }
//    @Override
//    public String toString(){
//        return color+"색의 ("+getX()+","+getY()+")의 점";
//    }
//}
class ColorPoint extends Point{
    private String color;

    public ColorPoint(){
        super(0, 0);
        this.color = "BLACK";
    }
    public ColorPoint(int x, int y) {
        super(x, y);

    }
    public void setXY(int x, int y){
        move(x, y);
    }
    public void setColor(String color){
        this.color = color;
    }
    @Override
    public String toString(){
        return color+"색의 ("+getX()+","+getY()+")의 점";
    }

}
class Point3D extends Point{
    private int z;
    Point3D(int x, int y, int z){
        super(x, y);
        this.z = z;
    }
    public void moveUp(){
        z++;
    }
    public void moveDown(){
        z--;
    }
    public void move(int x, int y, int z){
        move(x, y);
        this.z = z;
    }
    @Override
    public String toString(){
        return "("+ getX()+","+getY()+","+z+")의 점";
    }
}

public class Ez5 {
    public static void main(String[] args) {
        // #5
//        ColorPoint cp = new ColorPoint(5, 5, "YELLOW");
//        cp.setXY(10, 20);
//        cp.setColor("RED");
//        String str = cp.toString();
//        System.out.println(str + "입니다.");

//         #6
        ColorPoint zeroPoint = new ColorPoint(); //(0, 0)위치의 BLACK 색 점
        System.out.println(zeroPoint.toString()+"입니다.");

        ColorPoint cp = new ColorPoint(10, 10); //(10. 10)위치의 BLACK 색 점
        cp.setXY(5, 5);
        cp.setColor("RED");
        System.out.println(cp.toString()+"입니다.");

//     # 7
        Point3D p = new Point3D(1,2,3); //x, y, z
        System.out.println(p.toString() + "입니다");

        p.moveUp(); //z up
        System.out.println(p.toString() + "입니다");
        p.moveDown();
        p.move(10, 10); //x, y
        System.out.println(p.toString() + "입니다");

        p.move(100, 200, 300);
        System.out.println(p.toString() + "입니다");
    }
}
