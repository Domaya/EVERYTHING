
public class Main {
    public static void main(String[] args) {
        Song song = new Song("Dancing Queen", "ABBA", 1978, "스웨덴");
        song.show();
    }
}

class Song {
    String title;
    String artist;
    int year;
    String country;
    //생성자
    Song(String title, String artist, int year, String country){
        this.title = title;
        this.artist = artist;
        this.year = year;
        this.country = country;
    }
    //모든 필드를 초기화하는 생성자
    Song(){
        this("title", "artist", 1970, "country");
    }
    //정보를 출력하는 show메소드
    public void show(){
        System.out.println(year+"년 "+country+"국적의 "+artist+"가 부른 "+title);
    }
}
