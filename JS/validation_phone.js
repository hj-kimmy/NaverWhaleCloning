$(function () {

    /***************************************************
     * ITC(국가 전화번호 코드) json 에서 가져오기
     * *************************************************/
    $.ajax({
        url: 'https://raw.githubusercontent.com/hj-kimmy/NaverWhaleCloning/main/json/CountryCodes.json',
        type: "get",
        dataType: "json",
        success: function (result) {
            result = sortJSON(result, 'country', 'asc');
            for (var data of result) {
                if (data.code === "+82") {
                    $("select").append('<option value="' + data.code + '" selected>' + data.country + " " + data.code + '</option>');
                } else {
                    $("select").append('<option value="' + data.code + '">' + data.country + " " + data.code + '</option>');
                }

            }
        }
    })

    /*json 데이터 원하는 데이터 기준 정렬 메소드*/
    var sortJSON = function (data, key, type) {
        if (type === undefined) {
            type = "asc";
        }
        return data.sort(function (a, b) {
            var x = a[key];
            var y = b[key];
            if (type === "desc") {
                return x > y ? -1 : x < y ? 1 : 0;
            } else if (type === "asc") {
                return x < y ? -1 : x > y ? 1 : 0;
            }
        });
    };

    /***************************************************
     * 로그인 폼 validation
     * *************************************************/

    let findForm = document.findMemberForm;
    let errmsg = $(".errmsg")
    let findPhone = $("#findPhone");

    $("#submitBtn_find").on({
        "click" : function getLogin() {
            if(!findForm.findPhone.value){
                errmsg.text('전화번호를 입력해주세요.');
                findPhone.focus();
                return false;
            }
            if (!check(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/, phone)) {
                errmsg.text("휴대전화번호가 정확한지 확인해 주세요.");
                findPhone.focus();
                return false;
            }
            phoneForm(findForm.findPhone.value);
            findForm.submit();
        }
    })

    function check(regExp, e) {
        return regExp.test(e.val());
    }

    function phoneForm(phone){
        let temp = phone.replace(/-/g,"");
        let p1 = temp.substring(0,3);
        let p2 = temp.substring(3,7);
        let p3 = temp.substring(7);
        return p1+"-"+p2+"-"+p3;
    }
})
