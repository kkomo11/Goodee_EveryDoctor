console.log("regi.js")

let IDchk = false;
let IDdupl = false;
let NAMEchk = false;
//let EMAILchk = false;
let PASSWORDchk = false;
let PASSWORDchk2 = false;
let AGREchk = false;

//아이디 체크
$("#username").change(function(){
    let rex = /^[a-z]{1,1}[a-z0-9]{4,19}$/g;
    let str = $("#username").val();
    IDdupl = false;
    
    let idCheck = str.match(rex);
    if(idCheck == null) {
		IDchk = false;
		$('#errorUsername').html('5~20자의 소문자, 숫자만 사용가능합니다. 첫글자는 소문자로 입력해주세요');
	} else {
		IDchk = true;
		$('#errorUsername').html('');
	}
})

//아이디 중복체크
$("#chkId").click(function(){

    $.get("/user/chkId?username="+$("#username").val(), function(dt){
        if(dt>0){
            $("#errorUsername").text("중복된 아이디입니다. 다시 입력해주세요")
        }else{
            alert("사용가능한 아이디입니다.");
            IDdupl = true;
        }
    })
})
//이름 체크
$("#name").change(function() {
	let rex = /^[가-힣]{2,5}$/g;
    let str = $("#name").val();
    
    NAMEchk = str.match(rex);
    if(NAMEchk == null) {
		NAMEchk = false;
		$('#errorName').html('2-5자의 한글을 입력해주세요');
	} else {
		NAMEchk = true;
		$('#errorName').html('');
	}
})
//패스워크 체크
$("#password").change(function() {
	let rex = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[A-Za-z0-9]{6,}$/g;
    let str = $("#password").val();
    
    PASSWORDchk2 = false;
    
    PASSWORDchk = str.match(rex);
    if(PASSWORDchk == null) {
		PASSWORDchk = false;
		$('#errorPassword').html('대문자, 소문자, 숫자로 구성된 6-20자의 비밀번호를 입력해주세요');
	} else {
		PASSWORDchk = true;
		$('#errorPassword').html('');
	}
})
//패스워드 2차 체크
$("#password2").blur(function() {
    let str = $("#password").val();
    let str2 = $("#password2").val();
    
    console.log("패스워드 체크"+str + "패스워드 체크"+str2)
    
    if(str != str2) {
		PASSWORDchk2 = false;
		$('#errorPassword2').html('동일한 비밀번호를 입력해주세요');
	} else {
		PASSWORDchk2 = true;
		$('#errorPassword2').html('');
	}
})

//전체동의 체크박스 클릭하면
$("#agree_all").click(function(e){
	let agre_chk = $(e.target).prop("checked");
	
	if(agre_chk){
		$(".little-check").prop("checked", agre_chk)
	}else{
		console.log('flase')
		$(".little-check").prop("checked", "")
	}
})
// 동의사항 체크박스 클릭하면
$(".little-check").click(function(e){
	let little_agre_chk = $(e.target).prop("checked");
	
	if(little_agre_chk){
		let lchk = true;
		$(".little-check").each(function(index, item){
			if(!$(item).prop("checked")){
				lchk = false;
			}
		})
		if(lchk){		
			$("#agree_all").prop("checked", true);
		}
	}else{
		$("#agree_all").prop("checked","")
	}
	
})

//회원가입 버튼 클릭
$("#regiBtn").click(function(){
	console.log("hello",$("#agree_all").prop("checked")	)
	AGREchk = $("#agree_all").prop("checked");
	
	if(AGREchk){
		
		if(IDchk&IDdupl&NAMEchk&PASSWORDchk&PASSWORDchk2){
			$("#regiForm").submit();
		}else{
			let message = (IDchk?"":"아이디 ");
			message = message+ (IDdupl?"":"아이디 중복 ");
			message = message+ (NAMEchk?"":"이름 ");
			message = message+ (PASSWORDchk?"":"비밀번호 ");
			message = message+ (PASSWORDchk2?"":"비밀번호 일치");
			message = message+ "를 확인해주세요" 
			
			
			alert(message);
		}
	}else{
		alert("약관을 전체동의 해주세요")
	}
	

	
})