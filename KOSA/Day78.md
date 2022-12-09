# 스프링  
스프링으로 간단한 게시판 실습을 했다.

## 스프링의 "redirect:"리다이렉트 처리  
Spring Framework를 사용한다면 컨트롤러에서 리턴 타입은 String으로 하고, view 이름 대신 "redirect:"로 시작하는 문자열을 반환하면 해당 주소로 리다이렉트를 시켜준다. *리다이렉트*란, 웹 브라우저가 어떤 URL로 웹 서버를 요청했을 때 다른 URL로 넘겨주는 것을 말한다. 예를 들어 지메일로 접속했을 때 로그인이 되어 있지 않다면, 로그인이 선행되어야 하기 때문에 로그인 페이지로 이동시키는 것을 리다이렉트라고 한다.  

```java
@Controller
public class RegisterController {

	@RequestMapping("/register/step1")
	public String handleStep1() {
		return "register/step1";
	}

	@PostMapping("/register/step2")
	public String handleStep2(
			@RequestParam(value = "agree", defaultValue = "false") Boolean agree,
			Model model) {
		if (!agree) {
			return "register/step1";
		}
		model.addAttribute("registerRequest", new RegisterRequest());
		return "register/step2";
	}

}
```
/register/step1은 회원가입을 위한 약관 동의 페이지, /register/step2는 실제 회원가입을 위한 페이지라고 가정하겠다. 사용자가 주소창으로 register/step2로 바로 접근하려 하면 step2에 대한 GET방식을 처리하지 않았으므로 에러가 발생한다. 이렇게 잘못된 전송 방식으로 요청이 왔을 때 적절한 경로로 리다이렉트 해야 한다.

```java
@GetMapping("/register/step2")
	public String handleStep2Get() {
		return "redirect:/register/step1";
	}
 ```
 다시 약관 동의 페이지로 리다이렉트 시켜주는 예제이다. redirect:다음 문자열이 "/"로 시작하면 웹 애플리케이션을 기준으로 이동 경로를 생성하고, 그렇지 않으면 현재 경로를 기준으로 상대경로를 사용한다.
