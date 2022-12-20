const nav_hospital_tab = $("#nav-hospital-tab");  // 병원 리스트 탭 버튼
const nav_petHospital_tab = $("#nav-petHospital-tab");  // 동물병원 리스트 탭 버튼
const nav_pharmacy_tab = $("#nav-pharmacy-tab"); // 약국 리스트 탭 버튼


const hospitalList = $("#hospitalList"); // 병원 리스트 들어갈 부모 선택자
const hospitalPagination = $("#hospitalPagination"); // 병원 리스트 페이징
const petHospitalList = $("#petHospitalList"); // 동물병원 리스트 들어갈 부모 선택자
const petHospitalPagination = $("#petHospitalPagination"); // 동물병원 리스트 페이징
const pharmacyList = $("#pharmacyList"); // 약국 리스트 들어갈 부모 선택자
const pharmacyPagination = $("#pharmacyPagination"); // 약국 리스트 페이징


//병원 제휴 리스트 불러오기
// $("부모선택자").on("이벤트명", "자식선택자", callback function)
nav_hospital_tab.click(function(){
    agencyListAjax('병원');
    
})

hospitalPagination.click(function(event){
    agencyPagingAjax('병원', event.target.innerText);
})

//동물병원 제휴 리스트 불러오기
nav_petHospital_tab.click(function(){
    agencyListAjax('동물병원');
})

petHospitalPagination.click(function(event){
    agencyPagingAjax('동물병원', event.target.innerText);
})

//약국 제휴 리스트 불러오기
nav_pharmacy_tab.click(function(){
    agencyListAjax('약국');
})

pharmacyPagination.click(function(event){
    agencyPagingAjax('약국', event.target.innerText);
})



//기관 리스트 불러오기 Ajax
function agencyListAjax(kind){
    $.get("/admin/admin/findAgencyList?kind=" + kind, function(result){
        let list = "";
        let pagination = "";

        //kind 변수에 따라 어떤 tablebody, 페이지네이션에 넣을 것인지 지정
        if(kind == '병원'){
            list = hospitalList;
            pagination = hospitalPagination;
        }else if(kind == '동물병원'){
            list = petHospitalList;
            pagination = petHospitalPagination;
        }else{
            list = pharmacyList;
            pagination = pharmacyPagination;
        }

        list.empty();
        $.each(result.list, function(index, item){
            let agencyListTemplate = $("#agencyListTemplate");
            let temp = agencyListTemplate.html();
            temp = temp.replace("{agencyName}", item.agencyName)
                       .replace("{agencyAddr}", item.agencyAddr)
                       .replace("{agencyTel}", item.agencyTel)
                       .replace("{agencyType}", item.agencyType)
                       .replace("{agencyNum}", item.agencyNum);
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
function agencyPagingAjax(kind, page){
    $.get("/admin/admin/findAgencyList?kind=" + kind + "&page=" + page, function(result){
        let list = "";
        let pagination = "";

        //kind 변수에 따라 어떤 tablebody, 페이지네이션에 넣을 것인지 지정
        if(kind == '병원'){
            list = hospitalList;
            pagination = hospitalPagination;
        }else if(kind == '동물병원'){
            list = petHospitalList;
            pagination = petHospitalPagination;
        }else{
            list = pharmacyList;
            pagination = pharmacyPagination;
        }

        list.empty();
        $.each(result.list, function(index, item){
            let agencyListTemplate = $("#agencyListTemplate");
            let temp = agencyListTemplate.html();
            temp = temp.replace("{agencyName}", item.agencyName)
                       .replace("{agencyAddr}", item.agencyAddr)
                       .replace("{agencyTel}", item.agencyTel)
                       .replace("{agencyType}", item.agencyType)
                       .replace("{agencyNum}", item.agencyNum);
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

$("#agencyListParent").on("click", ".deleteBtn", function(){
    console.log("삭제 버튼");
    console.log($(this).attr("data-agencyNum"));
})


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
nav_hospital_tab.click();