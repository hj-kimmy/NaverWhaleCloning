$(function () {
    /***************************************************
     * 캐로셀 및 상세 섹션 변경
     * *************************************************/
    let gal = $(".contents-gallery li"); //이미지
    let info = $("#myCarousel .contents-info .contents-info li") // 안내문구
    let btn = $(".contents-btn li"); //인디케이터 버튼
    let section = $(".section-details");
    let galNow = $(".contents-gallery li.active");
    let sectionNow = $("#myCarousel .contents-info .contents-info li.active")
    let current = sectionNow.index(); //이미지의 현재 번째

    sectionNow.css({
        "top": "-50%",
        "opacity": 0
    }).animate({
        "top": 0,
        "opacity": 1
    }, 500);

    btn.click(function () {
        let tg = $(this);
        let i = tg.index();

        if (current === i) return false;

        gal.css({
            "z-index": 1
        });
        sectionNow.stop().css({
            "top": 0,
            "opacity": 0.5
        }).animate({
            "top": "100%",
            "opacity": 0
        }, 500, "easeOutExpo");
        galNow.css({
            "opacity": 1
        })
        move(i);
        section.removeClass("active");
        section.eq(i).addClass("active");

        /*캐로셀 변경 효과*/
        function move(i) {
            let currentImg = gal.eq(current);
            let nextImg = gal.eq(i);
            let currentInfo = info.eq(current);
            let nextInfo = info.eq(i);

            currentImg.css({
                "z-index": 2
            });

            nextImg.css({
                "opacity": 0,
                "z-index": 3
            }).animate({"opacity": 1});
            gal.removeClass("active");
            nextImg.addClass("active");

            if (current < i) {
                currentInfo.stop().css({
                    "top": 0,
                    "opacity": 0.5
                }).animate({
                    "top": "100%",
                    "opacity": 0
                }, 500, "easeOutExpo")
                nextInfo.stop().css({
                    "top": "-100%",
                    "opacity": 0
                }).animate({
                    "top": 0,
                    "opacity": 1
                }, 500, "easeOutExpo")
            } else {
                currentInfo.stop().css({
                    "top": 0,
                    "opacity": 0.5
                }).animate({
                    "top": "-100%",
                    "opacity": 0
                }, 500, "easeOutExpo")
                nextInfo.stop().css({
                    "top": "100%",
                    "opacity": 0
                }).animate({
                    "top": 0,
                    "opacity": 1
                }, 500, "easeOutExpo")
            }
            info.removeClass("active");
            nextInfo.addClass("active");
            current = i;
        }
    })

    /*인디케이터 버튼 클릭효과*/
    $("i, .contents-btn li").click(function () {
        btn.removeClass("active");
        btn.eq(current).addClass("active");
    })
})

