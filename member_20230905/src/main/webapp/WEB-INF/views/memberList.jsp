<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-05
  Time: 오전 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>멤버리스트 페이지</title>
</head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>
    <h1>멤버리스트 페이지</h1>
    <h4>인덱스 이메일 비밀번호 이름 생년월일 전화번호</h4>
    <c:forEach items="${memberList}" var="member">
        <td>
            <a href="/member?id=${member.id}">${member.id}</a>
        </td>
            ${member.memberEmail}
            ${member.memberPassword}
            ${member.memberName}
            ${member.memberBirth}
            ${member.memberMobile}
        <td>
            <a href="/update?id=${member.id}">수정</a>
        </td>
        <td>
            <a href="/delete?id=${member.id}">삭제</a>
        </td>
        <br>
    </c:forEach>

<%@include file="component/footer.jsp"%>

</body>
</html>
