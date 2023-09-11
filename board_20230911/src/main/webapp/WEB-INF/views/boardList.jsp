
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
            <a href="board/detail?id=${board.id}" >${board.boardTitle}</a>
        </div>
        <div class="col-md-2">${board.boardWriter}</div>
        <div class="col-md-2">${board.boardHits}</div>
        <div class="col-md-4">${board.createdAt}</div>
    </div>
</c:forEach>
<!-- Pagination -->
<div class="col">
<div class="row justify-content-start m-3">
    <a href="/board/save" id="save" class="btn btn-success btn-lg">글 작성하기</a>
</div>
<div class="row mt-4">
    <div class="col-md-12">
        <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="#">이전</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">다음</a></li>
        </ul>
    </div>
</div>
</div>

<script>
    const saveButton = document.getElementById("save");
    saveButton.addEventListener("click", function() {
        location.href = "/save";
    });
</script>