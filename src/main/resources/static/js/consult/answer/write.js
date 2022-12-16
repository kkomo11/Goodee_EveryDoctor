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

// 비 의료인 회원도 답변을 볼 수 있게 consultNum을 담은 p 태그
const consultContentParagraph = $("#consultContentParagraph");

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
        url: "/consult/answer/list?consultNum=" + consultContentParagraph.attr("data-content-consultnum"),
        success: result => {
            //console.log(result);
            $.each(result["list"], function(index, item){
                let consultAnswerTemplate = $("#consultAnswerTemplate").html();
                consultAnswerTemplate = consultAnswerTemplate.replace("{name}", item["userVO"].name)
                                        .replace("{consultAnswerRegDate}", item["answerRegDate"])
                                        .replace("{consultAnswerContent}", item["answerContent"]);

                if(item["userVO"].fileName != null && item["userVO"].fileName != ""){
                    consultAnswerTemplate = consultAnswerTemplate.replace("{userFileName}", item["userVO"].fileName);
                } else {
                    consultAnswerTemplate = consultAnswerTemplate.replace("{userFileName}", "/images/pet/home/doctor_icon.svg");
                }

                consultAnswerList.append(consultAnswerTemplate);
                
                if(item["username"] == answerUsernameInput.val()){
                    // 현재 로그인한 사용자가 답변 작성자이면 해당 답글의 삭제 버튼 생성
                    let delBtnTemp = '<div class="button"><button type="button" class="btn consultAnswerDeleteBtn" data-answernum="{consultAnswerNum}">삭제</button></div>';
                    delBtnTemp = delBtnTemp.replace("{consultAnswerNum}", item["answerNum"]);
                    consultAnswerList.append(delBtnTemp);
                }

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
        url: "/consult/answer/count?consultNum=" + consultContentParagraph.attr("data-content-consultnum"),
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
            url: "/consult/answer/list?consultNum=" + consultContentParagraph.attr("data-content-consultnum") + "&page=" + curPage,
            success: result => {
                //console.log(result);
                $.each(result["list"], function(index, item){
                    let consultAnswerTemplate = $("#consultAnswerTemplate").html();
                    consultAnswerTemplate = consultAnswerTemplate.replace("{name}", item["userVO"].name)
                                            .replace("{consultAnswerRegDate}", item["answerRegDate"])
                                            .replace("{consultAnswerContent}", item["answerContent"]);
    
                    if(item["userVO"].fileName != null && item["userVO"].fileName != ""){
                        consultAnswerTemplate = consultAnswerTemplate.replace("{userFileName}", item["userVO"].fileName);
                    } else {
                        consultAnswerTemplate = consultAnswerTemplate.replace("{userFileName}", "/images/pet/home/doctor_icon.svg");
                    }

                    consultAnswerList.append(consultAnswerTemplate);

                    if(item["username"] == answerUsernameInput.val()){
                        // 현재 로그인한 사용자가 답변 작성자이면 해당 답글의 삭제 버튼 생성
                        let delBtnTemp = '<div class="button"><button type="button" class="btn consultAnswerDeleteBtn" data-answernum="{consultAnswerNum}">삭제</button></div>';
                        delBtnTemp = delBtnTemp.replace("{consultAnswerNum}", item["answerNum"]);
                        consultAnswerList.append(delBtnTemp);
                    }
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

consultAnswerList.on("click", event => {
    
    // 답글의 삭제 버튼을 클릭하면 삭제 AJAX 요청
    if(event.target.classList[1] == "consultAnswerDeleteBtn"){

        let answerDeleteFlag = confirm("정말 삭제합니까?");
        if(answerDeleteFlag){
            let answerNumData = event.target.getAttribute("data-answernum");

            $.ajax({
                type: "POST",
                url: "/consult/answer/delete",
                data: {
                    answerNum: answerNumData
                },
                success: result => {
                    if(result == 1){
                        alert("답글 삭제 성공");
                        location.reload();
                    } else {
                        console.log(result);
                    }
                },
                error: result => {
                    console.log(result);
                }
            });
        }

    }
});