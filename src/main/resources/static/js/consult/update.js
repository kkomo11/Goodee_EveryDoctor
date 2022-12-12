const consultNumInput = $("#consultNumInput");

const consultKindSelect = $("#consultKindSelect");
const consultCategorySelect = $("#consultCategorySelect");

const fileAddBtn = $("#fileAddBtn");
let fileCount = 0;
let fileLimit = 4;
const filesFrame = $("#filesFrame");    // 파일 폼을 담을 태그

const consultUpdateBtn = $("#consultUpdateBtn");
const consultUpdateForm = $("#consultUpdateForm");

$.ajax({
    type: "GET",
    url: "/consult/detailAjax?consultNum=" + consultNumInput.val(),
    success: result => {
        //console.log(result);
        init(result);
    },
    error: result => {
        console.log(result);
    }
})

function init(data){
    // update 폼의 초기값을 설정하는 함수
    const consultTitleInput = $("#consultTitleInput");
    const consultContentInput = $("#consultContentInput");

    consultTitleInput.val(data.consultTitle);
    consultContentInput.val(data.consultContent);
    consultKindSelect.val(data.consultKind);

    $.ajax({
        type: "POST",
        url: "/consult/consultCategory",
        data: {
            consultKind: data.consultKind
        },
        success: function(result){
            //console.log(result);
            consultCategorySelect.empty();
            $.each(result, function(index, item){
                let consultCategoryTemplate = $("#consultCategoryTemplate").html();
                consultCategoryTemplate = consultCategoryTemplate.replace("{categoryNum}", item["categoryNum"]).replace("{categoryName}", item["categoryName"]);
                consultCategorySelect.append(consultCategoryTemplate);
            });
            consultCategorySelect.val(data.hospitalCategoryVO[0].categoryNum);
            // 기존에 설정된 카테고리를 선택함
        },
        error: function(result){
            console.log(result);
        }
    });

    /*// 기존에 파일이 존재하면
    if(data.consultFiles.length > 0){
        fileCount = data.consultFiles.length;

        $.each(data.consultFiles, function(index, item){
            let fileInputTemplate = $("#fileInputTemplate").html();
            filesFrame.append(fileInputTemplate);   // 파일 Input 템플릿을 div태그 안에 넣음
        });

    }*/

}

// 무료상담 작성 폼에서 유형을 선택할 시 유형에 맞는 카테고리 정보를 Ajax 요청
consultKindSelect.on("change", function(){

    if(consultKindSelect.val() != 'none'){
        
        $.ajax({
            type: "POST",
            url: "/consult/consultCategory",
            data: {
                consultKind: consultKindSelect.val()
            },
            success: function(result){
                //console.log(result);
                consultCategorySelect.empty();
                $.each(result, function(index, item){
                    let consultCategoryTemplate = $("#consultCategoryTemplate").html();
                    consultCategoryTemplate = consultCategoryTemplate.replace("{categoryNum}", item["categoryNum"]).replace("{categoryName}", item["categoryName"]);
                    consultCategorySelect.append(consultCategoryTemplate);
                });
            },
            error: function(result){
                console.log(result);
            }
        });
    }
});

fileAddBtn.on("click", function(){

    if(fileCount < fileLimit){
        fileCount += 1;
        let fileInputTemplate = $("#fileInputTemplate").html();
        filesFrame.append(fileInputTemplate);   // 파일 Input 템플릿을 div태그 안에 넣음
    }
    
});

filesFrame.on({
    "change": event => {
        // input type file의 값이 변경되면 해당 input을 매개로 사진 미리보기 함수 호출
        setThumnail(event, event.target);
        //console.log(event.target.value);
    },
    "click": event => {
        if(event.target.classList[2] == 'fileDeleteBtn'){
            deleteFile(event.target);
        }   // 파일 삭제 버튼을 누르면 삭제 함수 호출
    }
}); // 사진 파일이 입력되거나 변경되면

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
        fileCount -= 1;
    }
}

consultUpdateBtn.on("click", function(){
    let updateFlag = inputValidate();

    if(updateFlag){
        consultUpdateForm.submit();
    }

});

function inputValidate(){
    const consultTitleInput = $("#consultTitleInput");
    const consultContentInput = $("#consultContentInput");

    if(!consultTitleInput.val()){
        alert("제목을 적어주세요");
        consultTitleInput.focus();
        return false;
    }

    if(!consultContentInput.val()){
        alert("내용을 적어주세요");
        consultContentInput.focus();
        return false;
    }

    if(consultKindSelect.val() == 'none'){
        alert("유형을 선택해주세요");
        return false;
    }

    return true;

}