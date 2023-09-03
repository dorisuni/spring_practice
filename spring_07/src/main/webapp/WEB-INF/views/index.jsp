<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>index.jsp</h2>
    <a href="/demo1">demo1.jsp로 이동</a>
    <a href="/demo2">demo2.jsp로 이동</a>

    <a href="/demodb1">demodb1.jsp로 이동</a>

    <!-- demodb2 주소를 요청하면 DB에서 demo_table의 모든 데이터를 가져와서
        demodb2.jsp에 출력 -->
    <a href="/demodb2">db 데이터 출력하기</a>

</body>
</html>
