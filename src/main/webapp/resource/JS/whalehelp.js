$(function () {
    /***************************************************
     * 필터 기능 프론트로 구현하기
     * *************************************************/
    let tabBtn = $("#helpSearch .contents-tabButton li");
    let tabs =$("#questions .contents-tabs");
    let boxTabs = $("#tutorial .contents-boxes");

    tabBtn.click(function (){
        tabBtn.removeClass("active");
        tabs.removeClass("active");
        boxTabs.removeClass("active");
        $(this).addClass("active");
        $("[data-helpTarget ="+$(this).data('help')+"]").addClass("active")
    })

    let hamburgerTab = $("#whaleHelpCenter #mobileGnb .contents-tabButton li");
    let xBtn = $("#whaleHelpCenter #mobileGnb .xBtn");

    hamburgerTab.click(function (){
        tabBtn.removeClass("active");
        tabs.removeClass("active");
        boxTabs.removeClass("active");
        $(this).addClass("active");
        $("[data-helpTarget ="+$(this).data('help')+"]").addClass("active")
        xBtn.trigger("click");
    })

    /***************************************************
     * gnb 스크롤링 이벤트 변경
     * *************************************************/
    let gnb = $("#whaleHelpCenter header")
    $("html, body").on("mousewheel",function (event, delta){
        if(delta>0){
            gnb.stop().animate({
                top : 0
            },0)
        }else if(delta<0){
            gnb.stop().animate({
                top : "-100%"
            },200)
        }
    })

})
