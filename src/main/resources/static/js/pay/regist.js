
const payInfoRegistForm = $("#payInfoRegistForm"); //결제 정보 등록 폼
const cardNumberInput = $("#cardNumberInput");      // 카드 번호 입력 칸
const cardExpirationYearInput = $("#cardExpirationYearInput");  // 카드 유효 연 입력 칸
const cardExpirationMonthInput = $("#cardExpirationMonthInput");    //카드 유효 월 입력 칸
const cardTwoInput = $("#cardTwoInput");    // 카드 뒤 두자리 입력 칸
const payInfoRegistBtn = $("#payInfoRegistBtn"); // 결제 정보 등록 버튼
const usernameInput = $("#usernameInput");

payInfoRegistBtn.on("click", () => {

    let cardNumberValue = cardNumberInput.val().replace(/(\s*)/g, "");  // 모든 공백 제거
    let cardExpirationYearValue = cardExpirationYearInput.val().replace(/(\s*)/g, "");
    let cardExpirationMonthValue = cardExpirationMonthInput.val().replace(/(\s*)/g, "");
    let cardTwoValue = cardTwoInput.val().replace(/(\s*)/g, "");

    let registFlag = validation(cardNumberValue, cardExpirationYearValue, cardExpirationMonthValue, cardTwoValue);
    let userCheckFlag = false;
    if(registFlag){
        userCheckFlag = confirm("정말 등록합니까?");
    }
    

    if(registFlag && userCheckFlag){

        $.ajax({
            type: "POST",
            url: "/pay/checkRealCard",
            data: {
                username: usernameInput.val(),
                cardNumber: cardNumberValue,
                cardExpirationYear: cardExpirationYearValue,
                cardExpirationMonth: cardExpirationMonthValue,
                cardTwo: cardTwoValue
            },
            success: result => {

                // 빌링 객체를 받아오면 카드정보가 올바르다는 뜻
                if(result["statusCode"] == 200){
                    let billingObj = result["billingVO"];

                    let billingKey = billingObj.billingKey;

                    if(billingKey != "" && billingKey != null){
                        payInfoRegistForm.submit();
                    }

                } else {
                    let errMessage = result["payErrorVO"].message;
                    alert(errMessage);
                }
            },
            error: result => {
                alert("유효하지 않은 카드정보입니다");
            }
        });

    }

});

function validation(cn, cey, cem, ct){

    let check = /^[0-9]+$/; // 숫자만 입력했는지 체크

    if((cn.length < 16 || cn.length > 20) || !check.test(cn)){
        alert("카드번호를 올바르게 입력하세요");
        cardNumberInput.focus();
        return false;
    }

    if(cey.length != 2 || !check.test(cey)){
        alert("카드 유효 연을 올바르게 입력하세요");
        cardExpirationYearInput.focus();
        return false;
    }

    if(cem.length != 2 || !check.test(cem)){
        alert("카드 유효 월을 올바르게 입력하세요");
        cardExpirationMonthInput.focus();
        return false;
    }

    if(ct.length != 2 || !check.test(ct)){
        alert("카드 비밀번호 앞 두자리를 올바르게 입력하세요");
        cardTwoInput.focus();
        return false;
    }

    return true;

}