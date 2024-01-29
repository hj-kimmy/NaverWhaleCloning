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

    let loginForm = document.loginMemberForm;
    let errmsg = $(".errmsg")
    $("#submitBtn_Login").on({
        "click": function getLogin() {
            if (!loginForm.id.value) {
                errmsg.text('아이디를 입력해주세요.');
                $("#id").focus();
                return false;
            }
            if (!loginForm.password.value) {
                errmsg.text('비밀번호를 입력해주세요.');
                $("#password").focus();
                return false;
            }
            loginForm.submit();
        }
    })

    /***************************************************
     * 각 입력창에서 focusOut했을 때_회원가입 폼 validation
     * *************************************************/
    var joinForm = document.joinMemberForm;
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

    let id = $("#join #id");
    let idTxt = $(".id");
    let url = 'confirmId.jsp?id=' + joinForm.id.value;
    idTxt.find("span").load(url + " span");

    id.focusout(function () {
        if (!joinForm.id.value) {
            idTxt.show();
            idTxt.find("span").text("필수 정보입니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        if (!check(/^[a-z0-9_-]{5,20}$/, id)) {
            idTxt.show();
            idTxt.find("span").text("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        url = 'confirmId.jsp?id=' + joinForm.id.value;
        idTxt.find("span").load(url + " span");

        $(document).mouseup(function (e) {
            if (id.has(e.target).length === 0) {
                e.stopPropagation();
                if (idTxt.find("span").text()!=="") {
                    id.parents("li").addClass("noValid");
                    idTxt.show();
                    return false;
                }
                id.parents("li").removeClass("noValid");
                idTxt.hide();
            }
        })

    })

    let password = $("#join #password");
    let pwTxt = $(".password");

    password.focusout(function () {
        if (!joinForm.password.value) {
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
        if (!joinForm.passwordChk.value) {
            pwChkTxt.show();
            pwChkTxt.find("span").text("필수 정보입니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        if (joinForm.password.value !== joinForm.passwordChk.value) {
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
        if (!joinForm.name.value) {
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
        if (!joinForm.birth.value) {
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

    phone.focusout(function () {
        if (!joinForm.phone.value) {
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

        $.ajax({
            url : "./phoneCheckService.lo",
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

        //
        // phone.parents("li").removeClass("noValid");
        // phTxt.hide();
    })

    // let findPhone = $("#findPhone");
    // let phoneduChk = $("#submit_duplicateChk");
    // let findForm = document.findMemberForm;
    //
    // phoneduChk.click(function (){
    //     if(!findForm.findPhone.value){
    //         errmsg.text("전화번호를 입력해주세요.")
    //     }
    //     if(findForm.findPhone.value === "010-1234-1234"){
    //         alert("중복된 전화번호입니다.");
    //         findPhone.val("");
    //     }
    //     phone.val(findForm.findPhone.value);
    //     $(this).parents(".contents-modal").find(".xBtn").trigger("click");
    //     phone.trigger("focusout");
    // })

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
    $("#submitBtn_join").on({
        "click": function () {
            if (!check(/^[a-z0-9_-]{5,20}$/, id)) {
                idTxt.show();
                idTxt.find("span").text("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
                id.parents("li").addClass("noValid");
            }
            if (!joinForm.id.value) {
                idTxt.show();
                idTxt.find("span").text("필수 정보입니다.");
                id.parents("li").addClass("noValid");
            }
            if (idTxt.find("span").text()!=="") {
                id.parents("li").addClass("noValid");
                idTxt.show();
            }

            if (!check(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/, password)) {
                pwTxt.show();
                pwTxt.find("span").text("8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.");
                password.parents("li").addClass("noValid");
            }
            if (!joinForm.password.value) {
                pwTxt.show();
                pwTxt.find("span").text("필수 정보입니다.");
                password.parents("li").addClass("noValid");
            }

            if (joinForm.password.value !== joinForm.passwordChk.value) {
                pwChkTxt.show();
                pwChkTxt.find("span").text("입력한 비밀번호와 일치하지 않습니다.");
                passwordChk.parents("li").addClass("noValid");
            }
            if (!joinForm.passwordChk.value) {
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

            if (!joinForm.name.value) {
                nameTxt.show();
                nameTxt.find("span").text("필수 정보입니다.");
                name.parents("li").addClass("noValid");
            }

            if (!check(/^(19[0-9][0-9]|20\d{2}).?(0[0-9]|1[0-2]).?(0[1-9]|[1-2][0-9]|3[0-1])$/, birth)) {
                birTxt.show();
                birTxt.find("span").text("생년월일은 8자리 숫자로 입력해 주세요.");
                birth.parents("li").addClass("noValid");
            }
            if (!joinForm.birth.value) {
                birTxt.show();
                birTxt.find("span").text("필수 정보입니다.");
                birth.parents("li").addClass("noValid");
            }

            if (!check(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/, phone)) {
                phTxt.show();
                phTxt.find("span").text("휴대전화번호가 정확한지 확인해 주세요.");
                phone.parents("li").addClass("noValid");
            }
            if (!joinForm.phone.value) {
                phTxt.show();
                phTxt.find("span").text("필수 정보입니다.");
                phone.parents("li").addClass("noValid");
            }

            if (!joinForm.gender.value) {
                genTxt.show();
                genTxt.find("span").text("성별을 선택해 주세요.");
                genders.parents(".inList-li").addClass("noValid");
            }

            if (!joinForm.agree.checked) {
                agreeTxt.show();
                agreeTxt.find("span").text("약관에 동의해주세요.");
            }

            id.focus();
            let noValidNum = document.getElementsByClassName("noValid").length;
            if (noValidNum === 0) {
                joinForm.submit();
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
