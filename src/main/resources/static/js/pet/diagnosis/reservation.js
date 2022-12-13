const ownedPetListFrame = $("#ownedPetListFrame");

const petNumInput = $("#petNumInput");  // 펫 PK를 담을 인풋

const petNameInput = $("#petNameInput");
const speciesNameInput = $("#speciesNameInput");
const petBirthInput = $("#petBirthInput");
const petAgeInput = $("#petAgeInput");
const petSexInput = $("#petSexInput");
const neuteredInput = $("#neuteredInput");
const vaccinnationInput = $("#vaccinnationInput");  // Ajax 요청 완료 후 페이지에 값을 넣을 input들

const petNameInput2 = $("#petNameInput2");
const speciesNameInput2 = $("#speciesNameInput2");
const petBirthInput2 = $("#petBirthInput2");
const petAgeInput2 = $("#petAgeInput2");
const petSexInput2 = $("#petSexInput2");
const neuteredInput2 = $("#neuteredInput2");
const vaccinnationInput2 = $("#vaccinnationInput2");  // Ajax 요청 완료 후 페이지에 값을 넣을 세번째 단계 input들

const pDansCategory = $("#pDansCategory"); //카테고리 선택창
const pDansCategory2 = $("#pDansCategory2"); // 세번째 단계 카테고리 선택창

const pDansContentInput = $("#pDansContentInput");  // 상담내용 입력창
const pDansContentInput2 = $("#pDansContentInput2");    // 세번째 단계 상담내용 입력창

const addPhotoBtn = $("#addPhotoBtn");  //사진 추가 버튼
const photoFileFrame = $("#photoFileFrame"); //사진 Input들을 담을 틀
let photoFileCount = 0; // 사진 파일 틀 갯수
let photoFileLimit = 5; // 사진 파일 갯수 제한

const nav_item_info_tab = $("#nav-item-info-tab");  // 첫번째 단계 탭
const firstNextBtn = $("#firstNextBtn");    // 첫번째 다음 단계 버튼
const nav_item_details_tab = $("#nav-item-details-tab");    // 두번째 단계 탭
const secondPreBtn = $("#secondPreBtn");    // 두번째 단계 뒤로 버튼
const secondNextBtn = $("#secondNextBtn");  // 두번째 단계 앞으로 버튼
const nav_user_info_tab = $("#nav-user-info-tab");  // 세번째 단계 탭
const thirdPreBtn = $("#thirdPreBtn");  // 세번째 단계 뒤로 버튼

const submitBtn = $("#submitBtn");  // 세번째 단계 전송 버튼
const reservationForm = $("#reservationForm");  // 전송 폼

$.get("/pet/diagnosis/category", function(result){
    //console.log(result);
    $.each(result, function(index, item){
        let temp = $("#pDansCategoryOptionTemplate").html();
        temp = temp.replace("{category}", item.categoryName).replace("{categoryName}", item.categoryName);
        pDansCategory.append(temp);
        pDansCategory2.append(temp);
    });
}); // 상담 유형(category)를 불러올 Ajax 요청

ownedPetListFrame.on("click", event => {
    //console.log(event);
    //console.log(event.target);
    //console.log(event.target.parentNode);
    //console.log(event.target.parentNode.className);

    // 자신의 등록된 반려동물 리스트를 클릭 시 디테일 정보를 Ajax로 요청후 적절한 input에 값 넣음
    if(event.target.parentNode.className == "ownedPetFrame"){
        let petNumVal = event.target.parentNode.getAttribute("data-petnum");
        petNumInput.val(petNumVal);
        //console.log(petNumVal);
        $.ajax({
            type: "POST",
            url: "/pet/profile/detail",
            data: {
                petNum: petNumVal
            },
            success: function(result){
                //console.log(result);
                let petProfileDetail = result["petProfileDetail"];
                let petProfileBioDetail = result["petProfileBioDetail"];
                petNameInput.val(petProfileDetail.petName);
                speciesNameInput.val(petProfileBioDetail.petBioName);
                petBirthInput.val(petProfileDetail.petBirth);
                petAgeInput.val(petProfileDetail.petAge);

                if(petProfileDetail.petSex == 0){
                    petSexInput.val("암");
                } else if(petProfileDetail.petSex == 1) {
                    petSexInput.val("수");
                }

                if(petProfileDetail.neutered == 0){
                    neuteredInput.val("중성화안됨");
                } else if(petProfileDetail.neutered == 1){
                    neuteredInput.val("중성화됨");
                }

                if(petProfileDetail.vaccinnation == 0){
                    vaccinnationInput.val("안함");
                } else if(petProfileDetail.vaccinnation == 1){
                    vaccinnationInput.val("부분접종");
                } else if(petProfileDetail.vaccinnation == 2){
                    vaccinnationInput.val("함");
                } else if(petProfileDetail.vaccinnation == 3){
                    vaccinnationInput.val("모르겠음");
                }

                // 세번째 단계 값 세팅
                petNameInput2.val(petProfileDetail.petName);
                speciesNameInput2.val(petProfileBioDetail.petBioName);
                petBirthInput2.val(petProfileDetail.petBirth);
                petAgeInput2.val(petProfileDetail.petAge);

                if(petProfileDetail.petSex == 0){
                    petSexInput2.val("암");
                } else if(petProfileDetail.petSex == 1) {
                    petSexInput2.val("수");
                }

                if(petProfileDetail.neutered == 0){
                    neuteredInput2.val("중성화안됨");
                } else if(petProfileDetail.neutered == 1){
                    neuteredInput2.val("중성화됨");
                }

                if(petProfileDetail.vaccinnation == 0){
                    vaccinnationInput2.val("안함");
                } else if(petProfileDetail.vaccinnation == 1){
                    vaccinnationInput2.val("부분접종");
                } else if(petProfileDetail.vaccinnation == 2){
                    vaccinnationInput2.val("함");
                } else if(petProfileDetail.vaccinnation == 3){
                    vaccinnationInput2.val("모르겠음");
                }

            },
            error: function(result){
                console.log(result);
            }
        })
    }

});

pDansCategory.on("change", function(){
    pDansCategory2.val(pDansCategory.val());
});

pDansCategory2.on("change", function(){
    pDansCategory.val(pDansCategory2.val());
});

pDansContentInput.on("blur", function(){
    pDansContentInput2.val(pDansContentInput.val());
});

addPhotoBtn.on("click", function(){
    if(photoFileCount < photoFileLimit){
        photoFileCount += 1;
        photoFileFrame.append($("#diagnosisFileInputTemplate").html());
    }
    
});

photoFileFrame.on({
    "change": event => {
        // input type file의 값이 변경되면 해당 input을 매개로 사진 미리보기 함수 호출
        setThumnail(event, event.target);
    },
    "click": event => {
        if(event.target.classList[2] == 'fileDeleteBtn'){
            deleteFile(event.target);
        }   // 파일 삭제 버튼을 누르면 삭제 함수 호출
    }
});

// 사진파일 미리보기 함수
function setThumnail(event, input){
    // input은 사진이 들어가는 input 태그
    let reader = new FileReader();

    //console.log(input);

    reader.onload = function(event){
        let thum = input.previousSibling.previousSibling;   // 미리보기 img 태그를 넣을 태그
        thum.replaceChildren(); // 기존 내용물 지우기
        let img = document.createElement('img');
        img.setAttribute("src", event.target.result);
        img.setAttribute("style", "width:50%; height:50%;");
        thum.append(img);

    }

    reader.readAsDataURL(event.target.files[0]);
}

// 파일 삭제 함수
function deleteFile(targ){
    let fileFrame = targ.parentNode.parentNode; // 눌린 삭제 버튼을 포함하는 템플릿 최상위 태그
    
    let delFlag = confirm("취소합니까?");

    if(delFlag){
        fileFrame.remove();
        photoFileCount -= 1;
    }
}

firstNextBtn.on("click", function(){
    nav_item_details_tab.click();
});

secondPreBtn.on("click", function(){
    nav_item_info_tab.click();
});

secondNextBtn.on("click", function(){
    nav_user_info_tab.click();
});

thirdPreBtn.on("click", function(){
    nav_item_details_tab.click();
});

submitBtn.on("click", function(){
    let submitFlag = validation();

    if(submitFlag){
        reservationForm.submit();
    }
});

// 전송 전 검증 함수
function validation(){
    if(!petNameInput2.val() || !speciesNameInput2.val() || !petBirthInput2.val() || !petAgeInput2.val()){
        alert("반려동물을 선택하세요");
        nav_item_info_tab.click();
        return false;
    }

    if(!pDansCategory2.val()){
        alert("유형을 선택하세요");
        nav_item_details_tab.click();
        return false;
    }

    if(!pDansContentInput2.val()){
        alert("내용을 작성하세요");
        nav_item_details_tab.click();
        return false;
    }

    return true;
}