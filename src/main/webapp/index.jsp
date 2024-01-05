<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <%@ include file="cdns.jsp" %>

    <link rel="stylesheet" href='<c:url value="/resource/CSS/Index/mainStyle.css"/>'>
    <link rel="stylesheet" href='<c:url value="/resource/CSS/Index/1440px.css"/>'>
    <link rel="stylesheet" href='<c:url value="/resource/CSS/Index/1320px.css"/>'>
    <link rel="stylesheet" href='<c:url value="/resource/CSS/Index/1280px.css"/>'>
    <link rel="stylesheet" href='<c:url value="/resource/CSS/Index/960px.css"/>'>
    <link rel="stylesheet" href='<c:url value="/resource/CSS/Index/800px.css"/>'>
    <link rel="stylesheet" href='<c:url value="/resource/CSS/Index/600px.css"/>'>

    <title>Naver Dolphin</title>
</head>
<body>
<div id="wrap">
    <%@ include file="gnb.jsp" %>
    <main>
        <!-- 특장점 section -->
        <section id="feature">
            <section class="contentsWrap" id="feature1">
                <article class="contents-info-btn">
                    <h3 class="c-whale-blue" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                        data-aos-duration="1200" data-aos-easing="ease-out" data-aos-anchor="#feature1">나만의 스마트한
                        브라우저</h3>
                    <h1 class="important" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                        data-aos-duration="1200" data-aos-easing="ease-out" data-aos-delay="300"
                        data-aos-anchor="#feature1">네이버 웨일로 일상을 바꿔보세요.</h1>
                    <div class="c-whale-gray" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                         data-aos-duration="1200" data-aos-easing="ease-out" data-aos-delay="600"
                         data-aos-anchor="#feature1">
                        <p>
                            더 가볍게, 더 편하게, 내 일상에 딱 맞는 브라우저가 여기 있습니다. 새로운 인터넷으로 하루를 열어보세요. 작지만 큰 변화가 시작됩니다.
                        </p>
                        <button class="whale-Button">
                            <span class="whaleLogo whaleLogo-white"></span>
                            웨일 다운로드
                        </button>
                    </div>
                </article>
                <div class="contents-video" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                     data-aos-duration="800" data-aos-anchor="#feature1">
                    <video class="whale_loop hevcVideo" autoplay
                           muted loop playsinline>
                        <source src='<c:url value="/resource/img/main_loop.mov"/>' type="video/mp4">
                    </video>
                    <video class="whale_loop webmVideo" autoplay
                           muted loop playsinline>
                        <source src='<c:url value="/resource/img/main_loop.webm"/>' type="video/webm">
                    </video>
                    <video class="whale_show hevcVideo" autoplay
                           muted playsinline>
                        <source src='<c:url value="/resource/img/main_intro.mov"/>' type='video/mp4'>
                    </video>
                    <video class="whale_show webmVideo" autoplay
                           muted playsinline>
                        <source src='<c:url value="/resource/img/main_intro.webm"/>' type="video/webm">
                    </video>
                </div>
            </section>
            <section class="contentsWrap" id="feature2">
                <article class="contents-info-btn">
                    <h3 class="c-whale-blue" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                        data-aos-duration="1200" data-aos-easing="ease-out" data-aos-anchor="#feature2">오늘 할 일도 빠르게</h3>
                    <h1 data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="1200"
                        data-aos-easing="ease-out" data-aos-delay="300" data-aos-anchor="#feature2"> 시간 걱정 없는 화상회의
                        웨일온</h1>
                    <div class="c-whale-gray" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                         data-aos-duration="1200" data-aos-easing="ease-out" data-aos-delay="600"
                         data-aos-anchor="#feature2">
                        <p>
                            별도 애플리케이션 설치 없이 네이버 웨일만 있으면 바로 사용할 수 있는 온라인 화상회의 서비스입니다. PC와 모바일 어디서나 시간 제한 없이 편리하게 회의에
                            참여하세요.
                        </p>
                        <button onclick="location.href='whalehelp.html'">자세히 보기</button>
                    </div>
                </article>
                <div class="contents-video" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                     data-aos-duration="1200" data-aos-easing="ease-out" data-aos-anchor="#feature2">
                    <video playsinline autoplay muted class="hevcVideo">
                        <source src='<c:url value="/resource/img/main_whaleon.mov"/>' type='video/mp4' class="hevcVideo">
                    </video>
                    <video playsinline autoplay muted class="webmVideo">
                        <source src='<c:url value="/resource/img/main_whaleon.webm"/>' type="video/webm">
                    </video>
                </div>
            </section>
            <section class="contentsWrap" id="feature3">
                <article class="contents-info-btn">
                    <h3 class="c-whale-blue" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                        data-aos-duration="1200" data-aos-easing="ease-out" data-aos-anchor="#feature3">오늘 할 일도 빠르게</h3>
                    <h1 class="aniOrder2" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                        data-aos-duration="1200" data-aos-easing="ease-out" data-aos-delay="300"
                        data-aos-anchor="#feature3">가볍게 열고 닫는 사이드바</h1>
                    <div class="c-whale-gray" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                         data-aos-duration="1200" data-aos-easing="ease-out" data-aos-delay="600"
                         data-aos-anchor="#feature3">
                        <p>
                            사이드바에는 나에게 필요한 다양한 서비스가 있습니다. 메인 화면을 방해하지 않으면서 그때그때 필요한 서비스를 가볍게 열어보세요
                        </p>
                        <button onclick="location.href='whalehelp.html'">자세히 보기</button>
                    </div>
                </article>
                <div class="contents-video" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                     data-aos-duration="1200" data-aos-easing="ease-out" data-aos-anchor="#feature3">
                    <video playsinline autoplay muted class="hevcVideo">
                        <source src='<c:url value="/resource/img/main_sidebar.mov"/>' type='video/mp4' class="hevcVideo">
                    </video>
                    <video playsinline autoplay muted class="webmVideo">
                        <source src='<c:url value="/resource/img/main_sidebar.webm"/>' type="video/webm">
                    </video>
                </div>
            </section>
            <section class="contentsWrap" id="feature4">
                <article class="contents-info-btn">
                    <h3 class="c-whale-blue" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                        data-aos-duration="1200" data-aos-easing="ease-out" data-aos-anchor="#feature4">오늘 할 일도 빠르게</h3>
                    <h1 data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="1200"
                        data-aos-easing="ease-out" data-aos-delay="300" data-aos-anchor="#feature4">두 개의 탭을 하나로 듀얼
                        탭</h1>
                    <div class="c-whale-gray" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                         data-aos-duration="1200" data-aos-easing="ease-out" data-aos-delay="600"
                         data-aos-anchor="#feature4">
                        <p>
                            여러 탭을 왔다 갔다 헤메느라 시간을 낭비하지 마세요. 듀얼 탭에서는 왼쪽에서 클릭한 링크를 오른쪽으로 열 수 있습니다.
                        </p>
                        <button onclick="location.href='whalehelp.html'">자세히 보기</button>
                    </div>

                </article>
                <div class="contents-video" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                     data-aos-duration="1200" data-aos-easing="ease-out" data-aos-anchor="#feature4">
                    <video playsinline autoplay muted class="hevcVideo">
                        <source src='<c:url value="/resource/img/main_dualtab.mov"/>' type='video/mp4' class="hevcVideo">
                    </video>
                    <video playsinline autoplay muted class="webmVideo">
                        <source src='<c:url value="/resource/img/main_dualtab.webm"/>' type="video/webm">
                    </video>
                </div>
            </section>
            <section class="contentsWrap" id="feature5">
                <article class="contents-info-btn">
                    <h3 class="c-whale-blue" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                        data-aos-duration="1200" data-aos-easing="ease-out" data-aos-anchor="#feature5">오늘 할 일도 빠르게</h3>
                    <h1 data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="1200"
                        data-aos-easing="ease-out" data-aos-delay="300" data-aos-anchor="#feature5">궁금한 건 드래그하고 퀵서치</h1>
                    <div class="c-whale-gray" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                         data-aos-duration="1200" data-aos-easing="ease-out" data-aos-delay="600"
                         data-aos-anchor="#feature5">
                        <p>
                            웹 페이지를 읽다가 궁금하거나 번역이 필요한 내용은 드래그하고 퀵서치로 확인해보세요. 퀵서치는 맥락에 맞는 단어를 검색하고 문장도 번역해줍니다.
                        </p>
                        <button onclick="location.href='whalehelp.html'">자세히 보기</button>
                    </div>
                </article>
                <div class="contents-video" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                     data-aos-duration="1200" data-aos-easing="ease-out" data-aos-anchor="#feature5">
                    <video playsinline autoplay muted class="hevcVideo">
                        <source src='<c:url value="/resource/img/main_quicksearch.mov"/>' type='video/mp4'>
                    </video>
                    <video playsinline autoplay muted class="webmVideo">
                        <source src='<c:url value="/resource/img/main_quicksearch.webm"/>' type="video/webm">
                    </video>
                </div>
            </section>
            <section class="contentsWrap" id="feature6">
                <article class="contents-info-btn">
                    <h3 class="c-whale-blue" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                        data-aos-duration="1200" data-aos-easing="ease-out" data-aos-anchor="#feature6">오늘 할 일도 빠르게</h3>
                    <h1 data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="1200"
                        data-aos-easing="ease-out" data-aos-delay="300" data-aos-anchor="#feature6">깔끔한 캡처와 간단한 편집</h1>
                    <div class="c-whale-gray" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                         data-aos-duration="1200" data-aos-easing="ease-out" data-aos-delay="600"
                         data-aos-anchor="#feature6">
                        <p>
                            4개의 옵션으로 원하는 영역만 깔끔하게 캡처하고 간단히 편집해 보세요. 단축키를 사용하면 더욱 빠른 캡처가 가능합니다.
                        </p>
                        <button onclick="location.href='whalehelp.html'">자세히 보기</button>
                    </div>

                </article>
                <div class="contents-video" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                     data-aos-duration="1200" data-aos-easing="ease-out" data-aos-anchor="#feature6">
                    <video playsinline autoplay muted class="hevcVideo">
                        <source src='<c:url value="/resource/img/main_capture.mov"/>' type='video/mp4'>
                    </video>
                    <video playsinline autoplay muted class="webmVideo">
                        <source src='<c:url value="/resource/img/main_capture.webm"/>' type="video/webm">
                    </video>
                </div>
            </section>
        </section>

        <!-- 보안장점 section -->
        <section id="secure">
            <div class="titleWrap">
                <h3 class="c-whale-blue" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                    data-aos-duration="800" data-aos-easing="ease-out" data-aos-anchor="#secure">내 정보는 안전하게</h3>
                <h1 data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="800"
                    data-aos-easing="ease-out" data-aos-delay="300" data-aos-anchor="#secure">최신 기술이 적용된 <br
                        class="br-600">강력한 보안</h1>
                <p class="c-whale-gray" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                   data-aos-duration="800" data-aos-easing="ease-out" data-aos-delay="600" data-aos-anchor="#secure">네이버
                    웨일은 끊임없는 업데이트로 빈틈없는 보안 환경을 제공합니다. 안심하고 오늘의 할 일에만 집중하세요.</p>
            </div>
            <div class="contentsWrap">
                <div id="accordion" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="800"
                     data-aos-easing="ease-out" data-aos-delay="900" data-aos-anchor="#secure">
                    <div class="contents-accordion active">
                        <h4>세이프 브라우징</h4>
                        <p><span>헷갈리는 위조 사이트로 인한 걱정은 이제 그만, 네이버 웨일이 미리 판단하여 알려줍니다.</span>
                            <img class="active contents-thumbnail" src='<c:url value="/resource/img/img_safe_browsing.png"/>' alt=""></p>
                        <ul class="contents-list-btn">
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                    <div class="contents-accordion">
                        <h4>악성 프로그램 차단</h4>
                        <p><span>기기에 치명적인 피해를 입히고 해킹에 이용되는 악성 프로그램들도 다운로드 전에 차단합니다.</span>
                            <img class="contents-thumbnail" src='<c:url value="/resource/img/img_malware_blocking.png"/>' alt=""></p>
                        <ul class="contents-list-btn">
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                    <div class="contents-accordion">
                        <h4>클린 웹</h4>
                        <p><span>사용자를 불편하게 하거나 혼란스럽게 하는 광고를 차단하고 쾌적한 웹 환경을 제공합니다.</span>
                            <img class="contents-thumbnail" src='<c:url value="/resource/img/img_clean_web.png"/>' alt=""></p>
                        <ul class="contents-list-btn">
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                    <div class="contents-accordion">
                        <h4>마이 액티비티</h4>
                        <p><span>북마크, 비밀번호 등 사용자의 데이터를 서버에 안전하게 보관하고 다른 기기와 동기화합니다.</span>
                            <img class="contents-thumbnail" src='<c:url value="/resource/img/img_my_activity.png"/>' alt=""></p>
                        <ul class="contents-list-btn">
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>

                    </div>
                </div>
                <div class="contents-gallery" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                     data-aos-duration="800" data-aos-easing="ease-out" data-aos-delay="1000" data-aos-anchor="#secure">
                    <img class="active" src='<c:url value="/resource/img/img_safe_browsing.png"/>' alt="">
                    <img src='<c:url value="/resource/img/img_malware_blocking.png"/>' alt="">
                    <img src='<c:url value="/resource/img/img_clean_web.png"/>' alt="">
                    <img src='<c:url value="/resource/img/img_my_activity.png"/>' alt="">
                </div>
            </div>
        </section>
        <section id="environment">
            <div id="animation-sticky-Pin">
                <div class="contentsWrap titleWrap">
                    <h3 class="c-whale-blue">나에게 딱 맞는 환경</h3>
                    <ul class="titles-change">
                        <li class="title-change-1"><h1>다양한 위젯과 배경테마</h1></li>
                        <li class="title-change-2"><h1>맞춤형 인터페이스</h1></li>
                        <li class="title-change-3 c-whale-white"><h1>눈이 편한 다크모드</h1></li>
                    </ul>
                    <ul class="c-whale-gray paragraphs-change">
                        <li class="paragraph-change-1"><p>평상시 유용한 위젯과 마음에 쏙 드는 테마로 나만의 새 탭을 구성해보세요.</p></li>
                        <li class="paragraph-change-2"><p>기분 따라 바뀌는 컬러풀한 스킨과 커스터마이징할 수 있는 툴바는 브라우저에 개성을 부여합니다.</p></li>
                        <li class="paragraph-change-3"><p>인터페이스와 웹 콘텐츠에 모두 적용가능한 다크모드는 사용자 눈의 피로를 줄여줍니다.</p></li>
                    </ul>
                </div>
                <div class="contentsWrap">
                    <div class="contents-animation">
                        <div class="background">
                            <img src='<c:url value="/resource/img/environment_background.png"/>' alt="">
                            <div class="ui">
                                <img src='<c:url value="/resource/img/animation2_01.png"/>' alt="" class="ui-white">
                                <img src='<c:url value="/resource/img/animation3_0.png"/>' alt="" class="pos-absolute ui-dark">
                                <div class="theme">
                                    <img src='<c:url value="/resource/img/animation2_0.png"/>' alt="">
                                    <img src='<c:url value="/resource/img/animation1_3.png"/>' alt="" class="pos-absolute theme3">
                                    <img src='<c:url value="/resource/img/animation1_2.png"/>' alt="" class="pos-absolute theme2">
                                    <img src='<c:url value="/resource/img/animation1_1.png"/>' alt="" class="pos-absolute theme1 ">
                                </div>
                                <div class="upNav">
                                    <img src='<c:url value="/resource/img/animation2_1.png"/>' alt="" class="upNavTheme1">
                                    <img src='<c:url value="/resource/img/animation2_2.png"/>' alt="" class="pos-absolute upNavTheme2">
                                    <img src='<c:url value="/resource/img/animation2_3.png"/>' alt="" class="pos-absolute upNavTheme3">
                                </div>
                                <div class="menuTheme">
                                    <img src='<c:url value="/resource/img/animation2_4.png"/>' alt="" class="navTheme">
                                    <img src='<c:url value="/resource/img/animation3_1.png"/>' alt="" class="pos-absolute navThemeDark">
                                    <div class="icons">
                                        <img src='<c:url value="/resource/img/animation_icon_1.png"/>' alt="" class="icon1">
                                        <img src='<c:url value="/resource/img/animation_icon_2.png"/>' alt="" class="pos-absolute icon2">
                                    </div>
                                </div>
                                <div class="cursor">
                                    <img src='<c:url value="/resource/img/animation3_2.png"/>' alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="triggerEnv0"></div>
        </section>
        <section id="appService">
            <ul class="contents-whaleApps" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                data-aos-duration="800" data-aos-easing="ease-out" data-aos-anchor="#appService">
                <li class="webtoon shadow"></li>
                <li class="stock shadow"></li>
                <li class="audioBook shadow"></li>
                <li class="music shadow"></li>
                <li class="mail shadow"></li>
            </ul>
            <div class="contentsWrap titleWrap">
                <h3 class="c-whale-blue" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                    data-aos-duration="800" data-aos-easing="ease-out" data-aos-anchor="#appService">브라우저를 더 유용하게</h3>
                <h1 class="aniOrder3" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="800"
                    data-aos-easing="ease-out" data-aos-delay="300" data-aos-anchor="#appService">확장앱으로 외부 서비스를 <br
                        class="br-600"> 내 맘대로</h1>
                <p class="c-whale-gray" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                   data-aos-duration="800" data-aos-easing="ease-out" data-aos-delay="600"
                   data-aos-anchor="#appService">웨일 스토어에서 마음에 드는 확장앱을 설치하고 브라우저에 수많은 기능과 서비스를 더해보세요.</p>
            </div>
            <div class="contentsWrap">
                <ul class="contents-cardList">
                    <li class="shadow" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="800"
                        data-aos-easing="ease-out" data-aos-once="true">
                        <div class="icon webtoon "></div>
                        <div>
                            <h4>네이버 웹툰</h4>
                            <p class="c-whale-gray">웹툰 보기 딱 좋은 사이즈로 사이드바에서 틈틈이 즐겨 보세요.</p>
                        </div>
                    </li>
                    <li class="shadow" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="800"
                        data-aos-easing="ease-out" data-aos-once="true">
                        <div class="icon music"></div>
                        <div>
                            <h4>뮤직 플레이어</h4>
                            <p class="c-whale-gray">바이브, 벅스, 지니, 유튜브 뮤직플레이어가 사이드바에 쏙 들어옵니다.</p>
                        </div>
                    </li>
                    <li class="shadow" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="800"
                        data-aos-easing="ease-out" data-aos-once="true">
                        <div class="icon stock"></div>
                        <div>
                            <h4>네이버 증권</h4>
                            <p class="c-whale-gray">최근에 검색한 종목과 관심종목의 시세를 한 눈에 확인할 수 있습니다.</p>
                        </div>
                    </li>
                    <li class="shadow" data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="800"
                        data-aos-easing="ease-out" data-aos-once="true">
                        <div class="icon audioBook"></div>
                        <div>
                            <h4>오디오클립</h4>
                            <p class="c-whale-gray">스토리, 오디오북, ASMR등 다양한 오디오 콘텐츠를 만나보세요.</p>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <section id="adBanner">
            <div class="contentsWrap c-whale-white">
                <div class="contents-info-btn">
                    <h2 class="important" data-aos="fade-up" data-aos-anchor-placement="top-bottom"
                        data-aos-duration="800" data-aos-easing="ease-out" data-aos-once="true"
                        data-aos-anchor="#adBanner">모바일 웨일 브라우저도 만나보세요.</h2>
                    <div data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-duration="800"
                         data-aos-easing="ease-out" data-aos-once="true" data-aos-delay="300"
                         data-aos-anchor="#adBanner">
                        <p class="small">
                            PC 브라우저의 북마크 및 비밀번호를 동기화하고, 다양한 모바일 전용 기능을 사용할 수 있습니다.
                        </p>
                        <button class="whale-Button small" onclick="downloadModal()">
                            <span class="whaleLogo whaleLogo-white"></span>
                            웨일 다운로드
                        </button>
                    </div>
                </div>
                <div class="cellphone">
                </div>
            </div>
            <div class="cover">
                <div class="contentsWrap">
                    <div class="contents-modal">
                        <span class="material-symbols-outlined mobile-menu-btn xBtn">close</span>
                        <div class="contents-bgImg">
                            <img src='<c:url value="/resource/img/mobile_download_220x400.png"/>' alt="">
                        </div>
                        <div class="contents-info">
                            <h3 class="small">모바일 웨일 브라우저도 만나보세요.</h3>
                            <p class="smallest c-whale-gray">PC 브라우저의 북마크 및 비밀번호를 동기화하고, 다양한 모바일 전용 기능을 사용할 수 있습니다.</p>
                            <div class="contents-QrCode">
                                <div>
                                    <p>iOS</p>
                                    <img src='<c:url value="/resource/img/whale_download_qr_ios_160x160.png"/>' alt="">
                                    <p class="smallest c-whale-gray">iOS 13 이상</p>
                                </div>
                                <div>
                                    <p>Android</p>
                                    <img src='<c:url value="/resource/img/whale_download_qr_aos_160x160.png"/>' alt="">
                                    <p class="smallest c-whale-gray">Android 6.0 이상</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <%@ include file="footer.jsp" %>
</div>
<script src='<c:url value="/resource/JS/gnb.js"/>'></script>
<script src='<c:url value="/resource/JS/mainJavaScript.js"/>'></script>
</body>
</html>
