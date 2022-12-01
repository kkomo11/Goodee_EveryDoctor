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

$("#registButton").click(function(){
    //MEDICROLE에 따라 AGENCYROLE 값이 자동으로 결정
    const medicRole = $("#medicRole");
    const agencyRole = $("#agencyRole");
    if(medicRole.val()=="의사" || medicRole.val()=="간호사"){
        agencyRole.val("병원");
    }else if(medicRole.val()=="수의사"){
        agencyRole.val("동물병원");
    }else if(medicRole.val()=="약사"){
        agencyRole.val("약국");
    }else{
        agencyRole.val("보호소");
    }

    $("#form").submit();

})