<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-05
  Time: 오전 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>멤버 로그인 완료 페이지</title>
</head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>
<h2>멤버 로그인 완료 페이지</h2>
<%--    세션값꺼낼때는--%>
    로그인이메일: ${sessionScope.loginEmail}<br>
    ${member.id} <br>
    model에 담은 이메일: ${member.memberEmail} <br>

<%--    로그인 계쩡이 admin일 경우에만 회원목록 링크가 보임 jstl 써야함. 추가해야함.--%>
    <c:if test="${sessionScope.loginEmail == 'admin@gmail.com'}">
        <a href="/members">회원목록</a>
    </c:if>

    ${member.memberPassword} <br>
    ${member.memberName} <br>
    ${member.memberBirth} <br>
    ${member.memberMobile} <br>
<%@include file="component/footer.jsp"%>

</body>
</html>
