<%@ page import="com.model.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%
    int pageNum = (Integer) request.getAttribute("pageNum");
    List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardlist");
    int total_page = (Integer) request.getAttribute("total_page");
    String table = (String) request.getAttribute("table");
    String category = (String) request.getAttribute("category");
    String text = (String) request.getAttribute("text");

    System.out.println(table);
    System.out.println(pageNum);
    System.out.println(total_page);
%>
<section id="guideList" class="update">
    <div class="contentsWrap">
        <div id="tabs">
            <c:set var="table" value="<%=table%>"/>
            <c:set var="pageNum" value="<%=pageNum%>" />
            <c:set var="text" value="<%=text%>" />

            <!-- 게시글 탭 / 검색창 -->
            <div class="search">
                <ul class="contents-btns ">
                    <li class="active"><a href='<c:url value = "/BoardListAction.do?table=${table}&text=${text}&pageNum=1"/>' class="c-whale-gray">전체</a></li>
                    <li><a href='<c:url value = "/BoardListAction.do?table=${table}&category=Desktop&text=${text}&pageNum=1"/>' class="c-whale-gray">Desktop</a></li>
                    <li><a href='<c:url value = "/BoardListAction.do?table=${table}&category=iOS&text=${text}&pageNum=1"/>' class="c-whale-gray">iOS</a></li>
                    <li><a href='<c:url value = "/BoardListAction.do?table=${table}&category=Android&text=${text}&pageNum=1"/>' class="c-whale-gray">Android</a></li>
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
                    <li>
                        <p class="small"><span><%=dto.getSubject()%></span><span class="date"><%=dto.getRegist_day()%></span>
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
                            <li class="active num" onclick="location.href='<c:url value = "./BoardListAction.do?table=${table}&category=${category}&text=${text}&pageNum=${i}"/>'">${i}</li>
                        </c:when>
                        <c:otherwise>
                            <li class="num">${i}</li>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <c:if test="${text==null}">
                    <c:choose>
                        <c:when test="${pageNum==i}">
                            <li class="active num" onclick="location.href='<c:url value = "./BoardListAction.do?table=${table}&category=${category}&pageNum=${i}"/>'">${i}</li>
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
