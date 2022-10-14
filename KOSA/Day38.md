``` html
<!DOCTYPE html>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style type="text/css">

        .democlass{color:red;}
    </style>
</head>
<body>
    <div id="div">
        <h1 class="democlass">Hello World_1</h1>
        <h1 class="democlass">Hello World_2</h1>
        <h1 class="democlass">Hello World_3</h1>
    </div>
</body>
    <script type="text/javascript">
        //document.getElementsByTagName("h1")[0].removeAttribute("class");
        
        // let harr = document.getElementsByTagName("h1");
        // console.log(harr);
        // for(let i = 0; i < harr.length; i++){
        //     harr[i].removeAttribute("class");
        // }
        let arr = document.getElementsByTagName("h1");
        // for(let index in arr){
        //     console.log(arr[index]);
        //     document.getElementById("div").removeChild(arr[index]);
        //     //삭제순서 : 0->1->2
        //     //Hello World_2가 남아있음...왜?
        //     //1이 삭제되면 arr에 2,3이 남는데 index는 1이 되므로...3이 지워지고 for문 종료됨
        // }
        //원하는대로 전부 삭제하려면 아래처럼....
        // for(let index in arr){
        //     if(arr.length>0){
        //         document.getElementById("div").removeChild(arr[arr.length-1]);
        //     }
        // }
        //[자기 자신을 삭제하기]
        let len = arr.length;//3
        for(let i = 0; i < len; i ++){
            //remove() 자기자신 삭제
            arr[arr.length - 1].remove();
        }
    </script>
</html>
```

# 실패한 과제
```html
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <style>
        table,td,th{ border-collapse: collapse;}
		td,th{border: 1px solid black;}
		td{background-color: aqua;}
        </style>
	<script type="text/javascript">
        window.onload=function(){
            let createbtn = document.getElementById("b1");
            let delbtn = document.getElementById("b2");

            let tablenum = 0;
            createbtn.onclick = function(){
                //let table = document.createElement("table");
                let row = document.getElementById("txtrow").value;
                let col = document.getElementById("txtcolumn").value;
                console.log(row + " " + col)
                
                //tr: row
                //th: table header
                //td : table data cell
                // let tabletxtnode = document.createTextNode("table");
                let table = document.createElement("table");
                for(let i = 0; i<row;i++){
                    console.log("row index : " + i);
                    let trnode = document.createElement("tr");
                    let tr = table.appendChild(trnode);
                    for(let i = 0; i<col;i++){
                        console.log("col index: " + i);
                        let tdnode = document.createElement("td");
                        let txt = document.createTextNode("^_^")
                        tdnode.appendChild(txt);
                        tr.appendChild(tdnode);
                    }
                }
                table.setAttribute("id","tid" + tablenum);
                
                document.body.appendChild(table);
                console.log(table);
                console.log(document.getElementById("tid"+tablenum))
                tablenum++;
            }
            //테이블에 아이디를 줘서 지우고 싶은데 ㅠ ~~~~~
            //교수님께 피드백을 받아보니...이 함수가 만들어진 시점엔 element에 table요소가 생성이 되지 않기 때문에
            //id로는 가져올 수 없어서
            //name으로 가져와서 요소를 하나하나 지워야한다고 한다....슬프다.
            delbtn.onclick = function(){
                console.log("tablenum  : " + tablenum)
                console.log(document.getElementById("tid"+tablenum-1))
                if(tablenum>=0){
                    let table = document.getElementById("tid"+tablenum-1);
                    console.log(table);

                }else{
                    console.log("테이블없음")
                }
            }
        }
	</script>
</head>
<body>
    <div id="div">
		행의수 : <input type="text" id="txtrow" name="txtrow" value="2"><br>
		열의수 : <input type="text" id="txtcolumn" name="txtcolumn" value="2"><br>
		<input type="button" id="b1"  value="동적테이블 생성" >
		<input type="button" id="b2"  value="동적테이블 제거" >
	</div>
</body>
</html>
```
