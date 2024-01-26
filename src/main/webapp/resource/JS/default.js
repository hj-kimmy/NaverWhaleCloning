
$(function () {
    /***************************************************
     * 각 컨텐츠별 AOS 실행
     * *************************************************/
    // 팝업 애니메이션 (<!-- Animate On Scroll Library -->)
    AOS.init();
})

/***************************************************
 * modal창 실행
 * *************************************************/
// modal
let xBtn = $("main .xBtn");
let cover = xBtn.closest(".cover");
let modalWindow = $(".contents-modal")

xBtn.click(function () {
    $(this).closest(".cover").hide();
})

function downloadModal() {
    cover.fadeIn();
    modalWindow.css({
        "top": "50px",
        "opacity": 0
    }).animate({
        "top": 0,
        "opacity": 1
    }, 500)
}

let popupAni = $(".ani");

popupAni.attr({
    "data-aos": "fade-up",
    "data-aos-anchor-placement": "center-bottom",
    "data-aos-duration": "1000",
    "data-aos-easing": "ease-out"
})