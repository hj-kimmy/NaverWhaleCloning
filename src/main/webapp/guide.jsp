<%@ page import="com.model.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    List<BoardDTO> pressBoardlist = (List<BoardDTO>) request.getAttribute("pressBoardlist");
    System.out.println(pressBoardlist);
    List<BoardDTO> updateBoardlist = (List<BoardDTO>) request.getAttribute("updateBoardlist");
    System.out.println(updateBoardlist);
%>

<html>
<head>
    <%@ include file="cdns.jsp" %>

    <link rel="stylesheet" href='<c:url value="/resource/CSS/guide/mainStyle.css"/>'>
    <link rel="stylesheet" href='<c:url value="/resource/CSS/guide/960px.css"/>'>
    <link rel="stylesheet" href='<c:url value="/resource/CSS/guide/600px.css"/>'>

    <title>Naver Dolphin</title>
</head>
<body>
<div id="wrap">
    <%@ include file="gnb.jsp" %>
    <main>
        <section id="guideMain">
            <section class="contentsWrap">
                <article class="contents-info">
                    <h1 data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="1200"
                        data-aos-anchor="#guideMain">What's New</h1>
                    <div class="c-whale-gray" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                         data-aos-duration="1200" data-aos-anchor="#guideMain" data-aos-delay="150">
                        <p class="long">
                            네이버 웨일의 최신 업데이트와 보도 자료 소식을 빠르게 전해드립니다.
                        </p>
                        <p class="short">
                            최신 업데이트와 소식을 전해 드립니다.
                        </p>
                    </div>
                </article>
                <div class="contents-img">
                    <picture>
                        <source srcset='<c:url value="/resource/img/img_press_260.png"/>' media="(max-width : 600px)">
                        <source srcset='<c:url value="/resource/img/img_press_470.png"/>' media="(max-width : 960px)">
                        <img src='<c:url value="/resource/img/img_press_680.png"/>' alt="">
                    </picture>
                </div>
            </section>
        </section>
        <section id="update">
            <div class="contentsWrap">
                <h2>
                    업데이트
                </h2>
                <button class="small" onclick="location.href = 'update_List.html'">더 보기</button>
            </div>
            <div class="contentsWrap">
                <%
                    BoardDTO update;
                    for (int i = 0; i < updateBoardlist.size(); i++) {
                        update = updateBoardlist.get(i);
                        if (update.getCategory().equals("Desktop")) {
                %>
                <div class="contents-card">
                    <a href="update_post.html">
                        <span class="tag">Desktop</span>
                        <img src='<c:url value="/resource/img/img_notice_desktop_820.png"/>' alt="">
                        <div>
                            <p>
                                <%= update.getSubject() %>
                            </p>
                            <span class="date"><%=update.getRegist_day()%></span></div>
                    </a>
                </div>
                <%
                            break;
                        }
                    }
                    for (int i = 0; i < updateBoardlist.size(); i++) {
                        update = updateBoardlist.get(i);
                        if (update.getCategory().equals("iOS")) {

                %>
                <div class="contents-card">
                    <a href="update_post.html">
                        <span class="tag">iOS</span>
                        <img src='<c:url value="/resource/img/img_notice_ios_820.png"/>' alt="">
                        <div>
                            <p>
                                <%= update.getSubject() %>
                            </p>
                            <span class="date"><%=update.getRegist_day()%></span></div>
                    </a>
                </div>
                <%
                            break;
                        }
                    }
                    for (int i = 0; i < updateBoardlist.size(); i++) {
                        update = updateBoardlist.get(i);
                        if (update.getCategory().equals("Android")) {

                %>
                <div class="contents-card">
                    <a href="update_post.html">
                        <span class="tag">Android</span>
                        <img src='<c:url value="/resource/img/img_notice_android_820.png"/>' alt="">
                        <div>
                            <p>
                                <%= update.getSubject() %>
                            </p>
                            <span class="date"><%=update.getRegist_day()%></span></div>
                    </a>
                </div>
                <%
                            break;
                        }
                    }
                %>
            </div>
        </section>
        <section id="press">
            <div class="contentsWrap">
                <h2>
                    보도자료
                </h2>
                <button class="small" onclick="location.href = 'press_List.html'">더 보기</button>
            </div>
            <div class="contentsWrap">
                <ul>

                    <%
                        for (int i = 0; i < 5; i++) {
                            BoardDTO press = (BoardDTO) pressBoardlist.get(i);
                    %>
                    <li>
                        <a href="press_post.html">
                             <span class="tag">
                                 <%= press.getCategory() %>
                             </span>
                            <span class="date">
                                <%= press.getRegist_day() %>
                             </span>
                            <p>
                                <%= press.getSubject() %>
                            </p>
                        </a>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </section>
    </main>
    <%@ include file="footer.jsp" %>
</div>
<script src='<c:url value="/resource/JS/gnb.js"/>'></script>
<script src='<c:url value="/resource/JS/mainJavaScript.js"/>'></script>
</body>
</html>
