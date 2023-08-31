<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>index.jsp</h2>
    <a href="/req1">req1</a>
    <a href="/req2?p1=안녕&p2=1234">req2</a>
    <!-- 아래 form에서 입력한 값을 DTO에 담아
             서비스 클래스의 req3()메서드에서 DTO값을 출력-->
    <form action="/req3" method="post">
        p1:<input type="text" name="p1"> <br>
        p2:<input type="text" name="p2"> <br>
        p3:<input type="text" name="p3"> <br>
        <input type="submit" value="전송">
    </form>

    <br>
    <a href="/req4">req4</a>
    <a href="/req5">req5</a>
    <br>
    <br>
    <form action="/req6" method="post">
            p1:<input type="text" name="p1"> <br>
            p2:<input type="text" name="p2"> <br>
            p3:<input type="number" name="p3"> <br>
            <input type="submit" value="전송">
    </form>
    <br>
</body>


</html>
