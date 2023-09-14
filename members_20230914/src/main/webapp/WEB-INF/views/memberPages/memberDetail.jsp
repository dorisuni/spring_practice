<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-05
  Time: 오전 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>멤버 디테일 페이지</title>
</head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>



    <h2>멤버 디테일 페이지</h2>
        ${member.id}
        ${member.memberEmail}
        ${member.memberPassword}
        ${member.memberName}
        ${member.memberBirth}
        ${member.memberMobile}
    <a href="/update?id=${member.id}">정보수정</a>
    <a href="/logout">로그아웃</a>
<%@include file="component/footer.jsp"%>

</body>
</html>
