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
                <div class="col-lg-12 mb-3">
                    <video id="local_video" autoplay playsinline></video>
                </div>
                <div class="col-lg-12 mb-3">
                    <video id="remote_video" autoplay playsinline></video>
                </div>
            </div>
            <div class="col-lg-4" id="page-content-wrap">
                <div class="container-fluid">
                    <div class="col-6">
                        <h1>roomName</h1>
                    </div>
                    <div id="msgArea"></div>
                    <div class="input-group mb-3">
                        <input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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