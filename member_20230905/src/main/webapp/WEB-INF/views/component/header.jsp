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
            height: 4%;
            position: relative;
        }
    </style>
</head>


<body>
<header>
    <div class="header_top">
        <div class="container">
            <p>친구 초대하면 친구도 나도 적립금 <b>5000원!</b></p>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <div id="header" class="text-center">
                <a href="/"> <img src="../../../resources/img/market.jpg" alt=""/> </a>
            </div>
        </div>
    </div>
</header>

</body>



