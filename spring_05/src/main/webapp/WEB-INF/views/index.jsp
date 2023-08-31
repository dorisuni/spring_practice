<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>안녕하세요~ 반갑습니다!</h1>
    <a href="/demo1">demo1 이동하기</a>
    <!-- query string (주소값에 파라미터 전달하기)-->
    <!-- form 태그로 파라미터 보내기 메소드를 생략하면 기본적으로 get-->
    <form action="/demo2" method="post">
        param1:<input type="text" name="param1"> <br>
        param2:<input type="text" name="param2"> <br>
        <input type="submit" value="전송">
    </form>

    <form action="/demo3" method="post">
        param1:<input type="text" name="param1"> <br>
        param2:<input type="text" name="param2"> <br>
        <input type="submit" value="전송">
    </form>
</body>
</html>
