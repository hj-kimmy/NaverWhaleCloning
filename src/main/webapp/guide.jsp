<%@ page import="com.model.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    List<BoardDTO> pressBoardList = (List<BoardDTO>) request.getAttribute("pressBoardList");
    System.out.println(pressBoardList);
    List<BoardDTO> updateBoardList = (List<BoardDTO>) request.getAttribute("updateBoardList");
    System.out.println(updateBoardList);
%>

<html>
<head>
    <%@ include file="/cdns.jsp" %>

    <link rel="stylesheet" href='<c:url value="/resource/CSS/NaverWhale/mainStyle_guideMain.css"/>'>
    <link rel="stylesheet" href='<c:url value="/resource/CSS/NaverWhale/mediaQuery_guideMain.css"/>'>

</head>
<body>
<div id="wrap">
    <%@ include file="/gnb.jsp" %>
    <main>
        <c:set var="desktop" value="<%=(BoardDTO)updateBoardList.get(0)%>"/>
        <c:set var="iOS" value="<%=(BoardDTO)updateBoardList.get(1)%>"/>
        <c:set var="android" value="<%=(BoardDTO)updateBoardList.get(2)%>"/>
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
                <button class="small"
                        onclick="location.href = '<c:url value="/BoardListAction.do?table=update&pageNum=1"/>'">더 보기
                </button>
            </div>
            <div class="contentsWrap">
                <div class="contents-card">

                    <a href='<c:if test="${desktop.getNum()!=0}"><c:url value="/BoardViewAction.do?&table=update&num=${desktop.getNum()}"/></c:if><c:if test="${desktop.getNum()==0}">#</c:if>'>
                        <span class="tag">Desktop</span>
                        <img src='<c:url value="/resource/img/img_notice_desktop_820.png"/>' alt="">
                        <div>
                            <c:if test="${desktop!=null}">
                                <p>
                                        ${desktop.getSubject()}
                                </p>
                                <span class="date">${desktop.getRegist_day()}</span>
                            </c:if>
                        </div>
                    </a>
                </div>
                <div class="contents-card">
                    <a href='<c:if test="${iOS.getNum()!=0}"><c:url value="/BoardViewAction.do?&table=update&num=${iOS.getNum()}"/></c:if><c:if test="${iOS.getNum()!=0}">#</c:if>'>
                        <span class="tag">iOS</span>
                        <img src='<c:url value="/resource/img/img_notice_ios_820.png"/>' alt="">
                        <div>
                            <c:if test="${iOS!=null}">
                                <p>
                                        ${iOS.getSubject()}
                                </p>
                                <span class="date">${iOS.getRegist_day()}</span>
                            </c:if>
                        </div>
                    </a>
                </div>

                <div class="contents-card">
                    <a href='<c:if test="${android.getNum()!=0}"><c:url value="/BoardViewAction.do?&table=update&num=${android.getNum()}"/></c:if><c:if test="${android.getNum()==0}">#</c:if>'>
                        <span class="tag">Android</span>
                        <img src='<c:url value="/resource/img/img_notice_android_820.png"/>' alt="">
                        <div>
                            <c:if test="${android!=null}">
                                <p>
                                        ${android.getSubject()}
                                </p>
                                <span class="date">${android.getRegist_day()}</span>
                            </c:if>
                        </div>
                    </a>
                </div>

            </div>
        </section>
        <section id="press">
            <div class="contentsWrap">
                <h2>
                    보도자료
                </h2>
                <button class="small"
                        onclick="location.href = '<c:url value="/BoardListAction.do?table=press&pageNum=1"/>'">더 보기
                </button>
            </div>
            <div class="contentsWrap">
                <ul>

                    <%
                        for (int i = 0; i < pressBoardList.size(); i++) {
                            BoardDTO dto = (BoardDTO) pressBoardList.get(i);
                    %>
                    <c:set var="num" value="<%=dto.getNum()%>"/>
                    <li>
                        <a href='<c:url value="/BoardViewAction.do?&table=press&num=${num}"/>'>
                             <span class="tag">
                                 <%= dto.getCategory() %>
                             </span>
                            <span class="date">
                                <%= dto.getRegist_day() %>
                             </span>
                            <p>
                                <%= dto.getSubject() %>
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
    <%@ include file="/footer.jsp" %>
</div>
<script src='<c:url value="/resource/JS/gnb.js"/>'></script>
</body>
</html>
