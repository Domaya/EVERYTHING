public class ShapePrinter {
    public void printFloydsPyramid(int height) {
        // 코드를 입력하세요.
        if(height < 5){
            int cnt = 1;
            //패딩 필요 없는 경우
            for(int i = 1; i <= height; i++){
                for(int j = 0; j < i; j++) {
                    System.out.print(cnt + " ");
                    cnt++;
                }
                System.out.println();
            }
        }
        else if(height < 15){
            int cnt = 1;
            for(int i = 1; i <= height; i++) {
                for (int j = 0; j < i; j++) {
                    if(cnt < 10){
                        System.out.print(" " + cnt + " ");
                    }else {
                        System.out.print(cnt + " ");
                    }
                    cnt++;
                }
                System.out.println();
            }
        }
        else{
            int cnt = 1;
            for(int i = 1; i <= height; i++) {
                for (int j = 0; j < i; j++) {
                    if(cnt < 10){
                        System.out.print("  " + cnt + " ");
                    }else if(cnt < 100){
                        System.out.print(" " +cnt + " ");
                    }else{
                        System.out.print(cnt + " ");
                    }
                    cnt++;
                }
                System.out.println();
            }
        }
    }
}
