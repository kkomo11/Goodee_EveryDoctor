/**
 * 
 */
 
console.log("profile.js")
 
let currentPhone = $("#phone").val()
let currentEmail = $("#email").val()
let usernameVal = $("#username").val()
let phone;
let email;
let code2;
 
let chk = usernameVal.indexOf('@')
 
 //소셜로그인 계정이면
 if(chk!=-1){
	 $("#username").val(usernameVal.slice(0,chk) +" 소셜로그인 계정입니다.")
	 $("#passwordDiv").attr("style","display:none;")
}

let birthVal = $("#birth").val()

$("#birth").val(birthVal.slice(0,4)+"년 "+birthVal.slice(4,6)+"월 "+birthVal.slice(6,8)+"일")
 
 //프로필 사진 수정
 $("#profile-image").change(function(){
	    let filedata = new FormData();
        filedata.append("file",$("#profile-image")[0].files[0])
        //path 에 저장할 폴더 경로를 담아준다.
        filedata.append("username",usernameVal)
    
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "profileImgUpload",
            data: filedata,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (dt) {
				if(dt==1){
					window.location.href="";
				}
			}
			})
 })
 
 //기본 프로필로 변경
 $("#default-profile").click(function(){
	 if(window.confirm("기존 프로필 사진이 삭제됩니다. 계속 진행하시겠습니까?")){
		 console.log("기본으로 변경")
		 $.ajax({
			 type:"POST",
			 url: "setProfileImgDefault",
			 data: {
				 "username":usernameVal
			 },
			 success: function(dt){
				 if(dt==1){
					window.location.href="";
				}
			 }
		 })
	 }
 })
 
 //연락처 유효성 검증
 $("#phone").on("input",function(){
	 this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
	
	 
	 if(currentPhone==this.value){
		 $("#phoneMessage").text("현재 등록된 휴대전화 정보와 동일합니다")
		 $("#chkPhone").attr("class","btn bg-secondary")
		$("#chkPhone").attr("data-bs-toggle","")
		$("#chkPhone").attr("data-bs-target","")	
	}else if(this.value.length>9 & this.value.length<12){
		$("#phoneMessage").text("")
		$("#chkPhone").attr("class","btn")
		$("#chkPhone").attr("data-bs-toggle","modal")
		$("#chkPhone").attr("data-bs-target","#chkModal")		
	}else{
		$("#phoneMessage").text("숫자로 10-11자 입력해주세요")
		$("#chkPhone").attr("class","btn bg-secondary")
		$("#chkPhone").attr("data-bs-toggle","")
		$("#chkPhone").attr("data-bs-target","")	
	}
 })
 
 //문자인증하기
 $("#chkPhone").click(function(){
	
	if($("#chkPhone").attr("data-bs-toggle")=="modal"){
		//문자를 보내고 인증번호를 받아서 기다린다
		phone = $("#phone").val()	
		email = "";
		 $.get("/user/phoneCheck?phonenum="+phone, function(dt){
			 if(dt==0){
				$("#modifiyMsg").text("메세지 발송에 문제가 발생했습니다. 잠시후 다시 시도해주세요")
			 }else{
				 code2 = dt;
			 }
		 })
	} 
	 
 })

  //이메일 유효성 검증
  $("#email").on("input",function(){
	let regex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	if(regex.test(this.value)){
		$("#emailMessage").text("")
		$("#chkEmail").attr("class","btn")
		$("#chkEmail").attr("data-bs-toggle","modal")
		$("#chkEmail").attr("data-bs-target","#chkModal")

   }else{
	   $("#emailMessage").text("이메일 형식에 맞게 입력해주세요")
	   $("#chkEmail").attr("class","btn bg-secondary")
	  $("#chkEmail").attr("data-bs-toggle","")
	  $("#chkEmail").attr("data-bs-target","")			
   }
})

  //이메일인증하기
  $("#chkEmail").click(function(e){

	if($("#chkEmail").attr("data-bs-toggle")=="modal"){
		//문자를 보내고 인증번호를 받아서 기다린다
		email = $("#email").val()	
		phone = "";
		$.get("/user/emailCheck?emailnum="+email, function(dt){
			if(dt==0){
			   $("#modifiyMsg").text("이메일 발송에 문제가 발생했습니다. 잠시후 다시 시도해주세요")
			}else{
				$("#modifiyMsg").text("")
				code2 = dt;
			}
		})
	}

	
	
})

//인증번호 체크
 $("#chkCodeBtn").click(function(){
	if($("#code").val()==code2){
		console.log($("#code").val(),"일치",code2)
		let modifyForm = new FormData();
		modifyForm.append("phoneNum",phone)
		modifyForm.append("emailNum",email)
		$("#modifiyMsg").text("인증번호 확인 완료, 정보 수정 중")
		$.ajax({
			type:"POST",
			url:"modifyProfile",
			enctype: 'multipart/form-data',
			data: modifyForm,
			processData: false,
			contentType: false,
			cache: false,
			success:function(dt){
				window.location.href="/user/profile";
			}
		})
	}else{
		$("#modifiyMsg").text("인증번호 불일치")
	}
 })
 
 //비밀번호 변경
 $("#modifyPwBtn").click(function(){
	 let modifyPwForm = new FormData($("#modifyPwForm")[0]);
	 modifyPwForm.append("username",usernameVal)
	 console.log("비번 변경"+modifyPwForm)
	 
	 $.ajax({
		type:"POST",
		url:"modifyPassword",
		enctype: 'multipart/form-data',
		data: modifyPwForm,
        processData: false,
        contentType: false,
        cache: false,
		success:function(dt){
			if(dt==1){
				alert("비밀번호가 변경되었습니다. 다시 로그인해주세요")
				window.location.href="/user/login";
			}
		}
	})
	 
 })