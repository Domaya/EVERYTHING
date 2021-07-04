public class MarketGood {
    private String name;
    private int retailPrice;
    private int discountRate;

    public MarketGood(String name, int retailPrice, int discountRate){
        this.name = name;
        this.retailPrice = retailPrice;
        if(discountRate > 100 || discountRate < 0) {
            discountRate = 0;
        }else{
            this.discountRate = discountRate;
        }
    }
    public MarketGood(String name, int retailPrice){
        this(name, retailPrice, 0);
    }

    public String getName(){
        return name;
    }
    public int getRetailPrice(){
        return retailPrice;
    }
    public void setDiscountRate(int discountRate){
        this.discountRate = discountRate;
    }
    public int getDiscountRate(){
        return discountRate;
    }


    public int getDiscountedPrice(){
        return (int)(retailPrice * ((double)100 - discountRate)/100);
    }


}
