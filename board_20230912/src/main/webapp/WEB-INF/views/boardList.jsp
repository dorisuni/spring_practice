
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
<!-- 게시물 목록을 반복하면서 표시 -->
<c:forEach items="${boardList}" var="board">
    <div class="row mt-2">
        <div class="col-md-1">${board.id}</div>
        <div class="col-md-3">
            <a href="/board/detail?id=${board.id}" >${board.boardTitle}</a>
        </div>
        <div class="col-md-2">${board.boardWriter}</div>
        <div class="col-md-2">${board.boardHits}</div>
        <div class="col-md-4">${board.createdAt}</div>
    </div>
</c:forEach>




