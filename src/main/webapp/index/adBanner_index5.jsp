<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section id="adBanner">

    <!-- 광고 배너 -->
    <div class="contentsWrap c-whale-white">
        <div class="contents-info-btn">
            <h2 class="important ani">모바일 웨일 브라우저도 만나보세요.</h2>
            <div class="ani" data-aos-delay="200">
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

    <!-- QR코드 팝업 -->
    <%@include file="/index/adBanner_index5_modal-QR.jsp"%>
    
</section>