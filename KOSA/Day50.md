# 서블릿 실습 중 에러  
멤버 이름으로 LIKE검색을 하는 중 try~catch문에서 에러메시지가 발생했다.  
```
ORA-01756: quoted string not properly terminated
```
궁금해서 검색해보니 인용부에서 작은 따옴표를 마무리짓지 않으면 생기는 에러였다. 
```sql
String sql = "select * from koreamember where name like '%" + inputvalue + "%";
```
inputvalue를 넣다보니 뒤에 작은따옴표를 안 붙였다. 수정해서 다시 반영했다. 



# 오늘의 이슈  
회원 수정 삭제를 하려 할 때...이는 c:forEach로 들어오는데 어떻게 이 회원의 정보를 받아서 제거할 수 있을까? 생각해
