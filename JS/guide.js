$(function () {
    /***************************************************
     * 페이징 기능 프론트로 구현하기
     * *************************************************/
    let current = 0; //이미지의 현재 번째
    let navBtn = $("#guideList .contents-btns .material-symbols-outlined");
    let nextBtn = $("#guideList .contents-btns .material-symbols-outlined").eq(1);
    let prevBtn = $("#guideList .contents-btns .material-symbols-outlined").eq(0);
    let listBtn = $("#guideList>.contents-btns>ul li.num");
    let tabs = $("#guideList .contents-tabs ul.contents-tab-layer");
    let tabBtn = $("#guideList ul.contents-btns li");

    $("#tabs").tabs();
    prevBtn.css("color", "#e5e5e5");

    nextBtn.click(function () {
        if (current == 2) {
            nextBtn.css("color", "#e5e5e5");
            return;
        } else {
            navBtn.css("color", "black");
        }
        let currentTab = tabs.eq(current);
        current = 2;
        let nextTab = tabs.eq(current);

        currentTab.removeClass("active");
        nextTab.addClass("active");
        listBtn.removeClass("active");
        listBtn.eq(current).addClass("active");
        if (current == 2) {
            nextBtn.css("color", "#e5e5e5");
        }
    })

    prevBtn.click(function () {
        if (current == 0) {
            prevBtn.css("color", "#e5e5e5");
            return;
        } else {
            navBtn.css("color", "black");
        }
        let currentTab = tabs.eq(current);
        current = 0;
        let prevTab = tabs.eq(current);

        currentTab.removeClass("active");
        prevTab.addClass("active");
        listBtn.removeClass("active");
        listBtn.eq(current).addClass("active");
        if (current == 0) {
            prevBtn.css("color", "#e5e5e5");
        }
    })

    listBtn.click(function () {
        let tg = $(this).index();
        listBtn.removeClass("active");
        $(this).addClass("active");
        current = tg - 1;
        tabs.removeClass("active");
        tabs.eq(current).addClass("active")
        if (current == 0) {
            navBtn.css("color", "black");
            prevBtn.css("color", "#e5e5e5");
        }else if(current==2){
            navBtn.css("color", "black");
            nextBtn.css("color", "#e5e5e5");
        }else {
            navBtn.css("color", "black");
        }
    })

    tabBtn.click(function (){
        let tg = $(this).index();

        if(tg!=0){
            listBtn.removeClass("active");
            listBtn.css({
                "display" : "none"
            })
            listBtn.eq(0).css({
                "display" : "flex"
            }).addClass("active");
            prevBtn.css("color", "#e5e5e5");
            nextBtn.css("color", "#e5e5e5");
        }else {
            current=0;
            navBtn.css("color", "black");
            prevBtn.css("color", "#e5e5e5");
            tabs.removeClass("active");
            tabs.eq(current).addClass("active");
            listBtn.removeClass("active");
            listBtn.eq(0).addClass("active");
            listBtn.css({
                "display" : "flex"
            })
        }
    })


    let updatePostList = $("#guideList.update .contents-tabs ul li");
    let updatePostNavList = $("#guidePost.update .contents-post-nav li");

    updatePostList.click(function (){
        location.href="update_post.html";
    })

    updatePostNavList.click(function (){
        location.href="update_post.html";
    })

    let pressPostList = $("#guideList.press .contents-tabs ul li");
    let pressPostNavList = $("#guidePost.press .contents-post-nav li");

    pressPostList.click(function (){
        location.href="press_post.html";
    })

    pressPostNavList.click(function (){
        location.href="press_post.html";
    })

    let textSize = $("#guidePost .contents-post-title .material-symbols-outlined:first-child");
    let post = $("#guidePost .contents-post");

    textSize.click(function (){
        post.toggleClass("size-up");
    })
});
