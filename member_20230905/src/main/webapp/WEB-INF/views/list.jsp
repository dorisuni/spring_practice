<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>

</head>
<body>
    <h2>학생 리스트</h2>
    <h4>인덱스 학번 이름 학과 전화번호</h4>
    <c:forEach items="${studentList}" var="student">
        <td>
            <a href="/find?id=${student.id}">${student.id}</a>
        </td>
        ${student.studentNumber}
        ${student.studentName}
        ${student.studentMajor}
        ${student.studentMobile}
        <td>
            <a href="/update?id=${student.id}">수정</a>
        </td>
        <td>
            <a href="/delete?id=${student.id}">삭제</a>
        </td>

        <br>
    </c:forEach>

</body>
</html>
