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
}
