<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-05
  Time: 오전 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입 페이지</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <h1>회원가입</h1>
    <form action="/save" method="post">
        이메일 <input class="form-control" type="text" name="memberEmail"> <br>
        비밀번호 <input type="password" name="memberPassword"><br>
        이름 <input type="text" name="memberName"> <br>
        생년월일 <input type="date" name="memberBirth"> <br>
        전화번호 <input type="text" name="memberMobile"> <br>
        <input type="submit" value="회원가입">
    </form>
</body>
</html>
