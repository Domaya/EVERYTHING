# JAVA

자바는 운영체제와 직접 소통하지 않고 JVM(자바 가상 머신)을 거친다.

JDK-자바 개발 도구
JRE-자바 런타임 환경

객체지향프로그래밍 ... 재사용성높임
(A.O.P 관점지향프로그래밍 ... 관심사끼리 모아라)
메모리 자동정리(가비지 컬렉터)

#### 자바 실행 순서
1.자바 파일을 작성하고 저장하면 자바 컴파일러(javac.exe)에 의해 소스 파일(.java)가 클래스파일(.class)로 변환된다.
2.JVM은 바이트 코드(Byte code)로 이루어진 .class 파일을 Class Loader를 이용해서 로드하고, 링크를 통해 배치하는 작업을 수행한다. 또한 런타임 시에 동적으로 클래스를 로드한다.
3.Class Loader에 의해 .class 파일이 JVM 메모리 영역(RunTime Data Area)에 적재된다.
4.Execution Engine은 JVM 메모리 영역에 적재된 Byte code로 이루어진 .class 파일을 기계어로 변경하여 명령어(instruction) 단위로 실행한다.


#### 클래스의 구성 멤버
-필드Field	: 객체의 데이터가 저장되는 곳
-생성자Constructor : 객체 생성시 초기화 역할 담당
-메소드Method : 객체의 동작에 해당하는 실행 블록


#### 필드의 내용
-객체의 고유 데이터
-객체가 가져야 할 부품 객체
-객체의 현재 상태 데이터

public / private -> 접근자
private 변수를 위해 getter / setter를 만들어야한다.
setter는 값의 유효성을 검증 가능
