public class BankAccount {
    int balance;
    Person owner;

    public void setBalance(int pBalance){
        balance = pBalance;
    }
    public int getBalance(){
        return balance;
    }
    public void setOwner(Person newOwner){
        owner = newOwner;
    }
    public Person getOwner(){
        return owner;
    }

    public BankAccount(int pBalance) {
        // 코드를 입력하세요
        if(pBalance < 0){
            balance = 0;
        }
        balance = pBalance;
    }
    public BankAccount(Person pOwner){
        owner = pOwner;
        balance = 0;
    }
    public BankAccount(int pBalance, Person pOwner){
        if(pBalance < 0){
            balance = 0;
        }
        balance = pBalance;
        owner = pOwner;
    }

    public boolean transfer(Person to, int amount) {
        // insert code here
        return transfer(to.getBankAccount(), amount);
    }


    // 첫 번째 파라미터: 받는 사람의 계정 (BankAccount)
    // 두 번째 파라미터: 이체할 금액 (정수)
    // 리턴 : 성공여부 (불린)
    public boolean transfer(BankAccount to, int amount) {
        // insert code here
        boolean success = false;
        if(amount>balance || amount<0) {
            success = false;
        }else {
            balance = balance - amount;
            to.setBalance(to.getBalance() + amount);
            success = true;
        }
        System.out.println(""+ success +" - from: "+owner.getName() +", to: " + to.owner.getName() + ", amount: " +amount+ ", balance: "+balance);
        return success;
    }
}
