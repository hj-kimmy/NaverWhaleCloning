<%@ page import="com.model.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    <main>

        <!---------------------
            section1. 회원가입
        ----------------------->
        <section id="join">
            <div class="contents-joinBoxWrap">
                <h1 onclick="location.href='<c:url value="/index.jsp"/>'">
                </h1>
                <form action='<c:url value="/joinMember.lo"/>' name ="joinMemberForm" method="post">

                    <!--회원 아이디 정보-->
                    <fieldset>
                        <ul>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="text" placeholder="아이디" name = "id" id="id" maxlength="20"><span class="c-whale-gray">@naver.com</span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="password" placeholder="비밀번호" name="password" id="password" maxlength="16"><span class="joinIcons noview"></span>
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
                                    <span class="joinIcons"></span><input type="email" placeholder="[선택] 비밀번호 분실 시 확인용 이메일" name="email" id="email">
                                </div>
                            </li>
                        </ul>
                    </fieldset>

                    <!--validation 경고창-->
                    <div>
                        <ul class="validationText">
                            <li class="id">아이디 : <span></span></li>
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
                                    <span class="joinIcons"></span><input type="text" placeholder="이름" name="name" id="name">
                                </div>
                            </li>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="text" placeholder="생년월일 8자리" name="birth" id="birth" maxlength="10">
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
                                    <select name="itc" id="itc">
                                    </select>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <span class="joinIcons"></span><input type="text" placeholder="휴대전화번호" name="phone" id="phone" maxlength="16" onclick="downloadModal()">
                                </div>

                            </li>
                        </ul>
                    </fieldset>

                    <!--약관-->
                    <fieldset>
                        <p class="smallest c-whale-gray agreetitle"><strong>네이버 웨일 가입 약관</strong></p>
                        <div class="agreement">
                            <p><strong>여러분을 환영합니다.</strong></p><br>
                            <p>
                                네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버
                                주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이
                                될 수 있는 유익한 정보를 포함하고 있습니다.
                            </p><br>

                            <p>
                                네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의
                                깊게
                                살펴봐 주시기 바랍니다.
                            </p><br>

                            <p>
                                다양한 네이버 서비스를 즐겨보세요.
                                네이버는 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션,
                                콘텐츠
                                제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.
                                여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 네이버 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은
                                각
                                서비스 상의 안내, 공지사항, 네이버 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.
                            </p><br>

                            <p>
                                네이버는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에
                                의해서
                                연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가
                                있습니다.
                                자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.
                            </p><br>

                            <p>
                                네이버 서비스에는 기본적으로 본 약관이 적용됩니다만 네이버가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는
                                경우(예,
                                네이버페이, V LIVE 등)가 있습니다. 그리고 네이버 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의
                                약관,
                                운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.
                            </p><br>

                            <p>
                                회원으로 가입하시면 네이버 서비스를 보다 편리하게 이용할 수 있습니다.
                                여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 네이버는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 네이버 서비스 이용
                                계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 네이버 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별
                                단위를
                                말합니다. 회원은 자신의 계정을 통해 좀더 다양한 네이버 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내
                                네이버
                                회원가입 방법 등에서 확인해 주세요.
                            </p><br>

                            <p>
                                네이버는 단체에 속한 여러 구성원들이 공동의 계정으로 네이버 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의
                                계정 및
                                아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며,
                                관리자는
                                구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다.
                                따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및
                                이를
                                통한 게시물 게재 등 네이버 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의
                                구성원은
                                다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.
                            </p><br>

                            <p>
                                단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 네이버 단체회원(단체 아이디) 소개 등에서
                                확인해
                                주시기 바랍니다.
                            </p><br>

                            <p>
                                공지 일자: 2018년 3월 30일
                                적용 일자: 2018년 5월 1일
                                네이버 서비스와 관련하여 궁금하신 사항이 있으시면 고객센터(대표번호: 1588 – 3820/ 평일 09:00~18:00)로 문의 주시기 바랍니다.</p>
                            <br>
                        </div>
                        <div class="contents-agreementCheck">
                            <p><input type="checkbox" id="agree" name="agree">
                                <label for="agree" class="c-whale-gray"><span></span>위 약관에 동의합니다.</label>
                            </p>
                        </div>
                    </fieldset>

                    <!--validation 경고창-->
                    <div>
                        <ul class="validationText">
                            <li class="name">이름 : <span></span></li>
                            <li class="birth">생년월일 : <span></span></li>
                            <li class="gender">성별 : <span></span></li>
                            <li class="phone">휴대전화번호 : <span></span></li>
                            <li class="agree">약관확인 : <span></span></li>
                        </ul>
                    </div>
                    <input type="button" value="가입하기" id = "submitBtn_join">
                </form>
            </div>
        </section>
    </main>
    <%@ include file="/footer.jsp" %>
</div>
<script src='<c:url value="/resource/JS/validation.js"/>'></script>
</body>
</html>
