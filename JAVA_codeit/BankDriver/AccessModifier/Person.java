public class Person {
    private String name;
    private int age;
    private int cashAmount;
    private BankAccount account;

    public void setName(String newName){
        name = newName;
    }
    public String getName(){
        return name;
    }
    public void setAge(int newAge){
        if(newAge >= 0){
            age = newAge;
        }
    }
    public int getAge(){
        return age;
    }
    public void setCashAmount(int newAmount){
        if(newAmount >= 0){
            cashAmount = newAmount;
        }
    }
    public int getCashAmount(){
        return cashAmount;
    }
    public void setBankAccount(BankAccount pAccount){
        account = pAccount;
    }
    public BankAccount getBankAccount(){
        return account;
    }

    // 첫 번째 파라미터: 받는 사람 (Person)
    // 두 번째 파라미터: 이체할 금액 (정수)
    // 리턴 : 성공여부 (불린)
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
        if(amount > account.getBalance() || amount<0) {
            success = false;
        }else {
            account.setBalance(account.getBalance()-amount);
            to.setBalance(to.getBalance()+amount);
            success = true;
        }
        System.out.println(""+ success +" - from: "+name +", to: " + to.getOwner().name+ ", amount: " +amount+ ", balance: "+account.getBalance());
        return success;
    }
}
