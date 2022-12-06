const consultAnswerBtn = $("#consultAnswerBtn");
const consultAnswerForm = $("#consultAnswerForm");

const answerUsernameInput = $("#answerUsernameInput");
const answerConsultNumInput = $("#answerConsultNumInput");
const answerContentInput = $("#answerContentInput");

const consultAnswerList = $("#consultAnswerList");
const answerCountSpan = $("#answerCountSpan");
const consultAnswerCountSpan = $("#consultAnswerCountSpan");

const consultAnswerMoreBtn = $("#consultAnswerMoreBtn");
let curPage = 0;
let totalPage = 0;

init();

consultAnswerBtn.on("click", function(){
    if(!answerContentInput.val()){
        alert("답글을 입력하세요");
        answerContentInput.focus();
        return false;
    }
    
    $.ajax({
        type: "POST",
        url: "/consult/answer/write",
        data: {
            consultNum: answerConsultNumInput.val(),
            username: answerUsernameInput.val(),
            answerContent: answerContentInput.val()
        },
        success: result => {
            if(result == '1'){
                alert("답글 작성 성공");
                location.reload();
            }
        },
        error: result => {
            console.log(result);
        }
    });

});

function init(){
    // 작성된 댓글 요청
    $.ajax({
        type: "GET",
        url: "/consult/answer/list?consultNum=" + answerConsultNumInput.val(),
        success: result => {
            //console.log(result);
            $.each(result["list"], function(index, item){
                let consultAnswerTemplate = $("#consultAnswerTemplate").html();
                consultAnswerTemplate = consultAnswerTemplate.replace("{name}", item["userVO"].name)
                                        .replace("{consultAnswerRegDate}", item["answerRegDate"])
                                        .replace("{consultAnswerContent}", item["answerContent"]);

                consultAnswerList.append(consultAnswerTemplate);
            });
            curPage = result["pager"].page; // 현재 페이지
            totalPage = result["pager"].totalPage; // 마지막 페이지

            if(curPage >= totalPage){
                // 첫페이지가 마지막페이지이면 더보기 버튼 삭제
                consultAnswerMoreBtn.remove();
            }

        },
        error: result => {
            console.log(result);
        }
    });

    // 답변 개수 불러옴
    $.ajax({
        type: "GET",
        url: "/consult/answer/count?consultNum=" + answerConsultNumInput.val(),
        success: result => {
            //console.log(result);
            answerCountSpan.html(result + "개의 답변");
            consultAnswerCountSpan.html(result);

        },
        error: result => {
            console.log(result);
        }
    });
}

// 더보기 버튼 클릭시 추가적인 답변 목록 요청
consultAnswerMoreBtn.on("click", function(){
    if(curPage < totalPage){
        curPage += 1;

        $.ajax({
            type: "GET",
            url: "/consult/answer/list?consultNum=" + answerConsultNumInput.val() + "&page=" + curPage,
            success: result => {
                //console.log(result);
                $.each(result["list"], function(index, item){
                    let consultAnswerTemplate = $("#consultAnswerTemplate").html();
                    consultAnswerTemplate = consultAnswerTemplate.replace("{name}", item["userVO"].name)
                                            .replace("{consultAnswerRegDate}", item["answerRegDate"])
                                            .replace("{consultAnswerContent}", item["answerContent"]);
    
                    consultAnswerList.append(consultAnswerTemplate);
                });
                curPage = result["pager"].page; // 현재 페이지
    
                if(curPage >= totalPage){
                    // 현재페이지가 마지막페이지이면 더보기 버튼 삭제
                    consultAnswerMoreBtn.remove();
                }
    
            },
            error: result => {
                console.log(result);
            }
        });

    }
})