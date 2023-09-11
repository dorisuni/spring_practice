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
    <title>게시글 작성하기!</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <h4>게시글 작성</h4>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-md-12">
            <form action="/board/save" method="POST">
                <div class="mb-3">
                    <label for="boardTitle" class="form-label">제목</label>
                    <input type="text" class="form-control" id="boardTitle" name="boardTitle" required>
                </div>
                <div class="mb-3">
                    <label for="boardWriter" class="form-label">작성자</label>
                    <input type="text" class="form-control" id="boardWriter" name="boardWriter" required>
                </div>
                <div class="mb-3">
                    <label for="boardPass" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="boardPass" name="boardPass" required>
                </div>
                <div class="mb-3">
                    <label for="boardContents" class="form-label">글 내용</label>
                    <textarea class="form-control" id="boardContents" name="boardContents" rows="6" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">작성하기</button>
            </form>
        </div>
    </div>
</div>

</body>

</html>
