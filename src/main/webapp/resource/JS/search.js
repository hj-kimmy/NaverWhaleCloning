$(function (){
    let searchTab = $("#text");

    searchTab.keyup(function (key){
        let searchKeyword = searchTab.val();
        if(searchKeyword===""){
            searchTab.next().text("search");
        }else {
            searchTab.next().text("cancel");
        }
        if(key.keyCode===13){
            document.searchForm.submit();
        }
    })
    let searchKeyword = searchTab.val();
    if(searchKeyword===""){
        searchTab.next().text("search");
    }else {
        searchTab.next().text("cancel");
    }

    searchTab.next().click(function (){
        if(searchTab.next().text()==="cancel"){
            searchTab.val("");
            searchTab.next().text("search");
            document.searchForm.submit();
        }
    })

    $("#deleteBtn").click(function (){
        let deleteForm = $("#editForm");
        let checked = document.querySelectorAll('input[name="editCheck"]:checked').length
        if(checked===0){
            alert("선택된 게시글이 없습니다.")
            return false;
        }else {
            if(confirm(checked + '개의 게시글을 삭제합니다.')){
                deleteForm.attr('action','./BoardDeleteAction.do')
                deleteForm.submit();
            }
        }
    })

    $("#updateBtn").click(function (){
        let updateForm = $("#editForm");
        let checked = document.querySelectorAll('input[name="editCheck"]:checked')

        if(checked.length===0){
            alert("선택된 게시글이 없습니다.")
            return false;
        }else if(checked.length>1){
            alert("수정은 1개의 게시글만 가능합니다.")
        }else if(checked.length===1){
            updateForm.attr('action','./BoardUpdateForm.do')
            updateForm.submit();
        }
    })
})