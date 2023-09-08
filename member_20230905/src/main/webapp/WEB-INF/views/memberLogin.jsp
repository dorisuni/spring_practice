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
    <title>로그인 페이지</title>
    <style >

        .btn-colour-1 {
            color: #fff;
            background-color: #661da7;
            border-color: #661da7;
            font-weight: bold;
            letter-spacing: 0.05em;
            border-radius: .5rem;
        }

        .btn-colour-1:hover,
        .btn-colour-1:active,
        .btn-colour-1:focus,
        .btn-colour-1.active {
            /* let's darken #004E64 a bit for hover effect */
            background: #8B00FF;
            color: #ffffff;
            border-color: #8B00FF;
        }

    </style>
</head>
<body>
<%@include file="component/header.jsp"%>
<%@include file="component/nav.jsp"%>
        <div class="row my-8 justify-content-center">
            <div class="col-5 my-4">
                <h1 class="text-center mb-5">로그인</h1>
                    <form id="frm" method="post" class="card p-3">
                            <div>
                            <input type="text" name="memberEmail" class="form-control mb-2" placeholder="이메일을 입력하세요."><br>
                            <input type="password" name="memberPassword" class="form-control mb-2" placeholder="비밀번호를 입력하세요.">
                            </div>
                        <div class="text-end">
                            <a href="/search">아이디 찾기</a>|<a href="/search">비밀번호 찾기</a>
                        </div>
                        <div class="d-grid gap-2 col-6 mx-auto">
                            <button type="submit" class="btn-colour-1">로그인</button>

                            <button href="/save" class="btn-colour-1">회원가입</button>
                        </div>

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

            if (!memberEmail || !memberPassword ) {
                event.preventDefault();
                alert('모든 필드를 작성해주세요.');
            }else{
                frm.submit();
            }

        });
    });

</script>
</html>
