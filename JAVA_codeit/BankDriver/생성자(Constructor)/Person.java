public class Person {
    String name;
    int age;
    int cashAmount;
    BankAccount account;



    public void setName(String newName){
        name = newName;
    }
    public String getName(){
        return name;
    }
    public BankAccount getBankAccount(){
        return account;
    }
    public void setBankAccount(BankAccount pAccount){
        account = pAccount;
    }


    public Person(String pName, int pAge) {
        // 코드를 입력하세요
        name = pName;
        if(pAge < 0){
            age = 12;
        }
        cashAmount = 0;
    }
    public Person(String pName, int pAge, int pCashAmount) {
        // 코드를 입력하세요
        name = pName;
        if(pAge < 0){
            age = 12;
        }
        age = pAge;
        if(pCashAmount < 0){
            cashAmount = 0;
        }
        cashAmount = pCashAmount;
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
