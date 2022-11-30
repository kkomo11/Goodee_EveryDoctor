
//   $(document).ready(function () {
//     const lineEl = document.querySelectorAll(".vertical-line")
//     let topNumber = 110
//     let topText = 'top:' + topNumber + 'px'
//     if (lineEl.length == 1) {
//         lineEl[0].setAttribute('style', 'display:none')
//     } else if (lineEl.length > 1) {
//         for (let i = 1; i < (lineEl.length - 1); i++) {
//             lineEl[i].setAttribute('style', topText)
//             topNumber += 75
//             topText = 'top:' + topNumber + 'px'
//         }
//     }
//     $('.download-img').click(function () {
//         const userAgent = navigator.userAgent || navigator.vendor || window.opera
//         let deviceKey = null
//         if (/windows phone/i.test(userAgent))
//             deviceKey = 'android'

//         if (/android/i.test(userAgent))
//             deviceKey = 'android'

//         if (/iPad|iPhone|iPod/.test(userAgent) && !window.MSStream)
//             deviceKey = 'ios'

//         if (deviceKey == 'android')
//             window.open('https://goo.gl/XrWxoD', '_blank')
//         else if (deviceKey == 'ios')
//             window.open('https://goo.gl/TaSCIK', '_blank')
//         else
//             window.open('http://st.sweettracker.co.kr/', '_blank')
//     })
// })


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


function openPop() {
  let popup = window.open('http://info.sweettracker.co.kr/tracking/5', '배송팝업', 'width=700px,height=800px,scrollbars=yes');
}
// window.open('http://info.sweettracker.co.kr/tracking/5', '배송팝업', 'width=500, height=700, scrollbars=yes, resizable=no')



