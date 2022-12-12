let photoFileCount = 0; // 사진 파일 틀 갯수
let photoFileLimit = 5; // 사진 파일 갯수 제한

$("#addPhotoBtn").on("click", function(){
    if(photoFileCount < photoFileLimit){
        photoFileCount += 1;
        $("#photoFileFrame").append($("#diagnosisFileInputTemplate").html());
    }
    
});

$("#photoFileFrame").on({
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
        thum.innerHtml = "";
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