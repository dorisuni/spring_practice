<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- header라는 id가 적용된 div --%>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <style>
        .header_top {
            background-color: purple;
            color: white;
            font-weight: 500;
        }

        .header_top p {
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

        .css-t79vuj {
            position: relative;
            width: 1050px;
            height: 100px;
            margin: 0px auto;
            letter-spacing: -0.3px;
        }

        .css-fexq9b {
            position: absolute;
            right: 0px;
            top: 0px;
            z-index: 20;
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            font-size: 12px;
        }

        .css-xygizb {
            display: block;
            color: rgb(95, 0, 128);
            cursor: pointer;
        }

        .css-1qgm48u {
            width: 1px;
            height: 13px;
            margin: 0px 12px;
            background-color: rgb(217, 217, 217);
        }

        .css-r7wmjj {
            height: 100px;
            padding-top: 36px;
        }

        .css-1qolcqm {
            line-height: 35px;
            position: relative;
        }

        .css-oyffzd {
            display: block;
            cursor: pointer;
        }

        .css-oyffzd a {
            background-color: transparent;
            text-decoration: none;
            color: inherit;
        }

        .css-1qolcqm .menu {
            display: none;
        }

        .css-1ho29iy {
            position: absolute;
            right: 0px;
            top: 34px;
            width: 130px;
            padding: 3px 9px;
            border: 1px solid rgb(221, 221, 221);
            background-color: rgb(255, 255, 255);
        }

        .css-12olpw6 {
            display: block;
            height: 24px;
            line-height: 24px;
            cursor: pointer;
        }

        .css-boc80u {
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            height: 63px;
        }

        .css-boc80u * {
            *, :after, :before {
                box-sizing: border-box;
                margin: 0;
            }


        }

        .css-17mnrrx {
            flex: 0 0 82px;

        }

        .css-17mnrrx img {
            border: 0;
            vertical-align: top;
        }

        .css-j0ug0x {
            -webkit-text-size-adjust: 100%;
            --swiper-theme-color: #007aff;
            user-select: none;
            padding: 0;
            box-sizing: border-box;
            font: inherit;
            margin: 0;
            -webkit-tap-highlight-color: transparent;
            overflow: visible;
            background-color: transparent;
            border: none;
            text-transform: none;
            -webkit-appearance: button;
            border-radius: 0;
            font-family: "Noto Sans", "malgun gothic", AppleGothic, dotum, sans-serif;
            flex-shrink: 0;
            margin-left: 20px;
            font-size: 18px;
            line-height: 1.33;
            letter-spacing: normal;
            cursor: pointer;
            font-weight: 500;
            color: rgb(95, 0, 128);
        }

        .css-j0ug0x.active, .css-j0ug0x:hover {
            font-weight: 500;
            color: rgb(95, 0, 128);
        }

        .css-1sia941:hover {
            font-weight: 500;
            color: rgb(95, 0, 128);
        }

        .css-1sia941 {
            -webkit-text-size-adjust: 100%;
            --swiper-theme-color: #007aff;
            user-select: none;
            padding: 0;
            box-sizing: border-box;
            font: inherit;
            margin: 0;
            -webkit-tap-highlight-color: transparent;
            overflow: visible;
            background-color: transparent;
            border: none;
            text-transform: none;
            -webkit-appearance: button;
            border-radius: 0;
            font-family: "Noto Sans", "malgun gothic", AppleGothic, dotum, sans-serif;
            flex-shrink: 0;
            font-size: 18px;
            font-weight: normal;
            line-height: 1.33;
            letter-spacing: normal;
            color: rgb(181, 181, 181);
            cursor: pointer;
            position: relative;
            margin-left: 22px;
        }

        .css-1sia941 button {
            border-radius: 0;
        }

        .css-1sia941::after {
            content: "";
            position: absolute;
            display: block;
            background: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNyIgaGVpZ2h0PSI3IiB2aWV3Qm94PSIwIDAgNyA3IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogICAgPHBhdGggZD0iTTUuMTA4IDd2LS4wMDdMMS45MTEgMi41NzdWN0guMDQ2VjBoMS44NjdsMy4xOTYgNC40MTlWMGgxLjg2N3Y3SDUuMTA4eiIgZmlsbD0iI0ZBNjIyRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo=) 0px 0px no-repeat;
            width: 10px;
            height: 10px;
            top: 3px;
            right: -13px;
        }

        .css-pqw0uk {
            position: relative;
            width: 1050px;
            margin: 0px auto;
        }

        .css-w444a2 {
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: justify;
            justify-content: space-between;
            position: absolute;
            left: 325px;
            top: -55px;
            width: 400px;
            height: 48px;
            padding-left: 14px;
            border: 1px solid rgb(95, 0, 128);
            border-radius: 6px;
            background-color: rgb(255, 255, 255);
            box-shadow: rgb(247, 247, 247) 0px 0px 0px 1px inset;
        }

        .css-11ntk83 {
            width: 300px;
            background-color: inherit;
            border: none;
            outline: none;
            font-size: 16px;
            letter-spacing: -0.33px;

        }

        .css-ywxmlw {
            position: relative;
            width: 30px;
            height: 30px;
            margin: 10px;
            bottom: 3px;
            background: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0ibm9uZSIgZD0iTTAgMGgzNnYzNkgweiIvPgogICAgICAgIDxnIHN0cm9rZT0iIzVGMDA4MCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2Utd2lkdGg9IjEuNyI+CiAgICAgICAgICAgIDxwYXRoIGQ9Im0yNi4wODEgMjYuMDgxLTQuMTItNC4xMk0xNi40NjcgMjMuMzM0YTYuODY3IDYuODY3IDAgMSAwIDAtMTMuNzM0IDYuODY3IDYuODY3IDAgMCAwIDAgMTMuNzM0eiIvPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==) 0px 0px no-repeat;
            border-radius: 0;
            border: none;
        }

        .css-c4pbxv {
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            position: absolute;
            right: -6px;
            top: -49px;
            border-radius: 0;
            border: none;
        }

        .css-1n4p7us {
            width: 36px;
            height: 36px;
            margin-right: 20px;
            background: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTM2IDM2SDBWMGgzNnoiLz4KICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSg4LjcgNikiIHN0cm9rZT0iIzMzMyIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjciPgogICAgICAgICAgICA8cGF0aCBkPSJNOS4zMDYgMjRTMCAxNi41NDQgMCA5LjMwNmE5LjMwNiA5LjMwNiAwIDAgMSAxOC42MTIgMEMxOC42MTIgMTYuNTQ0IDkuMzA2IDI0IDkuMzA2IDI0eiIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIi8+CiAgICAgICAgICAgIDxjaXJjbGUgc3Ryb2tlLWxpbmVjYXA9InNxdWFyZSIgY3g9IjkuMjEyIiBjeT0iOS4xMjMiIHI9IjIuNzg0Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K) 50% 50% no-repeat;
            cursor: pointer;
            border-radius: 0;
            border: none;
        }

        .css-231fw3 {
            width: 36px;
            height: 36px;
            background: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0yOC45MjcgOC44OTNhNi40NiA2LjQ2IDAgMCAwLTkuMTM5IDBsLTEuODI5IDEuODI4LTEuODI3LTEuODI4YTYuNDYyIDYuNDYyIDAgMSAwLTkuMTQgOS4xMzhMOC44MiAxOS44Nmw4LjQzMiA4LjQzNGExIDEgMCAwIDAgMS40MTQgMGw4LjQzMy04LjQzNGgwbDEuODI4LTEuODI4YTYuNDYgNi40NiAwIDAgMCAwLTkuMTM4eiIgc3Ryb2tlPSIjMzMzIiBzdHJva2Utd2lkdGg9IjEuNyIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBzdHJva2UtbGluZWNhcD0icm91bmQiLz4KPC9zdmc+Cg==) 50% 50% no-repeat;
            border-radius: 0;
            border: none;
        }

        .css-ff2aah {
            position: relative;
            margin-left: 20px;
            border-radius: 0;
            border: none;
        }

        .css-g25h97 {
            display: block;
            width: 36px;
            height: 36px;
            background: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTM2IDM2SDBWMGgzNnoiLz4KICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSg1LjE2NCA2LjU0NykiIHN0cm9rZT0iIzMzMyIgc3Ryb2tlLWxpbmVjYXA9InNxdWFyZSIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjciPgogICAgICAgICAgICA8cGF0aCBkPSJtMjUuNjggMy42Ni0yLjcyIDExLjU3SDcuMzdMNC42NiAzLjY2eiIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSIyMC41MiIgY3k9IjIwLjc4IiByPSIyLjE0Ii8+CiAgICAgICAgICAgIDxjaXJjbGUgY3g9IjkuODEiIGN5PSIyMC43OCIgcj0iMi4xNCIvPgogICAgICAgICAgICA8cGF0aCBkPSJNMCAwaDMuOGwxLjc2IDcuNSIvPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==);
            cursor: pointer;
            border-radius: 0;
            border: none;
        }

        .css-19ndp9a {
            min-width: 1050px;
            letter-spacing: -0.3px;
            background-color: rgb(255, 255, 255);
            position: relative;
            box-shadow: rgba(0, 0, 0, 0.07) 0px 3px 4px 0px;
            width: 100%;
            z-index: 10;
        }

        .css-mlddcv {
            position: relative;
            display: flex;
            -webkit-box-pack: justify;
            justify-content: space-between;
            width: 1050px;
            height: 56px;
            margin: 0px auto;
        }

        .css-17ybbz4 .e17w4cfr3 {
            flex: 0 0 120px;
        }

        .css-axtlq9 {
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            height: 100%;
        }

        .css-axtlq9:hover {
            cursor: pointer;
            color: rgb(95, 0, 128);
        }


        .css-1k5gn9s {
            width: 16px;
            height: 14px;
            margin-right: 14px;
            background: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNiAxNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0wIDBoMTZ2MS43SDBWMHptMCA2LjE1aDE2djEuN0gwdi0xLjd6bTAgNi4xNWgxNlYxNEgwdi0xLjd6IiBmaWxsPSIjMzMzIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz4KPC9zdmc+Cg==) 0px 0px / 16px 14px no-repeat;
        }

        .css-t75x7c {
            font-size: 16px;
            font-weight: 500;
            line-height: 20px;
            letter-spacing: -0.3px;
            color: rgb(51, 51, 51);
        }

        .css-t75x7c:hover {
            cursor: pointer;
            color: rgb(95, 0, 128);
        }


        .css-1887xqd {
            display: flex;
            margin-left: 30px;
            list-style-type: none;
        }

        .css-59mmhh {
            display: flex;
            -webkit-box-pack: center;
            justify-content: center;
            width: 150px;
            height: 55px;
            padding-top: 18px;
            line-height: 20px;
            text-align: center;
        }

        .css-17ybbz4 .e17w4cfr4 {
            flex: 0 0 120px;
        }

        .css-1xyu7j9 {
            height: fit-content;
            font-size: 16px;
            font-weight: 500;
            color: rgb(51, 51, 51);
            cursor: pointer;
        }

        .css-1xyu7j9:hover {
            height: fit-content;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            color: rgb(95, 0, 128);
        }

        .css-s5xdrg * {
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            box-sizing: border-box;
            margin: 0;
        }

        .css-dnwaeo {
            height: 32px;
            padding: 6px 16px;
            border-radius: 18px;
            border: 1px solid rgb(238, 238, 238);
            color: rgb(102, 102, 102);
            font-size: 13px;
            line-height: 16px;
            letter-spacing: -0.32px;
        }

        .css-1s2o3jp {
            font-weight: 500;
            color: rgb(95, 0, 128);
        }
        .css-taug43 {
            max-height: calc(95vh - 55px);
            min-height: 200px;
            position: absolute;
            display: flex;
            top: 46px;
            padding-top: 10px;
        }
        .css-23l5vx {
            position: relative;
            z-index: 21;
            width: 249px;
            border: 1px solid rgb(221, 221, 221);
            background-color: rgb(255, 255, 255);
            animation: 0s linear 0s 1 normal none running animation-w43n76;
        }
        .css-13ct7qm {
            overflow-y: auto;
            width: 247px;
            height: 100%;
            background-color: rgb(255, 255, 255);
            cursor: pointer;
            list-style-type: none;
        }
        .css-13ct7qm ul{
            list-style-type: none;
        }
        .css-you2kh {
            padding: 7px 0px 9px 14px;
        }
        .css-you2kh li{
            display: list-item;
            text-align: -webkit-match-parent;
            box-sizing: border-box;
            margin: 0;
        }

        .css-11n7bn4 {
            display: flex;
            flex-wrap: wrap;
            align-items: flex-start;
        }
        .css-ar6ptu {
            flex: 0 1 0%;
            width: 24px;
            height: 24px;
        }
        .css-mhaka4 {
            flex: 1 1 0%;
            padding: 1px 20px 0px 10px;
            color: rgb(51, 51, 51);
            font-size: 14px;
            font-weight: 400;
            line-height: 22px;
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

    <%--    <div class="row">--%>
    <%--        <div class="col">--%>
    <%--            <div id="header" class="text-center">--%>
    <%--                <a href="/"> <img src="../../../resources/img/market.jpg" alt=""/> </a>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <div>
        <div class="css-t79vuj e15sbxqa2">
            <div class="css-fexq9b eo7pjfk4">
                <a class="css-xygizb eo7pjfk2">회원가입</a>
                <div class="css-1qgm48u eo7pjfk0">
                </div>
                <a class="css-oyffzd eo7pjfk2">로그인</a>
                <div class="css-1qgm48u eo7pjfk0">

                </div>
                <div class="css-1qolcqm eo7pjfk3">
                    <a class="css-oyffzd eo7pjfk2">고객센터<span class="css-1lrerrk eo4j3y50"></span></a>
                    <div class="menu css-1ho29iy ecncdj41">
                        <div class="css-12olpw6 ecncdj40">공지사항</div>
                        <div class="css-12olpw6 ecncdj40">자주하는 질문</div>
                        <div class="css-12olpw6 ecncdj40">1:1 문의</div>
                        <div class="css-12olpw6 ecncdj40">대량주문 문의</div>
                    </div>
                </div>
            </div>
            <div class="css-r7wmjj e15sbxqa3">
                <div class="css-boc80u ekdqe1a2">
                    <img src="src=../../../resources/img/logo.svg" alt="마켓컬리 로고" class="css-17mnrrx e1s3pt0j0">
                    <button class="active css-j0ug0x ekdqe1a1">마켓컬리</button>
                    <button class=" css-1sia941 ekdqe1a0">뷰티컬리</button>
                </div>
                <div class="css-pqw0uk e1493ofl4">
                    <div class="css-w444a2 e1493ofl1"><input id="gnb_search" placeholder="검색어를 입력해주세요" required=""
                                                             class="css-11ntk83 e1493ofl3" value="">
                        <button id="submit" aria-label="submit" class="css-ywxmlw e1493ofl0"></button>
                    </div>
                </div>
                <div class="css-pqw0uk e15sbxqa1">
                    <div class="css-c4pbxv e15sbxqa0">
                        <div class=" css-1n4p7us e1n3mt0d1"></div>
                        <button class="css-231fw3 etxxzpc0" aria-label="찜하기" type="button"></button>
                        <div class="css-ff2aah e14oy6dx2">
                            <button class="css-g25h97 e14oy6dx1"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="header" class="css-19ndp9a e17w4cfr1">
            <div class="css-mlddcv e17w4cfr6">
                <div class="css-0 e17w4cfr3">
                    <div class="css-axtlq9 eqn756m2"><span class="css-1k5gn9s eqn756m1"></span><span
                            class="css-t75x7c eqn756m0">카테고리</span></div>
                </div>
                <div class="css-taug43 e7s0tnu0">
                    <div width="0" class="css-23l5vx e1vs1ym87">
                        <ul class="css-13ct7qm e1vs1ym86">
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81">
                                    <img src="https://collection-image.kurly.com/site-category-groups/73/46687uEQ8XThFdKRRcMSzTR8cW9IzSxTTceS8CC3.png"
                                         alt="9월 뷰티컬리페스타" class="css-ar6ptu e1vs1ym82">
                                    <span class="css-mhaka4 e1vs1ym84">9월 뷰티컬리페스타<span
                                            class="css-95woie e1vs1ym80"></span></span>
                                </div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81">
                                    <img src="https://collection-image.kurly.com/site-category-groups/76/YVlPJuaTWxMcUONuR3PmQAFAHTGVHqI2hPHU7M9D.png"
                                         alt="2023 추석 선물세트" class="css-ar6ptu e1vs1ym82">
                                    <span class="css-mhaka4 e1vs1ym84">2023 추석 선물세트<span
                                            class="css-95woie e1vs1ym80"></span></span>
                                </div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81">
                                    <img src="https://collection-image.kurly.com/site-category-groups/1/4IYbd0CEWkokpqiN00CAL9cDC2Q7nT101TDEn0tF.png"
                                         alt="채소" class="css-ar6ptu e1vs1ym82">
                                    <span class="css-mhaka4 e1vs1ym84">채소</span>
                                </div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81">
                                    <img src="https://collection-image.kurly.com/site-category-groups/2/DNXCcUaXoXakDOdHiGhIMCNUeUjJioG9EyeQ7RRX.png"
                                         alt="과일·견과·쌀" class="css-ar6ptu e1vs1ym82"><span class="css-mhaka4 e1vs1ym84">과일·견과·쌀</span>
                                </div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/3/fivaoZPBTeqaDswJUgr3k0xMV0von36Qb9qnn7ZZ.png"
                                        alt="수산·해산·건어물" class="css-ar6ptu e1vs1ym82"><span class="css-mhaka4 e1vs1ym84">수산·해산·건어물</span>
                                </div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/4/jj6zZg2sY94aytlc2k1udIAmWWvmUignR9VYaMcm.png"
                                        alt="정육·계란" class="css-ar6ptu e1vs1ym82"><span class="css-mhaka4 e1vs1ym84">정육·계란</span>
                                </div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/5/CkyoRnUe2q9ngIOLW3bJPRYBw9xq9BHZ3fNQIq1c.png"
                                        alt="국·반찬·메인요리" class="css-ar6ptu e1vs1ym82"><span class="css-mhaka4 e1vs1ym84">국·반찬·메인요리</span>
                                </div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/6/kwat5Szmq0ONTpMd4hlbcGmCOBd3FsMPyTzWxKBb.png"
                                        alt="샐러드·간편식" class="css-ar6ptu e1vs1ym82"><span class="css-mhaka4 e1vs1ym84">샐러드·간편식</span>
                                </div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/7/CL0LpJynh8Nh2Vqmnm62RVTPePWVU84VkWwQPjdO.png"
                                        alt="면·양념·오일" class="css-ar6ptu e1vs1ym82"><span class="css-mhaka4 e1vs1ym84">면·양념·오일</span>
                                </div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/8/bKllScRqF9gQ5q58LcmBfOOhgBrCOdVypPiRvQkL.png"
                                        alt="생수·음료·우유·커피" class="css-ar6ptu e1vs1ym82"><span
                                        class="css-mhaka4 e1vs1ym84">생수·음료·우유·커피</span></div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/9/5qKRHLtIeBWLxUPa1g3koUhqsAkc39YjtMnyIXCJ.png"
                                        alt="간식·과자·떡" class="css-ar6ptu e1vs1ym82"><span class="css-mhaka4 e1vs1ym84">간식·과자·떡</span>
                                </div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/10/bIjVH9L4oDFYv0GpjBijA6QQEjiDOW0KoflLVNC1.png"
                                        alt="베이커리·치즈·델리" class="css-ar6ptu e1vs1ym82"><span
                                        class="css-mhaka4 e1vs1ym84">베이커리·치즈·델리</span></div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/11/vEGBXqN7a2bxTC3v6jntEzTqQiwG4ogLkiruPwRs.png"
                                        alt="건강식품" class="css-ar6ptu e1vs1ym82"><span
                                        class="css-mhaka4 e1vs1ym84">건강식품</span></div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/12/UnO3V0GDnss8p37EKmTGvnF9SzeyzgyzC0O7Wh1R.png"
                                        alt="와인·위스키" class="css-ar6ptu e1vs1ym82"><span class="css-mhaka4 e1vs1ym84">와인·위스키</span>
                                </div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/13/1vmSDtWcIbzUc8QNl8CV9EQ7h5dWGc4uMg4uY6cP.png"
                                        alt="전통주" class="css-ar6ptu e1vs1ym82"><span
                                        class="css-mhaka4 e1vs1ym84">전통주</span></div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/14/1vTroAoaidyGvcDf1MRU8GhS73GMp9oZ7lm7IT0Z.png"
                                        alt="생활용품·리빙·캠핑" class="css-ar6ptu e1vs1ym82"><span
                                        class="css-mhaka4 e1vs1ym84">생활용품·리빙·캠핑</span></div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/15/3OUDPGzCOTPixqHY1wdFEUfHacXxynCpnlzFzFBD.png"
                                        alt="스킨케어·메이크업" class="css-ar6ptu e1vs1ym82"><span class="css-mhaka4 e1vs1ym84">스킨케어·메이크업</span>
                                </div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/16/APNr2Xb1ZeF9WcBDky1V9GWHZaCy7kifCkwSjTjy.png"
                                        alt="헤어·바디·구강" class="css-ar6ptu e1vs1ym82"><span class="css-mhaka4 e1vs1ym84">헤어·바디·구강</span>
                                </div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/17/K81cs1Af4uRkEvbnfEV51E5UcwP5v6HhH1xyFqHK.png"
                                        alt="주방용품" class="css-ar6ptu e1vs1ym82"><span
                                        class="css-mhaka4 e1vs1ym84">주방용품</span></div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/18/Keg4gCKfZBXhAB0xMtsFyWq7PEowD7IiZNZSCTEY.png"
                                        alt="가전제품" class="css-ar6ptu e1vs1ym82"><span
                                        class="css-mhaka4 e1vs1ym84">가전제품</span></div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/19/DeT1R9JFqxgxubAIJuFcbZPPbBu8DHUkFJmGZBlJ.png"
                                        alt="반려동물" class="css-ar6ptu e1vs1ym82"><span
                                        class="css-mhaka4 e1vs1ym84">반려동물</span></div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://collection-image.kurly.com/site-category-groups/20/0901lRbjcR35VHqUHPbKIZCAO9qPgi79RCqFymgp.png"
                                        alt="베이비·키즈·완구" class="css-ar6ptu e1vs1ym82"><span class="css-mhaka4 e1vs1ym84">베이비·키즈·완구</span>
                                </div>
                            </li>
                            <li class="css-you2kh e1vs1ym83">
                                <div class="css-11n7bn4 e1vs1ym81"><img
                                        src="https://res.kurly.com/pc/service/common/2207/icon_recommend_inactive.png"
                                        alt="recommend" class="css-ar6ptu e1vs1ym82"><span class="css-mhaka4 e1vs1ym84">컬리의 추천</span>
                                </div>
                            </li>
                            <li width="0" class="css-1xy9xh5 e1vs1ym85"></li>
                        </ul>
                    </div>
                </div>
                <ul class="css-1887xqd e17w4cfr5">
                    <li class="css-59mmhh e17w4cfr4"><span class="css-1xyu7j9 e17w4cfr2">신상품</span></li>
                    <li class="css-59mmhh e17w4cfr4"><span class="css-1xyu7j9 e17w4cfr2">베스트</span></li>
                    <li class="css-59mmhh e17w4cfr4"><span class="css-1xyu7j9 e17w4cfr2">알뜰쇼핑</span></li>
                    <li class="css-59mmhh e17w4cfr4"><span class="css-1xyu7j9 e17w4cfr2">특가/혜택</span></li>
                </ul>
                <div class="css-s5xdrg e17w4cfr0"><a
                        href="/shop/event/kurlyEvent.php?htmid=event/delivery_search/delivery_search">
                    <div class="css-dnwaeo e1mmzaxa1"><span class="css-1s2o3jp e1mmzaxa0">샛별・택배</span> 배송안내</div>
                </a></div>
            </div>
        </div>
        <div class="css-1px7x3s e1py5jsz0" hidden=""></div>
    </div>

</header>


</body>



