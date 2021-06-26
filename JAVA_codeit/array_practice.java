public class array_practice {
    public static void main(String[] args) {
        int[] intArray = new int[30];
        int num = 1001;
        String[] remainders  = new String[4];
        remainders[0] = "Zero";
        remainders[1] = "One";
        remainders[2] = "Two";
        remainders[3] = "Three";

        for(int i : intArray) {
            i = num;
            num++;
            System.out.println(remainders[i % 4]);
        }
    }
}
