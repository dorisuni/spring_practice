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


        <%@ include file="boardList.jsp" %>
        <div class="row justify-content-start m-3">
            <a href="/board/save" id="save" class="btn btn-success btn-lg">글 작성하기</a>
        </div>
        <%@ include file="boardPages/boardPaging.jsp" %>
    </div>

</body>
<script>
    const saveButton = document.getElementById("save");
    saveButton.addEventListener("click", function() {
        location.href = "/save";
    });
</script>
</html>
