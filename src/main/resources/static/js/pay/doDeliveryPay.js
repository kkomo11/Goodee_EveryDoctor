
history.replaceState({}, null, location.pathname);

const addrSelect = $("#addrSelect");
const mainAddrInput = $("#mainAddrInput");
const subAddrInput = $("#subAddrInput");
const postInput = $("#postInput");

const doDeliveryPayBtn = $("#doDeliveryPayBtn");

addrSelect.on("change", (event) => {
    let addrOption = event.target;
    let addrChildren = addrOption.children;

    $.each(addrChildren, function(index, item){
        if(item.value == addrOption.value){
            mainAddrInput.val(item.getAttribute("data-mainaddr"));
            subAddrInput.val(item.getAttribute("data-subaddr"));
            postInput.val(item.getAttribute("data-post"));
        }
    });
    
});

doDeliveryPayBtn.on("click", () => {
    const usernameInput = $("#usernameInput");
    const amountInput = $("#amountInput");
    const orderNameInput = $("#orderNameInput");
    const orderIdInput = $("#orderIdInput");
    const payNumInput = $("#payNumInput");

    if(addrSelect.val() == "null"){
        alert("배송지를 선택해주세요");
        return false;
    } else {
        let doDeliveryPayFlag = confirm("등록된 결제 정보로 자동 결제 됩니다.");

        if(doDeliveryPayFlag){
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

                                                // 배송 정보 입력
                                                $.ajax({
                                                    type: "POST",
                                                    url: "/pay/inputDrugDelivery",
                                                    data: {
                                                        payNum: payNumInput.val(),
                                                        addressNum: addrSelect.val()
                                                    },
                                                    success: result => {
                                                        if(result == 1){
                                                            // 미납된 결제 목록으로 이동
                                                            location.href = "/pay/requestedPayList?m=" + customerKeyCheck;
                                                        } else{
                                                            alert("배송 정보 입력 오류, 관리자에게 문의")
                                                        }
                                                        
                                                    },
                                                    error: result => {
                                                        alert("배송 정보 입력 오류, 관리자에게 문의");
                                                    }
                                                });
                                                
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
                    alert("결제 정보를 불러올 수 없습니다.");
                }
            });
        }
    }

});