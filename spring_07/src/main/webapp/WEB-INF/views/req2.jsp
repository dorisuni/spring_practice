<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>req2.jsp</h2>
    <c:forEach items="${demoList}" var="demo">
        ${demo}
        ${demo.name}
        ${demo.age}
    </c:forEach>

</body>
</html>
