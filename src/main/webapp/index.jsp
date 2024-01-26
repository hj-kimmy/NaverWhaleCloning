<%@ page import="com.model.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/cdns.jsp" %>

    <!---------------------
       JavaScript Plugin
   ----------------------->
    <!-- GSAP Library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.0/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.0/ScrollTrigger.min.js"></script>

    <!---------------------
       Custom Stylesheet
   ----------------------->
    <link rel="stylesheet" href='<c:url value="/resource/CSS/NaverWhale/mainStyle_index.css"/>'>
    <link rel="stylesheet" href='<c:url value="/resource/CSS/NaverWhale/mediaQuery_index.css"/>'>
</head>
<body>
<div id="wrap">
    <%@ include file="/gnb.jsp" %>
    <main>
        <!---------------------
            section1. 주요기능
        ----------------------->
        <%@ include file="/index/feature_index1.jsp" %>

        <!---------------------
            section2. 보안장점
        ----------------------->
        <%@ include file="/index/secure_index2.jsp"%>

        <!---------------------
            section3. 웨일 환경설정
        ----------------------->
        <%@ include file="/index/environment_index3.jsp"%>

        <!---------------------
            section4. 웨일앱 서비스
        ----------------------->
        <%@ include file="/index/appService_index4.jsp"%>

        <!---------------------
            section5. 웨일 광고
        ----------------------->
        <%@ include file="/index/adBanner_index5.jsp"%>

    </main>
    <%@ include file="/footer.jsp" %>
</div>
<script src='<c:url value="/resource/JS/mainJavaScript.js"/>'></script>
</body>
</html>
