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
doctorList.on("click", ".modalBtn", function(){
    console.log("CLICK CLICK");
})
nav_doctor_tab.click(function(){
    cooperationListAjax('의사');

    console.log("this : ", $(this).parent().parent().next().children().children().children().children().find(".modalBtn"));
    console.log("nav_doctor_tab.click");
    let modalBtn = $(".modalBtn");
    console.log("modalBtn : ", modalBtn);
    modalBtn.click(function(){

    console.log("modalBtn Click");
    let username = modalBtn.attr("data-name");
    console.log(username);
    })
})

doctorPagination.click(function(event){
    // console.log(event);
    cooperationPagingAjax('의사', event.target.innerText);
})

//간호사 제휴 리스트 불러오기
nav_nurse_tab.click(function(){
    cooperationListAjax('간호사');
})

nursePagination.click(function(event){
    // console.log(event);
    cooperationPagingAjax('간호사', event.target.innerText);
})

//수의사 제휴 리스트 불러오기
nav_petDoc_tab.click(function(){
    cooperationListAjax('수의사');
})

petDocPagination.click(function(event){
    // console.log(event);
    cooperationPagingAjax('수의사', event.target.innerText);
})

//수간호사 제휴 리스트 불러오기
nav_petNurse_tab.click(function(){
    cooperationListAjax('수간호사');
})

petNursePagination.click(function(event){
    // console.log(event);
    cooperationPagingAjax('수간호사', event.target.innerText);
})

//약사 제휴 리스트 불러오기
nav_pharmacy_tab.click(function(){
    cooperationListAjax('약사');
})

pharmacyPagination.click(function(event){
    // console.log(event);
    cooperationPagingAjax('약사', event.target.innerText);
})

//보호소 제휴 리스트 불러오기
nav_petHotel_tab.click(function(){
    cooperationListAjax('보호소관리자');
})

petHotelPagination.click(function(event){
    // console.log(event);
    cooperationPagingAjax('보호소관리자', event.target.innerText);
})

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
                       .replace("{username}", item.username);
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
                       .replace("{agencyType}", item.agencyVO.agencyType);
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
//페이지 로딩 후에 의사 제휴리스트 강제 클릭
nav_doctor_tab.click();

// const modalBtn = $(".modalBtn");
// modalBtn.click(function(){
    // let title = $(this).parent().prev().prev().text();
    // $(this).attr("data-target",title);
    // $(".reportModal").attr("id",title);
    // console.log($(".reportModal"));
    // modalBtn.attr("data-target","")

    // console.log("modalBtn Click");
    // let username = modalBtn.attr("data-name");
    // console.log(username);
    
    // $("#medicName").empty();
    // $("#medicSpecialty").empty();
    // $("#medicInfo").empty();
    // $("#agencyName").empty();
    // $("#agencyAddr").empty();
    // $("#agencyInfo").empty();
    // 신고 상세내용을 모달창에 ajax로 호출
    // $.ajax({
    //     type: "GET",
    //     url: "/admin/report/detail",
    //     data: {
    //         reportNum: ajaxNum
    //     },
    //     success: function(result){
    //         $("#medicName").append("<strong>" + result + "</strong>");
    //         $("#medicSpecialty").append("<strong>" + result + "</strong>");
    //         $("#medicInfo").append("<strong>" + result + "</strong>");
    //         $("#agencyName").append("<strong>" + result + "</strong>");
    //         $("#agencyAddr").append("<strong>" + result + "</strong>");
    //         $("#agencyInfo").append("<strong>" + result + "</strong>");
    //     },
    //     error: function(result){
    //         console.log(result);
    //     }
    // });
// })


/* <tr>
    <td>{name}</td>
    <td>{medicSpecialty}</td>
    <td>{agencyRole}</td>
    <td>{agencyName}</td>
    <td>{agencyTel}</td>
    <td>{agencyType}</td>
</tr> */