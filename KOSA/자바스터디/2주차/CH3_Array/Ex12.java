package CH3_Array;

public class Ex12 {
    public static void main(String args[]) {
        int sum = 0;
        for(int i = 0; i < args.length; i++) {
            try {
                sum += Integer.parseInt(args[i]);
            }
            catch(Exception e) {
                args[i] = "0";
            }
        }
        System.out.println(sum / args.length);
    }
}
