import java.util.regex.Pattern;

public class myEmail {
    public static void main(String[] args) {
        String pattern1 = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";
        String pattern2 = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
        String str2 = "abc_123@gmail.com";
        if(Pattern.matches(pattern1, str2)) {
            System.out.println("올바른 이메일 형식입니다. ");
        } else {
            System.out.println("올바른 이메일 형식이 아닙니다. ");
        }

    }
}
