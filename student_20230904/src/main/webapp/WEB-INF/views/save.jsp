<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>학생등록을 위한 페이지</h2>
    <form action="/save1" method="post">
        학번 <input type="text" name="studentNumber"> <br>
        이름 <input type="text" name="studentName"> <br>
        학과 <input type="text" name="studentMajor"> <br>
        전화번호 <input type="text" name="studentMobile"> <br>
        <input type="submit" value="전송">
    </form>
</body>
</html>
