const ownedPetListFrame = $("#ownedPetListFrame");

const petNumInput = $("#petNumInput");  // 펫 PK를 담을 인풋

const petNameInput = $("#petNameInput");
const speciesNameInput = $("#speciesNameInput");
const petBirthInput = $("#petBirthInput");
const petAgeInput = $("#petAgeInput");
const petSexInput = $("#petSexInput");
const neuteredInput = $("#neuteredInput");
const vaccinnationInput = $("#vaccinnationInput");  // Ajax 요청 완료 후 페이지에 값을 넣을 input들

const pDansCategory = $("#pDansCategory"); //카테고리 선택창
const addPhotoBtn = $("#addPhotoBtn");  //사진 추가 버튼
const photoFileFrame = $("#photoFileFrame"); //사진 Input들을 담을 틀
let photoFileCount = 0; // 사진 파일 틀 갯수
let photoFileLimit = 5; // 사진 파일 갯수 제한

$.get("/pet/diagnosis/category", function(result){
    //console.log(result);
    $.each(result, function(index, item){
        let temp = $("#pDansCategoryOptionTemplate").html();
        temp = temp.replace("{category}", item.categoryName).replace("{categoryName}", item.categoryName);
        pDansCategory.append(temp);
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

            },
            error: function(result){
                console.log(result);
            }
        })
    }

});

addPhotoBtn.on("click", function(){
    if(photoFileCount < photoFileLimit){
        photoFileCount += 1;
        photoFileFrame.append($("#diagnosisFileInputTemplate").html());
    }
    
});