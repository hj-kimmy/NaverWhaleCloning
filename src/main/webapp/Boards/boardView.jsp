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
        BoardDTO now = (BoardDTO) request.getAttribute("now");
        BoardDTO next = (BoardDTO) request.getAttribute("next");
        BoardDTO prev = (BoardDTO) request.getAttribute("prev");
        String table = (String) request.getAttribute("table");
    %>
    <c:set var="table" value="<%=table%>"/>
    <c:set var="boardNum" value="<%=now.getNum()%>"/>
    <main>
        <c:if test='${table eq "update"}'>
            <%@ include file="/Boards/boardheader_update.jsp" %>
        </c:if>
        <c:if test='${table eq "press"}'>
            <%@ include file="/Boards/boardheader_press.jsp" %>
        </c:if>

        <!---------------------
        section1. 게시글 리스트
        ----------------------->
        <!---------------------
        section1. 게시글 본문
        ----------------------->
        <section id="guidePost" class="update">
            <div class="contentsWrap">

                <!-- title -->
                <div class="contents-post-title">
                    <p class="small"><span><strong><%=now.getSubject()%></strong></span><span
                            class="date"><%=now.getRegist_day()%></span></p>
                    <div>
                        <span class="material-symbols-outlined">format_size</span>
                        <span class="material-symbols-outlined">link</span>
                    </div>
                </div>

                <!-- 게시글 내용 -->
                <div class="contents-post">
                    <%=now.getContents()%>
                </div>
            </div>

            <!-- 이전글/다음글 -->
            <div class="contentsWrap">
                <ul class="contents-post-nav">
                    <c:set var="next" value="<%=next%>"/>
                    <c:if test="${next!=null}">
                        <c:set var="nextNum" value="<%=next.getNum()%>"/>
                        <li onclick="location.href = '<c:url
                                value="/BoardViewAction.do?&table=${table}&num=${nextNum}"/>'">
                            <span>이전</span><span><%=next.getSubject()%></span><span
                                class="date"><%=next.getRegist_day()%></span>
                        </li>
                    </c:if>

                    <c:set var="prev" value="<%=prev%>"/>
                    <c:if test="${prev!=null}">
                        <c:set var="prevNum" value="<%=prev.getNum()%>"/>
                        <li onclick="location.href = '<c:url
                                value="/BoardViewAction.do?&table=${table}&num=${prevNum}"/>'">
                            <span>다음</span><span><%=prev.getSubject()%></span><span
                                class="date"><%=prev.getRegist_day()%></span>
                        </li>
                    </c:if>
                </ul>
                <div class="contents-btns">
                    <c:if test='${sessionID!=null&&sessionID.equals("admin")}'>
                        <button class="small" type="button" id="updateBtn" onclick="location.href='<c:url value="/BoardUpdateForm.do?&table=${table}&num=${boardNum}"/>'">글수정
                        </button>
                        <button class="small" type="button" id="deleteBtn" onclick='checkDelete()'>글삭제
                        </button>
                    </c:if>
                </div>
                <button class="toList" onclick="location.href = '<c:url value="/BoardListAction.do?table=${table}&pageNum=1"/>'">목록
                </button>

            </div>
        </section>
    </main>
    <%@ include file="/footer.jsp" %>
    <script>
        function checkDelete(){
            if(confirm("해당 글을 삭제 하시겠습니까?")) {
                location.href="<c:url value='/BoardDeleteAction.do?table=${table}&num=${boardNum}'/>"
            }
        }
    </script>
</div>
</body>
</html>
