$(function () {
    let mobileGnb = $("#mobileGnb");
    let mobileSub = $("#mobile-subMenu");
    let cover = $("header .cover");
    //
    //
    // let listName = $(".menu-sub-2");
    // let submenuBox = listName.next();
    //
    //
    // let listW = listName.width();
    // let subW = submenuBox.width();
    //
    // if(listW>=subW){
    //     submenuBox.width(listW);
    // }


    /* 끄기 버튼 외 다른 공간 클릭했을 때 창 닫힘*/
    let appBox = $("#gnb-appMenu");
    $(document).mouseup(function (e) {
        if (appBox.has(e.target).length === 0) {
            e.stopPropagation();
            appBox.find(".subMenuBox").hide();
        }
        if (mobileGnb.has(e.target).length === 0) {
            xBtnClick();
        }
    });

    /*선택된 메뉴 스타일 */
    let menu = $("#main-menu>li");
    menu.on("click", function (e) {
        menu.removeClass("active");
        $(this).addClass("active");
        $(this).find("ul").css("font-weight", "normal");
    })

    /* 메뉴 호버 */
    menu.on({
        "mouseenter": function () {
            let sub = $(this).find(".subMenuBox");
            sub.stop().fadeIn("200");
            if($(this).width()>=sub.width()){
                sub.width($(this).width())
            }
        },
        "mouseleave": function () {
            let sub = $(this).find(".subMenuBox");
            sub.stop().hide();
        }
    });

    let loginchk = $(".loginUserMenu");

    loginchk.on({
        "mouseenter": function () {
            let sub = $(this).find(".subMenuBox");
            sub.stop().fadeIn("200");
            if($(this).width()>=sub.width()){
                sub.width($(this).width())
            }
        },
        "mouseleave": function () {
            let sub = $(this).find(".subMenuBox");
            sub.stop().hide();
        }
    });

    /* 앱 메뉴 버튼 클릭 */
    let appsBtn = $("#gnb-appMenu img[alt='바로가기']");
    appsBtn.click(function (){
        $(this).next().fadeToggle();
    })
    /*스크롤시 gnb effect*/
    $(window).scroll(function () {
        let scroll = $(window).scrollTop();
        if (scroll >= 40) {
            $("header").addClass("scrolled");
        } else {
            $("header").removeClass("scrolled");
        }
    })

    /*mobile-Menu*/

    /* 600 이하에서 메뉴 클릭*/
    let mobileAppsBtn = $("#mobileGnb .mobile-menu-nav img[alt = '바로가기']");
    mobileAppsBtn.off("click").on("click", function () {
        mobileSub.show();
    })

    /* 돌아가기 메뉴 클릭*/
    let BackBtn = $(".BackBtn");
    BackBtn.off("click").on("click", function () {
        mobileSub.hide();
    })

    /* fold menu 버튼 이벤트 */
    let menuBtn = $("#menuBtn");
    menuBtn.on("click", function () {
        menuClick();
    })

    /* 메뉴 닫기 버튼 이벤트 */
    let xBtn = $("#mobileGnb .xBtn");
    xBtn.click(function () {
        xBtnClick();
    })

    function menuClick() {
        mobileGnb.show();
        cover.show();
    }
    function xBtnClick() {
        mobileGnb.hide();
        cover.hide();
    }
})