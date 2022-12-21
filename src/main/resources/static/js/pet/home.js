const nav_dog_tab = $("#nav-dog-tab");  // 강아지 전문의 탭 버튼
const nav_cat_tab = $("#nav-cat-tab");  // 고양이 전문의 탭 버튼
const nav_other_tab = $("#nav-other-tab"); // 특수동물 전문의 탭 버튼

const petdogList = $("#petdogList");
const petdogPagination = $("#petdogPagination");
const petcatList = $("#petcatList");
const petcatPagination = $("#petcatPagination");
const petotherList = $("#petotherList");
const petotherPagination = $("#petotherPagination");

const petdocListIcon = $("#petdocListIcon");    // 의료진 아이콘 버튼

nav_dog_tab.on("click", function(){
    /*$.get("/pet/findPetdocList?kind=18", function(result){
        console.log(result);
        petdogList.empty();
        $.each(result["list"], function(index, item){
            
            let petdocListItemTemplate = $("#petdocListItemTemplate");
            let temp = petdocListItemTemplate.html();
            temp = temp.replace("{sectionName}", item["hospitalSectionVO"].sectionName).replace("{doctorName}", item["userVO"].name).replace("{agencyName}", item["agencyVO"].agencyName);
            petdogList.append(temp);
        });

        let pager = result["pager"];
        petdogPagination.empty();
        let startNum = pager.startNum;
        let lastNum = pager.lastNum;
        for(let i = startNum; i <= lastNum; i++){
            if(pager.page != i){
                petdogPagination.append("<li><a href='/pet/findPetdocList?kind=18&page=' + i + >" + i + "</a></li>");
            } else {
                petdogPagination.append("<li class='active'><a href='/pet/findPetdocList?kind=18&page='" + i + ">" + i + "</a></li>");
            }
            
        }
    });*/
    petdocListAjax(18);
});
petdogPagination.on("click", function(event){
    //console.log(event);
    petdocPagingAjax(18, event.target.innerText);
});

nav_cat_tab.on("click", function(){
    /*$.get("/pet/findPetdocList?kind=19", function(result){
        console.log(result);
        petcatList.empty();
        $.each(result["list"], function(index, item){
            
            let petdocListItemTemplate = $("#petdocListItemTemplate");
            let temp = petdocListItemTemplate.html();
            temp = temp.replace("{sectionName}", item["hospitalSectionVO"].sectionName).replace("{doctorName}", item["userVO"].name).replace("{agencyName}", item["agencyVO"].agencyName);
            petcatList.append(temp);
        });
    });*/
    petdocListAjax(19);
});
petcatPagination.on("click", function(event){
    petdocPagingAjax(19, event.target.innerText);
});

nav_other_tab.on("click", function(){
    /*$.get("/pet/findPetdocList?kind=20", function(result){
        console.log(result);
        petotherList.empty();
        $.each(result["list"], function(index, item){
            
            let petdocListItemTemplate = $("#petdocListItemTemplate");
            let temp = petdocListItemTemplate.html();
            temp = temp.replace("{sectionName}", item["hospitalSectionVO"].sectionName).replace("{doctorName}", item["userVO"].name).replace("{agencyName}", item["agencyVO"].agencyName);
            petotherList.append(temp);
        });
    });*/
    petdocListAjax(20);
});
petotherPagination.on("click", function(event){
    petdocPagingAjax(20, event.target.innerText);
});

function petdocListAjax(kind){
    $.get("/pet/findPetdocList?kind=" + kind, function(result){
        //console.log(result);
        let list = "";
        let pagination = "";

        if(kind === 18){
            list = petdogList;
            pagination = petdogPagination;
        } else if(kind === 19){
            list = petcatList;
            pagination = petcatPagination;
        } else {
            list = petotherList;
            pagination = petotherPagination;
        } // 선택한 부분에 맞게 리스트와 페이징 부분 선택

        list.empty();
        $.each(result["list"], function(index, item){
            
            let petdocListItemTemplate = $("#petdocListItemTemplate");
            let temp = petdocListItemTemplate.html();
            temp = temp.replace("{sectionName}", item["hospitalSectionVO"].sectionName)
                    .replace("{doctorName}", item["userVO"].name)
                    .replace("{agencyName}", item["agencyVO"].agencyName)
                    .replace("{doctorId}", item["userVO"].username)
                    .replace("{doctorId2}", item["userVO"].username);

            // 프로필 사진이 있는 경우 사진의 경로를 img 태그에 넣음
            if(item["userVO"].fileName != "" && item["userVO"].fileName != null){
                temp = temp.replace("{userFileName}", item["userVO"].fileName);
            } else {
                temp = temp.replace("{userFileName}", "/images/pet/home/doctor_icon.svg");
                // https://via.placeholder.com/600x400
            } // 프로필 사진이 없는 경우 기본 경로
            
            list.append(temp);
        });
        
        let pager = result["pager"];
        pagination.empty();
        let startNum = pager.startNum;
        let lastNum = pager.lastNum;
        for(let i = startNum; i <= lastNum; i++){
            if(pager.page != i){
                pagination.append("<li><a>" + i + "</a></li>");
            } else {
                pagination.append("<li class='active'><a>" + i + "</a></li>");
            }
            
        }
    });
}   // 상단 탭을 눌렀을 때의 Ajax 의료진 리스트 요청

function petdocPagingAjax(kind, page){
    $.get("/pet/findPetdocList?kind=" + kind + "&page=" + page, function(result){
        //console.log(result);

        let list = "";
        let pagination = "";

        if(kind === 18){
            list = petdogList;
            pagination = petdogPagination;
        } else if(kind === 19){
            list = petcatList;
            pagination = petcatPagination;
        } else {
            list = petotherList;
            pagination = petotherPagination;
        }   // 선택한 부분에 맞게 리스트와 페이징 부분 선택

        list.empty();
        $.each(result["list"], function(index, item){
            
            let petdocListItemTemplate = $("#petdocListItemTemplate");
            let temp = petdocListItemTemplate.html();
            temp = temp.replace("{sectionName}", item["hospitalSectionVO"].sectionName)
                    .replace("{doctorName}", item["userVO"].name)
                    .replace("{agencyName}", item["agencyVO"].agencyName)
                    .replace("{doctorId}", item["userVO"].username)
                    .replace("{doctorId2}", item["userVO"].username);

            // 프로필 사진이 있는 경우 사진의 경로를 img 태그에 넣음
            if(item["userVO"].fileName != "" && item["userVO"].fileName != null){
                temp = temp.replace("{userFileName}", item["userVO"].fileName);
            } else {
                temp = temp.replace("{userFileName}", "/images/pet/home/doctor_icon.svg");
                // https://via.placeholder.com/600x400
            } // 프로필 사진이 없는 경우 기본 경로

            list.append(temp);
        });

        let pager = result["pager"];
        pagination.empty();
        let startNum = pager.startNum;
        let lastNum = pager.lastNum;
        for(let i = startNum; i <= lastNum; i++){
            if(pager.page != i){
                pagination.append("<li><a>" + i + "</a></li>");
            } else {
                pagination.append("<li class='active'><a>" + i + "</a></li>");
            }
            
        }
        window.scrollTo(0, 845.5999755859375);
    });
}   // 각 탭의 하단 페이지 번호를 눌렀을 때의 의료진 리스트 Ajax 요청

petdocListIcon.on("click", function(){
    this.preventDefault;    // 아이콘이 a 태그여서 기본동작 중단
    window.scrollTo(0, 845.5999755859375); //지정된 스크롤 위치로
});

nav_dog_tab.click();

/*window.addEventListener("scroll", function(event){
    let scrollY = this.scrollY;
    let scrollX = this.scrollX;
    console.log("X :", scrollX, " Y:", scrollY);
});*/


/*<ul class="info">
    <li class="price">평점</li>
    <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
    </li>
</ul>*/
// 의사 리스트에서 평점 부분 제거