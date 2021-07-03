public class Main {
    public static void main(String[] args) {
        Person p1 = new Person("김신의", 24, 30000);
        Person p2 = new Person("문종모", 24, 100000);
        BankAccount a1 = new BankAccount(100000, p1);

        BankAccount a2 = new BankAccount(500000, p2);


        p1.account = a1;
        p2.account = a2;

        a2.transfer(a1, 200000);
        a1.transfer(p2, 150000);
        p2.transfer(a1, 270000);
        p1.transfer(p2, 130000);

    }
}
