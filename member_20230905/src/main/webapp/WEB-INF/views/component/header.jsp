<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- header라는 id가 적용된 div --%>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <style>
        .header_top{
            background-color: purple;
            color: white;
            font-weight: 500;
        }
        .header_top p{
            text-align: center;
            font-family: 'Noto Sans KR', sans-serif;
        }
        .container {
            color: white;
            padding: 5px 0;
            margin: 0 auto;
            width: 450px;
            position: relative;
        }
    </style>
</head>


<body>
<header>
    <div class="header_top">
        <div class="container">
            <p>지금 가입하고 인기상품 <b>100원</b>에 받아가세요!</p>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <div id="header" class="text-center">
                <img src="../../../resources/img/market.jpg" alt=""/>
            </div>
        </div>
    </div>
</header>

</body>



