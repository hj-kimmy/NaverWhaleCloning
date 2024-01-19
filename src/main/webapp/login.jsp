<%@ page import="com.model.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
<head>
    <%@ include file="cdns.jsp" %>

    <link rel="stylesheet" href='<c:url value="/resource/CSS/login/mainStyle.css"/>'>

    <title>Naver Dolphin</title>
</head>
<body>
<div id="wrap">
    <%@ include file="gnb.jsp" %>
    <%
        String msg = request.getParameter("msg");
        String errorMsg = "";
        if(msg!=null){
            if(msg.equals("1")){
                errorMsg = " 아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.\n" +
                        "입력하신 내용을 다시 확인해주세요.";
            }
        }
    %>
    <main>
        <section id="login">
            <div class="contents-loginBoxWrap">
                <h1 onclick="location.href='index.html'">
                </h1>
                <div class="contents-loginBox shadow">
                    <p><span></span>ID 로그인</p>
                    <form name="loginMemberForm" action="LoginAction.lo" method="post">
                        <div class="contents-loginInput">
                            <p class="loginInput"><span></span><input type="text" placeholder="아이디" name="id" id="id"></p>
                            <p class="loginInput"><span></span><input type="text" placeholder="비밀번호" name="password" id="password"></p>
                        </div>
                        <div class="contents-loginCheck">
                            <p><span></span><input type="checkbox" id="keepLogin">
                                <label for="keepLogin" class="c-whale-gray">로그인 상태 유지</label>
                            </p>
                        </div>
                        <p class="errmsg">
                            <%=errorMsg%>
                        </p>
                        <input type="button" value="로그인" id="submitBtn_Login">
                    </form>
                </div>
                <div class="contents-loginFindMenu">
                    <ul class="c-whale-gray">
                        <li>비밀번호 찾기</li>
                        <li>아이디 찾기</li>
                        <li onclick="location.href='join.html'">회원가입</li>
                    </ul>
                </div>
                <div class="contents-img">
                    <img src='<c:url value="/resource/img/759c010dfa99cbb47a7e_20220405144404082.jpg"/>' alt="">
                </div>
            </div>
        </section>
    </main>
    <%@ include file="footer.jsp" %>
</div>
<script src='<c:url value="/resource/JS/gnb.js"/>'></script>
<script src='<c:url value="/resource/JS/validation.js"/>'></script>
</body>
</html>
