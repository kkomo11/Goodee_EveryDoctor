<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/hospital/hospitalMain.css">
<c:import url="../temp/boot.jsp"></c:import>
<!-- ========================= CSS here ========================= -->
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/LineIcons.2.0.css" />
<link rel="stylesheet" href="/css/animate.css" />
<link rel="stylesheet" href="/css/tiny-slider.css" />
<link rel="stylesheet" href="/css/glightbox.min.css" />
<link rel="stylesheet" href="/css/main.css" />
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<section class="d-flex justify-content-center" id="section">
		<div class="left_sec">
			<img src="/images/hospital/1.jpg">
		</div>
		<div class="right_sec">
			<div class="fixInfo" style="border: green 1px solid">
				<div>무료 상담</div>
				<div>빠른 진료</div>
				<div>증상 진료</div>
				<div>과목 진료</div>
			</div>
		</div>
	</section>
	<c:import url="../temp/footer.jsp"></c:import>
	<script src="/js/hospital/hospitalMain.js"></script>
	<!-- ========================= JS here ========================= -->
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/wow.min.js"></script>
    <script src="/js/tiny-slider.js"></script>
    <script src="/js/glightbox.min.js"></script>
    <script src="/js/main.js"></script>
</body>
</html>