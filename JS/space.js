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

    play(0);
    let isPaused = false;

    function play(current) {
        go = window.setInterval(function () {
            if (!isPaused) {
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
})