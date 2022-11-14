# 에러일기  
다운로드 서비스를 구현하다 보니 에러가 떴다.
```
심각: 경로가 [/WebServlet_93_Board_Model1]인 컨텍스트의 서블릿 [kr.or.kosa.controller.BoardController]을(를) 위한 Servlet.service() 호출이 예외를 발생시켰습니다.
java.lang.IllegalStateException: 응답이 이미 커밋된 후에는 forward할 수 없습니다.
```
RequestDispatcher의 forward()는 현재 페이지의 로직을 처리하고 난 이후 제어를 호출하는 페이지로 넘기고 최종적으로는 제어가 넘어간 페이지에서 최종 결과를 브라우저로 출력하는 형태로 동작하게 됩니다. 
이때 forward()를 호출하는 시점에서 그 전 페이지(a.jsp) 에서 출력버퍼에 담아두었던 출력 내용들은 모두 깨끗이 비운 후에 제어를 넘기게 되는데(b.jsp) 만약 forward() 이전에 강제로 out.flush() 를 통해 버퍼의 내용을 브라우저로 출력하고 나서 forward()를 호출하는 경우에는 위와 같은 예외가 발생하게 됩니다.  

다운로드 구현에서 out.flush를 쓴 탓에 일어난 일이었다. return forward 대신 return null을 해주니 에러가 사라졌다.
