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

//지우기 버튼 이벤트 위임
$("#fileAdd").on("click", ".del", function(){
    $(this).parents(".file").remove();
    count--;
})

const doctorSpecialty = $("#doctorSpecialty");
const petdoctorSpecialty = $("#petdoctorSpecialty");
const neuteredInput = $(".neuteredInput");
const hospitalSectionBtn = $("#hospitalSectionBtn");
const petSectionBtn = $("#petSectionBtn");
const hospitalSection = $("#hospitalSection");
const petSection = $("#petSection");

//병원 부분 진료과목 취소 버튼 클릭시 해당부분 삭제
hospitalSection.on("click", ".del", function(){
    $(this).parent().prev().remove();
    $(this).parent().remove();
})

//동물병원 부분 진료과목 취소 버튼 클릭시 해당부분 삭제
petSection.on("click", ".del", function(){
    $(this).parent().prev().remove();
    $(this).parent().remove();
})

//전문의 여부 추가
neuteredInput.change(function(){
    if(neuteredInput[0].checked){
        doctorSpecialty.empty();
        hospitalSectionBtn.empty();
        let doctorSpecialtyAddForm = $("#doctorSpecialtyAddForm").html();
        doctorSpecialty.append(doctorSpecialtyAddForm);
        const doctorMedicSpecialty = $("#doctorMedicSpecialty");
        doctorMedicSpecialty.empty();
        //병원 진료 카테고리 가져오기
        $.ajax({
            type: "GET",
            url: "/hospital/home/section",

            success: function(result){
                    $.each(result, function(index, item){
                        doctorMedicSpecialty.append("<option value=" + item.sectionName + ">" + item.sectionName + "</option>");
                })
            },
            error: function(result){
                console.log(result);
            }
        });
        hospitalSectionBtn.append($("#hospitalSectionBtnForm").html());
    }else{
        doctorSpecialty.empty();
        hospitalSectionBtn.empty();
        hospitalSection.empty();
    }
    
    if(neuteredInput[2].checked){
        // console.log(petHospitalInput.val());
        petdoctorSpecialty.empty();
        petSectionBtn.empty();
        let petDoctorSpecialtyAddForm = $("#petDoctorSpecialtyAddForm").html();
        petdoctorSpecialty.append(petDoctorSpecialtyAddForm);
        const petDoctorMedicSpecialty = $("#petDoctorMedicSpecialty");
        petDoctorMedicSpecialty.empty();
        //동물병원 진료 카테고리 가져오기
        $.ajax({
            type: "GET",
            url: "/admin/agency/petHospitalSection",

            success: function(result){
                    $.each(result, function(index, item){
                        petDoctorMedicSpecialty.append("<option value=" + item.sectionName + ">" + item.sectionName + "</option>");
                })
            },
            error: function(result){
                console.log(result);
            }
        });
        petSectionBtn.append($("#petSectionBtnForm").html());
    }else{
        petdoctorSpecialty.empty();
        petSectionBtn.empty();
        petSection.empty();
    }
})



// 병원 진료과목 추가버튼 누르면 과목 리스트 select form으로 불러오기
hospitalSectionBtn.on("click", "#hospitalSectionAddBtn", function(){
    if(hospitalSectionCount < 3){
        console.log("진료과목 추가");

        let hospitalSectionListForm = $("#hospitalSectionListForm").html();
        hospitalSection.append(hospitalSectionListForm);
        hospitalSectionCount++;
    }else{
        alert('의사 진료과목 추가는 최대 3개까지만 추가할 수 있습니다');
    }
})

// 동물병원 진료과목 추가버튼 누르면 과목 리스트 select form으로 불러오기
petSectionBtn.on("click", "#petSectionAddBtn", function(){
    if(petSectionCount < 1){
        console.log("진료과목 추가");

        let petSectionListForm = $("#petSectionListForm").html();
        petSection.append(petSectionListForm);
        petSectionCount++;
    }else{
        alert('수의사 진료과목 추가는 최대 1개까지만 추가할 수 있습니다');
    }
})

//신청 버튼
$(".inputButton").click(function(){
    console.log("click");
    
    //기관 검색 유효성 검사
    console.log($(this).parent().parent().prev().prev().prev().find(".agencyNum").val());
    // console.log($(this).parent().parent().prev().prev().prev().children().children().val());
    
    $(this).parent().parent().parent().parent().submit();
})