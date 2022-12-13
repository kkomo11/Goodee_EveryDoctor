const nav_item_info_tab = $("#nav-item-info-tab");  // 첫번째 단계 탭
const firstNextBtn = $("#firstNextBtn");    // 첫번째 다음 단계 버튼
const nav_item_details_tab = $("#nav-item-details-tab");    // 두번째 단계 탭
const secondPreBtn = $("#secondPreBtn");    // 두번째 단계 뒤로 버튼
const secondNextBtn = $("#secondNextBtn");  // 두번째 단계 앞으로 버튼
const nav_user_info_tab = $("#nav-user-info-tab");  // 세번째 단계 탭
const thirdPreBtn = $("#thirdPreBtn");  // 세번째 단계 뒤로 버튼

const submitBtn = $("#submitBtn");  // 세번째 단계 전송 버튼
const reservationForm = $("#reservationForm");  // 전송 폼

firstNextBtn.on("click", function(){
  nav_item_details_tab.click();
});

secondPreBtn.on("click", function(){
  nav_item_info_tab.click();
});

secondNextBtn.on("click", function(){
  nav_user_info_tab.click();
});

thirdPreBtn.on("click", function(){
  nav_item_details_tab.click();
});

submitBtn.on("click", function(){
  let submitFlag = validation();

  if(submitFlag){
      reservationForm.submit();
  }
});