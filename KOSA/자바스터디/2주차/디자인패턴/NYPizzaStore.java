package FactoryMethodEx;

public class NYPizzaStore extends PizzaStore {
    @Override
    Pizza createPizza(String item){
        if("cheese".equals(item)){
            return new NYStyleCheesePizza();
        }else if("veggie".equals(item)){
            return new NYStyleVeggiePizza();
        }else if("clam".equals(item)){
            return new NYStyleClamPizza();
        }else{
            return null;
        }
    }
}
