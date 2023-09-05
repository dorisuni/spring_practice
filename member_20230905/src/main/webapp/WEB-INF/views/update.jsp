<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>학생수정을 위한 페이지</h2>
    <form action="/update" method="post">
        <input type="hidden" name="studentId" value = "${student.studentId}">
        학번 <input type="text" name="studentNumber" value = "${student.studentNumber}" readonly> <br>
        이름 <input type="text" name="studentName" value = "${student.studentName}" readonly><br>
        학과 <input type="text" name="studentMajor" value = "${student.studentMajor}"><br>
        전화번호 <input type="text" name="studentMobile" value = "${student.studentMobile}"><br>
        <input type="submit" value="수정">
    </form>
</body>
</html>
