public class No10{

    public static void main(String []args){
        int arr[] = new int[10];
        int ran = 0;
        int sum = 0;
        System.out.print("Random Integer : ");
        for(int i=0; i<=10;i++){
            ran = (int)(Math.random()*10);
            sum += ran;
            System.out.printf("%d ", ran);
        }
        System.out.println();
        System.out.printf("Average : "+(double)(sum/10));
    }
}
