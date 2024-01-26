<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section id="secure">
    <!-- title -->
    <div class="titleWrap">
        <h3 class="c-whale-blue ani">내 정보는 안전하게</h3>
        <h1 class="ani" data-aos-delay="200">최신 기술이 적용된 <br
                class="br-600">강력한 보안</h1>
        <p class="c-whale-gray ani" data-aos-delay="400">네이버
            웨일은 끊임없는 업데이트로 빈틈없는 보안 환경을 제공합니다. 안심하고 오늘의 할 일에만 집중하세요.</p>
    </div>

    <!-- accordion -->
    <div class="contentsWrap">
        <div id="accordion" class="ani" data-aos-delay="600">
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
        <div class="contents-gallery ani" data-aos-delay="700">
            <img class="active" src='<c:url value="/resource/img/img_safe_browsing.png"/>' alt="">
            <img src='<c:url value="/resource/img/img_malware_blocking.png"/>' alt="">
            <img src='<c:url value="/resource/img/img_clean_web.png"/>' alt="">
            <img src='<c:url value="/resource/img/img_my_activity.png"/>' alt="">
        </div>
    </div>
</section>