$(function (){
    const url = window.location.href;

    let urlInput = $(".contents-modal .contents-copyBox input:nth-of-type(1)");
    let urlBtn = $(".contents-modal .contents-copyBox input:nth-of-type(2)");

    urlInput.val(url);

    urlBtn.click(function (){
        new ClipboardJS('#copyBtn');
        alert("다운로드 링크가 복사되었습니다.")
    })

})