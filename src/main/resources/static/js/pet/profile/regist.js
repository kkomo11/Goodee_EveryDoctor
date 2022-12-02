const speciesBtn = document.getElementById("speciesBtn");
const petBioRef = $("#petBioRef");
const petBio = $("#petBio");
const petBioSearchFrame = $("#petBioSearchFrame");
const speciesModalBtn = $("#speciesModalBtn");
const petBioNumInput = $("#petBioNumInput");
const speciesName = $("#speciesName");
const registBtn = $("#registBtn");  // 등록하기 버튼
const petProfileRegistForm = $("#petProfileRegistForm");    // 반려동물 프로필 등록 폼
let selectedPetNum = -1;
let selectedPetName = "";

//종족 선택 버튼을 누르면 대분류에 해당하는 데이터를 DB에서 조회 후 SELECT의 OPTION으로 넣어줌
speciesBtn.addEventListener("click", function(){
    petBioRef.empty();
    $.get("/pet/profile/findPetBioList", function(result){
        petBioRef.append("<option value='0' selected>종류선택</option>");
        $.each(result, function(index, item){
            // 미리 JSP에 Template으로 사용할 코드를 넣어놓음
            let petBioRefListTemplate = $("#petBioRefListTemplate").html();
            petBioRefListTemplate = petBioRefListTemplate.replace("{petBioNum}", item["petBioNum"]).replace("{petBioName}", item["petBioName"]);
            petBioRef.append(petBioRefListTemplate);
        });
    });
});

// 대분류의 값이 선택되면 소분류에 해당하는 데이터를 DB에서 조회 후 뿌려줌
petBioRef.on("change", function(){
    let petBioRefNum = petBioRef.val(); // 대분류에 해당하는 값을 받아옴
    if(petBioRefNum == 0){  // 선택 안했을 경우를 처리
        clearModal();
    } else if(petBioRefNum > 2) {   // 소분류에 해당하는 값이 적은 것들은 리스트 형태로 뿌려줌
        clearModal();
        $.ajax({
            type: "GET",
            url: "/pet/profile/findPetBioDetailList",
            data: {
                petBioNumRef: petBioRefNum
            },
            success: function(result){
                $.each(result, function(index, item){
                    let petBioListTemplate = $("#petBioListTemplate").html(); //JSP에 template으로 사용할 코드 미리 넣어놓음
                    petBioListTemplate = petBioListTemplate.replace("{petBioNum}", item["petBioNum"]).replace("{petBioName}", item["petBioName"]);
                    petBio.append(petBioListTemplate);
                });
            },
            error: function(result){
                console.log(result);
            }
        });
    } else if(petBioRefNum > 0 && petBioRefNum <= 2){
        clearModal();
        // 강아지, 고양이는 분류가 많아 검색할 수 있게 처리
        let petBioSearchTemplate = $("#petBioSearchTemplate").html();
        petBioSearchFrame.append(petBioSearchTemplate);

        const petBioSearchKeyword = $("#petBioSearchKeyword");
        petBioSearchKeyword.on("keyup", (event) => {
            if(event.keyCode === 13){   //엔터키 누르면 검색실행
                //console.log("검색 실행하면 됨");
                $.ajax({
                    type: "POST",
                    url: "/pet/profile/findPetBioDetailSearch",
                    data: {
                        petBioNumRef: petBioRefNum,
                        keyword: petBioSearchKeyword.val()
                    },
                    success: function(result){
                        petBio.empty();
                        $.each(result, function(index, item){
                            let petBioListTemplate = $("#petBioListTemplate").html(); //JSP에 template으로 사용할 코드 미리 넣어놓음
                            petBioListTemplate = petBioListTemplate.replace("{petBioNum}", item["petBioNum"]).replace("{petBioName}", item["petBioName"]);
                            petBio.append(petBioListTemplate);
                        });
                    },
                    error: function(result){
                        console.log(result);
                    }
                })
            }
        });
    }
});

// 하위분류를 클릭하면
petBio.on("click", function(event){

    let petBioChildren = petBio.children();
    petBioChildren.each(function(index, item){
        item.classList.remove("active");
    }); // 기존 아이템이 선택된 상태이면 체크해제

    let petBioListItem = event.target;
    petBioListItem.classList.add("active"); // 현재 선택된 아이템을 체크
    selectedPetNum = petBioListItem.getAttribute("data-bionum"); //폼에 넘겨줄 펫 분류 PK
    selectedPetName = petBioListItem.innerText; // 폼에 보여줄 펫 분류 이름
});

// 적용 버튼을 누르면
speciesModalBtn.on("click", function(){
    // 유효성 체크
    if(selectedPetNum != -1 && selectedPetName != ""){
        speciesName.val(selectedPetName);
        petBioNumInput.val(selectedPetNum);
        // 값 세팅
    } else {
        alert("반려동물의 종류를 선택해주세요.");
    }
    
});

function clearModal(){
    petBio.empty();
    petBioSearchFrame.empty();
}

registBtn.on("click", function(){

    let registFlag = inputValidation();

    if(registFlag){
        //console.log("전송하면됨");
        petProfileRegistForm.submit();
    }

}); // 등록 버튼을 누르면 작동

function inputValidation(){ // 입력값 검증 함수
    //console.log("검증 동작");
    const petNameInput = $("#petNameInput");
    const petBioNumInput = $("#petBioNumInput");
    const petBirthInput = $("#petBirthInput");
    const petAgeInput = $("#petAgeInput");
    const petSexInput = $(".petSexInput");
    const neuteredInput = $(".neuteredInput");
    const vaccinnationInput = $(".vaccinnationInput");
    let sFlag = false;
    let nFlag = false;
    let vFlag = false;

    if(!petNameInput.val()){
        alert("이름을 적어주세요.");
        petNameInput.focus();
        return false;
    }

    if(!petBioNumInput.val()){
        alert("반려동물이 어떤 아이인지 정해주세요");
        speciesBtn.click();
        return false;
    }

    if(!petBirthInput.val()){
        alert("반려동물은 언제 태어났나요?");
        petBirthInput.focus();
        return false;
    } else {
        let now = new Date();
        realNow = now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + now.getDate();
        if(petBirthInput.val() >= realNow){
            alert("미래에서 태어날 수가 있나요?");
            petBirthInput.focus();
            return false;
        }
    }

    if(!petAgeInput.val()){
        alert("당신의 아이는 몇살?");
        petAgeInput.focus();
        return false;
    }

    petSexInput.each(function(index, item){
        //console.log(item.checked);
        if(item.checked){
            sFlag = true;
        }
    }); // 성별 체크 검증 확인

    neuteredInput.each(function(index, item){
        if(item.checked){
            nFlag = true;
        }
    }); // 중성화 체크 검증 확인

    vaccinnationInput.each(function(index, item){
        if(item.checked){
            vFlag = true;
        }
    }); // 예방접종 체크 검증 확인

    if(!sFlag || !nFlag || !vFlag){
        alert("모든 체크박스 항목을 결정해주세요.");
        return false;
    }

    return true;

}