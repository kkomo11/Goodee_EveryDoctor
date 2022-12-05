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
				 console.log(dt)
			 }
		 })
	 }
 })
 
 //프로필 수정
 $("#modifyBtn").click(function(){
	 console.log("비번 확인하고 프로필 수정")
 })
 
 //비밀번호 변경
 $("#modifyPwBtn").click(function(){
	 console.log("비번 변경")
 })