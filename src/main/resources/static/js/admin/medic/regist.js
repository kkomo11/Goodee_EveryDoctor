let count = 0;

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

//신청 버튼
$(".inputButton").click(function(){
    console.log("click");
    
    //기관 검색 유효성 검사
    console.log($(this).parent().parent().prev().prev().prev().find(".agencyNum").val());
    // console.log($(this).parent().parent().prev().prev().prev().children().children().val());
    
    $(this).parent().parent().parent().parent().submit();
})