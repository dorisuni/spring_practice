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
                <!-- 글번호를 숨겨진 입력 필드로 추가 -->
                <input type="hidden" name="id" value="${board.id}">
                <!-- 글작성자를 숨겨진 입력 필드로 추가 -->
                <input type="hidden" name="boardWriter" value="${board.boardWriter}">
                <input type="hidden" name="createdAt" value="${board.createdAt}">
                <input type="hidden" name="boardHits" value="${board.boardHits}">

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
                                   name="boardTitle"></td>
                    </tr>
                    <tr>
                        <th>글내용</th>
                        <td><textarea class="form-control" rows="5" name="boardContents">${board.boardContents}</textarea></td>
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
                <button type="submit" class="btn btn-primary">수정</button>
                <a class="btn btn-danger" href="/board/delete/${board.id}">삭제</a>
            </form>
        </div>
    </div>
</div>


</body>
</html>
