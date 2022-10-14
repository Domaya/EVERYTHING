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
