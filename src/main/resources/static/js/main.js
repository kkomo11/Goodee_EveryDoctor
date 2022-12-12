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
        if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
            backToTo.style.display = "flex";
        } else {
            backToTo.style.display = "none";
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

	const toastTrigger = document.getElementById('liveToastBtn')
	const toastLiveExample = document.getElementById('liveToast')
	const toast = new bootstrap.Toast(toastLiveExample)
    let userID = $("#authUsername").val()
	
    console.log($("#authUsername").val())

    

    let urlEndPoint = 'http://localhost:81/subscribe?userID='+userID;
    let eventSource = new EventSource(urlEndPoint);

	console.log(eventSource.readyState)
    eventSource.addEventListener("latestNews",function(event){
        let articleData =JSON.parse(event.data);
        // console.log(articleData)
        
        toast.show()

        
        // notifyMe();

    })
    
    
    
	console.log($(toastTrigger))
$(toastTrigger).click(function(){
	
    $.ajax({
        type:"POST",
        url:"/dispatchEventToSpecificUser",
        traditional:true, //배열을 전송할 때 사용(파라미터 이름 하나로 여러개를 보내야 할때)
        data:{
            title: "타이틀",
            text: "텍스트",
            userID:"Doctor"
        },
        success:function(result){
            console.log("result: ", result);
        }
    })
	
})
	
    
})();

