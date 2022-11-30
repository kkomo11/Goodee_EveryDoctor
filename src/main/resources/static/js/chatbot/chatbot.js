 let socket = new SockJS('/ws');
socket.onopen = (event) => {
    console.log("Open connection: " + event);
};

socket.onmessage = (event) => {
    $('#starkIsTyping').show();
    setTimeout(function() {
        const data = JSON.parse(event.data);
        $("#messagesContent").append('<div class="message stark">' + data.message+ '</div>');
        $('#starkIsTyping').hide();
    }, 1000);
    chat.scrollTop = chat.scrollHeight - chat.clientHeight;
};

socket.onclose = (event) => {
    console.log("Close connection: " + event);
};
