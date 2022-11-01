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



# 오늘의 크고 작은 고개들  
**회원 수정 삭제를 하려 할 때...이는 c:forEach로 들어오는데 어떻게 이 회원의 정보를 받아서 제거할 수 있을까?**  
-> forEach 안에서 태그에 ${member.id}로 아이디를 넣어, 이를 서블릿에 전달할 수 있었다.  

**회원삭제 후 다시 meberlist.jsp로 돌아가는데 이때는 서블릿을 통하지 않아 memberlist데이터가 불러와지지 않았다. 서블릿에서 서블릿을 부를 수 있을까?**  
-> O. viewpage를 'memberlist.jsp'로 하는 대신 'memberlist.do'로 해주니 서블릿을 통해 멤버리스트를 부른 memberlist.jsp로 이동할 수 있었다.  

**멤버수정시...수정form에는 기존의 멤버 데이터가 있어야하고, 이 수정form이 submit되면 새로 업데이트가 되어야 한다. 이걸 서블릿 두개로 나눠서 작성하는게 올바른 방법일까?**  
->아직 고민중
