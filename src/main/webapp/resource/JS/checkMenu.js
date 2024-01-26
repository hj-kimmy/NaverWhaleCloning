let openSort = $("#now");
let sortList = $("#category");
let current = 0;

openSort.click(function () {
    current += 180;
    sortList.fadeToggle(100);
    openSort.find("span").eq(1).css({"transform": "rotateZ(" + current + "deg)"});
})

let sortBtn = $("#category button");
let nowSorted = $("#now span:nth-child(1)");
let sortOrderText = $(".is-checked").find("span").eq(0).text();
$("#categoryValue").val(sortOrderText);

sortBtn.click(function () {
    sortOrderText = $(this).find("span").eq(0).text();
    sortBtn.removeClass("is-checked");
    $(this).addClass("is-checked");
    nowSorted.text(sortOrderText);
    sortList.hide();
    $("#categoryValue").val(sortOrderText);
})

$(document).mouseup(function (e) {
    if (sortList.has(e.target).length === 0) {
        e.stopPropagation();
        sortList.hide();
    }
})

let board = document.board_update;

function checkBoardForm(){
    if(!board.subject.value){
        alert("제목을 입력해주세요.")
        board.subject.focus();
        return false;
    }
    if(!board.content.value){
        alert("내용을 입력해주세요.")
        board.content.focus();
        return false;
    }

    let text = $('textarea');
    text.val(text.val().replace(/(?:\r\n|\r|\n)/g, '<br>'));

    board.submit();
}