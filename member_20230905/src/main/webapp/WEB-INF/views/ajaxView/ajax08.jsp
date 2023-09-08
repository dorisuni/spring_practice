<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-07
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <div class="row">
        <div class="col">
            <button class="btn btn-primary"  onclick="ajax08()"></button>
        </div>
    </div>

</body>
<script>
    const ajax08 = () =>{
        $.ajax({
            type:"get",
            url: "/ajax08",
            //res는 서버에서 온 응답을 받는다 res의 형태로
            //따라서 컨트롤러에서 return받는건 값이 다르므로, 이동하기 위해서는 location을 써야함.
            success: function (res){

                for(let i in res){
                    console.log(res[i].memberEmail)
                    console.log(res[i].memberPassword)
                }
            },
            error: function (){
                console.log("실패");
            }
        });
    }
</script>
</html>
