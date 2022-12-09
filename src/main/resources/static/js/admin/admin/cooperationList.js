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

nav_doctor_tab.click(function(){
    cooperationListAjax('의사');
})

doctorPagination.click(function(event){
    console.log(event);
    cooperationPagingAjax('의사', event.target.innerText);
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

nav_doctor_tab.click();

/* <tr>
    <td>{name}</td>
    <td>{medicSpecialty}</td>
    <td>{agencyRole}</td>
    <td>{agencyName}</td>
    <td>{agencyTel}</td>
    <td>{agencyType}</td>
</tr> */