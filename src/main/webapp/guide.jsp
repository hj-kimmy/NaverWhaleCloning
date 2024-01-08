<%@ page import="com.model.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
  int pageNum = (Integer) request.getAttribute("pageNum");
  List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardlist");
  int total_record = (Integer) request.getAttribute("total_record");
  int total_page = (Integer) request.getAttribute("total_page");

  String items = (String) request.getAttribute("items");
  String text = (String) request.getAttribute("text");

  System.out.println(items);
  System.out.println(text);
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
          <h1 data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="1200" data-aos-anchor="#guideMain">What's New</h1>
          <div class="c-whale-gray" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="1200" data-aos-anchor="#guideMain" data-aos-delay="150">
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
            <source srcset="img/img_press_260.png" media="(max-width : 600px)">
            <source srcset="img/img_press_470.png" media="(max-width : 960px)">
            <img src="img/img_press_680.png" alt="">
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
        <div class="contents-card">
          <a href="update_post.html">
            <span class="tag">Desktop</span>
            <img src="img/img_notice_desktop_820.png" alt="">
            <div>
              <p>
                v3.23.214.10 업데이트 안내
              </p>
              <span class="date">2023. 10. 31</span></div>
          </a>
        </div>
        <div class="contents-card">
          <a href="update_post.html">
            <span class="tag">iOS</span>
            <img src="img/img_notice_ios_820.png" alt="">
            <div>
              <p>
                v.2.1.0 업데이트 안내
              </p>
              <span class="date">2022. 2. 28</span></div>
          </a>
        </div>
        <div class="contents-card">
          <a href="update_post.html">
            <span class="tag">Android</span>
            <img src="img/img_notice_android_820.png" alt="">
            <div>
              <p>
                v.2.2.2.2 업데이트 안내
              </p>
              <span class="date">2022. 2. 22</span></div>
          </a>
        </div>
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
          <li>
            <a href="press_post.html">
              <span class="tag">환경조성</span><span class="date">2023.12.11</span>
              <p>네이버式 에듀테크, 대학가로 스며든다... '웨일 스페이스' 확장</p>
            </a>
          </li>
          <li>
            <a href="press_post.html">
              <span class="tag">환경조성</span><span class="date">2023.12.11</span>
              <p>웨일, 에듀테크 기술력으로 몽골 교육 디지털 전환 이끈다</p>
            </a>
          </li>
          <li>
            <a href="press_post.html">
              <span class="tag">환경조성</span><span class="date">2023.12.11</span>
              <p>네이버클라우드-전라북도교육청 MOU 체결... 웨일 스페이스, 전북 맞춤형 에듀테크 플랫폼으로 거듭난다</p>
            </a>
          </li>
          <li>
            <a href="press_post.html">
              <span class="tag">환경조성</span><span class="date">2023.12.11</span>
              <p>웨일 브라우저에서 환경 보호 실천해보세요! 네이버, 한국중앙자원봉사센터와 디지털 탄소 저감 캠페인 '그린웨일'진행한다</p>
            </a>
          </li>
          <li>
            <a href="press_post.html">
              <span class="tag">환경조성</span><span class="date">2023.12.11</span>
              <p>네이버클라우드 웨일, 미래형 교육 위한 교류의 장 'NWEC 2023' 개최... "함께 성장하는 에듀테크 생태계 조성할 것"</p>
            </a>
          </li>
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
