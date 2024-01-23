<%@ page import="com.model.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <%@ include file="/cdns.jsp" %>

    <!---------------------
        Custom Stylesheet
    ----------------------->
    <link rel="stylesheet" href='<c:url value="/resource/CSS/NaverWhale/mainStyle_guideDetail.css"/>'>
</head>
<body>
<div id="wrap">
    <%@ include file="/gnb.jsp" %>
    <%
        int pageNum = (Integer) request.getAttribute("pageNum");
        List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardlist");
        int total_page = (Integer) request.getAttribute("total_page");
        String table = (String) request.getAttribute("table");
        String category = (String) request.getAttribute("category");
        String text = (String) request.getAttribute("text");

        String[] updateCategories = {"Desktop", "iOS", "Android"};
        String[] pressCategories = {"출시소식", "학급지원", "환경조성"};

        System.out.println(category);
        System.out.println(table);
        System.out.println(pageNum);
        System.out.println(total_page);
    %>
    <main>
        <c:set var="table" value="<%=table%>"/>
        <c:set var="pageNum" value="<%=pageNum%>"/>
        <c:set var="text" value="<%=text%>"/>
        <c:set var="category" value="<%=category%>"/>


        <c:if test='${table eq "update"}'>
            <%@ include file="/Boards/boardheader_update.jsp" %>
        </c:if>
        <c:if test='${table eq "press"}'>
            <%@ include file="/Boards/boardheader_press.jsp" %>
        </c:if>

        <!---------------------
        section1. 게시글 리스트
        ----------------------->
        <section id="guideList" class="update">
            <div class="contentsWrap">
                <div id="tabs">

                    <!-- 게시글 탭 / 검색창 -->
                    <div class="search">
                        <ul class="contents-btns ">
                            <c:if test='${table eq "update"}'>
                                <c:set var="menu" value="<%=updateCategories%>"/>
                            </c:if>
                            <c:if test='${table eq "press"}'>
                                <c:set var="menu" value="<%=pressCategories%>"/>
                            </c:if>

                            <c:if test='${category == null}'>
                                <li class="active"><a
                                        href='<c:url value="/BoardListAction.do?table=${table}&text=${text}&pageNum=1"/>'
                                        class="c-whale-gray">전체</a></li>
                                <c:forEach var="i" begin="0" end="2">
                                    <li>
                                        <a href='<c:url value="/BoardListAction.do?table=${table}&category=${menu[i]}&text=${text}&pageNum=1"/>'
                                           class="c-whale-gray">${menu[i]}</a>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <c:if test='${category != null}'>
                                <li><a
                                        href='<c:url value="/BoardListAction.do?table=${table}&text=${text}&pageNum=1"/>'
                                        class="c-whale-gray">전체</a></li>
                                <c:forEach var="i" begin="0" end="2">
                                    <c:if test="${category eq menu[i]}">
                                        <li class="active">
                                            <a href='<c:url value="/BoardListAction.do?table=${table}&category=${menu[i]}&text=${text}&pageNum=1"/>'
                                               class="c-whale-gray">${menu[i]}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${!category.equals(menu[i])}">
                                        <li>
                                            <a href='<c:url value="/BoardListAction.do?table=${table}&category=${menu[i]}&text=${text}&pageNum=1"/>'
                                               class="c-whale-gray">${menu[i]}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </c:if>

                            <c:if test='${sessionID!=null&&sessionID.equals("admin")}'>
                                <button class="small">글쓰기</button>
                            </c:if>
                        </ul>
                        <form action="">
                            <input type="text" placeholder="제목, 내용"><img
                                src='<c:url value="/resource/img/search_2.svg"/>'
                                alt="">
                        </form>
                    </div>

                    <!-- 게시판 -->
                    <div id="tabs-1" class="contents-tabs">
                        <ul class="contents-tab-layer active">
                            <%
                                for (int i = 0; i < boardList.size(); i++) {
                                    BoardDTO dto = (BoardDTO) boardList.get(i);
                            %>
                            <c:set var="num" value="<%=dto.getNum()%>"/>
                            <li onclick="location.href = '<c:url value="/BoardViewAction.do?&table=${table}&num=${num}"/>'">
                                <p class="small"><span><%=dto.getSubject()%></span><span
                                        class="date"><%=dto.getRegist_day()%></span>
                                </p>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- 페이징 버튼 -->
            <div class="contents-btns">
                <ul>
                    <li>
                        <span class="material-symbols-outlined">chevron_left</span>
                    </li>
                    <c:forEach var="i" begin="1" end="<%=total_page%>">
                        <c:if test="${text!=null}">
                            <c:choose>
                                <c:when test="${pageNum==i}">
                                    <li class="active num" onclick="location.href='<c:url
                                            value="./BoardListAction.do?table=${table}&category=${category}&text=${text}&pageNum=${i}"/>'">${i}</li>
                                </c:when>
                                <c:otherwise>
                                    <li class="num">${i}</li>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${text==null}">
                            <c:choose>
                                <c:when test="${pageNum==i}">
                                    <li class="active num" onclick="location.href='<c:url
                                            value="./BoardListAction.do?table=${table}&category=${category}&pageNum=${i}"/>'">${i}</li>
                                </c:when>
                                <c:otherwise>
                                    <li class="num">${i}</li>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </c:forEach>
                    <li>
                        <span class="material-symbols-outlined">chevron_right</span>
                    </li>
                </ul>
            </div>
        </section>
    </main>
    <%@ include file="/footer.jsp" %>
</div>
</body>
</html>
