<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/chatbot/chatbot3.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <title>Document</title>
</head>
<body>
    <div id="web_chat" class="hyper_clova_chatbot">
        <div class="Chat_Chat__l9gIS" data-testid="chat-root">
            <div class="ChatContainer_Container__Bz-YZ ChatContainer_Closed__XFx+C" id="chatContainer" data-testid="container">
                <div class="ChatContainer_Header__Gs2e6">
                    <!-- <div class="ChatContainer_Logo__c6ufe">
                        <span class="ChatContainer_Blind__7omeh">CLOVA Chatbot</span>
                    </div> -->
                </div>
                <div class="ChatContainer_Body__LEr-q" id="chatBody">
                    <!-- <div class="ChatContainer_Opening__BuUR+">
                        <div class="ChatContainer_Title__yVoiL">
                            <p class="ChatContainer_Description__t5ueD">HyperCLOVA
                            기술이 적용된 새로운
                            챗봇을 만나보세요!
                            </p>
                        </div>
                        <i class="ChatContainer_Image__Byitv" role="img"></i>
                    </div> -->
                    <ul class="ChatContainer_ConversationList__aR5OV" id="chatList">
                        <li class="ChatContainer_ConversationItem__pk3IQ " data-testid="message-listitem">
                            <div class="CompleteMessage_CompleteMessage__KWS7v">
                                <div class="BubbleMessage_BubbleMessage__d2tka" data-testid="bubble-message">
                                    <div class="BubbleMessage_Body__SLE+g">
                                        <div class="BubbleMessage_Chunks__y4XFp">
                                            <div class="BubbleMessage_Section__5ZxvS" data-testid="body-section">
                                                <div class="SpeechBubble_SpeechBubble__dPnRi MessageChunk_MessageChunk__Q3D+1" data-testid="speech-bubble">
                                                    <div class="MessageChunk_WithVerticalMargin__RhSp3">
                                                        <div class="BoxMessage_BoxMessage__8JUew" data-testid="box-message" style="margin-top: 0px;">
                                                            <div class="TextMessage_TextMessage__EDD4r BoxMessage_WithoutMargin__MdLiN" data-testid="text-message" style="font-size: 15px; font-weight: 400; margin-top: 0px;">안녕하세요🙂</div>
                                                            <div class="TextMessage_TextMessage__EDD4r BoxMessage_WithoutMargin__MdLiN" data-testid="text-message" style="font-size: 15px; font-weight: 400; margin-top: 2px;">
                                                                안녕하세요 에브리닥터 입니다.☺️ 자주하는 질문에 대해 소개해드릴게요. 원하시는 정보를 선택해주세요.
                                                            </div>
                                                            <div class="TextMessage_TextMessage__EDD4r BoxMessage_WithoutMargin__MdLiN" data-testid="text-message" style="font-size: 15px; font-weight: 400; margin-top: 2px;">무엇을 찾으시나요?</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="BubbleMessage_Section__5ZxvS" data-testid="body-section">
                                                <ul class="ButtonMessageGroup_ButtonMessageGroup__+wRrg">
                                                    <li class="ButtonMessageGroup_Item__K2Y1r">
                                                        <button onclick='sendMessage("가입 안내")' class="ButtonMessage_ButtonMessage__z6JjE">가입 안내 </button>
                                                    </li>
                                                    <li class="ButtonMessageGroup_Item__K2Y1r">
                                                        <button onclick='sendMessage("이용")' class="ButtonMessage_ButtonMessage__z6JjE">사이트 이용 안내  </button>
                                                    </li>
                                                    <li class="ButtonMessageGroup_Item__K2Y1r">
                                                        <button onclick='sendMessage("상담")' class="ButtonMessage_ButtonMessage__z6JjE">무료 상담 안내 </button>
                                                    </li>
                                                    <li class="ButtonMessageGroup_Item__K2Y1r">
                                                        <button onclick='sendMessage("결제")' class="ButtonMessage_ButtonMessage__z6JjE">결제 안내 </button>
                                                    </li>
                                                    <li class="ButtonMessageGroup_Item__K2Y1r">
                                                        <button onclick='sendMessage("배달")' class="ButtonMessage_ButtonMessage__z6JjE">배송 안내 </button>
                                                    </li>
                                                    <li class="ButtonMessageGroup_Item__K2Y1r">
                                                        <button onclick='sendMessage("문의")' class="ButtonMessage_ButtonMessage__z6JjE">문의 안내 </button>
                                                    </li>
                                                    <li class="ButtonMessageGroup_Item__K2Y1r">
                                                        <button onclick='sendMessage("진료")' class="ButtonMessage_ButtonMessage__z6JjE">진료 안내 </button>
                                                    </li>
                                                </ul>
                                                <div id="communicate"></div>
                                            </div>
                                        </div>
                                        <!-- <div class="BubbleMessage_Time__yJFhy">
                                            <span class="TimeBox_TimeBox__vvSgj" data-testid="time-box">오전 9:14</span>
                                        </div> -->
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="ChatContainer_Footer__ewY4r">
                    <div class="UserInput_InputBox__N3KF1 " data-testid="userInput">
                        <input type="text" class="UserInput_TextInput__SmLMO" placeholder="메시지 입력" value="">
                        <button type="button" class="UserInput_MessageSend__B-tKP " disabled=""></button>
                    </div>
                </div>
            </div>
            <!-- <div class="ChatTooltip_TooltipBox__CDfSw ChatTooltip_Opened__Jvy3V" data-testid="tooltip">
                <span class="ChatTooltip_Tooltip__5nbPf">HyperCLOVA
                    기술이 적용된 새로운
                    챗봇을 만나보세요!
                </span>
            </div> -->
            <button type="button" class="ChatButton_ChatButton__utC8a ChatButton_Closed__sKzUx" id="chatbtn" data-testid="chatButton"></button>
        </div>
    </div>
    <script src="/js/chatbot/chatbot3.js"></script>
</body>
</html>