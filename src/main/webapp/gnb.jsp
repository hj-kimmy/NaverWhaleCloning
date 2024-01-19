<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String sessionID = (String)session.getAttribute("sessionID");
%>

<header>
    <!-- gnb_default -->
    <nav id="gnb">
        <h1 id="main-logo">
            <a href='<c:url value="/index.jsp"/>'>
                <div id="naver"></div>
                <div id="whale"></div>
            </a>
        </h1>
        <ul id="main-menu">
            <li class="active" id="home"><a href='<c:url value="/index.jsp"/>' class="check">홈</a>
            </li>
            <li>
                <div class="menu-sub-2">
                    <a href="whyWhale_BrandStory.html" class="check">Whale을 사용해야하는 이유
                        <span class="material-symbols-outlined dropdown">arrow_drop_down</span>
                    </a>
                </div>
                <div class="subMenuBoxWrap">
                    <ul class="subMenuBox hide">
                        <li><a href="whyWhale_BrandStory.html">브랜드 스토리</a></li>
                        <li><a href="details_Omnitasking.html">주요 기능</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <div class="menu-sub-2">
                    <a href='<c:url value="/BoardListAction.do?pageNum=1"/>' class="check">가이드
                        <span class="material-symbols-outlined dropdown">arrow_drop_down</span>
                    </a>
                </div>
                <div class="subMenuBoxWrap">
                    <ul class="subMenuBox hide">
                        <li><a href='<c:url value="/BoardListAction.do?pageNum=1"/>'>What's new</a></li>
                        <li><a href="whalehelp.html">이용 가이드</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="">스토어</a></li>
            <li><a href="whaleSpace.html">웨일 스페이스</a></li>
            <li><a href="whaleBook_Index.html">웨일북</a></li>
        </ul>
        <div id="subBtn">
            <button class="main-downloadBtn small" onclick="location.href = 'download.html'">
                <div class="whaleLogo whaleLogo-black"></div>
                다운로드
            </button>
            <c:choose>
                <c:when test='<%= sessionID == null %>'>
                    <button class="small c" onclick="location.href = '<c:url value="/login.jsp?where=whale&?msg=0"/>'">
                        로그인
                    </button>
                </c:when>
                <c:otherwise>
                    <div class="loginUserMenu">
                        <p class="loginMark c-whale-blue"><%= sessionID %>님 로그인</p>
                        <div class="subMenuBoxWrap">
                            <ul class="subMenuBox hide">
                                <li><a href='<c:url value="/logout.jsp"/>'>로그아웃</a></li>
                                <li><a href="details_Omnitasking.html">회원정보수정</a></li>
                            </ul>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
            <div id="gnb-appMenu">
                <img src='<c:url value="/resource/img/apps.svg"/>' alt="바로가기" title="바로가기">
                <ul class="subMenuBox hide">
                    <li>
                        <strong>웨일 서비스</strong>
                    </li>
                    <li>
                        <ul class="appMenu-Apps">
                            <li><a href=""><img src='<c:url value="/resource/img/ic_whale.png"/>' alt="">마이 액티비티</a></li>
                            <li><a href=""><img src='<c:url value="/resource/img/ic_whale_store.png"/>' alt="">웨일 스토어</a></li>
                            <li><a href="whalehelp.html"><img src='<c:url value="/resource/img/ic_help.png"/>' alt="">웨일 헬프센터</a></li>
                            <li><a href=""><img src='<c:url value="/resource/img/ic_whale_lab.png"/>' alt="">웨일 연구소</a></li>
                            <li><a href=""><img src='<c:url value="/resource/img/ic_whale_dev.png"/>' alt="">웨일 개발자센터</a></li>
                            <li><a href='<c:url value="/index.jsp"/>'><img src='<c:url value="/resource/img/ic_whaleon.png"/>' alt="">웨일온</a></li>
                            <li><a href=""><img src='<c:url value="/resource/img/ic_whaleon_study.png"/>' alt="">웨일온 스터디</a></li>
                            <li><a href=""><img src='<c:url value="/resource/img/ic_whale_class.png"/>' alt="">웨일 클래스</a></li>
                            <li><a href="whaleSpace.html"><img src='<c:url value="/resource/img/ic_whalespace.png"/>' alt="">웨일 스페이스</a></li>
                            <li><a href="whaleBook_Index.html"><img src='<c:url value="/resource/img/ic_whalebook.png"/>' alt="">웨일북</a></li>
                            <li><a href=""><img src='<c:url value="/resource/img/ic_whale.png"/>' alt="">버그바운티</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div id="menuBtn"><i class="fa-solid fa-bars"></i></div>
        </div>
    </nav>

    <!-- gnb_mobile -->
    <div class="cover"></div>
    <nav id="mobileGnb">
        <ul id="mobile-menu">
            <div class="mobile-menu-nav">
                <span class="material-symbols-outlined mobile-menu-btn xBtn">close</span>
                <span class="mobile-menu-btn"><img src='<c:url value="/resource/img/apps.svg"/>' alt="바로가기" title="바로가기"></span>
            </div>
            <li id="mobile-home">
                <a href='<c:url value="/index.jsp"/>'>홈
                    <span class="material-symbols-outlined arrow">chevron_right</span>
                </a>
            </li>
            <li>
                <a href="whyWhale_BrandStory.html">Whale을 사용해야하는 이유
                    <span class="material-symbols-outlined arrow">chevron_right</span>
                </a>
            </li>
            <li>
                <ul>
                    <li><a href="whyWhale_BrandStory.html">브랜드 스토리</a></li>
                    <li><a href="details_Omnitasking.html">주요 기능</a></li>
                </ul>
            </li>
            <hr>
            <li>
                <a href='<c:url value="/BoardListAction.do?pageNum=1"/>'>가이드
                    <span class="material-symbols-outlined arrow">chevron_right</span>
                </a></li>
            <li>
                <ul>
                    <li><a href='<c:url value="/BoardListAction.do?pageNum=1"/>'>What's new</a></li>
                    <li><a href="whalehelp.html">이용 가이드</a></li>
                </ul>
            </li>
            <hr>
            <li><a href="">스토어
                <span class="material-symbols-outlined arrow">chevron_right</span>
            </a>
            </li>
            <li><a href="whaleSpace.html">웨일 스페이스
                <span class="material-symbols-outlined arrow">chevron_right</span>
            </a>
            </li>
            <li><a href="whaleBook_Index.html">웨일북
                <span class="material-symbols-outlined arrow">chevron_right</span>
            </a>
            </li>
                <c:if test="<%= sessionID != null %>">
                    <hr>
                    <li class="c-whale-blue">
                        <%= sessionID %>님 로그인</p>
                    </li>
                    <li>
                        <ul>
                            <li><a href='<c:url value="/BoardListAction.do?pageNum=1"/>'>로그아웃</a></li>
                            <li><a href="whalehelp.html">회원정보 수정</a></li>
                        </ul>
                    </li>
                </c:if>
        </ul>
        <div class="downloadBtn">
            <c:if test="<%= sessionID == null %>">
                <button class="" onclick="location.href = '<c:url value="/login.jsp?where=whale&?msg=0"/>'">
                    로그인
                </button>
            </c:if>
            <button class="" onclick="location.href = 'download.html'">
                <span class="whaleLogo whaleLogo-color"></span>
                다운로드
            </button>
        </div>
    </nav>

    <div id="mobile-subMenu">
        <div id="mobile-gnb-appMenu">
            <div class="mobile-menu-nav">
                <span class="material-symbols-outlined BackBtn">chevron_left</span>
                바로가기
            </div>
            <h4>웨일 서비스</h4>
            <ul>
                <li><a href=""><img src='<c:url value="/resource/img/ic_whale.png"/>' alt="">마이 액티비티</a></li>
                <li><a href=""><img src='<c:url value="/resource/img/ic_whale_store.png"/>' alt="">웨일 스토어</a></li>
                <li><a href="whalehelp.html"><img src='<c:url value="/resource/img/ic_help.png"/>' alt="">웨일 헬프센터</a></li>
                <li><a href=""><img src='<c:url value="/resource/img/ic_whale_lab.png"/>' alt="">웨일 연구소</a></li>
                <li><a href=""><img src='<c:url value="/resource/img/ic_whale_dev.png"/>' alt="">웨일 개발자센터</a></li>
                <li><a href='<c:url value="/index.jsp"/>'><img src='<c:url value="/resource/img/ic_whaleon.png"/>' alt="">웨일온</a></li>
                <li><a href=""><img src='<c:url value="/resource/img/ic_whaleon_study.png"/>' alt="">웨일온 스터디</a></li>
                <li><a href=""><img src='<c:url value="/resource/img/ic_whale_class.png"/>' alt="">웨일 클래스</a></li>
                <li><a href=""><img src='<c:url value="/resource/img/ic_whalespace.png"/>' alt="">웨일 스페이스</a></li>
                <li><a href="whaleBook_Index.html"><img src='<c:url value="/resource/img/ic_whalebook.png"/>' alt="">웨일북</a></li>
                <li><a href=""><img src='<c:url value="/resource/img/ic_whale.png"/>' alt="">버그바운티</a></li>
            </ul>
        </div>
    </div>
</header>