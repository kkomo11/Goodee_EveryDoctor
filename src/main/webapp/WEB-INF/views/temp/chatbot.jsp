<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Hello WebSocket</title>
	<link rel="stylesheet" href="/css/chatbot/bot.css">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>

    <script src="/js/chatbot/bot.js" charset="UTF-8"></script>
	<style>
		.chatbotbtn{
			border-radius: 10px; 
			color: #2284f5;
			background-color: #f2f8ff; 
			font-weight: 700; 
			border: none; 
			min-width: 170px; 
			min-height: 30px;
		}
		.chatbotbtn:hover{
			margin: 1px;
			transition: margin 0.5s;
		}
	</style>
</head>
<body>
<noscript><h2 style="color: #ff0000">Seems your browser dmapoesn't support Javascript! Websocket relies on Javascript being
    enabled. Please enable
    Javascript and reload this page!</h2></noscript>
	<div id="main-content" class="container" >
	    <div class="row">
	        <div class="col-md-6">
	            <form class="form-inline">
	                <div class="form-group">
	                    <label for="connect">웹소켓 연결:</label>
	                    <button id="connect" class="btn btn-default" type="submit">연결</button>
	                    <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">해제</button>
	                </div>
	            </form>
	        </div>
	        <div class="col-md-6">
	            <form class="form-inline">
	                <div class="form-group">
	                    <label for="msg">문의사항</label>
						<div style="display:flex; justify-content: space-between;">
							<button onclick='sendMessage("이용")' class="chatbotbtn" >이용안내</button>
							<button onclick='sendMessage("결제")' class="chatbotbtn" >결제안내</button>
							<button onclick='sendMessage("배송")' class="chatbotbtn" >배송안내</button>
						</div>
	                    <!-- <input type="text" id="msg" class="form-control" placeholder="내용을 입력하세요...."> -->
	                </div>
	                <!-- <button id="send" class="btn btn-default" disabled type="submit">보내기</button> -->
	            </form>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-12" style="overflow-y: scroll;">
	            <div id="conversation" class="table table-striped">
	                    
	                <div id="communicate">
					</div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>