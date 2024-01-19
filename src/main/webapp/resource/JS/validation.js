$(function () {

    $.ajax({
        url: 'https://raw.githubusercontent.com/hj-kimmy/NaverWhaleCloning/main/json/CountryCodes.json',
        type: "get",
        dataType: "json",
        success: function (result) {
            result = sortJSON(result, 'country', 'asc');
            for (var data of result) {
                if (data.code == "+82") {
                    $("select").append('<option value="' + data.code + '" selected>' + data.country + " " + data.code + '</option>');
                } else {
                    $("select").append('<option value="' + data.code + '">' + data.country + " " + data.code + '</option>');
                }

            }
        }
    })


    var sortJSON = function (data, key, type) {
        if (type == undefined) {
            type = "asc";
        }
        return data.sort(function (a, b) {
            var x = a[key];
            var y = b[key];
            if (type == "desc") {
                return x > y ? -1 : x < y ? 1 : 0;
            } else if (type == "asc") {
                return x < y ? -1 : x > y ? 1 : 0;
            }
        });
    };


    var joinForm = document.joinMemberForm;

    let loginForm = document.loginMemberForm;
    let errmsg = $(".errmsg")
    $("#submitBtn_Login").on({
        "click" : function getLogin() {
            if(!loginForm.id.value){
                errmsg.append('아이디를 입력해주세요.');
                $("#id").focus();
                return false;
            }
            errmsg.empty();
            if(!loginForm.password.value){
                errmsg.append('비밀번호를 입력해주세요.');
                $("#password").focus();
                return false;
            }
            loginForm.submit();
        }
    })




    let pwview = $("#join fieldset:nth-of-type(1) li:nth-of-type(2) .joinIcons:nth-of-type(2)");

    pwview.click(function () {
        $(this).toggleClass("noview");
        $("input[type='password']").attr("type", "text");
        $(".noview").siblings("input").attr("type", "password");
    })

    let id = $("#join #id");

    id.focusout(function () {
        if (!joinForm.id.value) {
            $(".id").show();
            $(".id").find("span").text("필수 정보입니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        if (!check(/^[a-z0-9_-]{5,20}$/, id)) {
            $(".id").show();
            $(".id").find("span").text("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        id.parents("li").removeClass("noValid");
        $(".id").hide();
    })

    let password = $("#join #password");

    password.focusout(function () {
        if (!joinForm.password.value) {
            $(".password").show();
            $(".password").find("span").text("필수 정보입니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        if (!check(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/, password)) {
            $(".password").show();
            $(".password").find("span").text("8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        password.parents("li").removeClass("noValid");
        $(".password").hide();
    })

    let email = $("#join #email");
    let regex = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);

    email.focusout(function () {
        if (email.val() != "") {
            if (!check(regex, email)) {
                $(".email").show();
                $(".email").find("span").text("이메일 주소가 정확한지 확인해 주세요.");
                $(this).parents("li").addClass("noValid");
                return false;
            }
        }
        email.parents("li").removeClass("noValid");
        $(".email").hide();
    })

    let name = $("#join #name");

    name.focusout(function () {
        if (!joinForm.name.value) {
            $(".name").show();
            $(".name").find("span").text("필수 정보입니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        name.parents("li").removeClass("noValid");
        $(".name").hide();
    })

    let birth = $("#join #birth");

    birth.focusout(function () {
        if (!joinForm.birth.value) {
            $(".birth").show();
            $(".birth").find("span").text("필수 정보입니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        if (!check(/^(19[0-9][0-9]|20\d{2}).?(0[0-9]|1[0-2]).?(0[1-9]|[1-2][0-9]|3[0-1])$/, birth)) {
            $(".birth").show();
            $(".birth").find("span").text("생년월일은 8자리 숫자로 입력해 주세요.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        birth.parents("li").removeClass("noValid");
        $(".birth").hide();
        birth.val()
    })

    let phone = $("#join #phone");

    phone.focusout(function () {
        if (!joinForm.phone.value) {
            $(".phone").show();
            $(".phone").find("span").text("필수 정보입니다.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        if (!check(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/, phone)) {
            $(".phone").show();
            $(".phone").find("span").text("휴대전화번호가 정확한지 확인해 주세요.");
            $(this).parents("li").addClass("noValid");
            return false;
        }
        phone.parents("li").removeClass("noValid");
        $(".phone").hide();
    })
    let genders = $(".inList label")

    genders.click(function () {
        $(".genderInput").parents(".inList-li").removeClass("noValid");
        $(".gender").hide();
    })

    $("#submitBtn_join").on({
      "click" : function (){
          if (!joinForm.id.value) {
              $(".id").show();
              $(".id").find("span").text("필수 정보입니다.");
              id.parents("li").addClass("noValid");
          }

          if (!check(/^[a-z0-9_-]{5,20}$/, id)) {
              $(".id").show();
              $(".id").find("span").text("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
              id.parents("li").addClass("noValid");
          }

          if (!joinForm.password.value) {
              $(".password").show();
              $(".password").find("span").text("필수 정보입니다.");
              password.parents("li").addClass("noValid");
          }
          if (!check(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/, password)) {
              $(".password").show();
              $(".password").find("span").text("8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.");
              password.parents("li").addClass("noValid");
          }

          if (email.val() != "") {
              if (!check(regex, email)) {
                  $(".email").show();
                  $(".email").find("span").text("이메일 주소가 정확한지 확인해 주세요.");
                  email.parents("li").addClass("noValid");
              }
          }

          if (!joinForm.name.value) {
              $(".name").show();
              $(".name").find("span").text("필수 정보입니다.");
              name.parents("li").addClass("noValid");
          }

          if (!joinForm.birth.value) {
              $(".birth").show();
              $(".birth").find("span").text("필수 정보입니다.");
              birth.parents("li").addClass("noValid");
          }
          if (!check(/^(19[0-9][0-9]|20\d{2}).?(0[0-9]|1[0-2]).?(0[1-9]|[1-2][0-9]|3[0-1])$/, birth)) {
              $(".birth").show();
              $(".birth").find("span").text("생년월일은 8자리 숫자로 입력해 주세요.");
              birth.parents("li").addClass("noValid");
          }

          if (!joinForm.phone.value) {
              $(".phone").show();
              $(".phone").find("span").text("필수 정보입니다.");
              phone.parents("li").addClass("noValid");
          }

          if (!check(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/, phone)) {
              $(".phone").show();
              $(".phone").find("span").text("휴대전화번호가 정확한지 확인해 주세요.");
              phone.parents("li").addClass("noValid");
          }

          if (!joinForm.gender.value) {
              $(".gender").show();
              $(".gender").find("span").text("성별을 선택해 주세요.");
              $(".genderInput").parents(".inList-li").addClass("noValid");
          }

          let noValidNum = document.getElementsByClassName("noValid").length;
          if(noValidNum===0){
              joinForm.submit();
          }

      }
    })

    function check(regExp, e) {
        return regExp.test(e.val());
    }
})

