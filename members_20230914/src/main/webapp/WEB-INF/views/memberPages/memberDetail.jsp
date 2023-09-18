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
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>

<div class="container mt-5">
    <h2>멤버 디테일 페이지</h2>
    <div class="row">
        <div class="col-md-6">
            <table class="table">
                <tbody>
                <tr>
                    <th>멤버번호</th>
                    <td th:text="${member.id}">${member.id}</td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td th:text="${member.memberEmail}">${member.memberEmail}</td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td type="password" th:text="${member.memberPassword}">${member.memberPassword}</td>
                </tr>
                <tr>
                    <th>회원이름</th>
                    <td>${member.memberName}</td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>${member.memberBirth}</td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td th:text="${member.memberMobile}">${member.memberMobile}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <a class="btn btn-primary" href="/member/update?id=${member.id}">정보수정</a>
    <a class="btn btn-secondary" href="/member/logout">로그아웃</a>
</div>


</body>
<%@include file="../component/footer.jsp"%>
</html>
