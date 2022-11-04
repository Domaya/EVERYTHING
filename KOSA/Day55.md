<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Document</title>
    <script>

        //http://openapi.seoul.go.kr:8088/6b4957504f63326833325a414b7079/json/CardSubwayStatsNew/1/100/20221025

        let apilink = "http://openapi.seoul.go.kr:8088/6b4957504f63326833325a414b7079/json/CardSubwayStatsNew/1/100/20221025";

        const metroapi = "http://openapi.seoul.go.kr:8088/6b4957504f63326833325a414b7079/json/CardSubwayStatsNew/1/";


        //검색하는 링크??를 불러오려면
        /*
        const data = {tags:$('#search').val(), tagmode:"any", format:"json"}

        console.log(data);
        $.getJSON(apilink, data, function(data, textStatus, xhr){
            $.each(data.items, function(index, obj){
                console.log(obj);
                //$('<p>').attr("text",obj.media.m).appendTo("#dt");
                //img태그를 생성하고 src 속성에 이미지 경로 설정 div append
            })
        })
        */
       let mydate;
       let mynum;
       let linearr = [];
       let resultrow;
       $(function(){
            $('#mybtn').click(function(){
                mydate = $('#mydate').val();
                //mynum = $('#num').val();
                mynum = 1000;

                let param = metroapi + mynum + "/" + mydate;

                $('tbody').empty();
                $('h3').empty();
                $('h3').append(mydate + " 승하차 인원 정보");
                //String으로 그냥 요청링크 뒤에 갖다붙여서 만든 코드
                $.getJSON(param, function(data, textStatus, xhr){
                    //console.log(data);
                    //console.log(data['CardSubwayStatsNew'].row); //이렇게 해야 JSON에서 내가 원하는 결과배열에 접근가능
                    
                    //data에 JSON데이터
                    //resultrow = data['CardSubwayStatsNew'].row;
                    resultrow = data.CardSubwayStatsNew.row;

                    //지하철 노선 정보만 배열에 담아온다
                    
                    //let subwayinfo = data.CardSubwayStatsNew.row;
                    for(let index in resultrow){
                        let line = resultrow[index].LINE_NUM;
                        if(!linearr.includes(line)){
                            linearr.push(line);
                        }
                    }
                    //select태그에 옵션 추가
                    /*자바스크립트
                    linearr.forEach((value, index)=>{
                        let optiontag = document.createElement("option");
                        optiontag.innerHTML = value;
                        document.getElementById("sel").appendChild(optiontag);
                    })
                    */
                    //제이쿼리로 셀렉트 태그에 옵션 추가
                    linearr.forEach((value, index) => {
                        let optiontag = "<option>" + value + "</option>"
                        $("#sel").append(optiontag)
                    })

                    let linenum;
                    let station;
                    let ride;
                    let alight;

                    $.each(resultrow, function( key, value ){ 
                        // console.log("호선 : " + value.LINE_NUM);
                        // console.log("역명 : " + value.SUB_STA_NM);
                        // console.log("승차인원 : " + value.RIDE_PASGR_NUM);
                        // console.log("하차인원 : " + value.ALIGHT_PASGR_NUM);
                        // console.log("---------------------------------------")

                        linenum = value.LINE_NUM;
                        station = value.SUB_STA_NM;
                        ride = value.RIDE_PASGR_NUM;
                        alight = value.ALIGHT_PASGR_NUM;
                        $("tbody").append("<tr><td>" + linenum + "</td><td>" + station + "</td><td>" + ride + "</td><td>" + alight + "</td></tr>")

                    })

                    //셀렉트 태그 onchange
                    $('#sel').on("change",function(){
                        $("tbody").empty();
                        $.each(resultrow, function(key, value){
                            if(value.LINE_NUM == $('#sel').val()){
                                linenum = value.LINE_NUM;
                                station = value.SUB_STA_NM;
                                ride = value.RIDE_PASGR_NUM;
                                alight = value.ALIGHT_PASGR_NUM;
                                
                                $("tbody").append("<tr><td>" + linenum + "</td><td>" + station + "</td><td>" + ride + "</td><td>" + alight + "</td></tr>")

                            }
                        })
                    })


                });
             }
            )

          

        })
       

    </script>
</head>
<body>
    <div class="container mt-3">
        날짜 입력(형식: 20221103) <input type="text" id="mydate">
        <!-- 원하는 데이터 수 <input type="text" id="num"> -->
        <button class="btn btn-primary btn-sm" id="mybtn">검색</button>
        <hr>
        <div id="dt"></div>
        <h3></h3>
        <select class="form-control mb-3" style="width:250px;" id="sel" name="sel">
            <option>전체 호선</option>
        </select>
        <table class="table table-hover">
            <thead style="background-color: #d6deed;">
                <tr>
                    <th>호선</th>
                    <th>역명</th>
                    <th>승차인원</th>
                    <th>하차인원</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
