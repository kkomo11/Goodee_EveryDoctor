const drugListFrame = $("#drugListFrame");  // 약 추가 목록 틀
const addDrugBtn = $("#addDrugBtn");        // 약 추가 버튼

const drugSearchModal = $("#drugSearchModal")   // 약 검색 모달
const drugSearchModalBtn = $("#drugSearchModalBtn");    // 약 검색 모달 오픈 버튼
const drugSearch = $("#drugSearch");        // 약 검색 인풋
const drugSearchItemFrame = $("#drugSearchItemFrame");  // 약 검색 결과 틀
const drugSearchList = $("#drugSearchList");    // 약 검색 결과 목록을 넣어줄 틀
const drugSetBtn = $("#drugSetBtn");    // 약 처방 버튼

const prescriptionSendBtn = $("#prescriptionSendBtn");  // 진단서 작성 버튼
const petPrescriptionForm = $("#petPrescriptionForm");   // 진단서 폼 태그

let searchedDrugNum = -1;
let searchedDrugName = "";
let aimedDrugInputTemplate = null;  // 약 정보를 담을 선택된 인풋

addDrugBtn.on("click", () => {
    const drugTemplate = $("#drugTemplate").html();

    drugListFrame.append(drugTemplate);
});

drugListFrame.on("click", event => {
    if(event.target.classList[1] == "drugSearchBtn"){
        drugSearchModalBtn.click();
        aimedDrugInputTemplate = event.target.parentNode.parentNode;
    }
});

drugSearch.on("keyup", (event) => {

    // 엔터키 누르면 약 정보 검색
    if(event.keyCode === 13){
        $.ajax({
            type: "POST",
            url: "/pet/diagnosis/findDrug",
            data: {
                drugName: drugSearch.val()
            },
            success: result => {
                drugSearchList.empty();
                $.each(result, function(index, item){
                    let drugListTemplate = $("#drugListTemplate").html();
                    drugListTemplate = drugListTemplate.replace("{drugNum}", item.drugNum).replace("{drugName}", item.drugName);

                    drugSearchList.append(drugListTemplate);
                }); // 검색 결과를 출력
            },
            error: result => {
                console.log(result);
            }
        });
    }
    
});

// 검색된 약을 클릭하면
drugSearchList.on("click", event => {
    let drugSearchListChildren = drugSearchList.children();
    drugSearchListChildren.each(function(index, item){
        item.classList.remove("active");
    }); // 기존에 선택된 아이템 선택 해제

    // 선택된 아이템 선택자
    let target = event.target;
    target.classList.add("active");
    searchedDrugNum = target.getAttribute("data-drugnum");
    searchedDrugName = target.innerText;
});

// 모달의 약 처방 버튼 누르면
drugSetBtn.on("click", () => {
    // 유효성 체크
    if(searchedDrugNum != -1 && searchedDrugName != ""){
        aimedDrugInputTemplate.children[1].innerText = searchedDrugName;
        aimedDrugInputTemplate.children[2].value = searchedDrugNum;

        searchedDrugName = "";
        searchedDrugNum = -1;
        aimedDrugInputTemplate = null;

        drugSearchList.empty();
        drugSearch.val("");
    } else {
        alert("약을 선택해주세요");
    }
});

prescriptionSendBtn.on("click", () => {

    let sendFlag = validation();

    if(sendFlag){
        petPrescriptionForm.submit();   // 진단서 전송
    }

});

function validation(){
    const pDansResponseInput = $("#pDansResponseInput");    // 의사소견 입력창
    const pDansAidInput = $("#pDansAidInput");  // 의사 조치내용 입력창
    const pDansCostInput = $("#pDansCostInput");    // 진료비 입력창

    let check = /^[0-9]+$/; // 숫자만 입력했는지 체크

    if(pDansResponseInput.val() == ""){
        alert("의사 소견을 입력해주세요");
        pDansResponseInput.focus();
        return false;
    }

    if(pDansAidInput.val() == ""){
        alert("의사 조치내용을 입력해주세요");
        pDansAidInput.focus();
        return false;
    }

    if(pDansCostInput.val() == ""){
        alert("진료비를 입력해주세요");
        pDansCostInput.focus();
        return false;
    }

    if(!check.test(pDansCostInput.val())){
        alert("진료비를 정확히 입력해주세요");
        pDansCostInput.focus();
        return false;
    }

    return true;

}