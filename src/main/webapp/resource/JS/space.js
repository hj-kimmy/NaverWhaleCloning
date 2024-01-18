$(function () {
    let minCarousel = $(".contents-miniCarousel");
    let info = $(".contents-miniCarousel .contents-info li"); //이미지
    let btn = $(".contents-btn li"); //인디케이터 버튼
    let infoNow = $(".contents-miniCarousel .contents-info li.active");
    let current = 0;
    let nextBtn = btn.eq(1);
    let prevBtn = btn.eq(0);

    nextBtn.click(function () {
        info.removeClass("active");
        info.eq(current + 1).addClass("active");

        current++;

        if (current == 2) {
            current = -1;
        }
    })
    prevBtn.click(function () {
        info.removeClass("active");
        info.eq(current - 1).addClass("active");

        current--;
        if (current == -1) {
            current = 2;
        }
    })

    play1(0);
    let isPaused1 = false;

    function play1(current) {
        go = window.setInterval(function () {
            if (!isPaused1) {
                info.removeClass("active");
                info.eq(current - 1).addClass("active");

                current++;

                if (current == 2) {
                    current = -1;
                }
            }
        }, 2000);
    }

    minCarousel.on({
        "mouseenter": function (e) {
            e.preventDefault();
            isPaused = true;
        },
        "mouseleave": function (e) {
            e.preventDefault();
            isPaused = false;
        }
    })


    $("#accordion").accordion({
        heightStyle: "content",
        animate: 200,
        header: "div>h4"
    });

    play2(1);
    let accordionContent = $("#accordion .contents-accordion");
    let accordionGallery = $("section#smartEdu .contents-gallery img");
    let isPaused2 = false;

    function play2(current) {
        go = window.setInterval(function () {
            if (!isPaused2) {
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