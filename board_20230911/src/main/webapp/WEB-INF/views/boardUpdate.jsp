<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-11
  Time: 오전 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판 수정하기</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <h2>게시판 수정하는 페이지</h2>
    <div class="row">
        <div class="col-md-6">
            <form action="/board/update" method="post">
                <table class="table">
                    <tbody>
                    <tr>
                        <th>글번호</th>
                        <td th:text="${board.id}" readonly>${board.id}</td>
                    </tr>
                    <tr>
                        <th>글작성자</th>
                        <td th:text="${board.boardWriter}" readonly>${board.boardWriter}</td>
                    </tr>
                    <tr>
                        <th>글제목</th>
                        <td><input type="text" class="form-control" id="boardTitle" value="${board.boardTitle}"
                                   name="boardTitle" placeholder="${board.boardTitle}"></td>
                    </tr>
                    <tr>
                        <th>글내용</th>
                        <td><textarea class="form-control" rows="5" name="boardContents"
                                      th:text="${board.boardContents}"></textarea></td>
                    </tr>
                    <tr>
                        <th>작성시간</th>
                        <td th:text="${board.createdAt}">${board.createdAt}</td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td th:text="${board.boardHits}">${board.boardHits}</td>
                    </tr>
                    </tbody>
                </table>
                <a class="btn btn-primary" href="/board/update?id=${board.id}">수정</a>
                <a class="btn btn-danger" href="/delete?id=${board.id}">삭제</a>
            </form>
        </div>
    </div>
</div>


</body>
</html>
