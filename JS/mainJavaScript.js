$(function () {
    /* 1번 섹션 고래 비디오 재생*/
    let whaleShow = $(".whale_show");
    let whaleLoop = $(".whale_loop");

    whaleLoop.hide();
    let whaleVideo = setTimeout(function () {
        whaleShow.hide();
        whaleLoop.show();
    }, 1600)


    $("#accordion").accordion({
        heightStyle: "content",
        animate: 200,
        header: "div>h4"
    });

    play(1);
    let accordionContent = $("#accordion .contents-accordion");
    let accordionGallery = $("section#secure .contents-gallery img");
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

    const trigger = gsap.utils.toArray('.trigger-fadeinOn');
    const container = document.querySelectorAll('.trigger-fadeinOn');

    trigger.forEach((text, i) => {
        let aniOrder1 = container[i].querySelector('.aniOrder1');
        let aniOrder2 = container[i].querySelector('.aniOrder2');
        let aniOrder3 = container[i].querySelector('.aniOrder3');
        let aniOrder4 = container[i].querySelector('.aniOrder4');
        let aniOrder5 = container[i].querySelector('.aniOrder5');
        let aniOrder6 = container[i].querySelector('.aniOrder6');

        let aniOrder1Same = container[i].querySelector('.aniOrder1Same');
        let aniOrder2Same = container[i].querySelector('.aniOrder2Same');
        let aniOrder3Same = container[i].querySelector('.aniOrder3Same');
        let aniOrder4Same = container[i].querySelector('.aniOrder4Same');
        let aniOrder5Same = container[i].querySelector('.aniOrder5Same');
        let aniOrder6Same = container[i].querySelector('.aniOrder6Same');

        ScrollTrigger.create({
            trigger: text,
            start: "0% 90%",
            animation: gsap
                .timeline()
                .fromTo(aniOrder1, startDefault, {y: 0, opacity: 1, duration: 1})
                .fromTo(aniOrder1Same, startDefault, {y: 0, opacity: 1, duration: 1}, "<")
                .fromTo(aniOrder2, startDefault, {y: 0, opacity: 1, duration: 1}, "-=0.8")
                .fromTo(aniOrder2Same, startDefault, {y: 0, opacity: 1, duration: 1}, "<")
                .fromTo(aniOrder3, startDefault, {y: 0, opacity: 1, duration: 1}, "-=0.8")
                .fromTo(aniOrder3Same, startDefault, {y: 0, opacity: 1, duration: 1}, "<")
                .fromTo(aniOrder4, startDefault, {y: 0, opacity: 1, duration: 1}, "-=0.8")
                .fromTo(aniOrder4Same, startDefault, {y: 0, opacity: 1, duration: 1}, "<")
                .fromTo(aniOrder5, startDefault, {y: 0, opacity: 1, duration: 1}, "-=0.8")
                .fromTo(aniOrder5Same, startDefault, {y: 0, opacity: 1, duration: 1}, "<")
                .fromTo(aniOrder6, startDefault, {y: 0, opacity: 1, duration: 1}, "-=0.8")
                .fromTo(aniOrder6Same, startDefault, {y: 0, opacity: 1, duration: 1}, "<")
        })
    })

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
            .to(".title-change-1", {yPercent : -100, opacity:0, duration:0.2},"<")
            .to(".title-change-2",{opacity:1, yPercent:-100, duration:0.2},"<")
            .to(".paragraph-change-1",{opacity:0,duration:0},"<")
            .to(".paragraph-change-2",{opacity:1,duration:0},"<")
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
            .to(".title-change-2", {yPercent : -100, opacity:0, duration:0.2},"<")
            .to(".title-change-3",{opacity:1, yPercent:-200, duration:0.2},"<")
            .to(".paragraph-change-2",{opacity:0,duration:0},"<")
            .to(".paragraph-change-3",{opacity:1,duration:0},"<")
            .to(".upNavTheme3", {opacity: 0, duration: 2}, "<")
            .to(".upNavTheme2", {opacity: 0, duration: 2}, "<")
            .to(".upNavTheme1", {opacity: 0, duration: 2}, "<")
            .to(".ui-dark", {opacity: 1, duration: 2}, "<")
            .to("#environment", {backgroundColor: '#202020', duration: 1}, "<")
        , scrub: 1,
    })
})

