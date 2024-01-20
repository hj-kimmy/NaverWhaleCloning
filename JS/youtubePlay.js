$(function (){
    /***************************************************
     * 유튜브 제어
     * *************************************************/
    let videoBtn = $("section#smartStudy .contents-youtube img.thumbnail");
    let playBtn = $("section#smartStudy .playButton")

    videoBtn.click(function (){
        $(this).hide();
        $(this).next().hide();
        $("iframe")[0].contentWindow.postMessage('{"event" : "command", "func" : "'+'playVideo'+'"}','*');
    })

    playBtn.click(function (){
        videoBtn.trigger("click");
    })

})