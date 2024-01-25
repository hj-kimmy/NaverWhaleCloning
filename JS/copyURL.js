$(function (){
    /***************************************************
     * URL 복사기능
     * *************************************************/
    const url = window.location.href;

    let urlInput = $("#downloadURL");
    let urlBtn = $(".copyBtn");

    urlInput.val(url);

    urlBtn.click(function (){
        new ClipboardJS('.copyBtn');
        alert("링크가 복사되었습니다.")
    })

})