
// // 1.빈창 팝업 생성
// let url = "http://info.sweettracker.co.kr/tracking/5";
// let windowTargetName = "targetName";
// let features = "width = 650px, height=550px, top=300px, left=300px, scrollbox=yes";
// window.open(url, windowTargetName, features);

// // 2.POST로 데이터 전달
// popuptestbtn.action="http://info.sweettracker.co.kr/tracking/5"; // 이동
// popuptestbtn.method="post";
// popuptestbtn.target=windowTargetName;
// popuptestbtn.submit();

// popuptestbtn.onclick = function() {
//   let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbox=yes";
//   let openUrl = '/test/popup/do'
//   window.open(openUrl,'pop',popOption);
// }


// function openPop() {
//   let popup = window.open('http://www.naver.com', '배송팝업', 'width=700px,height=800px,scrollbars=yes');
// }
//  window.open('http://info.sweettracker.co.kr/tracking/5', '배송팝업', 'width=500, height=700, scrollbars=yes, resizable=no')

//배송 팝업 창
function popUp(){
  let option = "width = 500, height = 700, top = 100, left = 200, scrollbars=yes, resizable=no"
  let pop_title = "Smart" ;

  window.open("", pop_title, option) ;
  
  let frmData = document.frmData ;
  frmData.target = pop_title ;
  
  frmData.submit() ;

}


