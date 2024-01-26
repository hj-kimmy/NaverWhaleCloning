<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section id="feature">
    <!-- 웨일 다운로드  -->
    <section class="contentsWrap" id="feature1">
        <article class="contents-info-btn">
            <h3 class="c-whale-blue ani">나만의 스마트한
                브라우저</h3>
            <h1 class="important ani" data-aos-delay="200"
            >네이버 웨일로 일상을 바꿔보세요.</h1>
            <div class="c-whale-gray ani" data-aos-delay="400">
                <p>
                    더 가볍게, 더 편하게, 내 일상에 딱 맞는 브라우저가 여기 있습니다. 새로운 인터넷으로 하루를 열어보세요. 작지만 큰 변화가 시작됩니다.
                </p>
                <button class="whale-Button">
                    <span class="whaleLogo whaleLogo-white"></span>
                    웨일 다운로드
                </button>
            </div>
        </article>
        <div class="contents-video ani">
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
    <!-- 네이버 웨일온 -->
    <section class="contentsWrap" id="feature2">
        <article class="contents-info-btn">
            <h3 class="c-whale-blue ani">오늘 할 일도 빠르게</h3>
            <h1 class="ani" data-aos-delay="200"> 시간 걱정 없는 화상회의
                웨일온</h1>
            <div class="c-whale-gray ani" data-aos-delay="400"
                 data-aos-anchor="#feature2">
                <p>
                    별도 애플리케이션 설치 없이 네이버 웨일만 있으면 바로 사용할 수 있는 온라인 화상회의 서비스입니다. PC와 모바일 어디서나 시간 제한 없이 편리하게 회의에
                    참여하세요.
                </p>
                <button onclick="location.href='whalehelp.html'">자세히 보기</button>
            </div>
        </article>
        <div class="contents-video">
            <video playsinline autoplay muted class="hevcVideo">
                <source src='<c:url value="/resource/img/main_whaleon.mov"/>' type='video/mp4' class="hevcVideo">
            </video>
            <video playsinline autoplay muted class="webmVideo">
                <source src='<c:url value="/resource/img/main_whaleon.webm"/>' type="video/webm">
            </video>
        </div>
    </section>

    <!-- 웨일 사이드바 -->
    <section class="contentsWrap" id="feature3">
        <article class="contents-info-btn">
            <h3 class="c-whale-blue ani">오늘 할 일도 빠르게</h3>
            <h1 class="ani" data-aos-delay="200"
            >가볍게 열고 닫는 사이드바</h1>
            <div class="c-whale-gray ani" data-aos-delay="400"
                 data-aos-anchor="#feature3">
                <p>
                    사이드바에는 나에게 필요한 다양한 서비스가 있습니다. 메인 화면을 방해하지 않으면서 그때그때 필요한 서비스를 가볍게 열어보세요
                </p>
                <button onclick="location.href='whalehelp.html'">자세히 보기</button>
            </div>
        </article>
        <div class="contents-video ani">
            <video playsinline autoplay muted class="hevcVideo">
                <source src='<c:url value="/resource/img/main_sidebar.mov"/>' type='video/mp4' class="hevcVideo">
            </video>
            <video playsinline autoplay muted class="webmVideo">
                <source src='<c:url value="/resource/img/main_sidebar.webm"/>' type="video/webm">
            </video>
        </div>
    </section>

    <!-- 웨일 더블탭 -->
    <section class="contentsWrap" id="feature4">
        <article class="contents-info-btn">
            <h3 class="c-whale-blue ani">오늘 할 일도 빠르게</h3>
            <h1 class="ani" data-aos-delay="200">두 개의 탭을 하나로 듀얼
                탭</h1>
            <div class="c-whale-gray ani" data-aos-delay="400">
                <p>
                    여러 탭을 왔다 갔다 헤메느라 시간을 낭비하지 마세요. 듀얼 탭에서는 왼쪽에서 클릭한 링크를 오른쪽으로 열 수 있습니다.
                </p>
                <button onclick="location.href='whalehelp.html'">자세히 보기</button>
            </div>

        </article>
        <div class="contents-video ani">
            <video playsinline autoplay muted class="hevcVideo">
                <source src='<c:url value="/resource/img/main_dualtab.mov"/>' type='video/mp4' class="hevcVideo">
            </video>
            <video playsinline autoplay muted class="webmVideo">
                <source src='<c:url value="/resource/img/main_dualtab.webm"/>' type="video/webm">
            </video>
        </div>
    </section>

    <!-- 웨일 퀵서치 -->
    <section class="contentsWrap" id="feature5">
        <article class="contents-info-btn">
            <h3 class="c-whale-blue ani">오늘 할 일도 빠르게</h3>
            <h1 class="ani" data-aos-delay="200">궁금한 건 드래그하고 퀵서치</h1>
            <div class="c-whale-gray ani" data-aos-delay="400">
                <p>
                    웹 페이지를 읽다가 궁금하거나 번역이 필요한 내용은 드래그하고 퀵서치로 확인해보세요. 퀵서치는 맥락에 맞는 단어를 검색하고 문장도 번역해줍니다.
                </p>
                <button onclick="location.href='whalehelp.html'">자세히 보기</button>
            </div>
        </article>
        <div class="contents-video ani">
            <video playsinline autoplay muted class="hevcVideo">
                <source src='<c:url value="/resource/img/main_quicksearch.mov"/>' type='video/mp4'>
            </video>
            <video playsinline autoplay muted class="webmVideo">
                <source src='<c:url value="/resource/img/main_quicksearch.webm"/>' type="video/webm">
            </video>
        </div>
    </section>

    <!-- 웨일 캡쳐 -->
    <section class="contentsWrap" id="feature6">
        <article class="contents-info-btn">
            <h3 class="c-whale-blue ani">오늘 할 일도 빠르게</h3>
            <h1 class="ani" data-aos-delay="200">깔끔한 캡처와 간단한 편집</h1>
            <div class="c-whale-gray ani" data-aos-delay="400">
                <p>
                    4개의 옵션으로 원하는 영역만 깔끔하게 캡처하고 간단히 편집해 보세요. 단축키를 사용하면 더욱 빠른 캡처가 가능합니다.
                </p>
                <button onclick="location.href='whalehelp.html'">자세히 보기</button>
            </div>
        </article>
        <div class="contents-video ani">
            <video playsinline autoplay muted class="hevcVideo">
                <source src='<c:url value="/resource/img/main_capture.mov"/>' type='video/mp4'>
            </video>
            <video playsinline autoplay muted class="webmVideo">
                <source src='<c:url value="/resource/img/main_capture.webm"/>' type="video/webm">
            </video>
        </div>
    </section>
</section>
