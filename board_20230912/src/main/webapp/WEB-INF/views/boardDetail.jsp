<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판 디테일</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>게시판 디테일 페이지</h2>
    <div class="row">
        <div class="col-md-6">
            <table class="table">
                <tbody>
                <tr>
                    <th>글번호</th>
                    <td th:text="${board.id}">${board.id}</td>
                </tr>
                <tr>
                    <th>글작성자</th>
                    <td th:text="${board.boardWriter}">${board.boardWriter}</td>
                </tr>
                <tr>
                    <th>글제목</th>
                    <td th:text="${board.boardTitle}">${board.boardTitle}</td>
                </tr>
                <tr>
                    <th>글내용</th>
                    <td><textarea class="form-control" rows="5" th:text="${board.boardContents}" readonly>${board.boardContents}</textarea></td>
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

            <div id="pass-check" style="display: none;">
                <input type="text" id="board-pass" placeholder="비밀번호 입력하세요">
                <input type="button" onclick="pass_check()" value="확인">
            </div>

            <button onclick="board_list()">목록</button>
            <button onclick="board_update()">수정</button>
            <button onclick="board_delete()">삭제</button>
            <a class="btn btn-primary" href="/board/update?id=${board.id}">수정</a>
            <a class="btn btn-danger" href="/board/delete/${board.id}">삭제</a>

            <div class="comment-write-area">
                <input type="text" id="comment-writer" placeholder="작성자 입력">
                <input type="text" id="comment-contents" placeholder="내용 입력">
                <button class="btn btn-primary" onclick="comment_write()">댓글작성</button>
            </div>

            <div id="comment-list-area">
<%--                댓글이 출력될 공간--%>

            </div>

        </div>
    </div>
</div>




</body>
<script>
    const getList = () => {
        const boardId = '${board.id}';
        const result = document.getElementById("comment-list-area");

        $.ajax({
            type:"post",
            url:"/comment/list",
            data:{
                boardId: boardId
            },
            success: function (res) {
                console.log("리턴값: ", res);
                let output =    "<table id=\"comment-list\">\n" +
                    "    <tr>\n" +
                    "        <th>작성자</th>\n" +
                    "        <th>내용</th>\n" +
                    "        <th>작성시간</th>\n" +
                    "    </tr>\n";
                for(let i in res) {
                    output += "    <tr>\n";
                    output += "        <td>" + res[i].commentWriter + "</td>\n";
                    output += "        <td>" + res[i].commentContents + "</td>\n";
                    output += "        <td>" + res[i].createdAt + "</td>\n";
                    output += "    </tr>\n";
                }
                output += "</table>";
                result.innerHTML = output;
                document.getElementById("comment-writer").value = "";
                document.getElementById("comment-contents").value = "";
            },
            error: function () {
                console.log("댓글 불러오기 실패!");
            }
        });
    }
    getList();

    const comment_write = () => {
        const commmentWriter = document.getElementById("comment-writer").value;
        const commentContents = document.querySelector("#comment-contents").value;
        const boardId = '${board.id}';
        const result = document.getElementById("comment-list-area");
        $.ajax({
            type:"post",
            url:"/comment/save",
            data:{
                commentWriter:commmentWriter,
                commentContents: commentContents,
                boardId:boardId
            },
            success: function (res) {
                console.log("리턴값: ", res);
                let output =    "<table id=\"comment-list\">\n" +
                    "    <tr>\n" +
                    "        <th>작성자</th>\n" +
                    "        <th>내용</th>\n" +
                    "        <th>작성시간</th>\n" +
                    "    </tr>\n";
                for(let i in res) {
                    output += "    <tr>\n";
                    output += "        <td>" + res[i].commentWriter + "</td>\n";
                    output += "        <td>" + res[i].commentContents + "</td>\n";
                    output += "        <td>" + res[i].createdAt + "</td>\n";
                    output += "    </tr>\n";
                }
                output += "</table>";
                result.innerHTML = output;
                document.getElementById("comment-writer").value = "";
                document.getElementById("comment-contents").value = "";
            },
            error: function () {
                console.log("댓글 작성 실패");
            }
        });
    }

    const board_list = () => {
        location.href = "/board/";
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
</html>
