package FactoryMethodEx;

public class ChicagoPizzaStore extends PizzaStore {
    @Override
    Pizza createPizza(String item) {
        if ("cheese".equals(item)) {
            return new ChicagoStyleCheesePizza();
        } else if ("veggie".equals(item)) {
            return new ChicagoStyleVeggiePizza();
        } else if ("clam".equals(item)) {
            return new ChicagoStyleClamPizza();
        } else {
            return null;
        }
    }
}