$(function () {
    let tabBtn = $("#helpSearch .contents-tabButton li");
    let tabs =$("#questions .contents-tabs");

    tabBtn.click(function (){
        tabBtn.removeClass("active");
        $(this).addClass("active");
        tabs.removeClass("active");
        $("#"+$(this).data('help')).addClass("active")
    })
})
