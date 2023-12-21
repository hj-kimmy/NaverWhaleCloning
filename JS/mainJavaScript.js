$(function () {
    /* 1번 섹션 고래 비디오 재생*/
    let whaleShow = $(".whale_show");
    let whaleLoop = $(".whale_loop");

    whaleLoop.hide();
    let whaleVideo = setTimeout(function () {
        whaleShow.hide();
        whaleLoop.show();
    }, 1400)


    $("#accordion").accordion({
        heightStyle: "content",
        animate: 200,
        header: "div>h3"
    });

    play(1);
    let accordionContent = $("#accordion>div");
    let accordionGallery = $("section#secure .gallery img");
    let isPaused = false;

    function play(current) {
        go = window.setInterval(function () {
            if (!isPaused) {
                $("#accordion").accordion({active: current});
                accordionContent.removeClass("active");
                accordionGallery.removeClass("active");
                accordionContent.eq(current).addClass("active");
                accordionGallery.eq(current).addClass("active");
                current++;
                if (current == 4) current = 0;
            }
        }, 3000);
    }

    $("#accordion").on("mouseenter", function (e) {
        e.preventDefault();
        isPaused = true;
    })
    $("#accordion").on("mouseleave", function (e) {
        e.preventDefault();
        isPaused = false;
    })

    accordionContent.click(function () {
        clearInterval(go);
        let num = $(this).index();
        accordionContent.removeClass("active");
        accordionGallery.removeClass("active");
        accordionContent.eq(num).addClass("active")
        accordionGallery.eq(num).addClass("active");
        $("#accordion").accordion({active: num});
        if (num == 3) num = -1;
        play(num + 1);
    })
})


$(function () {
    gsap.registerPlugin(ScrollTrigger);

    var startDefault = {
        y: 50, opacity: 0
    }

    const trigger = gsap.utils.toArray('.triggerContent');
    const subtitle = document.querySelectorAll('.subtitleAni');
    const title = document.querySelectorAll('.titleAni');
    const paragraph = document.querySelectorAll('.paragraphAni');
    const button = document.querySelectorAll('.buttonAni');
    const video = document.querySelectorAll('.videoAni');

    trigger.forEach((text, i) => {
        ScrollTrigger.create({
            trigger: text,
            start: "0% 90%",
            animation: gsap
                .timeline()
                .fromTo(subtitle[i], startDefault, {y: 0, opacity: 1, duration: 1})
                .fromTo(video[i], startDefault, {y: 0, opacity: 1, duration: 1}, "<")
                .fromTo(title[i], startDefault, {y: 0, opacity: 1, duration: 1}, "-=0.8")
                .fromTo(paragraph[i], startDefault, {y: 0, opacity: 1, duration: 1}, "-=0.8")
                .fromTo(button[i], startDefault, {y: 0, opacity: 1, duration: 1}, "<")
        })
    })
    ScrollTrigger.create({
        trigger: ".secureWrap",
        start: "0% 100%",
        animation: gsap
            .timeline()
            .fromTo("#accordion", startDefault, {y: 0, opacity: 1, duration: 1})
            .fromTo(".gallery", startDefault, {y: 0, opacity: 1, duration: 1}, "-=0.8")
    })

    let theme1 = document.querySelector(".theme1");

    /*stop*/
    ScrollTrigger.create({
        trigger: "#triggerEnv0",
        start: "0% 0%",
        // markers: true,
        animation: gsap
            .timeline()
            .to(".background", {scale: 0.82, duration: 5}, "+=2")
            .to(".theme1", {opacity: 0, duration: 1}, "-=4")
            .to(".theme2", {opacity: 0, duration: 1}, "-=3")
            .to(".theme3", {opacity: 0, duration: 1}, "+=0.5")
            .fromTo(".menuTheme", {opacity: 0, scale: 0.5}, {opacity: 1, scale: 1, duration: 1})
            .to("#environment", {backgroundColor: '#e7c0b5'}, "+=2")
            .to(".subTitle1", {yPercent : -100, opacity:0, duration:0.2},"<")
            .to(".subTitle2",{opacity:1, yPercent:-100, duration:0.2},"<")
            .to(".parLi1",{opacity:0,duration:0},"<")
            .to(".parLi2",{opacity:1,duration:0},"<")
            .to(".upNavTheme1",  {opacity: 1}, "<")
            .to("#environment", {backgroundColor: '#d6d28c'}, "+=2")
            .to(".upNavTheme2", {opacity: 1}, "<")
            .to("#environment", {backgroundColor: '#c7d8ce'}, "+=2")
            .to(".upNavTheme3", {opacity: 1}, "<")
            .to(".background", {scale: 1, duration: 5})
            .to(".cursor", {opacity: 1, xPercent: 330, yPercent: -70, duration: 1})
            .to(".icon1", {scale: 1, opacity: 1, duration: 1})
            .to(".cursor", {scale: 0.7, duration: 5})
            .to(".cursor", {scale: 1, duration: 0.5})
            .to(".icon1", {opacity: 0, duration: 0})
            .to(".icon2", {opacity: 1, duration: 0}, "<")
            .to(".navTheme", {opacity: 0, duration: 2}, "+=0.3")
            .to(".icon2", {opacity: 0, duration: 2}, "<")
            .to(".cursor", {opacity: 0, duration: 2}, "<")
            .to(".navThemeDark", {opacity: 1, duration: 2})
            .to(".subTitle2", {yPercent : -100, opacity:0, duration:0.2},"<")
            .to(".subTitle3",{opacity:1, yPercent:-200, duration:0.2},"<")
            .to(".parLi2",{opacity:0,duration:0},"<")
            .to(".parLi3",{opacity:1,duration:0},"<")
            .to(".upNavTheme3", {opacity: 0, duration: 2}, "<")
            .to(".upNavTheme2", {opacity: 0, duration: 2}, "<")
            .to(".upNavTheme1", {opacity: 0, duration: 2}, "<")
            .to(".ui-dark", {opacity: 1, duration: 2}, "<")
            .to("#environment", {backgroundColor: '#202020', duration: 1}, "<")
        , scrub: 1,
    })
})

