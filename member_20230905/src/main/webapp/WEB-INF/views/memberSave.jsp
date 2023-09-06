<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-05
  Time: 오전 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입 페이지</title>
</head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>

<div class="row my-5 justify-content-center">
    <div class="col-md-8 col-lg-6 my-5">
        <h1 class="text-center mb-5">회원가입</h1>
            <form id="frm" action="/save" method="post" class="card p-3">
                <p>이메일</p> <input class="form-control" type="text" name="memberEmail"> <br>
                <p>비밀번호</p> <input class="form-control" type="password" name="memberPassword"><br>
                <p>이름</p> <input class="form-control" type="text" name="memberName"> <br>
                <p>생년월일</p> <input class="form-control" type="date" name="memberBirth"> <br>
                <p>전화번호</p> <input class="form-control" type="text" name="memberMobile"> <br>
                <button type="submit" class="btn btn-primary">회원가입</button>
            </form>
    </div>
</div>


<%@include file="component/footer.jsp"%>

</body>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const frm = document.getElementById('frm')
        frm.addEventListener('submit', (event) => {
            // 기본 동작(페이지 새로고침) 방지
            event.preventDefault();
            const memberEmail = document.getElementsByName('memberEmail')[0].value.trim();
            console.log(memberEmail);
            const memberPassword = document.getElementsByName('memberPassword')[0].value.trim();
            const memberName = document.getElementsByName('memberName')[0].value.trim();
            const memberBirth = document.getElementsByName('memberBirth')[0].value.trim();
            const memberMobile = document.getElementsByName('memberMobile')[0].value.trim();
            if (!memberEmail || !memberPassword ||!memberName||!memberBirth||!memberMobile) {
                event.preventDefault();
                alert('모든 필드를 작성해주세요.');
            }else{
                frm.submit();
            }

        });
    });
</script>

</html>
