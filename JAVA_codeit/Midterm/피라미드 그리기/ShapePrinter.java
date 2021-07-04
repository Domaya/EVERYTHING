public class ShapePrinter {
    public void printPyramid(int height) {
        // 코드를 입력하세요.
        for(int i = 1; i <= height; i++){
            for(int j = i; j<= height-1; j++){
                System.out.print(" ");
            }
            for(int k = 1; k <= i; k++){
                if(k < 2){
                    System.out.print("*");
                }else {
                    System.out.print("**");
                }
            }
            System.out.println();
        }
    }
}
