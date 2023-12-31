
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-11
  Time: 오전 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <style>
        .btn-lg {
            width: 150px;
        }
    </style>
</head>
<table class="table table-striped">
    <thead>
    <tr class="table-primary">
        <th scope="col">글번호</th>
        <th scope="col">글제목</th>
        <th scope="col">작성자</th>
        <th scope="col">조회수</th>
        <th scope="col">작성일</th>
    </tr>
    </thead>
<!-- 게시물 목록을 반복하면서 표시 -->
<c:forEach items="${boardList}" var="board">
    <tr>
        <th scope="row">${board.id}</th>
        <th>
            <a href="/board/detail?id=${board.id}" >${board.boardTitle}</a>
        </th>
        <th>${board.boardWriter}</th>
        <th>${board.boardHits}</th>
        <th>${board.createdAt}</th>
    </tr>
</c:forEach>
</table>




