<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<body>

<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>
<div class="row">
    <div class="col">
        <div class="text-center">
            <h2>어서오세요 멤버관리!</h2>
            로그인이메일: ${sessionScope.loginEmail}<br>
            model에 담은 이메일: ${email} <br>
            <a href="/save">회원가입</a>
            <a href="/login">로그인</a>
            <a href="/members">목록출력</a>
        </div>
    </div>
</div>


<%@include file="component/footer.jsp"%>

</body>
</html>
