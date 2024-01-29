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
            let code = $("#itc").attr('data-itccode');
            for (var data of result) {
                if (data.code === code) {
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
     * 각 입력창에서 focusOut했을 때_회원가입 폼 validation
     * *************************************************/
    var updateForm = document.updateMemberForm;
    let pwview1 = $("#join fieldset:nth-of-type(1) li:nth-of-type(2) .joinIcons:nth-of-type(2)");
    let pwview2 = $("#join fieldset:nth-of-type(1) li:nth-of-type(3) .joinIcons:nth-of-type(2)");

    pwview1.click(function () {
        $(this).toggleClass("noview");
        $("input[type='password']").attr("type", "text");
        $(".noview").siblings("input").attr("type", "password");
    })
    pwview2.click(function () {
        $(this).toggleClass("noview");
        $("input[type='password']").attr("type", "text");
        $(".noview").siblings("input").attr("type", "password");
    })

    let password = $("#join #password");
    let pwTxt = $(".password");

    password.focusout(function () {
        if (!updateForm.password.value) {
            pwTxt.show();
            pwTxt.find("span").text("필수 정보입니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        if (!check(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/, password)) {
            pwTxt.show();
            pwTxt.find("span").text("8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        password.parents("li").removeClass("noValid");
        pwTxt.hide();
    })

    let passwordChk = $("#join #passwordChk");
    let pwChkTxt = $(".passwordChk");

    passwordChk.focusout(function () {
        if (!updateForm.passwordChk.value) {
            pwChkTxt.show();
            pwChkTxt.find("span").text("필수 정보입니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        if (updateForm.password.value !== updateForm.passwordChk.value) {
            pwChkTxt.show();
            pwChkTxt.find("span").text("입력한 비밀번호와 일치하지 않습니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }

        passwordChk.parents("li").removeClass("noValid");
        pwChkTxt.hide();
    })


    let email = $("#join #email");
    let emailTxt = $(".email");
    let regex = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);

    email.focusout(function () {
        if (email.val() !== "") {
            if (!check(regex, email)) {
                emailTxt.show();
                emailTxt.find("span").text("이메일 주소가 정확한지 확인해 주세요.");
                $(this).parents("li").addClass("noValid");
                return false;
            }
        }
        email.parents("li").removeClass("noValid");
        emailTxt.hide();
    })

    let name = $("#join #name");
    let nameTxt = $(".name");

    name.focusout(function () {
        if (!updateForm.name.value) {
            nameTxt.show();
            nameTxt.find("span").text("필수 정보입니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        name.parents("li").removeClass("noValid");
        nameTxt.hide();
    })

    let birth = $("#join #birth");
    let birTxt = $(".birth");

    birth.focusout(function () {
        if (!updateForm.birth.value) {
            birTxt.show();
            birTxt.find("span").text("필수 정보입니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        if (!check(/^(19[0-9][0-9]|20\d{2}).?(0[0-9]|1[0-2]).?(0[1-9]|[1-2][0-9]|3[0-1])$/, birth)) {
            birTxt.show();
            birTxt.find("span").text("생년월일은 8자리 숫자로 입력해 주세요.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        let inputbirth = birth.val();
        inputbirth = dateForm(inputbirth);
        birth.val(inputbirth);

        birth.parents("li").removeClass("noValid");
        birTxt.hide();
        birth.val()
    })

    let phone = $("#join #phone");
    let phTxt = $(".phone");
    let now = phone.val();

    phone.focusout(function () {
        if (!updateForm.phone.value) {
            phTxt.show();
            phTxt.find("span").text("필수 정보입니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        if (!check(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/, phone)) {
            phTxt.show();
            phTxt.find("span").text("휴대전화번호가 정확한지 확인해 주세요.");
            $(this).parents("li").addClass("noValid");
            return false;
        }

        let inputPhone = phone.val();
        inputPhone = phoneForm(inputPhone);
        phone.val(inputPhone);

        if(now!==inputPhone){
            $.ajax({
                url : "./whale_member/phoneCheckService.lo",
                type : "post",
                data : {inputPhone : inputPhone},
                dataType: 'json',
                success :
                    function (result){
                        console.log("통신성공");
                        if(result===0){
                            phTxt.show();
                            phTxt.find("span").text("사용할 수 없는 전화번호입니다.(중복)");
                            phone.parents("li").addClass("noValid");
                            return false;
                        }else {
                            phone.parents("li").removeClass("noValid");
                            phTxt.hide();
                        }
                    },
                error : function (){
                    console.log("통신 실패")
                }
            })
        }else {
            phone.parents("li").removeClass("noValid");
            phTxt.hide();
        }
    })

    let genders = $(".inList label");
    let genTxt = $(".gender");

    genders.click(function () {
        genders.parents(".inList-li").removeClass("noValid");
        genTxt.hide();
    })

    let agree = $("#join #agree");
    let agreeTxt = $(".agree");

    agree.click(function () {
        agreeTxt.hide();
    })

    /***************************************************
     * submit 클릭시_회원가입 폼 validation
     * *************************************************/
    $("#submit_update").on({
        "click": function () {
            if (!check(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/, password)) {
                pwTxt.show();
                pwTxt.find("span").text("8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.");
                password.parents("li").addClass("noValid");
            }
            if (!updateForm.password.value) {
                pwTxt.show();
                pwTxt.find("span").text("필수 정보입니다.");
                password.parents("li").addClass("noValid");
            }

            if (updateForm.password.value !== updateForm.passwordChk.value) {
                pwChkTxt.show();
                pwChkTxt.find("span").text("입력한 비밀번호와 일치하지 않습니다.");
                passwordChk.parents("li").addClass("noValid");
            }
            if (!updateForm.passwordChk.value) {
                pwChkTxt.show();
                pwChkTxt.find("span").text("필수 정보입니다.");
                passwordChk.parents("li").addClass("noValid");
            }

            if (email.val() !== "") {
                if (!check(regex, email)) {
                    emailTxt.show();
                    emailTxt.find("span").text("이메일 주소가 정확한지 확인해 주세요.");
                    email.parents("li").addClass("noValid");
                }
            }

            if (!updateForm.name.value) {
                nameTxt.show();
                nameTxt.find("span").text("필수 정보입니다.");
                name.parents("li").addClass("noValid");
            }

            if (!check(/^(19[0-9][0-9]|20\d{2}).?(0[0-9]|1[0-2]).?(0[1-9]|[1-2][0-9]|3[0-1])$/, birth)) {
                birTxt.show();
                birTxt.find("span").text("생년월일은 8자리 숫자로 입력해 주세요.");
                birth.parents("li").addClass("noValid");
            }
            if (!updateForm.birth.value) {
                birTxt.show();
                birTxt.find("span").text("필수 정보입니다.");
                birth.parents("li").addClass("noValid");
            }

            if (!check(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/, phone)) {
                phTxt.show();
                phTxt.find("span").text("휴대전화번호가 정확한지 확인해 주세요.");
                phone.parents("li").addClass("noValid");
            }
            if (!updateForm.phone.value) {
                phTxt.show();
                phTxt.find("span").text("필수 정보입니다.");
                phone.parents("li").addClass("noValid");
            }

            if (!updateForm.gender.value) {
                genTxt.show();
                genTxt.find("span").text("성별을 선택해 주세요.");
                genders.parents(".inList-li").addClass("noValid");
            }

            let noValidNum = document.getElementsByClassName("noValid").length;
            if (noValidNum === 0) {
                updateForm.submit();
            }
        }
    })

    function dateForm(birth) {
        let temp = birth.replace(/\./g, "");
        let yyyy = temp.substring(0, 4);
        let mm = temp.substring(4, 6);
        let dd = temp.substring(6);
        return yyyy + "." + mm + "." + dd;
    }

    function phoneForm(phone) {
        let temp = phone.replace(/-/g, "");
        let p1 = temp.substring(0, 3);
        let p2 = temp.substring(3, 7);
        let p3 = temp.substring(7);
        return p1 + "-" + p2 + "-" + p3;
    }

    function check(regExp, e) {
        return regExp.test(e.val());
    }
})

function confirmSignOut(sessionID) {
    let userInput = prompt("계정 탈퇴는 취소할 수 없습니다. 탈퇴를 진행하시려면 아래에 '동의합니다'를 입력해주세요.");

    if(userInput==="동의합니다"){
        location.href="deleteMember.lo?id="+sessionID;
    }else {
        alert('확인문구가 일치하지 않습니다.');
        return false;
    }
}