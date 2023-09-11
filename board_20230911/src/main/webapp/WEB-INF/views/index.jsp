<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글작성 게시판</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <h4>게시판</h4>
            </div>
        </div>
        <!-- 검색창과 버튼 -->
        <div class="row mt-4 justify-content-end">
            <div class="col-md-4">
                <select class="form-select">
                    <option value="writer">작성자</option>
                    <option value="title">글제목</option>
                    <option value="contents">글내용</option>
                    <!-- 다른 검색 옵션들을 필요에 따라 추가 -->
                </select>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control" placeholder="검색어 입력">
            </div>
            <div class="col-md-4">
                <button class="btn btn-primary">검색</button>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-1">글번호</div>
            <div class="col-md-3">글제목</div>
            <div class="col-md-2">작성자</div>
            <div class="col-md-2">조회수</div>
            <div class="col-md-4">작성일</div>
        </div>
        <%@include file="boardList.jsp"%>



    </div>

</body>
</html>
