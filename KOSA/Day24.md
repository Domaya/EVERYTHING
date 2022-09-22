# 에러 일기  
기존 코드의 AdminSystem에서 특정 회원 검색기능을 사용할 때, 검색 결과가 없으면 Exception in thread "main" java.lang.NullPointerException: Cannot invoke "java.util.List.size()" because "this.searchResult" is null 이 발생하는 것을 확인했다. 특정회원검색 함수는 검색결과 리스트를 반환하는데 검색결과가 없으면 null로 반환하도록 해서 생긴 문제였다. 빈 리스트를 반환하도록 올바르게 고쳤다.
```java
public List<AccountData> selectAccount(String name) {
		List<AccountData> searchUsers = new ArrayList<>();
		for(AccountData ac : userMap.values()) {
			if(ac.getName().equals(name)) {
				searchUsers.add(ac);
			}
		}
		if(searchUsers.size() == 0) { //검색결과가 0일 때
			System.out.println("검색결과가 존재하지 않습니다."); //이거 나중에 returnMessage에 넣기
			//return null;//////////에러가 난 부분
      return searchUsers;//수정한 부분
		}else {
			int index = 1;
			System.out.println(message(room.language, "0058")); //"검색 결과"
			 for(int i = 0; i < searchUsers.size(); i++) {
		            System.out.println(index + " : " + searchUsers.get(i));
		            index++;
		      }
			 return searchUsers;
		}
	}
  ```
