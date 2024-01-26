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

    searchTab.next().click(function (){
        if(searchTab.next().text()==="cancel"){
            searchTab.val("");
            searchTab.next().text("search");
        }
    })
})