let count = 0;
let check = [false, false, false];
let titleCheck = false;
let contentsCheck = false;

//파일 추가 버튼 클릭하면 파일추가 폼 생성
$("#fileAddButton").click(function(){
    console.log(count);

    if(count < 5){
        let add = $("#fileAddForm").html();
        $("#fileAdd").append(add);

        count++;
    }else{
        alert('파일은 최대 5개까지만 추가할 수 있습니다');
    }
})

//지우기 버튼 이벤트 위임
$("#fileAdd").on("click", ".del", function(){
    $(this).parents(".file").remove();
    count--;
})

//입력내용 검증
//신고제목 검증
// $("#reportTitle2").blur(function(){
//         let title = $("#reportTitle2").val();
//         console.log("Title : ", title);
//         let titleResult = nullCheck(title, ".reportTitlem", "제목은");
//         check[0] = titleResult;
// })


//신고내용 검증
// $("#reportContents").blur(function(){
//     let contents = $("#reportContents").val();
//     let contentsResult = nullCheck(contents, ".reportContentsm", "내용은");
//     check[1] = contentsResult;
// })
            
//신고 유형 검증
let type = $("#reportTypeNum").val();

$(".report").click(function(){
    console.log($("#reportTypeNum").val());
    if($("#reportTypeNum").val() != null){
        check[2] = true;
    }

    if(check.includes(false)){
        alert("입력 조건을 지켜주세요")
    }else{
        alert("신고 성공")
        $("#form").submit();
    }
})