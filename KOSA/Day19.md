# Format
```java
import java.text.DecimalFormat;
import java.text.MessageFormat;

public class Ex11_Format_ETC {
	public static void main(String[] args) {
		double money = 123456.5678;
		DecimalFormat df = new DecimalFormat("0.0");
		System.out.println(df.format(money)); //123456.6 반올림
		
		DecimalFormat df2 = new DecimalFormat("0");
		System.out.println(df2.format(money)); //123457 반올림
		
		DecimalFormat df3 = new DecimalFormat("0.000");
		System.out.println(df3.format(money)); //123457 반올림
		
		DecimalFormat df4 = new DecimalFormat("#.#");
		System.out.println(df4.format(money)); //123456.6
		
		String userId = "hjdo";
		String userName = "HYEONJUNG";
		String userTel = "3581";
		
		String message = "회원 Id :{0} \n회원 이름 : {1} \n회원 전화번호 : {2}";
		String result = MessageFormat.format(message, userId, userName, userTel);
		
		System.out.println(result);
	}
}
```

# Stream
```java
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Arrays;

public class Ex01_Stream {
	public static void main(String[] args) {
		//byte(-128~127 정수를 저장)
		byte[] inSrc = {0,1,2,3,4,5,6,7,8,9};
		byte[] outSrc = null;
		
		//data read, write하는 대상 메모리
		ByteArrayInputStream input = null;
		ByteArrayOutputStream output = null;
		
		input = new ByteArrayInputStream(inSrc); //inSrc대상으로부터 데이터를 읽겠다.
		output = new ByteArrayOutputStream(); //write
		
		System.out.println("outSrc before : " + Arrays.toString(outSrc));//outSrc before : null
		
		//공식같은 로직
		int data = 0;
		while((data = input.read()) != -1) { //더이상 read할 데이터가 없으면 -1
			//System.out.println("data : " + data);
			//System.out.println("input.read()  " + input.read()); //1,3,5,7,9 ... read()내부에 이동커서가 있어서 내부적으로 next()
			
			output.write(data); //출력통로 안에 데이터를 머금고 있는 것
			//write대상이 data가 아니고 ByteArrayOutputStream자신의 통로에...
		}
		
		outSrc = output.toByteArray(); //내부적으로 byte배열로 값을 바꿈
		System.out.println("outSrc After : " +  Arrays.toString(outSrc));
	}
}
```
# File Stream
```
import java.io.FileInputStream;
import java.io.FileOutputStream;

/*
 * Byte 데이터를 read, write >> 그 대상이 File
 * FileInputStream
 * FileOutputStream
 * 
 * 
 * File >> 1.txt, data.txt (데이터를 파일에 기록)
 * 
 * I/O클래스는 예외를 강제한다... try~catch 
 * 
 * I/O 자원은 개발자가 직접적으로 자원에 해제(여러 사용자들이 접근 가능)
 * close
 */


public class Ex02_Point_FileStream {
	public static void main(String[] args) {
		FileInputStream fs = null;
		FileOutputStream fos = null;
		
		String path = "C:\\Temp\\a.txt";
		try {
			fs = new FileInputStream(path);
			fos = new FileOutputStream("C:\\Temp\\new.txt");
			/*
			 * FileOutputStream
			 * 1.write하는 파일이 존재하지 않으면 자동으로 파일을 생성한다.
			 * 2.FileOutputStream("C:\\Temp\\new.txt", false);
			 *   false면 덮어쓰기. 
			 * 3.FileOutputStream("C:\\Temp\\new.txt", true);
			 *   true면 append
			 * 
			 */
			int data = 0;
			while((data = fs.read()) != -1) {
				//System.out.println("정수 : " + data + " : " + (char)data);
				//read한 파일을 새로운 파일에 write하는 것이 목적
				fos.write(data); //data값을 내부적으로 read해서 new.txt를 생성한다.
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			//I/O는 가비지 컬렉터가 관리하지 않으므로 소멸자 close()명시적
			try {
				fs.close();
				fos.close();
			}catch(Exception e) {
				
			}
		}
		
	}
}
```
## Copy Image
```java
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex03_Stream_ImageCopy {
	public static void main(String[] args) {
		String orifile = "C:\\Temp\\kkeyboard.jpg";
		String targetfile = "copy.jpg";
		//default 경로 : 해당 클래스가 바라보는 경로 : C:\KOSA_IT\JAVA\Labs\Ex09_IO
		
		FileInputStream fs = null;
		FileOutputStream fos = null;
		
		try {
			fs = new FileInputStream(orifile);
			fos = new FileOutputStream(targetfile, false);
			
			int data = 0;
			while((data = fs.read())!=-1) {
				fos.write(data); //byte값
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				fs.close();
				fos.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
}
```
# Buffer
```java
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

/*
 * File 처리(DISK) : 입출력은 byte단위...
 * 여러 학생을 모아서 하나의 버스에 태워서 목적지...놀면
 * 버스 : buffer
 * 1.I/O성능개선
 * 2.Line단위(엔터)
 * 
 * BufferedInputStream(보조스트림)>>주클래스에의존
 */
public class Ex04_Stream_Buffer {
	public static void main(String[] args) {
		
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		
		try {
			fos = new FileOutputStream("data.txt"); //파일이 없으면 자동생성
			bos = new BufferedOutputStream(fos); //FileOoutputStream 버퍼 사용
			
			/*
			 * JAVA Buffer의 사이즈는 8192byte... 8kb
			 * 1.buffer안에 내용이 채워지면 스스로 출발(버퍼를 비움)
			 * 2.8192바이트가 다 차지 않으면 출발을 안하니까...buffer를 강제로 비우는 작업 : flush() or close()
			 * 3.close()자원해제 >> 내부적으로 flush()호출>>자원해제 
			 */
			
			for(int i=0; i<10; i++) {
				bos.write('A'); //data.txt에 A를 작성하겠다
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				bos.close();
				fos.close();
			}catch(Exception e2) {
				
			}
		}
		
	}
}
```
# Reader Writer
```java
import java.io.FileReader;
import java.io.FileWriter;

/*
 * 문자기반의 데이터 처리 (char[])
 * String 클래스 : String str = "ABC" : 내부적으로 데이터를 char[]에 저장함 [A][B][C]
 * 한글 1자, 영문 1자 >> 2byte >> Reader, Writer (추상클래스)
 * 
 *  대상이 파일이면
 *  FileReader
 *  FileWriter
 *  
 *  
 */
public class Ex05_Reader_Writer {
	public static void main(String[] args) {
		FileReader fr = null;
		FileWriter fw = null;
		
		try {
			fr = new FileReader("Ex01_Stream.java");
			fw = new FileWriter("copy_Ex01.txt"); //파일생성 >> 파일에 같은 내용 write
			
			int data = 0;
			while((data = fr.read())!=-1) {
				//System.out.println(data);
				if(data != '\n'&& data!='\r' && data!=' ' && data!='\t') {
					//엔터, 탭, 빈문자는 파일에 쓰지 않겠다... 압축 버전!
					//https://jquery.com/download/ 실사례:제이쿼리 다운로드
					
					fw.write(data);
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				fr.close();
				fw.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
}
```
# File Reader Writer
```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Ex06_FileReader_FileWriter_Buffer {
	public static void main(String[] args) throws IOException {
//		FileWriter fw = new FileWriter("Lotto.txt", true); //true>>append
//		BufferedWriter bw = new BufferedWriter(fw);
//		bw.write("로또");
//		bw.newLine(); //Enter!!
//		bw.write("1,3,5,7,9,10");
//		bw.newLine();
//		bw.flush();
		
		FileReader fr = null;
		BufferedReader br = null;
		try {
			fr = new FileReader("Ex01_Stream.java");
			br = new BufferedReader(fr);
			//buffer의 장점 : Line단위의 처리,, 즉 엔터가 가능
			String line = "";
			for(int i=0; (line = br.readLine())!=null;i++) {
				//System.out.println(line);
				if(line.indexOf(";")!= -1) {
					//;의 위치값이 -1이 아니라면 line..
					//즉, 한 줄을 읽어서 세미콜론이 있는 경우에만 출력.
					System.out.println(line);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				br.close();
				fr.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
}
```
# 파일 읽기 및 쓰기 실습과제 (로또추첨)
``java
package kr.or.kosa;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Set;
import java.util.TreeSet;

public class Lotto {
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy년MM월dd일 HH:mm");
	Set<Integer> lotto = new TreeSet<Integer>();

	public Lotto(){
		for(int i=0;lotto.size()<6;i++) {
			lotto.add((int)(Math.random()*45+1));
		}
	}
	public void write(){
		FileWriter fw = null;
		BufferedWriter bw = null;
		
		try {
			fw = new FileWriter("theLotto.txt", true);
			bw = new BufferedWriter(fw);
			bw.write("로또번호: " + lotto.toString() + "[" + dateformat.format(cal.getTime())+"]");
			bw.newLine();
			bw.flush();
		} catch (IOException e) {
			
		}finally {
			try {
				fw.close();
				bw.close();
			} catch (Exception e2) {
				
			}
		}
	}
	public void read() {
		FileReader fr = null;
		BufferedReader br = null;
		try {
			fr = new FileReader("theLotto.txt");
			br = new BufferedReader(fr);
			String line = "";
			try {
				for(int i=0; (line=br.readLine())!=null;i++) {
					System.out.println(line);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			
		}
	}
}
```
