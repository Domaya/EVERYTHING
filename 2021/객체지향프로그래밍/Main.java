import javax.swing.*;
import java.awt.event.*;
import java.awt.*;

public class Main extends JFrame{
    public Main(){

        setSize(600, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); //프레임 윈도우를 닫으면 프로그램 종료
        setTitle("배경색 바꾸기"); // 프레임 제목


        Container contentPane = getContentPane();
        contentPane.setLayout(new FlowLayout());
        contentPane.setBackground(Color.RED);

        JButton btn1 = new JButton("빨강");
        btn1.addActionListener(new MyActionListner());
        JButton btn2 = new JButton("노랑");
        btn2.addActionListener(new MyActionListner());
        contentPane.add(btn1);
        contentPane.add(btn2);
        setVisible(true);
}
class MyActionListner implements ActionListener{
    public void actionPerformed(ActionEvent e){
        JButton b = (JButton)e.getSource();
        Container c = (Container) e.getSource();
        if(b.getText().equals("빨강")) {
            getContentPane().setBackground(Color.RED);
        }
        else
            getContentPane().setBackground(Color.YELLOW);
    }
}
    public static void main(String[] args){
        new Main();
    }

}
