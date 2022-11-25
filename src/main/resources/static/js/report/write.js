let count = 0;

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

// <span id="upload-name">첨부파일명</span>

// $("부모선택자").on("이벤트명", "자식선택자", callback function)

// $("#fileAdd").on("change", ".uploadFile",function(event){
//     console.log(event.target.value);
//     let fileName = $(this).val();

//     $(this).parent().find(".upload-name").text(fileName);
//     console.log(fileName);
//     // $("#upload-name").text(fileName);
// });

// $("#fileAdd").on("click", ".step-two-content", function(event){
//     console.log($(this).find(".uploadFile"));
//     $(this).find(".uploadFile").click();
// })
