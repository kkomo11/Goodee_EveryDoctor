<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <!-- Latest minified Bootstrap & JQuery-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <c:import url="../temp/boot.jsp"></c:import>
    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="/css/telemedicine.css"/>
</head>
<body class="text-center">

<!-- Start Header Area -->
<c:import url="../temp/header.jsp"></c:import>
<!-- End Header Area -->
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
<!-- Begin page content -->
<main role="main" class="container" style="margin-top:200px">
    <div id="container">
        <form method="post" action="/room" id="form">
            <input type="hidden" id="uuid" name="uuid" value="${uuid}"/>
            <div class="row justify-content-md-center">
                <div class="input-group col-md-6 mb-3 justify-content-md-center">
                	<c:if test="${not empty rooms}">
                		<div class="mb-3" data-uid="${uuid}">
	                        <label for="rooms-list">Select one of the rooms created:</label><br>
	                        <h4>
		                        <c:forEach items="${rooms}" var="r">
			                        <span id="rooms-list">
			                            <a href="/room/${r.id}" id="button-link-${r.id}">
			                                <button type="button" name="action" value="${r.id}"
			                                        class="btn btn-primary" onclick="addUuidToButtonLink(this);">${r.id}
			                                </button>
			                            </a>
			                        </span>
		                        </c:forEach>
	                        </h4>
	                    </div>
                	</c:if>
                    <div class="mb-3">
                        <label for="id">To create a new room enter your room number,
                            or press 'Random #' button to get a random one</label>
                        <input class="form-control" name="id" id="id" type="number" placeholder="Min: 0, max: 99"
                               min="0" max="99" value="${id}" required>
                    </div>
                    <div>
                        <a href="/room/random">
                            <button class="btn btn-outline-success" type="button">Random #</button>
                        </a>
                        <button name="action" value="create" type="submit" class="btn btn-outline-primary">
                            Create Selected Room</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</main>
<!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>
<!-- Start Footer Area -->
<c:import url="../temp/footer.jsp"></c:import>
<!-- End Footer Area -->
<!--generates unique user identifier stored at 'uuid' input field to pass it to the back-side-->
<script src="/js/telemedicine/telemedicine.js"></script>
</body>
</html>
