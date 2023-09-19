<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>


    </style>
</head>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <h4>게시판 디테일 페이지</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <table class="table">
                <tbody>
                <tr>
                    <th>id</th>
                    <td>${board.id}</td>
                <tr>
                    <th>writer</th>
                    <td>${board.boardWriter}</td>
                </tr>
                <tr>
                    <th>date</th>
                    <td>${board.createdAt}</td>
                </tr>
                <tr>
                    <th>hits</th>
                    <td>${board.boardHits}</td>
                </tr>
                <tr>
                    <th>title</th>
                    <td>${board.boardTitle}</td>
                </tr>
                <tr>
                    <th>contents</th>
                    <td><textarea class="form-control" rows="5" th:text="${board.boardContents}" readonly>${board.boardContents}</textarea></td>
                </tr>
                <c:if test="${board.fileAttached == 1}">
                <tr>
                    <th>image</th>
                    <td>
                        <c:forEach items="${boardFileList}" var="boardFile">
                            <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                                 alt="" width="100" height="100">
                        </c:forEach>
                    </td>
                </tr>
                </c:if>
            </table>
            <button class="btn btn-secondary" onclick="board_list()">목록</button>
            <c:if test="${board.boardWriter == sessionScope.loginEmail}">
                <button class="btn btn-primary" onclick="board_update()">수정</button>
                <button class="btn btn-danger" onclick="board_delete()">삭제</button>
            </c:if>
            <c:if test="${sessionScope.loginEmail == 'admin'}">
                <button class="btn btn-danger" onclick="board_delete()">삭제</button>
            </c:if>

            <div id="pass-check" style="display: none;">
                <input type="text" id="board-pass" placeholder="비밀번호 입력하세요">
                <input type="button" onclick="pass_check()" value="확인">
            </div>
            <c:if test="${sessionScope.loginEmail != null}">
            <div id="comment-write-area">
                <input type="text" id="comment-writer" placeholder="작성자 입력" value="${sessionScope.loginEmail}" readonly>
                <input type="text" id="comment-contents" placeholder="내용 입력">
                <button class="btn btn-primary" onclick="comment_write()">댓글작성</button>
            </div>
            </c:if>
            <div id="comment-list-area">
                <c:choose>
                    <c:when test="${commentList == null}">
                        <h3>작성된 댓글이 없습니다.</h3>
                    </c:when>
                    <c:otherwise>
                        <table class="table" id="comment-list">
                            <tr>
                                <th>좋아요</th>
                                <th>작성자</th>
                                <th>내용</th>
                                <th>작성시간</th>
                            </tr>
                            <c:forEach items="${commentList}" var="comment" varStatus="loop">
                                <tr>
                                    <td id="${comment.id}">
                                        <button class="like-button" data-index="${comment.id}">Like</button>
                                        <span class="like-amount">${comment.likeAmount}</span>
                                    </td>
                                    <td>${comment.commentWriter}</td>
                                    <td>${comment.commentContents}</td>
                                    <td>${comment.createdAt}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    const memberId = ${sessionScope.loginId};
    const comment_write = () => {
        const commentWriter = document.getElementById("comment-writer").value;
        const commentContents = document.querySelector("#comment-contents").value;
        const boardId = '${board.id}';
        const result = document.getElementById("comment-list-area");
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                commentWriter: commentWriter,
                commentContents: commentContents,
                boardId: boardId
            },
            success: function (res) {
                console.log("리턴값: ", res);
                let output = "<table class='table' id=\"comment-list\">\n" +
                    "    <tr>\n" +
                    "        <th>좋아요</th>\n" +
                    "        <th>작성자</th>\n" +
                    "        <th>내용</th>\n" +
                    "        <th>작성시간</th>\n" +
                    "    </tr>\n";
                for (let i in res) {
                    output += "    <tr>\n";
                    output += "        <td id='" + res[i].id + "'>\n";
                    output += "            <button class='like-button' data-index='" + res[i].id + "'>Like</button>\n";
                    output += "            <span class='like-amount'>" + res[i].likeAmount + "</span>\n";
                    output += "        </td>\n";
                    output += "        <td>" + res[i].commentWriter + "</td>\n";
                    output += "        <td>" + res[i].commentContents + "</td>\n";
                    output += "        <td>" + res[i].createdAt + "</td>\n";
                    output += "    </tr>\n";
                }
                output += "</table>";
                result.innerHTML = output;
                document.getElementById("comment-writer").value = memberId;
                document.getElementById("comment-contents").value = "";
                attachClickEventToNewComment(res[i].commentId);
            },
            error: function () {
                console.log("댓글 작성 실패");
            }
        });
    }
    const board_list = () => {
        const page = '${page}';
        const q = '${q}';
        const type = '${type}';
        location.href = "/board/list?page=" + page + "&q=" + q + "&type=" + type;
    }
    const board_update = () => {
        const id = '${board.id}';
        location.href = "/board/update?id=" + id;
    }
    const board_delete = () => {
        const passArea = document.getElementById("pass-check");
        passArea.style.display = "block";
    }
    const pass_check = () => {
        const inputPass = document.getElementById("board-pass").value;
        const pass = '${board.boardPass}';
        const id = '${board.id}';
        if (inputPass == pass) {
            location.href = "/board/delete?id=" + id;
        } else {
            alert("비밀번호 불일치!");
        }
    }




</script>
<script>


    // // jQuery를 사용하여 버튼 클릭 이벤트 처리
    // $(document).ready(function () {
    //     $(".like-button").click(function () {
    //         // 클릭된 버튼의 data-index 속성을 가져옴
    //         let commentId = $(this).attr("data-index");
    //         console.log("여기가현재작동중")
    //         // 여기에서 Ajax 요청을 수행하고 인덱스를 사용하여 작업을 수행
    //         console.log("멤버아이디:"+memberId);
    //         console.log("코멘트아이디:"+commentId);
    //         $.ajax({
    //             type: "post",
    //             url: "/comment/like",
    //             data: {
    //                 commentId: commentId,
    //                 memberId: memberId
    //             },
    //             success: function (res) {
    //                 console.log(res)
    //                 console.log("현재 likeAmount값:"+res.likeAmount);
    //                 let likeAmount = $("#" + commentId + " .like-amount");
    //                 likeAmount.text(res.likeAmount);
    //             },
    //             error: function () {
    //                 console.log("좋아요 실패");
    //             }
    //         });
    //     });
    // });


</script>

<script>
    $(document).on("click", ".like-button", function () {
        // 클릭된 버튼의 data-index 속성을 가져옴
        let commentId = $(this).data("index");
        // 여기에서 Ajax 요청을 수행하고 인덱스를 사용하여 작업을 수행
        console.log("멤버아이디:" + memberId);
        console.log("코멘트아이디:" + commentId);
        $.ajax({
            type: "post",
            url: "/comment/like",
            data: {
                commentId: commentId,
                memberId: memberId
            },
            success: function (res) {
                console.log(res);
                // 서버 응답으로 업데이트된 likeAmount 값을 해당 HTML 요소에 반영
                let likeAmount = $("#" + commentId + " .like-amount");
                likeAmount.text(res.likeAmount);
                console.log("현재 likeAmount값:" + res.likeAmount);
            },
            error: function () {
                console.log("좋아요 실패");
            }
        });
    });

</script>



<%@include file="../component/footer.jsp" %>
</html>