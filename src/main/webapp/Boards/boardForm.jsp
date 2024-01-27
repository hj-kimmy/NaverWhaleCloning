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
        BoardDTO update = null;
        if (request.getAttribute("now") != null) {
            update = (BoardDTO) request.getAttribute("now");
        }
        String name = (String) request.getAttribute("name");
        String table = (String) request.getAttribute("table");

        String[] updateCategories = {"Desktop", "iOS", "Android"};
        String[] pressCategories = {"출시소식", "학급지원", "환경조성"};
        String[] arr = new String[3];
    %>
    <c:set var="table" value="<%=table%>"/>
    <c:set var="updateDto" value="<%=update%>"/>
    <main>
        <c:if test='${table eq "update"}'>
            <%@ include file="/Boards/boardheader_update.jsp" %>
            <%
                arr = updateCategories;
            %>
        </c:if>
        <c:if test='${table eq "press"}'>
            <%@ include file="/Boards/boardheader_press.jsp" %>
            <%
                arr = pressCategories;
            %>
        </c:if>

        <!---------------------
        section1. 게시글 리스트
        ----------------------->
        <!---------------------
            section1. 게시글 쓰기
         ----------------------->
        <section id="guideForm">
            <div class="contentsWrap">
                <p class="smallest c-whale-gray">
                    <sup>*</sup> 관리자만 작성할 수 있는 게시글입니다. 작성 전 내용을 확인해주세요.
                </p>
                <form name="board_update" method="post" id="board_update">
                    <c:if test="${updateDto!=null}">
                        <input type="hidden" name="num" value="<%=update.getNum()%>">
                    </c:if>
                    <input type="hidden" name="name" value="<%=name%>">
                    <input type="hidden" name="id" value="<%=sessionID%>">
                    <input type="hidden" name="table" value="<%=table%>">
                    <div id="menus">
                        <div id="now">
                            <span>
                                <%
                                    String selected = null;
                                    for (int i = 0; i < arr.length; i++) {
                                        if (update != null && arr[i].equals(update.getCategory())) {
                                            selected = arr[i];
                                            break;
                                        } else if (update == null) {
                                            selected = arr[0];
                                            break;
                                        }
                                    }
                                %>
                                <%=selected%>
                            </span>
                            <span class="material-symbols-outlined">expand_more</span>
                        </div>
                        <div id="category" class="button-group">
                            <%
                                for (int i = 0; i < arr.length; i++) {
                            %>
                            <button class="button
                                            <%
                                            if(arr[i].equals(selected)){
                                            %>
                                            is-checked
                                            <%
                                            }
                                            %>
                                            " type="button">
                                <span><%=arr[i]%></span>
                                <span class="material-symbols-outlined">check</span>
                            </button>
                            <%
                                }
                            %>

                        </div>
                    </div>
                    <input type="hidden" name="category" id="categoryValue">

                    <p>
                        <input type="text" id="subject" name="subject" placeholder="제목"
                               value="<c:if test="${updateDto!=null}">${updateDto.subject}</c:if>">
                    </p>
                    <p>
                        <textarea name="content" id="content" rows="20" placeholder="공지사항을 업로드 하기 전에 내용을 확인 바랍니다."><c:if
                                test="${updateDto!=null}">${updateDto.contents}</c:if></textarea>
                    </p>
                    <div class="contents-btns">
                        <c:if test="${updateDto!=null}">
                            <button class="whale-Button small" type="button" id="updateBtn"> 수정</button>
                        </c:if>
                        <c:if test="${updateDto==null}">
                            <button class="whale-Button small" type="button" id="insertBtn"> 등록</button>
                        </c:if>
                        <button class="small" type="reset"> 초기화</button>
                        <button class="small" type="button" onclick="history.back()"> 이전</button>
                    </div>
                </form>
            </div>
            <p id="#test"></p>
        </section>
    </main>
    <%@ include file="/footer.jsp" %>
    <script src='<c:url value="/resource/JS/checkMenu.js"/>'></script>
</div>
</body>
</html>
