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

    //주소 하나로 합치기
    $("#agencyAddr").val($("#mainAddress").val()+$("#detailAddress").val());

    $("#form").submit();

})




//주소 변수
const postcode = document.getElementById('postcode');
const mainAddress = document.getElementById("mainAddress");
const detailAddress = document.getElementById("detailAddress")

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