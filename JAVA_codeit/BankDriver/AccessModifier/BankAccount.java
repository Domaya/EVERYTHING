public class BankAccount {
    private int balance;
    private Person owner;

    public void setBalance(int pBalance){
        if(pBalance >= 0){
            balance = pBalance;
        }
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

    // 파라미터 : 입금할 액수(정수)
    // 리턴 : 성공여부(불린)
    boolean deposit(int amount) {
        // 1. write code here
        if(amount < 0){
            System.out.println("입금 실패입니다. 잔고: " + balance + "원, 현금: " + owner.getCashAmount() + "원");
            System.out.println("false");
            return false;
        }
        else if(owner.getCashAmount() < amount) {
            System.out.println("입금 실패입니다. 잔고: " + balance + "원, 현금: " + owner.getCashAmount() + "원");
            System.out.println("false");
            return false;
        }else{
            owner.setCashAmount(owner.getCashAmount() - amount);
            balance += amount;
            System.out.println(amount + "원 입금하였습니다. 잔고: " + balance + "원, 현금: " + owner.getCashAmount() + "원");
            System.out.println("true");
            return true;
        }
    }

    // 파라미터 : 출금할 액수(정수)
    // 리턴 : 성공여부(불린)
    boolean withdraw(int amount) {
        // 2. write code here
        if(amount < 0){
            System.out.println("출금 실패입니다. 잔고: " + balance + "원, 현금: " + owner.getCashAmount() + "원");
            System.out.println("false");
            return false;
        }else if(balance < amount){
            System.out.println("출금 실패입니다. 잔고: " + balance + "원, 현금: " + owner.getCashAmount() + "원");
            System.out.println("false");
            return false;
        }else{
            owner.setCashAmount(owner.getCashAmount() + amount);
            balance -= amount;
            System.out.println(amount + "원 출금하였습니다. 잔고: " + balance + "원, 현금: " + owner.getCashAmount() + "원");
            System.out.println("true");
            return true;
        }
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
