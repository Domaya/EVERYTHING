public class Character_Program {
    public static void main(String[] args) {
        Mage sally = new Mage("Sally", 1);
        Priest tom = new Priest("Tom", 10);
        Warrior kei = new Warrior("Kei", 23);
        sally.show();
        sally.cast();
        tom.buff();
        kei.attack();
        kei.resting();
        tom.show();

    }
}
