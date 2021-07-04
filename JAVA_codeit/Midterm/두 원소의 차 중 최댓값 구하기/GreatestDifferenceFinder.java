public class GreatestDifferenceFinder {
    int greatestDifference(int[] intArray) {
        // 코드를 입력하세요.
        if(intArray.length <= 2){
            return 0;
        }
        int max = intArray[0];
        int min = intArray[0];
        for(int i : intArray){
            if(i > max){
                max = i;
            }
            if(i < min){
                min = i;
            }
        }
        return max - min;
    }
}
