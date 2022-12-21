/*
Template Name: ClassiGrids - Classified Ads and Listing Website Template.
Author: GrayGrids
*/

(function () {
	
	"use strict";

	//===== Prealoder

	window.onload = function () {
		window.setTimeout(fadeout, 200);
	}


    function fadeout() {
        document.querySelector('.preloader').style.opacity = '0';
        document.querySelector('.preloader').style.display = 'none';
        document.querySelector('.preloader').style.as = 'script';
    }


    /*=====================================
    Sticky
    ======================================= */
    window.onscroll = function () {
        var header_navbar = document.querySelector(".navbar-area");
        var sticky = header_navbar.offsetTop;

        if (window.pageYOffset > sticky) {
            header_navbar.classList.add("sticky");
        } else {
            header_navbar.classList.remove("sticky");
        }

        // show or hide the back-top-top button
        var backToTo = document.querySelector(".scroll-top");
        if(backToTo != null) {
			if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
            backToTo.style.display = "flex";
	        } else {
	            backToTo.style.display = "none";
	        }
		}
        
        // show or hide the back-top-top button
	    if (document.body.scrollTop > 500 || document.documentElement.scrollTop > 500) {
	        $("#remote_video").addClass("video-sticky");
	    } else {
			$("#remote_video").removeClass("video-sticky");
	    }
    };

     //===== mobile-menu-btn
	let navbarToggler = document.querySelector(".mobile-menu-btn");
	navbarToggler.addEventListener('click', function () {
		navbarToggler.classList.toggle("active");
	});
    
    // WOW active
    new WOW().init();
    
    //준회원은 본인인증 모달
    if($("#preModal").length){
    $("#preModal").trigger('click');		

	$("#certificationBtn").click(function(){
		
		
		$("#certiClose").trigger("click")
		
		//본인인증 창 띄우기
		var IMP = window.IMP; // 생략 가능
		IMP.init("imp18741385"); 
		
		// IMP.certification(param, callback) 호출
		  IMP.certification({ // param
		    merchant_uid: "SEKJSKLFll2334", // 주문 번호
		  }, function (rsp) { // callback
		    if (rsp.success) {
				console.log(rsp)
				$.post("/user/certification", 
					{imp_uid:rsp.imp_uid}, 
					function(rt){
						if(rt==1){
							window.location.href="";
						}else{
							alert("이미 인증된 계정이 존재합니다. 인증된 계정으로 로그인해주세요")
						}
						
					})

		    } else {
				console.log(rsp)
				alert(rsp.error_msg+" 다시 진행해주세요")
		    }
		  });
		
	})
	}

	
	console.log("로그")
	// 웹알림전송하는 공간 건들지 말아주뗴옹 먀항ಠ_ಠ---------------------------------------

	//현재시간 출력
	const date = new Date();
	const year = date.getFullYear();
	const month = date.getMonth()+1;
	const day = date.getDay();
	const hour  = date.getHours();
	const min = date.getMinutes();
	console.log("현재시간은 ", year+'-'+month+'-'+day+'-'+hour+':'+min);
	let current = (year+'-'+month+'-'+day+' '+hour+':'+min);
	console.log(current)
	console.log(year);
	console.log(month);
	console.log(day);
	console.log(hour);
	console.log(min);

	const toastTrigger = document.getElementById('liveToastBtn')
	const toastLiveExample = document.getElementById('liveToast')
	const toast = new bootstrap.Toast(toastLiveExample)
    let userID = $("#authUsername").val()
	
    console.log($("#authUsername").val())

    
	//SSE를 페이지를 열면 연결요청을 한다.
    let urlEndPoint = 'http://'+window.location.host+'/subscribe?userID='+userID;
    let eventSource = new EventSource(urlEndPoint);


	//이벤트 요청을 받는다.
	// 알림을 받는 측의 디자인과 받은 파라미터를 처리할때 변경
	console.log(eventSource.readyState)
    eventSource.addEventListener("latestNews",function(event){
		let articleData =JSON.parse(event.data);
		console.log(articleData)
		
		
		$("#toastAlert").append(
			'<div id='+articleData.toastId+' class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">'+
				'<div class="toast-header">'+
					'<strong class="me-auto">'+articleData.title+'</strong>'+
					'<small class="text-muted">'+current+'</small>'+
					'<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>'+
				'</div>'+
				'<div class="toast-body">'+
		  			articleData.text+
    				'<div class="mt-2 pt-2 border-top">'+
      					'<button type="button" class="btn btn-primary btn-sm"><a href=' +articleData.link+ ' style="color:white;">신청 바로가기</a></button>'+
      				'</div>'+
				'</div>'+
	  		'</div>')

		let toastname = articleData.toastId
        console.log(toastname)

		const toastLiveExample = document.getElementById(toastname)
		const toast = new bootstrap.Toast(toastLiveExample)

        
        toast.show()
		console.log('알림받은 사람 == ',articleData.text,current,userID)

		//웹알림 저장해야돼요 나 
		$.ajax({
			type:"POST",
			url:"/insertAlarm",
			data : {
				alarmContents : articleData.text,
				alarmReceiver : userID
			},
			success: function(data){
				console.log('data=== ',data);
			},
			error: function(e){
				console.log('error===', e);
			}
		});

    })

	$("#alarmBell").click(function(){
	$(".mx-1").toggleClass("show");
    $("#dropDownList").toggleClass("show");

		// 웹알림 리스트 불러오기
		$.ajax({
			type:"GET",
			url:"/alarmList",
			data: {
				alarmReceiver: userID
			},
			success: function(data){
				console.log('success',data);
				if(data.length > 0){
					$('AjaxList').attr("disabled", false);
					$.each(data,function(index,value){
					let date = new Date(data[index].alarmTime);
					console.log('date == ',date);
	
					let d = date.getMinutes();
					if (d < 10) {
						d = '0'+(d % 10);
					}
					console.log(date.getFullYear()+'-'+date.getMonth()+'-'+date.getDay()+' '+date.getHours()+':'+d);
					let a = $('<a class="dropdown-item d-flex align-items-center" href="#"/>');
					let tungdiv= $('<div/>');
					let daydiv= $('<div class="small text-gray-500"/>').text(date.getFullYear()+'-'+date.getMonth()+'-'+date.getDay()+' '+date.getHours()+':'+d);
					let span = $('<span class="font-weight-bold">').text(data[index].alarmContents);
	
					a.append(tungdiv);
					tungdiv.append(daydiv);
					tungdiv.append(span);
					
					$("#alarmList").after(a)
					});
				}else{
					let noText =  $('<div style="text-align: center;"/>').text('알람이 없습니다.')
					$("#alarmList").after(noText)
				}
			},
			error: function(e){
				console.log('error',e);
			}
		})
		
	});
    
    
// 테스트용 알림요청
// 	console.log($(toastTrigger))
// $(toastTrigger).click(function(){
	
//     $.ajax({
//         type:"POST",
//         url:"/dispatchEventToSpecificUser",
//         traditional:true, //배열을 전송할 때 사용(파라미터 이름 하나로 여러개를 보내야 할때)
//         data:{
//             title: "타이틀",
//             text: "텍스트",
//             userID:''//의사아이디
//         },
//         success:function(result){
//             console.log("result: ", result);
//         }
//     })
	
// })
	
    
})();

