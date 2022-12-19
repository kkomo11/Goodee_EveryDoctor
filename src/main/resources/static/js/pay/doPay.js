
const doPayBtn = $("#doPayBtn");

doPayBtn.on("click", () => {
    const usernameInput = $("#usernameInput");      // 유저이름창
    const amountInput = $("#amountInput");          // 결제금액창
    const orderNameInput = $("#orderNameInput");    // 주문이름창
    const orderIdInput = $("#orderIdInput");        // 주문아이디창
    const payNumInput = $("#payNumInput");          // 결제번호창

    let doPayFlag = confirm("등록된 결제 정보로 자동 결제됩니다.");

    if(doPayFlag){
        // Ajax로 등록된 결제 정보 요청
        $.ajax({
            type: "POST",
            url: "/pay/findMyPayInfo",
            data: {
                username: usernameInput.val()
            },
            success: result => {
                // 성공
                let customerKey = result["username"];
                let customerIdentityNumber = result["birth"].toString().substring("2"); // 8자리 생년월일을 6자리로 전처리
                let cardNumber = result["cardNumber"];
                let cardExpirationYear = result["cardExpirationYear"];
                let cardExpirationMonth = result["cardExpirationMonth"];
                let cardPassword = result["cardTwo"];

                // 빌링 객체 요청
                $.ajax({
                    type: "POST",
                    url: "/pay/billing",
                    data: {
                        cn: cardNumber,
                        cey: cardExpirationYear,
                        cem: cardExpirationMonth,
                        ct: cardPassword,
                        birth: customerIdentityNumber,
                        username: customerKey
                    },
                    success: result => {

                        // 빌링 객체 받아오면
                        if(result["statusCode"] == 200){
                            let billingObj = result["billingVO"];

                            let billingKey = billingObj.billingKey;
                            let customerKeyCheck = billingObj.customerKey;

                            if(customerKeyCheck == customerKey){

                                // 결제 요청
                                $.ajax({
                                    type: "POST",
                                    url: "/pay/payment",
                                    data: {
                                        bk: billingKey,
                                        username: customerKeyCheck,
                                        amount: amountInput.val(),
                                        orderId: orderIdInput.val(),
                                        orderName: orderNameInput.val(),
                                        pn: payNumInput.val()
                                    },
                                    success: result => {
                                        if(result["statusCode"] == 200){
                                            alert("결제완료");
                                            // 미납된 결제 목록으로 이동
                                            location.href = "/pay/requestedPayList?m=" + customerKeyCheck;
                                        } else {
                                            let errMessage = result["payErrorVO"].message;
                                            alert(errMessage);
                                        }
                                    },
                                    error: result => {
                                        alert("결제 실패");
                                    }
                                });

                            }

                        } else {
                            let errMessage = result["payErrorVO"].message;
                            alert(errMessage);
                        }
                    },
                    error: result => {
                        alert("결제 실패");
                    }
                });

            },
            error: result => {
                alert("결제 정보를 불러올 수 없습니다");
            }
        });
    }

});