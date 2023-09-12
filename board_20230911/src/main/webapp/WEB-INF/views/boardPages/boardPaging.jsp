
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

</head>
<body>
<!-- Pagination -->
<form id="frm" action="/board/paging" method="get">
    <input type="hidden" name="offset" value="0">
    <input type="hidden" id="pageCheck" name="page" value="1">
    <input type="hidden" name="pageSize" value="20">
    <input type="hidden" id="keyCheck" name="key" class="form-control" value="${pageDTO.key}">
    <input type="hidden" id="queryCheck" name="query" class="form-control" value="${pageDTO.query}">

    <!-- 검색창과 버튼 -->
    <div class="row mt-4 justify-content-end">
        <div class="col-md-4">
            <select id="searchOption" class="form-select">
                <option value="boardWriter">작성자</option>
                <option value="boardTitle">글제목</option>
                <option value="boardContents">글내용</option>
                <!-- 다른 검색 옵션들을 필요에 따라 추가 -->
            </select>
        </div>
        <div class="col-md-4">
            <input id="searchQuery" type="text" class="form-control" placeholder="검색어 입력">
        </div>
        <div class="col-md-4">
            <button id="searchButton" class="btn btn-primary">검색</button>
        </div>
    </div>
</form>
<div>
    <span>${totalEndPage}</span>
</div>

<div class="row mt-4">
    <div class="col-md-12">
        <ul class="pagination justify-content-center flex-wrap" id="pagination-list">
            <!-- 페이지 번호가 여기에 동적으로 추가됩니다 -->
        </ul>
    </div>
</div>

</body>
<script>
    // 전체 페이지 수와 현재 페이지 번호를 설정합니다.
    var total = ${total}; // 전체 페이지 수를 가져오는 코드
    var currentPage = 1; // 현재 페이지 번호
    var visiblePages = 10; // 보여줄 페이지 번호 개수

    var paginationList = document.getElementById("pagination-list");

    // 페이지 번호를 계산하여 동적으로 생성합니다.
    var startPage = Math.max(currentPage - visiblePages / 2, 1);
    var endPage = Math.min(startPage + visiblePages - 1, total);

    for (var i = startPage; i <= endPage; i++) {
        var listItem = document.createElement("li");
        var link = document.createElement("a");
        link.href = "page.jsp?page=" + i;
        link.textContent = i;

        if (i === currentPage) {
            listItem.classList.add("active");
        }

        listItem.appendChild(link);
        paginationList.appendChild(listItem);

        link.addEventListener("click", function (event) {
            // 페이지 링크를 클릭할 때의 동작을 정의합니다.
            event.preventDefault();
            var page = parseInt(this.textContent);
            // 페이지 이동 로직을 추가하세요.
            // 예: window.location.href = "page.jsp?page=" + page;
        });
    }


    const searchButton = document.getElementById("searchButton");
    const searchForm = document.getElementById("frm");

    // 검색 버튼 클릭 시 이벤트 핸들러
    searchButton.addEventListener("click", () => {
        const selectedOption = document.getElementById("searchOption").value;
        const searchInput = document.getElementById("searchQuery").value;

        // 선택한 값을 hidden 입력란에 설정
        document.getElementById("keyCheck").value = selectedOption;
        document.getElementById("queryCheck").value = searchInput;
        document.getElementById("pageCheck").value = 1;
        document.getElementById("offset").value=0;

        // 여기에서 원하는 작업 수행
        // 예: 검색을 수행하거나 페이지 이동 등
        searchForm.submit();

    });



    // let frm = document.getElementById("frm");
    // // 페이지 이동 버튼 클릭 이벤트 핸들러
    // document.addEventListener("DOMContentLoaded", function () {
    //     let pageInput = document.getElementById("pageCheck");
    //     var paginationLinks = document.querySelectorAll(".page-link"); // 페이지 링크 요소들
    //     paginationLinks.forEach(function (link) {
    //         link.addEventListener("click", function (e) {
    //             e.preventDefault();
    //             // console.log("현재페이지값:"+pageInput.value)
    //             var dataPage = link.getAttribute("data-page"); // 클릭한 페이지의 데이터 속성 값
    //             if (dataPage === "prev") {
    //                 // 이전 페이지 버튼 클릭 시
    //                 if (pageInput.value > 1) {
    //                     pageInput.value = parseInt(pageInput.value) - 1;
    //                 }
    //             } else if (dataPage === "next") {
    //                 // 다음 페이지 버튼 클릭 시
    //                 pageInput.value = parseInt(pageInput.value) + 1;
    //             } else {
    //                 // 페이지 번호를 직접 클릭한 경우
    //                 pageInput.value = dataPage;
    //             }
    //             // console.log(pageInput)// 페이지 번호를 입력하는 input 요소
    //
    //             // 페이지 번호를 변경한 후 폼을 제출하거나 필요한 작업을 수행할 수 있습니다.
    //
    //             console.log(frm)
    //
    //         });
    //     });
    // });
</script>

</html>
