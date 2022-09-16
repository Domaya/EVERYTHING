# File
```
package kr.or.kosa;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class Ex10_File_SubList {
	
	static int totalfiles = 0;//파일의 개수
	static int totaldirs = 0;//폴더의 개수
	
	static void printFileList(File dir) {
		System.out.println("Full Path : " + dir.getAbsolutePath());
		//코드...자유...
		List<Integer> subdir = new ArrayList<Integer>();
		File[] files = dir.listFiles(); //하위 자원 정보를 얻어냄
		//^파일 하나하나를 file객체로 보는 것.
		//[0] = a.txt
		//[1] = aaa폴더
		//[2] = bbb폴더
		//[3] = java.jpg
		//이런 식으로... 각 방의 타입은 File타입
		for(int i=0; i<files.length;i++) {
			String filename = files[i].getName(); //폴더명 파일명
			if(files[i].isDirectory()) {
				filename = "[ DIR ]" + filename;
				//POINT
				subdir.add(i); //WHY? >> 폴더인 녀석의 index값을 (i) > arraylist
			}else {
				filename = filename + " / " + files[i].length() + "byte";
			}
		}
		//하위 폴더의 개수는
		int dirnum = subdir.size();
		//파일 개수는
		int filenum = files.length - dirnum;
		//누적개수...하위 폴더 안의 자원까지
		totaldirs += dirnum;//총 누적된 폴더 개수 ... 하위의 하위까지
		totalfiles += filenum; //총 누적된 파일 개수
		
		System.out.println("[Current DirNum] : " + dirnum);
		System.out.println("[Current FileNum] : " + filenum);
		System.out.println("***********************");
		
		//POINT (하위 폴더의 하위 폴더까지 다 보길 원함)
		for(int i=0;i<subdir.size();i++) {
			int index = subdir.get(i); //폴더의 방 위치값
			//한줄의 코드 재귀호출
			printFileList(files[index]);
		}
	}
	
	public static void main(String[] args) {
		if(args.length != 1) {
			System.out.println("Usage : java [filename] [path]");
			System.out.println("ex) java Ex10_File_SubList C:\\Temp");
			System.exit(0);
		}
		File f = new File(args[0]);
		if(!f.exists() || !f.isDirectory()) {
			//존재하지 않거나 디렉토리가 아니면
			System.out.println("유효하지 않은 경로");
			System.exit(0);
		}
		//정상적인 경로고 폴더 ...
		printFileList(f); //호출 반복
		//하위 폴더 안의 개수, 파일 개수 누적
		System.out.println("누적 총 폴더 수 : " + totaldirs);
		System.out.println("누적 총 파일 수 : " + totalfiles);
		
	}
}
```

# PrintWriter
```java

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;

/* 
 *출력형식 저장
 *1.printf
 *2.String.format
 *3.PrintWriter (레포팅할 때)
 *4.현업 : 레포팅 소프트웨어(양식지 : 전표, 세금계산서, 인사(휴가지원서))
 *4.1크리스탈 레포트, 오즈
 * 
 * 
 */
public class Ex11_PrintWriter {
	public static void main(String[] args) {
		
		try {
//			PrintWriter pw = new PrintWriter("C:\\Temp\\homework.txt");
//			pw.println("**********************************************");
//			pw.println("*                 HOMEWORK                   *");
//			pw.println("**********************************************");
//			pw.printf("%3s : %5d %5d %5d %5.1f", "아무개", 100, 99, 80, (float)((100+99+80)/3));
//			pw.println();
//			pw.close();
//			
			//read(line단위)
			FileReader fr = new FileReader("C:\\Temp\\homework.txt");
			BufferedReader br = new BufferedReader(fr);
			String s = "";
			
			while((s=br.readLine())!=null){
				System.out.println(s);
			}
			br.close();
			fr.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
```
# Find
```java
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Ex12_PrintWriter_String_Finder {
	
	String baseDir = "C:\\Temp"; //검색할 디렉토리
	String word = "HELLO"; //검색할 단어
	String savetxt = "result.txt"; //Hello단어가 들어있는 파일 정보 저장
	
	void Find() throws IOException { //Find함수 사용시 예외처리 강제
		File dir = new File(baseDir);
		if(!dir.isDirectory()) {
			System.out.println("유효한 폴더가 아니에요");
			System.exit(0);
		}
		
		PrintWriter writer = new PrintWriter(new FileWriter(savetxt));
		BufferedReader br = null;
		
		File[] files = dir.listFiles();
		for(int i=0;i<files.length;i++) {
			if(!files[i].isFile()) {
				continue;
			}
			//파일이면
			br = new BufferedReader(new FileReader(files[i]));
			
			//a.txt
			//a.txt한문장씩 read
			String line = "";
			while((line = br.readLine())!=null) {
				//a.txt 한줄씩 읽어서 그 문장안에 HELLO 단어가 하나라도 존재하면
				if(line.indexOf(word) != -1) {
					//a.txt 한줄씩 읽어서 그문장 안에 HELLO 단어가 하나라도 존재하면
					writer.write("word = " + files[i].getAbsolutePath() +"\n");
				}
			}
			writer.flush();
		}
		br.close();
		writer.close();
	}
	
	public static void main(String[] args) {
		
		Ex12_PrintWriter_String_Finder finder = new Ex12_PrintWriter_String_Finder();
			
		try {
			finder.Find();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
```
# DataOutputStream and DataInputStream
```java
import java.io.DataOutputStream;
import java.io.FileOutputStream;

/*
 * 보조스트림
 * DataOutPutStream
 * DataInputStream
 * 
 * java 8가지 기본타입(타입별로 write, read)
 * 단 조건 (둘이 같이 쓰여야만 타입별로 데이터를 쓰고 읽을 수 있다)
 * 
 * 만약)
 * 성적.txt
 * 100, 20, 60, 88 >> 문자열 > split > array > 연산을 위해 int로....
 * 
 * 
 */
public class Ex13_DataOutPutStream {
	public static void main(String[] args) {
		int[] score = {100, 60, 55, 95, 50};
		FileOutputStream fos = null;
		DataOutputStream dos = null;
		
		try {
			fos = new FileOutputStream("score.txt");
			dos = new DataOutputStream(fos);
			for(int i=0;i<score.length;i++) {
				dos.writeInt(score[i]); //정수값으로 그대로 write
				//조건 이걸로 썼으니 read할 때 반드시 datainputstream을 써라
				//dos.writeUTF(null); 채팅입력 출력
				
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				dos.close();
				fos.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}


import java.io.DataInputStream;
import java.io.FileInputStream;

public class Ex14_DataInputStream {
	public static void main(String[] args) {
		//파일 학생 점수 기록
		//read 합계, 평균
		//DataOutputStream >> dos.writeInt
		
		//반드시 >> DataInputStream >> read
		int sum = 0;
		int score = 0;
		FileInputStream fis = null;
		DataInputStream dis = null;
		
		try {
			fis = new FileInputStream("score.txt");
			dis = new DataInputStream(fis);
			while(true) {
				score = dis.readInt();
				System.out.println("score int type : " + score);
				sum += score;
				//read할 자원이 없으면 IOException발생
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("sum : " + sum);
		}finally {
			try {
				dis.close();
				fis.close();
			} catch (Exception e2) {
				// TODO: handle exception
				System.out.println(e2.getMessage());
			}
		}
		
	}
}
```
# ObjectInputStream and ObjectOutputStream
```
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

import kr.or.kosa.UserInfo;

public class Ex15_ObjectDataOutputStream {
	public static void main(String[] args) {
		//직렬화........
		
		String filename = "UserData.txt";
		
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		//버퍼에 담아서 보내는 것을 뭐로 할거냐면
		ObjectOutputStream out = null;
		
		try {
			fos = new FileOutputStream(filename, true);
			bos = new BufferedOutputStream(fos);
			//직렬화
			out = new ObjectOutputStream(bos); //얘가 버퍼에 있는 내용을 직렬화함
			
			UserInfo u1 = new UserInfo("홍길동", "super", 500); //완제품
			UserInfo u2 = new UserInfo("scott", "tiger", 30); //완제품
			//직렬화
			out.writeObject(u1); //userinfo분해해서 한 줄로 세워서 파일에 기록
			out.writeObject(u2);
			//파일에 UserInfo 객체 두 개를 직렬화해서 write한 과정이 여기까지 ...
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("err" + e.getMessage());
		}finally {
			
			try {
				out.close();
				bos.close();
				fos.close();
				System.out.println("파일 생성 -> 버퍼 -> 직렬화 -> 파일 write");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
	}
}
```
```java
import java.io.BufferedInputStream;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;

import kr.or.kosa.UserInfo;

//UserData.txt에 직렬화된 객체가 2개
//이 객체들을 read원상태로 복원 즉 역직렬화
public class Ex16_ObjectDataInputStream {
	
	public static void main(String[] args) {
		String filename = "UserData.txt";
		
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		ObjectInputStream in = null;
		
		try {
			fis = new FileInputStream(filename);
			bis = new BufferedInputStream(fis);
			in = new ObjectInputStream(bis); //한 줄의 코드가 (역직렬화)
			
//			//복원
//			UserInfo r1 = (UserInfo)in.readObject();
//			UserInfo r2 = (UserInfo)in.readObject();
//			System.out.println(r1.toString());
//			System.out.println(r2.toString());
			//근데 이러면 내가 몇 개의 객체가 있는지 알아야만 하니까...
			
			Object users = null;
			while((users = in.readObject())!=null) {
				System.out.println(((UserInfo)users).toString());
			}
			
		} catch (FileNotFoundException e) {
			System.out.println("파일이 존재하지 않아요");
		} catch (EOFException e2) {
			System.out.println("끝 " + e2.getMessage());
		} catch (IOException e3) {
			System.out.println("파일을 읽을 수 없어요");
		} catch (ClassNotFoundException e) {
			System.out.println("클래스를 찾을 수 없어요 ");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally {
			try {
				in.close();
				bis.close();
				fis.close();
			} catch (Exception e2) {
				// TODO: handle exception
				System.out.println(e2.getMessage());
			}
		}
		
	}
}
```



# DOS과제
```java
import java.io.File;

public class DosProject {
	static File f;
	
	static public void mkdir(String dirName) {
		String path = "";
		path = f + "\\" + dirName;
		File newfile = new File(path);
		if(newfile.exists()) {
			System.out.println("이미 존재하는 디렉토리입니다");
		}else {
			newfile.mkdir();
		}
	}
	
	static public void rename(String originName, String newName) {
		try {
			File originFileName = new File(f + "\\" + originName);
			File newFileName = new File(f + "\\" + newName);
			
			if(!originFileName.exists()) {
				System.out.println("존재하지 않습니다.");
				System.exit(0);
			}
			if(newFileName.exists()) {
				System.out.println("이미 존재하는 이름입니다");
				System.exit(0);
			}
			
			boolean scc = originFileName.renameTo(newFileName);
			if(scc) {
				System.out.println("수정 완료");
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("rename 중 예외 발생 : " + e.getMessage());
		}
	}
	static public void delete(File dirPath) {
		try {
			File[] files = dirPath.listFiles();
			if(files != null) {
				for(File file : files) {
					delete(file);
					System.out.println(file + "제거");
				}
			}
			dirPath.delete();
		} catch (Exception e) {
			System.out.println("제거 실패..." + e.getMessage());
		}
	}
	static public void dir() {
		try {
			File[] files = f.listFiles();
			for(int i=0; i<files.length;i++) {
				System.out.println(files[i].toString());
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void main(String[] args) throws Exception {

		//java ExDos C:\Temp mkdir newDir

		//java ExDos C:\Temp rename file.txt file2.txt

		//java ExDos C:\Temp delete new.txt

		if(args.length != 3 && args.length != 4 && args.length != 2) {

		System.out.println("사용법 : [java파일명] [디렉토리경로] mkdir [생성디렉토리명]");
		System.out.println("사용법 : [java파일명] [디렉토리경로] rename [파일명] [새로운 파일명]");
		System.out.println("사용법 : [java파일명] [디렉토리경로] delete [파일명]");
		System.out.println("사용법 : [java파일명] [디렉토리경로] dir");
		System.exit(0);

		}

		f = new File(args[0]); //입력한 pathname 경로 파일의 객체를 생성합니다.

		if(!f.exists() || !f.isDirectory()) { //존재하지 않거나 디렉토리 아니라면

		System.out.println("유효하지 않은 디렉토리입니다");

		System.exit(0);

		}

		if(args[1].equals("mkdir")) {
			mkdir(args[2]);
		}else if(args[1].equals("rename")) {
			rename(args[2], args[3]);
		}else if(args[1].equals("dir")) {
			dir();
		}else if(args[1].equals("delete")) {
			String path = f + "\\" + args[2];
			File newfile = new File(path);
			delete(newfile);
		}
	}
}
```
