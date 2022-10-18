# 자바스크립트 객체
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript">
        /* 
        ​자바 설계도(클래스) => 재사용성
        class Product{
            private String carname="pony";
            public Product(){}
            public Product(String carname){
            this.carname= carname;
        }
            public void print(){
            System.out.println(this.carname);
            }
        }

        메모리 load ... (new)
        Product p = new Product();
        Product p2 = new Product("pony2");
        p.print();
        p2.print();
        /////////////////////////////////////////////////////
        javaScript >> 객체지향언어(OOP)
        클래스 정의 3가지 방법
        1. 프로토타입 방식 :  일반적인 클래스 제작 방법
        인스턴스마다 공통된 메서드를 공유해서 사용하는 장점 
                            Jquery 도 prototype 방식으로 설계

        function 클래스이름() {
            this.프로퍼티1 = 초기값;
            this.프로퍼티2 = 초기값;
            }
            클래스이름.prototype.메서드1 = function() {
        }

        클래스이름.prototype.메서드2 = function() {
        }
        var 인스턴스 = new 클래스이름(); 
        var carObj = new Car();
        var carObj2 = new Car();
        var carObj3 = new Car();

        2. 함수 방식 : 간단한 클래스 제작 시 사용 
        인스턴스마다 메서드가 독립적으로 만들어지는 단점
        ** 클래스 :  function Car(){ this.name = , this.age=}
        ** 함수 :   function car(){}
        function 클래스이름() {
            this.프로퍼티1 = 초기값;
            this.프로퍼티2 = 초기값;
            this.메서드1 = function() {
            }
            this.메서드2 = function() {
            }
        }
        var 인스턴스 = new 클래스이름(); 
        var carObj = new Car();
        var carObj2 = new Car();
        var carObj3 = new Car();

        ***********************************************************************************************
        3. 리터럴 방식 : 자바스크립트 객체 "표기법" (이기종간의 데이터 호환) > JSON (Javascript Object Notation)
        클래스 만드는 용도는 아니며 주로 여러개의 매개변수를 그룹으로 묶어 함수의 매개변수로 보낼때
            정의와 함께 인스턴스가 만들어지는 장점이 있음 단 인스턴스는 오직 하나
            (초보자에게도 중요 ^^)
            {"a":"데이터"}

        4. ECMA6 버전부터 : class 키워드 제공
        class Person {
            constructor(name) {
                this._name = name;
            }
            sayHi() {
                console.log(`Hi! ${this._name}`);
            }
        }

        [ javascript 객체 생성 ]
        1.오브젝트 리터럴 방식 (객체를 만드는 방법): 클래스 생성과 동시에 객체가 만들어 져요
        1.1 리터럴 방식 >> 제일 간단한 방법 > var obj = {}; //var objarr = [] 배열 
        1.2 JSON 표기 : {} >> JSON: JavaScript Object Notation

        ex) var myObj = { "name":"John", "age":31, "city":"New York" };

        TIP) JSON >> XML (텍스트 기반의 형식화된 문서 제공)
        XML :이기종간의 데이터 호환 (한 때는 서점 : xml webservice)

        다른 이야기 >> JSON
        객체지향언어 장점 : 설계도 (재사용성)
        *오브젝트 리터럴 방식 : 재사용을 지원하는 않는다 
        *설계도를 생성과 동시에 객체 생성(장점 : 편하고 , 빠르다 )
        *설계도를 미리 만들어 놓고 재사용하는 방식은 아니다
        *설계도당 하나의 객체만 생성 사용 (only object)

        var product = {};  //Product p = new Product();
        var product2 = {제품명:'사과',년도:'2018',원산지:'대구'};
        var 인스턴스 ={
            프로퍼티:초기값,
            프로퍼티:초기값,
            .....
            메서드:function(){}, //데이터로서 사용하는게 많기 때문에 함수는 잘 안 만든다
            메서드:function(){}....
        }

        리터럴 방식 > 선언과 동시에 인스턴스 자동 생성
        var 인스턴스 = {}
        특징 : 생성자 존재하지 않는다.
        프로퍼티와 메서드만 정의 가능
        단점 : 객체 하나 생성(재사용성 없다) 
        접근방법 : 인스턴스이름.자원 >> product2.제품명 

        */
    
        let product = {제품명:'사과', 년도:'2000', 원산지:'대구'};
        console.log(product);
        console.log(product.제품명);
        console.log(product.원산지);
        console.log(product.toString());

        //객체() >> 리터럴 >> JSON
        let Person = {
           name:"홍길동",
           addr:"서울시 강남구 역삼동",
           eat:function(food){
              document.write(this.name + " / " + this.addr + " / " + food + "냠냠")
           }
        };
        document.write("<hr>");
        Person.eat("사과");//eat함수 호출

        //1.속성 제거 기능
        delete(product.년도);
        console.log(product);

        for(let key in product){ //변수명 key
            console.log("key : " + key);
            console.log(product[key]);
        }

        for(let key in Person){
            console.log("key : " + key + "=" + Person[key]);
        }

        //JSON (자바스크립트로 객체를 표기하는 방법)
        //XML or JSON 데이터를 가공해서 전달
        //OPEN API(외부 API) >> (공공데이터 : xml, json : 서울시 공공데이터, 대법원 판례, 날씨 정보 ...)
        //KEY POINT : 제공 받은 XML 또는 JSON 데이터를 객체를 원하는 형태로 가공작업 필수 (화면 출력)
        //2차 프로젝트 강제사항 : 최소 2개 이상의 외부 API 가공 > 차트 화

        let Member = {};
        Member.name = "hong"; //{name:"hong"}
        console.log(Member);
        console.log(Member.name);

        Member.age = 100;
        Member.print = function(){
            document.write("<br>" + this.name + " / " + this.age + "<br>");
        }
        Member.print();

        //JSON 객체를 수 많은 데이터 표현
        //POINT : 객체가 객체를 가질 수 있다, 객체가 배열을 가질 수 있다
        //JAVA : class Member{Car car; List<Person> li};
        let Grade = {
            "list" : {
                "hong": 10,
                "kim" : 20,
                "park" : 30
            },
            "show":function(){
                for(let key in this.list){//객체 key(속성값)
                    document.write(key + ":" + this.list[key] + "<br>");
                }
            }
        }
        Grade.show();

        document.write("<hr>");

        let listobj = Grade.list;
        document.write(listobj.kim);
        document.write("<br>");
        for(let key in listobj){
            document.write(key + " : " + listobj[key]);
        }

        </script>
    </head>
    <body>
        
    </body>
 </html>
  ```
  
  ```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javaScript">
        //1.배열 >> [] >> let arr = []; >> STACK구조 >> push(), pop()
        //2.JSON >> {} >> let obj = {}; >> obj.속성명, obj.함수명

        //우리가 원하는 데이터는 단순하지 않아요
        //날씨, 영화정보, 지하철 정보 데이터, 원하는 정보를 추출(OPEN API) >> xml, json
        //이런 데이터는 객체와 객체, 객체 안에 배열, 배열 안에 객체가 존재 ... 원하는 값만 추출

        let students = [];
        students.push({이름:"홍길동",국어:80,영어:60}); //배열의 0번째 방에 객체 (JSON)
        students.push({이름:"아무개",국어:100,영어:50});
        students.push({이름:"이순신",국어:10,영어:100});

        //[{}, {}, {}]
        //기존에 만들어진 객체에 함수 추가
        for(let index in students){
            //students[index] >> {이름:"홍길동", 국어:80, 영어:60}
            students[index].getSum = function(){return this.국어 + this.영어};
            students[index].getAvg = function(){return this.getSum()/2};
        }
        //{이름 : "홍길동", 국어:80, 영어:60, getSum:function..., getAvg:function ...}
        console.log(students);
        
        for(let index in students){
            console.log(students[index].이름);
            console.log(students[index].getSum());
            console.log(students[index].getAvg());
        }

    </script>
</head>
<body>
    
</body>
</html>
```
```
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		let MyObj = {name:"john",age:30,city:"seoul"};
		
		console.log(MyObj);
		
		//[객체 데이터]를 [문자열 데이터]로
		//login.jsp?name=john&age=30&city=seoul
		let stringobj = JSON.stringify(MyObj); //POINT
		console.log(stringobj);  //'{"name":"john","age":30,"city":"seoul"}'
		console.log(typeof(stringobj)); //string
		
		//[문자열 데이터]를 [객체 데이터] (단 구조가 객체인 경우 : 조건 "속성값은  "" 표기 ")
		let stringstr = '{"name":"john","age":30,"city":"seoul"}';
		console.log(stringstr);
		console.log(typeof(stringstr));
		
		let Myjson = JSON.parse(stringstr);
		console.log(Myjson);
		
		//POINT
		console.log(Myjson.name);//접근    : 객체.속성명 ^^ 암기
		console.log(Myjson["name"]);//접근 : 객체["속성명"] ^^ 암기
		
		/*
		index.htm , index.html
		css > common.css
		javascript >  common.js
		json > common.json >> 형식(웹 타입)MIME >> application/json
		xml  > common.xml
	
		*/
		let MyCars;
		MyCars = {"name":"john" , "age":30 , "cars":[
			                                          {"name":"Ford","model":["Fiesta","Focus","Mustang"]},
			                                          {"name":"BMW" ,"model":["420","x4","x5"]},
			                                          {"name":"Fiat","model":["500","panda"]}
		                                             ]
		};
		//신입개발자 업무
		//JSON 데이터 원하는 값을 추출 화면 이쁘게 출력
        
		console.log(MyCars);

        for(let index in MyCars.cars){
            
            document.write("차량이름:" + MyCars.cars[index].name + "<br>");
            console.log(MyCars.cars[index].model);
            for(let i in MyCars.cars[index].model){
                document.write("차량모델: " + MyCars.cars[index].model[i] + "<br>");
            }
        }

	</script>
</head>
<body>

</body>
</html>
```
