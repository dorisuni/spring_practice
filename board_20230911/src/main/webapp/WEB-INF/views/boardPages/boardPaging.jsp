
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <style>

    </style>
</head>
<body>
<!-- Pagination -->
<form id="frm" action="/board/paging" method="get">
    <input type="hidden" id="offsetCheck" name="offset" value="${pageDTO.offset}">
    <input type="hidden" id="pageCheck" name="page" value="${pageDTO.page}">
    <input type="hidden" id="pageSizeCheck" name="pageSize" value="10">
    <input type="hidden" id="keyCheck" name="key" class="form-control" value="${pageDTO.key}">
    <input type="hidden" id="queryCheck" name="query" class="form-control" value="${pageDTO.query}">
    <input type="hidden" id="total" value="${total}">
    <input type="hidden" id="endPage" value="${totalEndPage}">
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
            <!-- 이전 버튼 -->
            <li class="page-item" id="prevButton">
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>

            <!-- 페이지 번호가 여기에 동적으로 추가됩니다 -->


        </ul>
    </div>
</div>

<div>
    <span>${totalEndPage}</span>
</div>



</body>
<script>
    // 전체 페이지 수와 현재 페이지 번호를 설정합니다.
    const offsetCheck = document.getElementById("offsetCheck")
    console.log("오프셋값:",offsetCheck.value)
    var total = document.getElementById("total").value;
    console.log("전쳇값",total)// 전체 페이지 수를 가져오는 코드
    var currentPage = document.getElementById("pageCheck").value; // 현재 페이지 번호
    console.log("현재페이지:",currentPage)
    const totalEndPage = document.getElementById("endPage").value
    console.log("마지막페이지:",totalEndPage)
    var visiblePages = 10; // 보여줄 페이지 번호 개수
    var paginationList = document.getElementById("pagination-list");
    // 페이지 번호를 계산하여 동적으로 생성합니다.
    var startPage = Math.max(currentPage - visiblePages / 2, 1);
    var endPage = Math.min(startPage + visiblePages - 1, total);
    endPage = Math.min(endPage, totalEndPage);

    for (var i = startPage; i <= endPage; i++) {
        var listItem = document.createElement("li");
        var link = document.createElement("a");
        listItem.classList.add("page-item");
        link.classList.add("page-link")
        link.href = "#"
        link.textContent = i;
        if (i == currentPage) {
            link.classList.add("active")
        }
        listItem.appendChild(link);
        paginationList.appendChild(listItem);

        link.addEventListener("click", function (event) {
            // 페이지 링크를 클릭할 때의 동작을 정의합니다.
            event.preventDefault();
            var page = parseInt(this.textContent);
            // 페이지 이동 로직을 추가하세요.
            const selectedOption = document.getElementById("searchOption").value;
            const searchInput = document.getElementById("searchQuery").value;
            // console.log("페이지사이즈:",pageSizeCheck)
            // 선택한 값을 hidden 입력란에 설정
            document.getElementById("keyCheck").value = selectedOption;
            document.getElementById("queryCheck").value = searchInput;
            document.getElementById("pageCheck").value = page;
            document.getElementById("offsetCheck").value=(parseInt(page-1)*parseInt(10));
            // console.log(document.getElementById("offsetCheck").value)
            // console.log(searchForm)
            searchForm.submit();
        });
    }


    //다음버튼 그리기
    var nextButton = document.createElement("li");
    nextButton.classList.add("page-item");
    nextButton.id = "nextButton";
    var nextLink = document.createElement("a");
    nextLink.classList.add("page-link");
    nextLink.href = "#";
    nextLink.innerHTML = '<span aria-hidden="true">&raquo;</span>';
    nextButton.appendChild(nextLink);
    paginationList.appendChild(nextButton);


    const prevButton = document.getElementById("prevButton");
    const realNextButton = document.getElementById("nextButton");

    // 이전 버튼의 클릭 이벤트 핸들러
    prevButton.addEventListener("click", function (event) {
        event.preventDefault();
        if (currentPage > 1) {
            // 현재 페이지가 1보다 크면 이전 페이지로 이동
            navigateToPage(currentPage - 1);
        }
    });

    // 다음 버튼의 클릭 이벤트 핸들러
    realNextButton.addEventListener("click", function (event) {
        event.preventDefault();
        if (currentPage < totalEndPage) {
            // 현재 페이지가 totalEndPage보다 작으면 다음 페이지로 이동
            console.log("현재페이지값 다음버튼",currentPage)
            navigateToPage(currentPage+1);
        }
    });

    // 페이지 이동 함수
    function navigateToPage(page) {
        // 페이지 이동 로직을 추가하세요.
        const selectedOption = document.getElementById("searchOption").value;
        const searchInput = document.getElementById("searchQuery").value;

        document.getElementById("keyCheck").value = selectedOption;
        document.getElementById("queryCheck").value = searchInput;
        document.getElementById("pageCheck").value = page;
        document.getElementById("offsetCheck").value = ((page - 1) * parseInt(10));
        searchForm.submit();
    }



    // 페이지가 1이면 이전 버튼 비활성화
    if (currentPage == 1) {
        prevButton.classList.add("disabled");
    }

    // 페이지가 totalEndPage이면 다음 버튼 비활성화
    if (currentPage === totalEndPage) {
        nextButton.classList.add("disabled");
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
