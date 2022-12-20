$(".prescribeBtn").click(function(){
  console.log("처방버튼실행");

  $(".prescribeBtn").attr("data-dansNum");
  console.log($(".prescribeBtn").attr("data-dansNum"));
  let dansNum = $(".prescribeBtn").attr("data-dansNum");
//   $.ajax({
//     type: "POST",
//     url: "/drug/prescription/prescribe",
//     data: {
//         dansNum : dansNum
//     },
    
//     success: function(result){
//         if(result == 1){
//             alert("처방이 완료되었습니다");
//             location.href = "/drug/prescription/completedList";
//         }else{
//             alert("다시 시도해주세요");
//         }
        
//     },
//     error: function(result){
//         console.log(result);
//     }
// });

})