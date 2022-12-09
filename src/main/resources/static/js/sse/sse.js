var socket = null;
connect();

function connect() {
    var ws = new WebSocket('ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket.do');		   
    socket = ws;
    
    ws.onopen = function() {
           console.log('Info: connection opened.');
    };

    ws.onmessage = function(event) {
           console.log('Info: connection onmessage.');
    };

    ws.onclose = function(event) {
           console.log('Info: connection closed');
    };
    
    ws.onerror = function(err) {
           console.log('Error:', err);
    };
}

$(document).ready(function() {
       socket.send();
    });
   socket.onclose();
