<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Chat Room</title>
    <!-- Latest minified Bootstrap & JQuery-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <c:import url="../temp/boot.jsp"></c:import>
    <!-- Custom styles for this template -->
    <style>
        .btn.active {
            display: none;
        }

        .btn span:nth-of-type(1)  {
            display: none;
        }
        .btn span:last-child  {
            display: block;
        }

        .btn.active span:nth-of-type(1)  {
            display: block;
        }
        .btn.active span:last-child  {
            display: none;
        }

        .remoteWrap {
            position: relative;
            padding: 0;
            min-height: 500px;
        }

        .localWrap {
            position: absolute;
            height: 20%;
            width: 20%;
            right: 0;
            bottom: 0;
            padding: 0;
        }

        .video-sticky {
            position: fixed;
            width: 300px;
            height: 300px;
            right: 30px;
            bottom: 30px;
            z-index: 10;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/css/telemedicine.css"/>
</head>
<body class="text-center">
<!-- Preloader -->
<div class="preloader">
    <div class="preloader-inner">
        <div class="preloader-icon">
            <span></span>
            <span></span>
        </div>
    </div>
</div>
<!-- /End Preloader -->
<!-- Start Header Area -->
<c:import url="../temp/header.jsp"></c:import>
<!-- End Header Area -->
<!-- Begin page content -->
<main role="main" class="container" style="margin-top:100px">
    <input type="hidden" id="id" name="id" value="${id}"/>
    <div class="col-lg-12 mb-3">
        <div class="col-lg-12 mb-3">
            <div class="d-flex justify-content-around mb-3">
                <div id="buttons" class="row">
                    <div class="btn-group mr-2" role="group">
                        <div class="mr-2" data-toggle="buttons">
                            <label class="btn btn-outline-success" id="video_off">
                                <input type="radio" name="options" style="display:none" autocomplete="off">Video On
                            </label>
                            <label class="btn btn-outline-warning active" id="video_on">
                                <input type="radio" name="options" style="display:none" autocomplete="off" checked>Video Off
                            </label>
                        </div>
                        <div class="mr-2" data-toggle="buttons">
                            <label class="btn btn-outline-success" id="audio_off">
                                <input type="radio" name="options" style="display:none" autocomplete="off">Audio On
                            </label>
                            <label class="btn btn-outline-warning active" id="audio_on">
                                <input type="radio" name="options" style="display:none" autocomplete="off" checked>Audio Off
                            </label>
                        </div>
                        <!--<button type="button" class="btn btn-outline-success" id="audio" data-toggle="button">Audio</button>-->
                        <a href="/room/${id}/user/${uuid}/exit">
                            <button type="button" class="btn btn-outline-danger" id="exit" name="exit">
                                Exit Room
                            </button>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-around mb-3">
            <div class="col-lg-8">
                <!-- 상대 화면 -->
                <div class="col-lg-12 mb-3 remoteWrap">
                    <video id="remote_video" autoplay playsinline></video>
                    <div class="col-lg-12 localWrap">
                        <!-- 내 화면 -->
                        <video id="local_video" autoplay playsinline></video>
                    </div>
                </div>
            </div>
            <!-- 채팅 자리 -->
            <div class="messages-body col-lg-4" style="height:900px; width:420px;">
                <div class="row" style="height:90%">
                    <div style="height:80%">
                        <!-- Start Chat List -->
                        <div class="chat-list" style="height:90%">
                            <ul class="single-chat-head" id="msgArea" style="height:90%">
                            </ul>
                            <div class="reply-block">
                                <input name="reply" type="text" id="msg" placeholder="Type your message here...">
                                <button class="reply-btn" type="button" id="button-send">
                                    <img src="/images/messages/send.svg" alt="#">
                                </button>
                            </div>
                        </div>
                        <!-- End Chat List -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Start Dashboard Section -->
        <section class="dashboard section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-12">
                        <div class="main-content">
                            <div class="dashboard-block mt-0" style="padding-bottom: 60px;">
                                <div class="profile-settings-block">
                                    <h3 class="block-title">환자 신청 내용</h3>
                                    <c:if test="${!empty diagnosisVO }">
	                                    <div class="inner-block">
	                                        <div class="image">
	                                            <c:forEach items="${diagnosisVO.dansFiles}" var="fileVO">
	                                                <img src="${fileVO.fileName}" alt="#">
	                                            </c:forEach>
	                                        </div>
	                                        <form class="profile-setting-form" method="post" action="#">
	                                            <div class="row">
	                                                <div class="col-12">
	                                                    <div class="form-group message">
	                                                        <label>내 증상</label>
	                                                        <textarea name="message" readonly
	                                                            onfocus="this.blur()">${diagnosisVO.dansContent}</textarea>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <a href="/hospital/diagnosis/prescription" class="col-3 btn btn-primary" style="float: right;">진료 종료</a>
	                                        </form>
	                                    </div>
                                    </c:if>
                                    
                                    <c:if test="${!empty petDiagnosisVO }">
	                                    <div class="inner-block">
	                                        <div class="image">
	                                            <c:forEach items="${petDiagnosisVO.PDansFiles}" var="fileVO">
	                                                <img src="/file/PETDANS/${fileVO.fileName}" alt="#">
	                                            </c:forEach>
	                                        </div>
	                                        <form class="profile-setting-form" method="post" action="#">
	                                            <div class="row">
	                                                <div class="col-12">
	                                                	<div class="form-group">
	                                                		<label>보호자명</label>
	                                                		<input type="text" readonly="readonly" value="${petDiagnosisVO.protectorName }">
	                                                	</div>
	                                                	<div class="form-group">
	                                                		<label>반려동물명</label>
	                                                		<input type="text" readonly="readonly" value="${petDiagnosisVO.petVO.petName }">
	                                                	</div>
	                                                	<div class="form-group">
	                                                		<label>반려동물 생일</label>
	                                                		<input type="text" readonly="readonly" value="${petDiagnosisVO.petVO.petBirth }">
	                                                	</div>
	                                                	<div class="form-group">
	                                                		<label>반려동물 나이</label>
	                                                		<input type="text" readonly="readonly" value="${petDiagnosisVO.petVO.petAge }">
	                                                	</div>
	                                                	<div class="form-group">
	                                                		<label>반려동물 성별</label>
	                                                		<c:if test="${petDiagnosisVO.petVO.petSex == 0 }">
	                                                			<input type="text" readonly="readonly" value="암">
	                                                		</c:if>
	                                                		<c:if test="${petDiagnosisVO.petVO.petSex == 1 }">
	                                                			<input type="text" readonly="readonly" value="수">
	                                                		</c:if>
	                                                	</div>
	                                                	<div class="form-group">
	                                                		<label>반려동물 중성화여부</label>
	                                                		<c:if test="${petDiagnosisVO.petVO.neutered == 0 }">
	                                                			<input type="text" readonly="readonly" value="안함">
	                                                		</c:if>
	                                                		<c:if test="${petDiagnosisVO.petVO.neutered == 1 }">
	                                                			<input type="text" readonly="readonly" value="함">
	                                                		</c:if>
	                                                	</div>
	                                                	<div class="form-group">
	                                                		<label>반려동물 예방접종 정보</label>
	                                                		<c:if test="${petDiagnosisVO.petVO.vaccinnation == 0 }">
	                                                			<input type="text" readonly="readonly" value="안함">
	                                                		</c:if>
	                                                		<c:if test="${petDiagnosisVO.petVO.vaccinnation == 1 }">
	                                                			<input type="text" readonly="readonly" value="부분접종">
	                                                		</c:if>
	                                                		<c:if test="${petDiagnosisVO.petVO.vaccinnation == 2 }">
	                                                			<input type="text" readonly="readonly" value="함">
	                                                		</c:if>
	                                                		<c:if test="${petDiagnosisVO.petVO.vaccinnation == 3 }">
	                                                			<input type="text" readonly="readonly" value="모르겠음">
	                                                		</c:if>
	                                                	</div>
	                                                    <div class="form-group message">
	                                                        <label>상담 내용</label>
	                                                        <textarea name="message" readonly
	                                                            onfocus="this.blur()">${petDiagnosisVO.PDansContent}</textarea>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <a href="/pet/diagnosis/petPrescription?n=${petDiagnosisVO.PDansNum }" class="col-3 btn btn-primary" style="float: right;">진료 종료</a>
	                                        </form>
	                                    </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Dashboard Section -->
    </div>
</main>
<!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>
<!-- Start Footer Area -->
<c:import url="../temp/footer.jsp"></c:import>
<!-- End Footer Area -->
<script src="/js/telemedicine/webrtc_client.js"></script>
</body>
</html>