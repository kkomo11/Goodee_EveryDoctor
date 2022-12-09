const modalBtn = $(".modalBtn");

$("#flexSwitchCheckDefault").change(function(){
    console.log($("#flexSwitchCheckDefault").prop("checked"));
})

//상세보기 버튼 클릭
modalBtn.click(function(){
    // let title = $(this).parent().prev().prev().text();
    // $(this).attr("data-target",title);
    // $(".reportModal").attr("id",title);
    // console.log($(".reportModal"));
    // modalBtn.attr("data-target","")

    console.log($(this).parent().parent().find(".ajaxNum").html());
    const ajaxNum = $(this).parent().parent().find(".ajaxNum").html();
    
    //관리자 답변달기를 위한 reportNum값 받기
    $("#reportNum").val(ajaxNum);
    console.log("reportNum : ",$("#reportNum").val());

    $("#reporterName").empty();
    $("#reportedName").empty();
    $("#reportTitle").empty();
    $("#reportType").empty();
    $("#reportContents").empty();
    $("#reportFile").empty();
    $("#reportAnswer").empty();
    // 신고 상세내용을 모달창에 ajax로 호출
    $.ajax({
        type: "GET",
        url: "/admin/report/detail",
        data: {
            reportNum: ajaxNum
        },
        success: function(result){
            $("#reporterName").append("<strong>" + result.reporterName + "</strong>");
            $("#reportedName").append("<strong>" + result.reportedName + "</strong>");
            $("#reportTitle").append("<strong>" + result.reportTitle + "</strong>");
            $("#reportType").append("<strong>" + result.reportTypeVO.reportTypeName + "</strong>");
            $("#reportContents").append("<strong>" + result.reportContents + "</strong>");
            if(result.fileVOs != null){
                $.each(result.fileVOs, function(index, item){
                    $("#reportFile").append("<img src='/file/report/" + item.fileName + "'style='width: 450px;'>");
                });
            }
            if(result.reportAnswerVO != null){
                $("#reportAnswer").append("<strong>" + result.reportAnswerVO.reportAnswerContents + "</strong>");
            }
        },
        error: function(result){
            console.log(result);
        }
    });
})

const answerModalBtn = $(".answerModalBtn");
answerModalBtn.click(function(){
    const reportNum = $(this).attr("data-num");
    $("#numForAnswer").val(reportNum);
    console.log($("#numForAnswer").val());
})