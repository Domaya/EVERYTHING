class Character {
    String name;
    int hp = 100;
    int level = 1;
    String skill;

    public Character(String name, int level) {
        this.name = name;
        hp *= level;
    }
    void resting(){
        System.out.println(name + "은 휴식을 취합니다... 생명력이 " + hp + "만큼 회복되었습니다.");
    }; //휴식을 한다
    void show(){
        System.out.println("======================================");
        System.out.printf("[이름]%s \n[레벨]%d \n[HP]%d \n", name, level, hp);
        System.out.println("[직업]" + getClass().getName());
        System.out.println("======================================");
    }

}
class Warrior extends Character{
    int power = level*20 + 3; //공격력
    public Warrior(String name, int level) {
        super(name, level);
    }
    void attack(){
        System.out.printf("%s가 %d만큼의 공격을 가합니다.\n", name, power);
    };
}

class Mage extends Character{
    int mp = level*30; //마나
    public Mage(String name, int level) {
        super(name, level);
    }
    void cast(){
        System.out.printf("%s가 %d의 마나만큼 공격을 준비합니다.\n",name, mp);
    }; //마법 캐스팅을 한다
}
class Priest extends Character{
    int shield = level*20; //보호막 수치
    public Priest(String name, int level) {
        super(name, level);
    }
    void buff(){
        System.out.printf("%s가 %d만큼의 보호막을 부여합니다. \n", name, shield);
    }; //버프를 주다
}
