const nav_doctor_tab = $("#nav-doctor-tab");  // 의사 제휴 리스트 탭 버튼
const nav_nurse_tab = $("#nav-nurse-tab");  // 간호사 제휴 리스트 탭 버튼
const nav_petDoc_tab = $("#nav-petDoc-tab"); // 수의사 제휴 리스트 탭 버튼
const nav_petNurse_tab = $("#nav-petNurse-tab"); // 수간호사 제휴 리스트 탭 버튼
const nav_pharmacy_tab = $("#nav-pharmacy-tab"); // 약사 제휴 리스트 탭 버튼
const nav_petHotel_tab = $("#nav-other-tab"); // 보호소 제휴 리스트 탭 버튼

const doctorList = $("#doctorList"); // 의사 제휴 리스트 들어갈 부모 선택자
const doctorPagination = $("#doctorPagination"); // 의사 제휴 리스트 페이징
const nurseList = $("#nurseList"); // 간호사 제휴 리스트 들어갈 부모 선택자
const nursePagination = $("#nursePagination"); // 간호사 제휴 리스트 페이징
const petDocList = $("#petDocList"); // 수의사 제휴 리스트 들어갈 부모 선택자
const petDocPagination = $("#petDocPagination"); // 수의사 제휴 리스트 페이징
const petNurseList = $("#petNurseList"); // 수간호사 제휴 리스트 들어갈 부모 선택자
const petNursePagination = $("#petNursePagination"); // 수간호사 제휴 리스트 페이징
const pharmacyList = $("#pharmacyList"); // 약사 제휴 리스트 들어갈 부모 선택자
const pharmacyPagination = $("#pharmacyPagination"); // 약사 제휴 리스트 페이징
const petHotelList = $("#pethotelList"); // 보호소 제휴 리스트 들어갈 부모 선택자
const petHotelPagination = $("#petHotelPagination"); // 보호소 제휴 리스트 페이징

//의사 제휴 리스트 불러오기
// $("부모선택자").on("이벤트명", "자식선택자", callback function)
nav_doctor_tab.click(function(){
    cooperationListAjax('의사');
    
})

doctorPagination.click(function(event){
    // console.log(event);
    cooperationPagingAjax('의사', event.target.innerText);
})

//의사 제휴 상세보기
doctorList.on("click", ".modalBtn", function(){
    const username = $(this).attr("data-username");
    const medicRole = $(this).attr("data-medicRole");
    cooperationDetailAjax(username, medicRole);
    // console.log("this : ", $(this).attr("data-username"));
    console.log(medicRole);

})

//간호사 제휴 리스트 불러오기
nav_nurse_tab.click(function(){
    cooperationListAjax('간호사');
})

nursePagination.click(function(event){
    // console.log(event);
    cooperationPagingAjax('간호사', event.target.innerText);
})

//간호사 제휴 상세보기
nurseList.on("click", ".modalBtn", function(){
    // console.log("this : ", $(this).attr("data-username"));
    const username = $(this).attr("data-username");
    const medicRole = $(this).attr("data-medicRole");
    cooperationDetailAjax(username);

})

//수의사 제휴 리스트 불러오기
nav_petDoc_tab.click(function(){
    cooperationListAjax('수의사');
})

petDocPagination.click(function(event){
    // console.log(event);
    cooperationPagingAjax('수의사', event.target.innerText);
})

//수의사 제휴 상세보기
petDocList.on("click", ".modalBtn", function(){
    // console.log("this : ", $(this).attr("data-username"));
    const username = $(this).attr("data-username");
    const medicRole = $(this).attr("data-medicRole");
    cooperationDetailAjax(username);

})

//수간호사 제휴 리스트 불러오기
nav_petNurse_tab.click(function(){
    cooperationListAjax('수간호사');
})

petNursePagination.click(function(event){
    // console.log(event);
    cooperationPagingAjax('수간호사', event.target.innerText);
})

//수간호사 제휴 상세보기
petNurseList.on("click", ".modalBtn", function(){
    // console.log("this : ", $(this).attr("data-username"));
    const username = $(this).attr("data-username");
    const medicRole = $(this).attr("data-medicRole");
    cooperationDetailAjax(username);

})

//약사 제휴 리스트 불러오기
nav_pharmacy_tab.click(function(){
    cooperationListAjax('약사');
})

pharmacyPagination.click(function(event){
    // console.log(event);
    cooperationPagingAjax('약사', event.target.innerText);
})

//약사 제휴 상세보기
pharmacyList.on("click", ".modalBtn", function(){
    // console.log("this : ", $(this).attr("data-username"));
    const username = $(this).attr("data-username");
    const medicRole = $(this).attr("data-medicRole");
    cooperationDetailAjax(username);

})

//보호소 제휴 리스트 불러오기
nav_petHotel_tab.click(function(){
    cooperationListAjax('보호소관리자');
})

petHotelPagination.click(function(event){
    // console.log(event);
    cooperationPagingAjax('보호소관리자', event.target.innerText);
})

//보호소 제휴 상세보기
petHotelList.on("click", ".modalBtn", function(){
    // console.log("this : ", $(this).attr("data-username"));
    const username = $(this).attr("data-username");
    const medicRole = $(this).attr("data-medicRole");
    cooperationDetailAjax(username);

})

//모달창 승인 버튼
const approvalBtn = $("#approvalBtn");
approvalBtn.click(function(){
    // console.log("approvalBtn CLICK");
    const username = $("#hiddenData").attr("data-username");
    const medicRole = $("#hiddenData").attr("data-medicRole");
    // console.log("username : ",username);
    // console.log("medicRole : ",medicRole)
    roleModifyAjax(username, medicRole);
    modifyMedicEnabled(username);
})

//제휴 리스트 불러오기 Ajax
function cooperationListAjax(kind){
    $.get("/admin/admin/findCooperationList?kind=" + kind, function(result){
        let list = "";
        let pagination = "";

        //kind 변수에 따라 어떤 tablebody, 페이지네이션에 넣을 것인지 지정
        if(kind == '의사'){
            list = doctorList;
            pagination = doctorPagination;
        }else if(kind == '간호사'){
            list = nurseList;
            pagination = nursePagination;
        }else if(kind == '수의사'){
            list = petDocList;
            pagination = petDocPagination;
        }else if(kind == '수간호사'){
            list = petNurseList;
            pagination = petNursePagination;
        }else if(kind == '약사'){
            list = pharmacyList;
            pagination = pharmacyPagination;
        }else{
            list = petHotelList;
            pagination = petHotelPagination;
        }

        list.empty();
        // console.log("result : ",result);
        $.each(result.list, function(index, item){
            let cooperationListTemplate = $("#cooperationListTemplate");
            let temp = cooperationListTemplate.html();
            temp = temp.replace("{name}", item.userVO.name)
                       .replace("{medicSpecialty}", item.medicSpecialty)
                       .replace("{agencyRole}", item.agencyVO.agencyRole)
                       .replace("{agencyName}", item.agencyVO.agencyName)
                       .replace("{agencyTel}", item.agencyVO.agencyTel)
                       .replace("{agencyType}", item.agencyVO.agencyType)
                       .replace("{username}", item.username)
                       .replace("{medicRole}",item.medicRole)
                       .replace("{medicEnabled}",item.medicEnabled);
            list.append(temp); 
        })

        let pager = result.pager;
        pagination.empty();
        let startNum = pager.startNum;
        let lastNum = pager.lastNum;
        for(let i = startNum; i <= lastNum; i++){
            if(pager.page != i){
                pagination.append("<li class='page-item'><a class='page-link' style='cursor:pointer;'>" + i + "</a></li>");
            } else {
                pagination.append("<li class='page-item active'><a class='page-link' style='cursor:pointer;'>" + i + "</a></li>");
            }
            
        }
    })
}

//각 제휴리스트에 맞게 페이징 AJAX
function cooperationPagingAjax(kind, page){
    $.get("/admin/admin/findCooperationList?kind=" + kind + "&page=" + page, function(result){
        let list = "";
        let pagination = "";

        //kind 변수에 따라 어떤 tablebody, 페이지네이션에 넣을 것인지 지정
        if(kind == '의사'){
            list = doctorList;
            pagination = doctorPagination;
        }else if(kind == '간호사'){
            list = nurseList;
            pagination = nursePagination;
        }else if(kind == '수의사'){
            list = petDocList;
            pagination = petDocPagination;
        }else if(kind == '수간호사'){
            list = petNurseList;
            pagination = petNursePagination;
        }else if(kind == '약사'){
            list = pharmacyList;
            pagination = pharmacyPagination;
        }else{
            list = petHotelList;
            pagination = petHotelPagination;
        }

        list.empty();
        // console.log("result : ",result);
        $.each(result.list, function(index, item){
            let cooperationListTemplate = $("#cooperationListTemplate");
            let temp = cooperationListTemplate.html();
            temp = temp.replace("{name}", item.userVO.name)
                       .replace("{medicSpecialty}", item.medicSpecialty)
                       .replace("{agencyRole}", item.agencyVO.agencyRole)
                       .replace("{agencyName}", item.agencyVO.agencyName)
                       .replace("{agencyTel}", item.agencyVO.agencyTel)
                       .replace("{agencyType}", item.agencyVO.agencyType)
                       .replace("{username}", item.username)
                       .replace("{medicRole}",item.medicRole)
                       .replace("{medicEnabled}",item.medicEnabled);
            list.append(temp); 
        })

        let pager = result.pager;
        pagination.empty();
        let startNum = pager.startNum;
        let lastNum = pager.lastNum;
        for(let i = startNum; i <= lastNum; i++){
            if(pager.page != i){
                pagination.append("<li class='page-item'><a class='page-link' style='cursor:pointer;'>" + i + "</a></li>");
            } else {
                pagination.append("<li class='page-item active'><a class='page-link' style='cursor:pointer;'>" + i + "</a></li>");
            }
            
        }
    })
}

//디테일 불러오기
function cooperationDetailAjax(username, medicRole){
    $("#medicName").empty();
    $("#medicSpecialty").empty();
    $("#medicInfo").empty();
    $("#agencyName").empty();
    $("#agencyAddr").empty();
    $("#agencyInfo").empty();

    // 제휴 상세내용을 모달창에 ajax로 호출
    $.ajax({
        type: "GET",
        url: "/admin/admin/findCooperationDetail?username=" + username,
        
        success: function(result){
            $("#medicName").append("<strong>" + result.userVO.name + "</strong>");
            $("#medicSpecialty").append("<strong>" + result.medicSpecialty + "</strong>");
            $("#medicInfo").append("<strong>" + result.medicInfo + "</strong>");
            $("#agencyName").append("<strong>" + result.agencyVO.agencyName + "</strong>");
            $("#agencyAddr").append("<strong>" + result.agencyVO.agencyAddr + "</strong>");
            $("#agencyInfo").append("<strong>" + result.agencyVO.agencyInfo + "</strong>");
            $("#hiddenData").attr("data-username", username);
            $("#hiddenData").attr("data-medicRole", medicRole);

        },
        error: function(result){
            console.log(result);
        }
    });
}

function roleModifyAjax(username, medicRole){
    if(medicRole == '의사'){
        medicRole = 'Doctor';
    }else if(medicRole == '간호사'){
        medicRole = 'Nurse';
    }else if(medicRole == '수의사'){
        medicRole = 'petDoc';
    }else if(medicRole == '수간호사'){
        medicRole = 'PetNurse';
    }

    $.ajax({
        type: "POST",
        url: "/admin/admin/modifyRole" + medicRole,
        data: {
            username : username
        },
        
        success: function(result){
            if(result == 1){
                alert("등급 변경이 완료되었습니다");
            }else{
                alert("다시 시도해주세요");
            }
            
        },
        error: function(result){
            console.log(result);
        }
    });
}

function modifyMedicEnabled(username){
    $.ajax({
        type: "POST",
        url: "/admin/admin/modifyMedicEnabled",
        data: {
            username : username
        },
        
        success: function(result){
            if(result == 1){
                alert("등급 승인이 완료되었습니다");
                location.href = "./cooperationList";
            }else{
                alert("다시 시도해주세요");
            }
            
        },
        error: function(result){
            console.log(result);
        }
    });
}
//페이지 로딩 후에 의사 제휴리스트 강제 클릭
nav_doctor_tab.click();