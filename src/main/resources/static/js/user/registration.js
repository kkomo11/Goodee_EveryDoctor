console.log("regi.js")

let IDchk = false;
let IDdupl = false;
let NAMEchk = false;
//let EMAILchk = false;
let PASSWORDchk = false;
let PASSWORDchk2 = false;

//아이디 체크
$("#username").change(function(){
    let rex = /^[a-z]{1,1}[a-z0-9]{4,19}$/g;
    let str = $("#username").val();
    IDdupl = false;
    
    let idCheck = str.match(rex);
    console.log();
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
    console.log("클릭", $("#username").val())
    IDdupl = true;

    $.get("/user/chkId?username="+$("#username").val(), function(dt){
        if(dt>0){
            $("#errorUsername").text("중복된 아이디입니다. 다시 입력해주세요")
        }else{
            alert("사용가능한 아이디입니다.");
            IDdupl = true;
        }
        console.log(IDdupl)
    })
})
//이름 체크
$("#name").change(function() {
	let rex = /^[가-힣]{2,5}$/g;
    let str = $("#name").val();
    
    NAMEchk = str.match(rex);
    console.log(NAMEchk);
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
    console.log(PASSWORDchk);
    if(PASSWORDchk == null) {
		PASSWORDchk = false;
		$('#errorPassword').html('대문자, 소문자, 숫자로 구성된 6-20자의 비밀번호를 입력해주세요');
	} else {
		PASSWORDchk = true;
		$('#errorPassword').html('');
	}
})
//패스워드 2차 체크
$("#password2").change(function() {
    let str = $("#password").val();
    let str2 = $("#password2").val();
    
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
	console.log("헬로헬로",$(e.target).prop("checked"))
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
	console.log($(e.target).prop("checked"))
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
	console.log("hello",IDchk,IDdupl,NAMEchk,PASSWORDchk,PASSWORDchk2	)
	
	if(IDchk&IDdupl&NAMEchk&PASSWORDchk&PASSWORDchk2){
		$("#regiForm").submit();
	}

	
})