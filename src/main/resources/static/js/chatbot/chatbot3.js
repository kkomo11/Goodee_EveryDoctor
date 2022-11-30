$("#chatbtn").click(function(){
    $('#chatbtn').toggleClass('ChatButton_Closed__sKzUx');
    $('#chatbtn').toggleClass('ChatButton_ChatButton__utC8a ChatButton_Opened__urOH2');
    // $('chatbtn').toggleClass('ChatButton_ChatButton__utC8a');

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
            showBotReply( message.body); //서버에 메시지 전달 후 리턴받는 메시지
        });
    });
}

function showBotReply(message){
    let bot = '<li class="ChatContainer_ConversationItem__pk3IQ " data-testid="message-listitem">'
            + '<div class="CompleteMessage_CompleteMessage__KWS7v">'
            + '<div class="CompleteMessage_BotIcon__L-jGa" data-testid="bot-icon"></div>'
            + '<div class="BubbleMessage_BubbleMessage__d2tka" data-testid="bubble-message">'
            + '<div class="BubbleMessage_Body__SLE+g">'
            + '<div class="BubbleMessage_Chunks__y4XFp">'
            + '<div class="BubbleMessage_Section__5ZxvS" data-testid="body-section">'
            + '<div class="SpeechBubble_SpeechBubble__dPnRi MessageChunk_MessageChunk__Q3D+1" data-testid="speech-bubble">'
            + '<div class="MessageChunk_WithVerticalMargin__RhSp3">'
            + '<div class="BoxMessage_BoxMessage__8JUew" data-testid="box-message" style="margin-top: 0px;">'
            + '<div class="BoxMessage_BoxMessage__8JUew BoxMessage_WithoutMargin__MdLiN" data-testid="box-message" style="margin-top: 0px;">'
            + '<div class="TextMessage_TextMessage__EDD4r BoxMessage_WithoutMargin__MdLiN" data-testid="text-message" style="font-size: 15px; font-weight: 400; margin-top: 0px;">'+message+'</div>'
            +    '</div>'
            +    '</div>'
            +    '</div>'
            +    '</div>'
            +    '</div>'
            +    '</div>'
            +    '</div>'
            +    '</div>'
            +    '</div>'
            +    '</li>'
    $("#chatList").append(bot)
    $("#chatBody").scrollTop($("#chatBody")[0].scrollHeight);   //답변이 나오는 곳으로 스크롤 focus맞춰줌
}

function sendMessage(messages){
    showMessage(messages);

    stompClient.send("/app/sendMessage", {}, JSON.stringify(messages)); //서버에 보낼 메시지
}

function showMessage(message) {
   let li =  $('<li class="ChatContainer_ConversationItem__pk3IQ ChatContainer_User__aHG5H" data-testid="message-listitem"/>')
   let div =  $('<div class="UserMessage_UserMessage__K5Ywg"/>')
   let span =   $('<span class="UserMessage_Content__LSbVx"/>').text(message)
    
   li.append(div);
   div.append(span);

   $("#chatList").append(li);
    
    // $("#communicate").append('<div class="UserMessage_UserMessage__K5Ywg">' + message + '</div><br>');
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}

// $("#web_chat").addEventListener("resize", (event) => {
//     console.log("ㅇㅇㅇ애ㅐ")
// });
