console.log("addresss....js")


const samplePostcode = document.querySelectorAll('.sample-postcode');
const sample6_postcode = document.querySelector('#sample6_postcode');
const sample6_address = document.querySelector('#sample6_address');
const sample6_detailAddress = document.querySelector('#sample6_detailAddress');


if($("#listAddrChk").val()=='true'){
    for (sp of samplePostcode) {
        sp.onclick = sample6_execDaumPostcode;
    }
}

//전화번호 first , last로 나누기
$(function(){
    for(chd of $("#phoneFirst").children()){
        if($(chd).val()==$("#phoneLast").val().slice(0,3)){
            $(chd).attr("selected", "selected")
        }
    }

    $("#phoneLast").val($("#phoneLast").val().slice(3))
    
})

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

$("#phoneLast").on("blur", function(){
    $("#submitPhone").val($("#phoneFirst").val()+$("#phoneLast").val())
    console.log("블러", $("#submitPhone").val())
})

//핸드폰 번호 010빼고 보여주기

//phoneFirst ID 주소수정 버튼 누르기전에 못 누르게 하기

//주소 수정 버튼 클릭하면 
    //readonly class="addrVals bg-light" 없애기
    //주소 수정 버튼 비활성화 주소 저장 버튼 활성화
    //post button 활성화    
$("#modifyAddress").click(function(){
    let addrBtn = document.getElementsByClassName("addrBtn");
    console.log(addrBtn.classList)
})



//

function updateAddress(){
    console.log("updateAddress")
}