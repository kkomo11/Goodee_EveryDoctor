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
		//이름이랑 성별값 잘 왔나 체크
		let chk = false
		let nameVal = $("#certiName").val()
		let genderVal = $("input[name='gender']:checked").val();
		let usernameVal = $("#certiusername").val()
		
		if(genderVal!=null && nameVal!=""){
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
						{imp_uid:rsp.imp_uid, username:usernameVal, name:nameVal, gender:genderVal}, 
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
		}else{
			
			$("#certiMsg").text("성함과 성별을 입력해주세요")
		}
		
	})
	}
	
    
})();

