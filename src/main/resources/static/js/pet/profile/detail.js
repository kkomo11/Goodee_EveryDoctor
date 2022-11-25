const radioDetailList = $(".radioDetail");
const userNameInputFromController = $("#userNameInputFromController");
const userNameInputFromDB = $("#userNameInputFromDB");
const petProfileUpdateBtn = $("#petProfileUpdateBtn");
const petProfileDeleteBtn = $("#petProfileDeleteBtn");
const petNum = $("#petNumInput");

radioDetailList.on("click", function(){
    return false;
}); // 라디오버튼 비활성화

init();

function init(){    // 반려동물 디테일 페이지 초기화 함수
    // 반려동물의 상세 정보를 AJAX로 요청
    const petNumValue = petNum.val(); // Get요청으로 Controller가 전달한 PK

    $.ajax({
        type : "POST",
        url : "/pet/profile/detail",
        data: {
            petNum: petNumValue
        },
        success: function(result){  // 성공 시 Detail페이지에 맞춰 값 넣음
            //console.log(result);
            let petProfile = result.petProfileDetail;
            let petBioProfile = result.petProfileBioDetail;
            //console.log(petProfile);
            //console.log(petBioProfile);
            $("#petNameInput").val(petProfile.petName);
            $("#speciesName").val(petBioProfile.petBioName);
            $("#petBirthInput").val(petProfile.petBirth);
            $("#petAgeInput").val(petProfile.petAge);
            $(".petSexInput").each(function(index, item){
                if(item.value == petProfile.petSex){
                    //item.prop("checked", "checked");
                    item.setAttribute("checked", "checked");
                }
            });
            $(".neuteredInput").each(function(index, item){
                if(item.value == petProfile.neutered){
                    item.setAttribute("checked", "checked");
                }
            });
            $(".vaccinnationInput").each(function(index, item){
                if(item.value == petProfile.vaccinnation){
                    item.setAttribute("checked", "checked");
                }
            });
            userNameInputFromDB.val(petProfile.userName);
            // 반려동물의 주인 PK를 받아옴(수정, 삭제의 검증으로 사용)

            if(petProfile.petFileName){
                $("#petProfileImage").attr("src", "/file/PET/" + petProfile.petFileName);
                $("#petFileNameInput").val(petProfile.petFileName); // 수정, 삭제를 위한 프로필 사진 이름 저장
            } // 프로필 사진이 있는 경우 보여줌

        },
        error: function(result){
            console.log(result);
        }
    })
}

// 반려동물 프로필 수정 버튼을 누르면
petProfileUpdateBtn.on("click", function(){
    // 먼저 해당 반려동물의 주인인지 확인
    if(userNameInputFromController.val() === userNameInputFromDB.val()){
        location.href = "/pet/profile/update?petNum=" + petNum.val(); // 수정 폼으로 이동
    } else {
        alert("권한이 없습니다.");
    }
});

// 반려동물 프로필 삭제 버튼을 누르면
petProfileDeleteBtn.on("click", function(){
    // 먼저 해당 반려동물의 주인인지 확인
    if(userNameInputFromController.val() === userNameInputFromDB.val()){
        let deleteFlag = confirm("정말 삭제합니까?");
        if(deleteFlag){
            // Delete 요청
            $.ajax({
                type: "POST",
                url: "/pet/profile/delete",
                data: {
                    petNum: petNum.val(),
                    petFileName: $("#petFileNameInput").val()
                },
                success: function(result){ // 반려동물 프로필 삭제 성공 시
                    if(result == 1){
                        location.href = "/"; // 이동(추후 마이페이지로 수정)
                    } else {
                        alert("삭제 오류");
                    }
                },
                error: function(result){
                    console.log(result);
                }
            });
        }
        
    } else {
        alert("권한이 없습니다.");
    }
});