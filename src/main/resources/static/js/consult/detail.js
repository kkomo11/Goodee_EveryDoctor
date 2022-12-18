const updateBtn = $("#updateBtn");
const deleteBtn = $("#deleteBtn");
const buttonFrame = $("#buttonFrame");

updateBtn.on("click", function(){
    location.href = "/consult/update?consultNum=" + buttonFrame.attr("data-consultnum");
});

deleteBtn.on("click", function(){
    let deleteFlag = confirm("정말 삭제합니까?");

    if(deleteFlag){
        $.ajax({
            type: "POST",
            url: "/consult/delete",
            data: {
                consultNum: buttonFrame.attr("data-consultnum")
            },
            success: function(result){
                if(result == '1'){
                    alert("삭제 성공");
                    location.href = "/consult/list";
                } else {
                    console.log(result);
                }
                
            },
            error: result => {
                console.log(result);
            }
        });
    }
});

const reportModalBtn = $("#reportModalBtn");
const reportForm = $("#reportForm");

reportModalBtn.click(function(){

    let reportFlag = confirm("신고 하시겠습니까?");

    if(reportFlag){
        reportForm.submit();
        // location.reload();
    }
})