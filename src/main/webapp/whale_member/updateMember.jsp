<%@ page import="com.model.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
    <%@ include file="/cdns.jsp" %>

    <!---------------------
         Custom Stylesheet
     ----------------------->
    <link rel="stylesheet" href='<c:url value="/resource/CSS/login/mainStyle_Login.css"/>'>

</head>
<body>
<div id="wrap">
    <%@ include file="/gnb.jsp" %>
    <%
        MemberDTO dto = (MemberDTO) request.getAttribute("memberDTO");
    %>
    <main>
        <!---------------------
            section1. 정보 수정
        ----------------------->
        <section id="join">
            <div class="contents-joinBoxWrap">
                <h1 onclick="location.href='<c:url value="/index.jsp"/>'">
                </h1>
                <form action='<c:url value="/updateMember.lo"/>' name="updateMemberForm" method="post">

                    <!--회원 아이디 정보-->
                    <fieldset>
                        <ul>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="text" placeholder="아이디" name="id"
                                                                          id="id" maxlength="20" readonly
                                                                          value="<%=sessionID%>"><span
                                        class="c-whale-gray">@naver.com</span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="password" placeholder="비밀번호"
                                                                          name="password" id="password"
                                                                          maxlength="16"><span
                                        class="joinIcons noview"></span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="password" placeholder="비밀번호 확인"
                                                                          name="passwordChk" id="passwordChk"
                                                                          maxlength="16"><span
                                        class="joinIcons noview"></span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="email"
                                                                          placeholder="[선택] 비밀번호 분실 시 확인용 이메일"
                                                                          name="email" id="email"
                                                                          value="<%=dto.getEmail()%>">
                                </div>
                            </li>
                        </ul>
                    </fieldset>

                    <!--validation 경고창-->
                    <div>
                        <ul class="validationText">
                            <li class="password">비밀번호 : <span></span></li>
                            <li class="passwordChk">비밀번호 확인 : <span></span></li>
                            <li class="email">이메일 : <span></span></li>
                        </ul>
                    </div>

                    <!--회원 개인 정보-->
                    <fieldset>
                        <ul>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="text" placeholder="이름" name="name"
                                                                          id="name" value="<%= dto.getName() %>">
                                </div>
                            </li>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="text" placeholder="생년월일 8자리"
                                                                          name="birth" id="birth" maxlength="10"
                                                                          value="<%= dto.getBirth() %>">
                                </div>
                            </li>
                            <li>
                                <ul class="inList">

                                    <li class="inList-li">
                                        <input type="radio" name="gender" value="male" id="male" class="genderInput"
                                            <% if(dto.getGender().equals("male")){%>
                                               checked
                                            <%}%>
                                        ><label
                                            for="male">남자</label>
                                    </li>

                                    <li class="inList-li">
                                        <input type="radio" name="gender" value="female" id="female"
                                               class="genderInput"
                                            <% if(dto.getGender().equals("female")){%>
                                               checked
                                            <%}%>
                                        ><label
                                            for="female">여자</label>
                                    </li>
                                    <li class="inList-li">
                                        <input type="radio" name="gender" value="none" id="none"
                                               class="genderInput"
                                            <% if(dto.getGender().equals("none")){%>
                                               checked
                                            <%}%>
                                        ><label
                                            for="none">선택안함</label>
                                    </li>

                                </ul>
                            </li>
                            <li>
                                <div>
                                    <span class="joinIcons"></span>
                                    <select name="itc" id="itc" data-itccode="<%=dto.getItc()%>">
                                    </select>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="text" placeholder="휴대전화번호" name="phone"
                                                                          id="phone" maxlength="16"
                                                                          value="<%=dto.getPhone()%>"
                                                                          onclick="downloadModal()">
                                </div>

                            </li>
                        </ul>
                    </fieldset>

                    <fieldset>
                        <p class="smallest c-whale-gray agreetitle"><strong onclick="confirmSignOut('<%=sessionID%>')" type="button" class="signOutBtn">탈퇴하기</strong></p>
                    </fieldset>

                        <!--validation 경고창-->
                    <div>
                        <ul class="validationText">
                            <li class="name">이름 : <span></span></li>
                            <li class="birth">생년월일 : <span></span></li>
                            <li class="gender">성별 : <span></span></li>
                            <li class="phone">휴대전화번호 : <span></span></li>
                        </ul>
                    </div>

                    <input type="button" value="회원정보수정하기" id="submit_update">
                </form>
            </div>
        </section>
    </main>
    <%@ include file="/footer.jsp" %>
</div>
<script src='<c:url value="/resource/JS/validation_update.js"/>'></script>
</body>
</html>
