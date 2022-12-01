<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>기관 추가 인원 등록</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Place favicon.ico in the root directory -->

    <c:import url="../../temp/boot.jsp"></c:import>

	<link rel="stylesheet" href="/css/admin/medic/chosen.css">
	<!-- <link rel="stylesheet" href="/css/admin/medic/chosen.min.css"> -->
	<!-- <link rel="stylesheet" href="/css/admin/medic/prism.css">
	<link rel="stylesheet" href="/css/admin/medic/style.css"> -->
</head>

<body>

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

    <!-- Header -->
    <c:import url="../../temp/header.jsp"></c:import>

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">종사자 추가 등록</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>종사자 추가 등록</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Dashboard Section -->
    <section class="dashboard section">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="main-content">
                        <!-- 기관 등록 폼 시작 -->
                        <div class="dashboard-block mt-0 profile-settings-block">
                            <h3 class="block-title">종사자 추가 등록</h3>
                            <div class="inner-block">
                                <div class="image">
                                    <img src="https://via.placeholder.com/300x300" alt="#">
                                </div>
                                <form class="profile-setting-form default-form-style" method="post" action="./regist" enctype="multipart/form-data" id="form">
                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label>기관검색*</label>
                                            <div class="selector-head">
                                                <!-- <span class="arrow"><i class="lni lni-chevron-down"></i></span> -->
                                                <select class="user-chosen-select chosen-select" name="medicRole" id="agencySelect" onchange="onChangeEvent();">
                                                <c:forEach items="${list}" var="list">
                                                	<option value="${list.agencyNum}">${list.agencyName}</option>
                                                </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <!-- 상호명 입력 -->
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>성함*</label>
                                                <input name="username" placeholder="상호명" id="username" />
                                                <div class="usernamem" style="color: #55DDBD;"></div>
                                            </div>
                                        </div>
                                        <!-- 전화번호 입력 -->
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>전화번호*</label>
                                                <input name="" type="text" placeholder="02-111-1111" id="agencyTel" />
                                                <div class="agencyTelm" style="color: #55DDBD;"></div>
                                            </div>
                                        </div>
                                        <!-- 기관 소개글 입력 -->
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>소개글*</label>
                                                <textarea name="agencyInfo" placeholder="기관에 대한 정보를 입력해주세요"></textarea>
                                            </div>
                                        </div>
                                        <!-- 기관 등록 신청 버튼 -->
                                        <div class="col-12">
                                            <div class="form-group button mb-0 d-flex" style="flex-direction: row-reverse;">
                                                <button type="button" class="btn regist">기관 등록 신청</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- 기관 등록 폼 끝 -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Dashboard Section -->

    <!-- Footer -->
    <c:import url="../../temp/footer.jsp"></c:import>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="/js/admin/medic/regist.js"></script>
    <script src="/js/admin/util/nullCheck.js"></script>
    <script src="/js/admin/medic/chosen.jquery.js"></script>
    <script src="/js/admin/medic/prism.js" charset="utf-8"></script>
    <script src="/js/admin/medic/init.js" charset="utf-8"></script>
</body>

</html>