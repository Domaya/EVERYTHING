# 에러 일기
관리자 시스템에서 회원의 비밀번호를 초기화하거나 회원의 경고 횟수가 바뀔 때 세이브 후 로드를 하면 해당 회원을 제외한 모든 유저 정보가 삭제되는 것을 확인했다. 코드 작동에는 문제가 없어서 에러 메시지도 없었고, load 메소드에 문제가 있는 것 같아 계속 AccountSystem 클래스의 load메소드를 확인했다. 그러다가 혹시 해서 모든 save, load, update에 syso로 값을 출력해본 결과, update함수에서 불러오는 유저맵이 null상태인 것을 확인했다. update를 하기 전에도 load로 유저맵을 불러와야하는데 로드를 하지 않아 빈 맵에 계속 변경된 회원의 정보만을 put해서 일어난 일이었다.
```java
public void update(AccountData ac){
		load();
		this.account.remove(ac.getId());
		this.account.put(ac.getId(), ac);
		save();
	}
  ```
  어카운트 정보를 수정하기 전에 먼저 load()를 해주자 원하는 대로 작동하기 시작했다.
