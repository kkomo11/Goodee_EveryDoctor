console.log("regi.js")

let IDchk = false;
let IDdupl = false;
let NAMEchk = false;
let EMAILchk = false;
let PASSWORDchk = false;

$("#username").change(function(){
    console.log("아이디는 몇자이상 어떤 형식으로 입력해야 할까?")
    let rex = /^[a-z]{1,1}[a-z0-9]{4,}$/g;
    let str = $("#username").val();
    
    IDdupl = str.match(rex);
    console.log(IDdupl);
    if(IDdupl == null) {
		IDdupl = false;
		$('#errorUsername').html('절대 안돼!');
	} else {
		IDdupl = true;
		$('#errorUsername').html('');
	}
})


$("#chkId").click(function(){
    console.log("클릭", $("#username").val())
    IDdupl = true;

    $.get("/user/chkId?username="+$("#username").val(), function(dt){
        if(dt>0){
            $("#errorUsername").text("중복된 아이디입니다. 다시 입력해주세요")
        }else{
            $("#errorUsername").text("")
            IDchk = true;
        }
        console.log(IDchk)
    })
})

$("#name").change(function() {
	let rex = /^[가-힣]{2,5}$/g;
    let str = $("#name").val();
    
    NAMEchk = str.match(rex);
    console.log(NAMEchk);
    if(NAMEchk == null) {
		NAMEchk = false;
		$('#errorName').html('절대 안돼!');
	} else {
		NAMEchk = true;
		$('#errorName').html('');
	}
})

$("#password").change(function() {
	let rex = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[A-Za-z0-9]{6,}$/g;
    let str = $("#password").val();
    
    PASSWORDchk = str.match(rex);
    console.log(PASSWORDchk);
    if(PASSWORDchk == null) {
		PASSWORDchk = false;
		$('#errorPassword').html('절대 안돼!');
	} else {
		PASSWORDchk = true;
		$('#errorPassword').html('');
	}
})

$("#password2").change(function() {
    let str = $("#password").val();
    let str2 = $("#password2").val();
    
    if(str != str2) {
		PASSWORDchk = false;
		$('#errorPassword2').html('절대 안돼!');
	} else {
		PASSWORDchk = true;
		$('#errorPassword2').html('');
	}
})