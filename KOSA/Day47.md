# XMLHttpRequest 객체
Ajax의 가장 핵심적인 구성 요소는 바로 XMLHttpRequest 객체입니다.

Ajax에서 XMLHttpRequest 객체는 웹 브라우저가 서버와 데이터를 교환할 때 사용됩니다.

웹 브라우저가 백그라운드에서 계속해서 서버와 통신할 수 있는 것은 바로 이 객체를 사용하기 때문입니다.

XMLHttpRequest 객체의 역사
비동기식 통신 방식인 XMLHttp는 가장 처음으로 익스플로러 5 버전에서 ActiveXObject라는 객체를 사용하여 구현됩니다.

그 후에 모질라와 사파리에서 XMLHttpRequest라는 이름으로 도입하여 널리 사용되기 시작합니다.

 

초기의 XMLHttpRequest 객체는 W3C 표준이 아니었기 때문에 웹 브라우저마다 구현상의 차이가 존재했습니다.

하지만 익스플로러도 7 버전부터 XMLHttpRequest 객체를 기본적으로 지원하게 되며, W3C 표준으로도 제정되게 됩니다.

 

따라서 현재 대부분의 웹 브라우저는 모두 비슷한 구현 방식으로 XMLHttpRequest 객체를 사용하고 있습니다.

XMLHttpRequest 객체의 생성
현재 대부분의 주요 웹 브라우저는 XMLHttpRequest 객체를 내장하고 있습니다.

 

이러한 XMLHttpRequest 객체를 생성하는 방법은 브라우저의 종류에 따라 다음과 같이 나눠집니다.

 

1. XMLHttpRequest 객체를 이용한 방법

2. ActiveXObject 객체를 이용한 방법


# 서버에 요청(request)하기
Ajax에서는 XMLHttpRequest 객체를 사용하여 서버와 데이터를 교환합니다.

따라서 서버에 요청을 보내기 위해서는 우선 XMLHttpRequest 인스턴스를 생성해야 합니다.

XMLHttpRequest 인스턴스의 open() 메소드와 send() 메소드를 사용하여 요청을 보낼 수 있습니다.

open() 메소드
open() 메소드는 서버로 보낼 Ajax 요청의 형식을 설정합니다.

문법
open(전달방식, URL주소, 동기여부);

 

전달 방식은 요청을 전달할 방식으로 GET 방식과 POST 방식 중 하나를 선택할 수 있습니다.

URL 주소는 요청을 처리할 서버의 파일 주소를 전달합니다.

동기 여부는 요청을 동기식으로 전달할지 비동기식으로 전달할지를 전달합니다.

send() 메소드
send() 메소드는 작성된 Ajax 요청을 서버로 전달합니다.

이 메소드는 전달 방식에 따라 인수를 가질 수도 안 가질 수도 있습니다.

문법
send();       // GET 방식

send(문자열); // POST 방식

GET 방식과 POST 방식
GET 방식은 주소에 데이터(data)를 추가하여 전달하는 방식입니다.

GET 방식의 HTTP 요청은 브라우저에 의해 캐시되어(cached) 저장됩니다.

또한, GET 방식은 보통 쿼리 문자열(query string)에 포함되어 전송되므로, 길이의 제한이 있습니다.

따라서 보안상 취약점이 존재하므로, 중요한 데이터는 POST 방식을 사용하여 요청하는 것이 좋습니다.

 

POST 방식은 데이터(data)를 별도로 첨부하여 전달하는 방식입니다.

POST 방식의 HTTP 요청은 브라우저에 의해 캐시되지 않으므로, 브라우저 히스토리에도 남지 않습니다.

또한, POST 방식의 HTTP 요청에 의한 데이터는 쿼리 문자열과는 별도로 전송됩니다.

따라서 데이터의 길이에 대한 제한도 없으며, GET 방식보다 보안성이 높습니다.

 

Ajax에서는 주로 GET 방식보다는 POST 방식을 사용하여 요청을 전송합니다.
GET 방식으로 요청하기
Ajax에서는 서버에 GET 방식의 요청을 보내기 위해서 다음과 같이 작성합니다.

 

이때 서버로 전송하고자 하는 데이터는 URI에 포함되어 전송됩니다.
 
 
# 서버로부터의 응답(response) 확인
Ajax에서 서버로부터의 응답을 확인하기 위해 사용하는 XMLHttpRequest 객체의 프로퍼티는 다음과 같습니다.

 

 - readyState 프로퍼티

 - status 프로퍼티

 - onreadystatechange 프로퍼티

readyState 프로퍼티
readyState 프로퍼티는 XMLHttpRequest 객체의 현재 상태를 나타냅니다.

 

이 프로퍼티의 값은 객체의 현재 상태에 따라 다음과 같은 주기로 변화합니다.

 

 1. UNSENT (숫자 0) : XMLHttpRequest 객체가 생성됨.

 2. OPENED (숫자 1) : open() 메소드가 성공적으로 실행됨.

 3. HEADERS_RECEIVED (숫자 2) : 모든 요청에 대한 응답이 도착함.

 4. LOADING (숫자 3) : 요청한 데이터를 처리 중임.

 5. DONE (숫자 4) : 요청한 데이터의 처리가 완료되어 응답할 준비가 완료됨.

status 프로퍼티
status 프로퍼티는 서버의 문서 상태를 나타냅니다.

 

 - 200 : 서버에 문서가 존재함.

 - 404 : 서버에 문서가 존재하지 않음.

onreadystatechange 프로퍼티
onreadystatechange 프로퍼티는 XMLHttpRequest 객체의 readyState 프로퍼티 값이 변할 때마다 자동으로 호출되는 함수를 설정합니다.

 

이 함수는 서버에서 응답이 도착할 때까지 readyState 프로퍼티 값의 변화에 따라 총 5번 호출됩니다.
