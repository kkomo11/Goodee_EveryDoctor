const postcode = document.getElementById('postcode');
const mainAddress = document.getElementById("mainAddress");
const detailAddress = document.getElementById("detailAddress")

//유효성 검사
let check = [false, false, false];
let address = $("#mainAddress").val();

//상호명 유효성 검사
// $("#agencyName").blur(function(){
//     let agencyName = $("#agencyName").val();
//     let agencyNameResult = nullCheck(agencyName, ".agencyNamem", "상호명은");
//     check[0] = agencyNameResult;
// })

// //주소 유효성 검사
// $("#detailAddress").blur(function(){
//     let detailAddress = $("#detailAddress").val();
//     let addressResult = nullCheck(detailAddress, ".addressm", "주소는");
//     check[1] = addressResult;
// })

// //전화번호 유효성 검사
// $("#agencyTel").blur(function(){
//     let agencyTel = $('#agencyTel').val();
//     let agencyTelResult = nullCheck(agencyTel, ".agencyTelm", "전화번호는");
//     check[2] = agencyTelResult;
// })


// $(".regist").click(function(){
//     //주소 하나로 합치기
//     $("#agencyAddr").val($("#mainAddress").val()+$("#detailAddress").val());

//     if(check.includes(false)){
//         alert("입력 조건을 확인해주세요");
//     }else{
//         $("#form").submit();
//     }
// })

let count = 0;
let hospitalSectionCount = 0;
let petSectionCount = 0;

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

//파일 지우기 버튼 이벤트 위임
$("#fileAdd").on("click", ".del", function(){
    $(this).parents(".file").remove();
    count--;
})

const agencyRole = $("#agencyRole");
const medicRole = $("#medicRole");
const specialty = $("#specialty");
const medicSectionBtn = $("#medicSectionBtn");
const medicSection = $("#medicSection");
//신청 버튼 클릭 시
$("#registButton").click(function(){
    //MEDICROLE에 따라 AGENCYROLE 값이 자동으로 결정
    if(medicRole.val()=="의사" || medicRole.val()=="간호사"){
        agencyRole.val("병원");
    }else if(medicRole.val()=="수의사"){
        agencyRole.val("동물병원");
    }else if(medicRole.val()=="약사"){
        agencyRole.val("약국");
    }else{
        agencyRole.val("보호소");
    }

    console.log(agencyRole.val());

    //주소 하나로 합치기
    $("#agencyAddr").val($("#mainAddress").val()+$("#detailAddress").val());
    // console.log($("#testTest").val());
    $("#form").submit();

})

//문의유형에 따라 전문의 선택 select폼 추가
medicRole.change(function(){
    if(medicRole.val() == '의사'){
        specialty.empty();
        medicSectionBtn.empty();
        medicSection.empty();
        hospitalSectionCount = 0;

        let specialtyAddForm = $("#specialtyAddForm").html();
        specialty.append(specialtyAddForm);
        const medicSpecialty = $("#medicSpecialty");
        //병원 진료 카테고리 가져오기
        $.ajax({
            type: "GET",
            url: "/hospital/home/section",

            success: function(result){
                    $.each(result, function(index, item){
                        medicSpecialty.append("<option value=" + item.sectionName + ">" + item.sectionName + "</option>");
                })
            },
            error: function(result){
                console.log(result);
            }
        });
        medicSectionBtn.append($("#hospitalSectionBtnForm").html());

        //확인
        console.log(medicSpecialty);
    }else if(medicRole.val() == '수의사'){
        specialty.empty();
        medicSectionBtn.empty();
        medicSection.empty();
        petSectionCount = 0;

        let specialtyAddForm = $("#specialtyAddForm").html();
        specialty.append(specialtyAddForm);
        const medicSpecialty = $("#medicSpecialty");
        //동물병원 진료 카테고리 가져오기
        $.ajax({
            type: "GET",
            url: "/admin/agency/petHospitalSection",

            success: function(result){
                    $.each(result, function(index, item){
                        medicSpecialty.append("<option value=" + item.sectionName + ">" + item.sectionName + "</option>");
                })
            },
            error: function(result){
                console.log(result);
            }
        });
        medicSectionBtn.append($("#petSectionBtnForm").html());
    }else{
        specialty.empty();
        medicSectionBtn.empty();
    }
})

// 병원 진료과목 추가버튼 누르면 과목 리스트 select form으로 불러오기
medicSectionBtn.on("click", "#hospitalSectionAddBtn", function(){
    if(hospitalSectionCount < 3){
        console.log("진료과목 추가");

        let hospitalSectionListForm = $("#hospitalSectionListForm").html();
        medicSection.append(hospitalSectionListForm);
        hospitalSectionCount++;
    }else{
        alert('진료과목 추가는 최대 3개까지만 추가할 수 있습니다');
    }
})

// 동물병원 진료과목 추가버튼 누르면 과목 리스트 select form으로 불러오기
medicSectionBtn.on("click", "#petSectionAddBtn", function(){
    if(petSectionCount < 3){
        console.log("진료과목 추가");

        let petSectionListForm = $("#petSectionListForm").html();
        medicSection.append(petSectionListForm);
        petSectionCount++;
    }else{
        alert('진료과목 추가는 최대 3개까지만 추가할 수 있습니다');
    }
})

//병원 진료과목 지우기 버튼 이벤트 위임
medicSection.on("click", ".del", function(){
    $(this).parent().prev().remove();
    $(this).parent().remove();
    hospitalSectionCount--;
})

//동물병원 진료과목 지우기 버튼 이벤트 위임
medicSection.on("click", ".del", function(){
    $(this).parent().prev().remove();
    $(this).parent().remove();
    petSectionCount--;
})

function secure(){
    console.log($("#secure"));
}

//운영시간 반복문
// for(let i = 0; i <= 23; i++){
//     let m = document.createElement('option');
//     let m_value = document.createAttribute('value');
//     m_value.value = i;
//     m.setAttributeNode(m_value);
//     let m_content = document.createTextNode(i);
//     m.appendChild(m_content);
//     birth_month.append(m);
// }

//다음 주소 api
function checkPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            postcode.value = data.zonecode;
            mainAddress.value = addr + extraAddr;

            // 커서를 상세주소 필드로 이동한다.
            detailAddress.focus();
        }
    }).open();
}