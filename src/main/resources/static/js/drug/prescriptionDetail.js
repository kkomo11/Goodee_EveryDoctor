$(".prescribeBtn").click(function() {
  console.log("처방버튼실행");

  $(".prescribeBtn").attr("data-dansNum");
  console.log($(".prescribeBtn").attr("data-dansNum"));
  let dansNum = $(".prescribeBtn").attr("data-dansNum");
  $.ajax({
    type: "POST",
    url: "/drug/prescription/prescribe",
    data: {
        dansNum : dansNum
    },
    
    success: function(result){
        if(result == 1){
            Swal.fire("약 처방이 완료되었습니다.");
            location.href = "/drug/prescription/completedList";
        }else{
          Swal.fire("처방이 실패했습니다");
        }
        
    },
    error: function(result){
        console.log(result);
    }
});

})