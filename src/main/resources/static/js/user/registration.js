console.log("regi.js")

let IDchk = false;
let IDdupl = false;
let NAMEchk = false;
let EMAILchk = false;
let PASSWORDchk = false;

$("#username").change(function(){
    console.log("아이디는 몇자이상 어떤 형식으로 입력해야 할까?")
    IDdupl = false;
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