public class No11{
    public static void main(String []args){

        for(int i=1;i<=99;i++){
            if(i/10==3||i/10==6||i/10==9) {
                System.out.printf("%d 박수 짝", i);
                if(i%10==3||i%10==6||i%10==9)
                    System.out.print("짝");
                System.out.println();
            }
            else if(i%10==3||i%10==6||i%10==9){
                System.out.printf("%d 박수 짝 \n", i);
            }
        }
    }
}
