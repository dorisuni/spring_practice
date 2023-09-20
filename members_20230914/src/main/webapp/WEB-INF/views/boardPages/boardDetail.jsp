<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        .heart {
            filter: invert(78%) sepia(7%) saturate(6%) hue-rotate(324deg) brightness(105%) contrast(81%);

        }

        .heart:hover {
            cursor: pointer
        }

        .heart.active {
            filter: invert(68%) sepia(25%) saturate(2343%) hue-rotate(298deg) brightness(91%) contrast(87%);
        }
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
                                        <button class="like-button heart" data-index="${comment.id}">
                                            <svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none"
                                                                                                           height="24" viewBox="0 0 24 24" width="24">
                                            <path d="M0 0h24v24H0z" fill="none" />
                                            <path d="M16.5 3c-1.74 0-3.41.81-4.5 2.09C10.91 3.81 9.24 3 7.5 3 4.42 3 2 5.42 2 8.5c0 3.78 3.4 6.86 8.55 11.54L12 21.35l1.45-1.32C18.6 15.36 22 12.28 22 8.5 22 5.42 19.58 3 16.5 3zm-4.4 15.55l-.1.1-.1-.1C7.14 14.24 4 11.39 4 8.5 4 6.5 5.5 5 7.5 5c1.54 0 3.04.99 3.57 2.36h1.87C13.46 5.99 14.96 5 16.5 5c2 0 3.5 1.5 3.5 3.5 0 2.89-3.14 5.74-7.9 10.05z"/>
                                        </svg></button>
                                        <span class="like-amount">${comment.likeAmount}</span>
                                    </td>
                                    <td>${comment.commentWriter}</td>
                                    <td>${comment.commentContents}</td>
                                    <td>${comment.createdAt}</td>
                                </tr>
                                <script>
                                    // 서버에서 가져온 JSON 데이터를 JavaScript로 처리
                                    try {
                                        let likeMemberJson = ${comment.likeMemberJson};
                                        let sessionUserId = "${sessionScope.loginId}"; // 세션 아이디
                                        likeMemberJson.forEach(item=>{
                                            if(item===sessionUserId){
                                                // 세션 ID가 일치하는 경우 특정 태그(예시: div)에 클래스 추가하여 활성화
                                                const elementToActivate = document.querySelector('.like-button[data-index="${comment.id}"]');
                                                elementToActivate.classList.add('active');
                                            }
                                        })
                                    } catch (error) {
                                        console.error('JSON 파싱 오류:', error);
                                    }


                                </script>
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
                    output += "            <button class='like-button heart' data-index='" + res[i].id + "'>Like</button>\n";
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
    const boardId = ${board.id}
    $(document).on("click", ".like-button", function () {
        // 클릭된 버튼의 data-index 속성을 가져옴
        let commentId = $(this).data("index");
        // 여기에서 Ajax 요청을 수행하고 인덱스를 사용하여 작업을 수행
        console.log("멤버아이디:" + memberId);
        console.log("코멘트아이디:" + commentId);
        console.log("보드아이디:"+boardId);
        $.ajax({
            type: "post",
            url: "/comment/like",
            data: {
                commentId: commentId,
                memberId: memberId,
                boardId: boardId
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

<script>
    $(document).ready(function () {
        // .like-button 클래스를 가진 요소가 클릭되면 이벤트 핸들러 실행
        $(document).on("click", ".like-button", function () {
            // 클릭한 요소에 .active 클래스를 토글
            $(this).toggleClass("active");
        });
    });
</script>


<%@include file="../component/footer.jsp" %>
</html>
