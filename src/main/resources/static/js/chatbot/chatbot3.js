$("#chatbtn").click(function(){
    $('#chatbtn').toggleClass('ChatButton_Closed__sKzUx')
    $('#chatbtn').toggleClass('ChatButton_Opened__urOH2')

    $('#chatContainer').toggleClass('ChatContainer_Closed__XFx+C')

    if($('#chatbtn').hasClass('ChatButton_Closed__sKzUx')) {
        disconnect();
    }else {
        connect();
    }
})
let stompClient = null;

function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    $("#send").prop("disabled", !connected);
    if (connected) {
        $("#conversation").show();
    }
    else {
        $("#conversation").hide();
    }
    $("#msg").html("");
}

function connect() {
    let socket = new SockJS('/ws');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/public', function (message) {
            showBotReply("받은 메시지: " + message.body); //서버에 메시지 전달 후 리턴받는 메시지
        });
    });
}

function showBotReply(message){
	$("#communicate").append('<div class="SpeechBubble_SpeechBubble__dPnRi">'+message+'</div>')
}

function sendMessage(messages){
    showMessage("보낸 메시지: " + messages);

    stompClient.send("/app/sendMessage", {}, JSON.stringify(messages)); //서버에 보낼 메시지
}

function showMessage(message) {
    $("#communicate").append('<div class="UserMessage_UserMessage__K5Ywg">' + message + '</div><br>');
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}
