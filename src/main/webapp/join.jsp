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
    <main>
        <section id="join">
            <div class="contents-joinBoxWrap">
                <h1 onclick="location.href='<c:url value="/index.jsp"/>'">
                </h1>
                <form action="joinMember.lo" name ="joinMemberForm" method="post">
                    <fieldset>
                        <ul>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="text" placeholder="아이디" name = "id" id="id"><span class="c-whale-gray">@naver.com</span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="password" placeholder="비밀번호" name="password" id="password"><span class="joinIcons noview"></span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="email" placeholder="[선택] 비밀번호 분실 시 확인용 이메일" name="email" id="email">
                                </div>
                            </li>
                        </ul>
                    </fieldset>
                    <div>
                        <ul class="validationText">
                            <li class="id">아이디 : <span></span></li>
                            <li class="password">비밀번호 : <span></span></li>
                            <li class="email">이메일 : <span></span></li>
                        </ul>
                    </div>
                    <fieldset>
                        <ul>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="text" placeholder="이름" name="name" id="name">
                                </div>
                            </li>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="text" placeholder="생년월일 8자리" name="birth" id="birth">
                                </div>
                            </li>
                            <li>
                                <ul class="inList">
                                    <li class="inList-li">
                                        <input type="radio" name="gender" value="male" id="male" class="genderInput"><label
                                            for="male">남자</label>
                                    </li>
                                    <li class="inList-li">
                                        <input type="radio" name="gender" value="female" id="female" class="genderInput"><label
                                            for="female">여자</label>
                                    </li>
                                    <li class="inList-li">
                                        <input type="radio" name="gender" value="none" id="none" class="genderInput"><label
                                            for="none">선택안함</label>
                                    </li>

                                </ul>
                            </li>
                            <li>
                                <div>
                                    <span class="joinIcons"></span>
                                    <select name="itc" id="">
                                    </select>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="text" placeholder="휴대전화번호" name="phone" id="phone" maxlength="16">
                                </div>

                            </li>
                        </ul>
                    </fieldset>
                    <div>
                        <ul class="validationText">
                            <li class="name">이름 : <span></span></li>
                            <li class="birth">생년월일 : <span></span></li>
                            <li class="gender">성별 : <span></span></li>
                            <li class="phone">휴대전화번호 : <span></span></li>
                        </ul>
                    </div>
                    <input type="button" value="가입하기" id = "submitBtn_join">
                </form>
            </div>
        </section>
    </main>
    <%@ include file="footer.jsp" %>
</div>
<script src='<c:url value="/resource/JS/gnb.js"/>'></script>
<script src='<c:url value="/resource/JS/validation.js"/>'></script>
</body>
</html>
