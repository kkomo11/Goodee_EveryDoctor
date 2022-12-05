/**
 * 
 */
 
 console.log("profile.js")
 
 let usernameVal = $("#username").val()
 
let chk = usernameVal.indexOf('@')
 
 if(chk!=-1){
	 $("#username").val(usernameVal.slice(0,chk) +" 소셜로그인 계정입니다.")
}

let birthVal = $("#birth").val()
console.log(birthVal.slice(0,4)+"년"+birthVal.slice(4,6)+"월"+birthVal.slice(6,8)+"일")

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
            url: "profileUpload",
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
			 url: "setProfileDefault",
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
 
 //프로필 수정
 $("#modifyBtn").click(function(){
	 $("#modifiyMsg").text("정보를 수정중입니다. 잠시만 기다려주세요")
	 let modifyForm = new FormData($("#modifyForm")[0]);
	 modifyForm.append("username",usernameVal)
	 modifyForm.append("email",$("#email").val())
	 modifyForm.append("phone",$("#phone").val())
	 $.ajax({
			type:"POST",
			url: "modifyProfile",
			enctype: 'multipart/form-data',
            data: modifyForm,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (dt) {
					console.log(dt)
				if(dt==1){
					window.location.href="";
				}else if(dt==-1){
					$("#modifiyMsg").text("비밀번호가 틀렸습니다.")
				}else{
					$("#modifiyMsg").text("다시 시도해주세요.")
				}
			}
			})
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