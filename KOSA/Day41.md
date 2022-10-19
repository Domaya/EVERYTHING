```html
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2 id="title"class="display-4"></h2>
    <table id="mylist" class="table table-hover">
        <thead>
            <th>순위</th>
            <th>제목</th>
            <th>개봉일</th>
            <th>누적관객수</th>
        </thead>
        <tbody id="tbody">
            <tr id="no0"></tr>
            <tr id="no1"></tr>
            <tr id="no2"></tr>
            <tr id="no3"></tr>
            <tr id="no4"></tr>
            <tr id="no5"></tr>
            <tr id="no6"></tr>
            <tr id="no7"></tr>
            <tr id="no8"></tr>
            <tr id="no9"></tr>
            

        </tbody>
    </table>
</body>
    <script type="text/javascript">
    
    let data ={
            "boxOfficeResult":{
                "boxofficeType":"일별 박스오피스",
                "showRange":"20221018~20221018",
                "dailyBoxOfficeList":[
                                        {
                                        "rnum":"1",
                                        "rank":"1",
                                        "rankInten":"0",
                                        "rankOldAndNew":"OLD",
                                        "movieCd":"20198317",
                                        "movieNm":"인생은 아름다워",
                                        "openDt":"2022-09-28",
                                        "salesAmt":"160367745",
                                        "salesShare":"18.5",
                                        "salesInten":"751919",
                                        "salesChange":"0.5",
                                        "salesAcc":"8164396200",
                                        "audiCnt":"17841",
                                        "audiInten":"244",
                                        "audiChange":"1.4",
                                        "audiAcc":"864462",
                                        "scrnCnt":"858",
                                        "showCnt":"2644"
                                        },
                                        {
                                        "rnum":"2",
                                        "rank":"2",
                                        "rankInten":"0",
                                        "rankOldAndNew":"OLD",
                                        "movieCd":"20215601",
                                        "movieNm":"공조2: 인터내셔날",
                                        "openDt":"2022-09-07",
                                        "salesAmt":"123727485",
                                        "salesShare":"14.2",
                                        "salesInten":"3184410",
                                        "salesChange":"2.6",
                                        "salesAcc":"69491864870",
                                        "audiCnt":"14854",
                                        "audiInten":"388",
                                        "audiChange":"2.7",
                                        "audiAcc":"6802312",
                                        "scrnCnt":"802",
                                        "showCnt":"2293"
                                        },
                                        {
                                        "rnum":"3",
                                        "rank":"3",
                                        "rankInten":"0",
                                        "rankOldAndNew":"OLD",
                                        "movieCd":"20226798",
                                        "movieNm":"에브리씽 에브리웨어 올 앳 원스",
                                        "openDt":"2022-10-12",
                                        "salesAmt":"89637893",
                                        "salesShare":"10.3",
                                        "salesInten":"6405650",
                                        "salesChange":"7.7",
                                        "salesAcc":"709020409",
                                        "audiCnt":"8729",
                                        "audiInten":"518",
                                        "audiChange":"6.3",
                                        "audiAcc":"66821",
                                        "scrnCnt":"581",
                                        "showCnt":"1348"
                                        },
                                        {
                                        "rnum":"4",
                                        "rank":"4",
                                        "rankInten":"0",
                                        "rankOldAndNew":"OLD",
                                        "movieCd":"20219628",
                                        "movieNm":"정직한 후보2",
                                        "openDt":"2022-09-28",
                                        "salesAmt":"67567053",
                                        "salesShare":"7.8",
                                        "salesInten":"3304561",
                                        "salesChange":"5.1",
                                        "salesAcc":"8049335167",
                                        "audiCnt":"8177",
                                        "audiInten":"478",
                                        "audiChange":"6.2",
                                        "audiAcc":"851296",
                                        "scrnCnt":"614",
                                        "showCnt":"1423"
                                        },
                                        {
                                        "rnum":"5",
                                        "rank":"5",
                                        "rankInten":"0",
                                        "rankOldAndNew":"OLD",
                                        "movieCd":"20227304",
                                        "movieNm":"오펀: 천사의 탄생",
                                        "openDt":"2022-10-12",
                                        "salesAmt":"75940972",
                                        "salesShare":"8.7",
                                        "salesInten":"-134001",
                                        "salesChange":"-0.2",
                                        "salesAcc":"1182967868",
                                        "audiCnt":"7543",
                                        "audiInten":"104",
                                        "audiChange":"1.4",
                                        "audiAcc":"115028",
                                        "scrnCnt":"630",
                                        "showCnt":"1450"
                                        },
                                        {
                                        "rnum":"6",
                                        "rank":"6",
                                        "rankInten":"0",
                                        "rankOldAndNew":"OLD",
                                        "movieCd":"20226777",
                                        "movieNm":"극장판 짱구는 못말려: 수수께끼! 꽃피는 천하떡잎학교",
                                        "openDt":"2022-09-28",
                                        "salesAmt":"56502873",
                                        "salesShare":"6.5",
                                        "salesInten":"-1262310",
                                        "salesChange":"-2.2",
                                        "salesAcc":"5674455020",
                                        "audiCnt":"5762",
                                        "audiInten":"-43",
                                        "audiChange":"-0.7",
                                        "audiAcc":"566575",
                                        "scrnCnt":"459",
                                        "showCnt":"785"
                                        },
                                        {
                                        "rnum":"7",
                                        "rank":"7",
                                        "rankInten":"0",
                                        "rankOldAndNew":"OLD",
                                        "movieCd":"20208101",
                                        "movieNm":"대무가",
                                        "openDt":"2022-10-12",
                                        "salesAmt":"41726497",
                                        "salesShare":"4.8",
                                        "salesInten":"2527884",
                                        "salesChange":"6.4",
                                        "salesAcc":"490504164",
                                        "audiCnt":"4804",
                                        "audiInten":"22",
                                        "audiChange":"0.5",
                                        "audiAcc":"53214",
                                        "scrnCnt":"499",
                                        "showCnt":"978"
                                        },
                                        {
                                        "rnum":"8",
                                        "rank":"8",
                                        "rankInten":"1",
                                        "rankOldAndNew":"OLD",
                                        "movieCd":"20227338",
                                        "movieNm":"티켓 투 파라다이스",
                                        "openDt":"2022-10-12",
                                        "salesAmt":"34876673",
                                        "salesShare":"4.0",
                                        "salesInten":"4836740",
                                        "salesChange":"16.1",
                                        "salesAcc":"471311764",
                                        "audiCnt":"3840",
                                        "audiInten":"703",
                                        "audiChange":"22.4",
                                        "audiAcc":"49342",
                                        "scrnCnt":"486",
                                        "showCnt":"957"
                                        },
                                        {
                                        "rnum":"9",
                                        "rank":"9",
                                        "rankInten":"1",
                                        "rankOldAndNew":"OLD",
                                        "movieCd":"20225729",
                                        "movieNm":"스마일",
                                        "openDt":"2022-10-06",
                                        "salesAmt":"22232487",
                                        "salesShare":"2.6",
                                        "salesInten":"3849887",
                                        "salesChange":"20.9",
                                        "salesAcc":"940294602",
                                        "audiCnt":"2674",
                                        "audiInten":"946",
                                        "audiChange":"54.7",
                                        "audiAcc":"87419",
                                        "scrnCnt":"145",
                                        "showCnt":"212"
                                        },
                                        {
                                        "rnum":"10",
                                        "rank":"10",
                                        "rankInten":"-2",
                                        "rankOldAndNew":"OLD",
                                        "movieCd":"20198461",
                                        "movieNm":"리멤버",
                                        "openDt":"2022-10-26",
                                        "salesAmt":"22572000",
                                        "salesShare":"2.6",
                                        "salesInten":"-12015000",
                                        "salesChange":"-34.7",
                                        "salesAcc":"148905000",
                                        "audiCnt":"2508",
                                        "audiInten":"-1139",
                                        "audiChange":"-31.2",
                                        "audiAcc":"15629",
                                        "scrnCnt":"11",
                                        "showCnt":"11"
                                        }
            ]
        }
    }

    window.onload = function() {
            // console.log(data.boxOfficeResult.dailyBoxOfficeList);
            let boxoffice = data.boxOfficeResult.dailyBoxOfficeList;
            let title = data.boxOfficeResult.showRange + data.boxOfficeResult.boxofficeType;
            document.getElementById("title").innerHTML = title;
            // table = document.getElementById("mylist");
            table = document.getElementById("tbody");
            for(let index in boxoffice){
            // for(let index = 0; index<4; index++){
                // console.log(boxoffice[index]);
                // document.getElementById("mylist").innerHTML(boxoffice[index] + "<br>"); innerHTML은 함수가 아니니까 당연히 오류-_-
                let rank = boxoffice[index].rank;
                let moviename = boxoffice[index].movieNm;
                let openDt = boxoffice[index].openDt;
                // let movieCd = boxoffice[index].movieCd
                let audiCnt = boxoffice[index].audiAcc;

                let currentrow = document.getElementById("no" + index);
                
                let td1 = document.createElement("td");
                td1.innerHTML = rank;
                let td2 = document.createElement("td");
                td2.innerHTML = moviename;
                let td3 = document.createElement("td");
                td3.innerHTML = openDt;
                let td4 = document.createElement("td");
                td4.innerHTML = audiCnt;

                
                currentrow.appendChild(td1);
                currentrow.appendChild(td2);
                currentrow.appendChild(td3);
                currentrow.appendChild(td4);
                console.log(table); 
        }
        
    }

    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>
  ```
  ![image](https://user-images.githubusercontent.com/51879052/196581274-06468a23-f19a-4353-93ee-4537088aa1c4.png)
