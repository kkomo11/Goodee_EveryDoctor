<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Profile Settings - ClassiGrids Classified Ads and Listing Website Template</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.svg" />
    <!-- Place favicon.ico in the root directory -->

    <c:import url="../../temp/boot.jsp"></c:import>

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
                        <h1 class="page-title">기관 등록</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>기관 등록</li>
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
                            <h3 class="block-title">기관 등록</h3>
                            <div class="inner-block">
                                <div class="image">
                                    <img src="https://via.placeholder.com/300x300" alt="#">
                                </div>
                                <form:form class="profile-setting-form" method="post" modelAttribute="agencyVO" action="./regist" enctype="multipart/form-data" id="form">
                                    <div class="row">
                                        <!-- 상호명 입력 -->
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>상호명*</label>
                                                <form:input path="agencyName" placeholder="상호명" id="agencyName" />
                                                <form:errors path="agencyName"></form:errors>
                                                <div class="agencyNamem" style="color: #55DDBD;"></div>
                                            </div>
                                        </div>
                                        <!-- 주소 입력 -->
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>주소*</label>
                                                <div class="d-flex flex-row" style="justify-content: space-between;">
                                                    <div class="col-lg-6">
                                                        <input type="text" id="postcode" placeholder="우편번호" readonly="readonly" name="postcode">
                                                    </div>
                                                    <div class="form-group button mb-0">
                                                        <button class="btn findPost" type="button" onclick="checkPost();" value="우편번호 찾기">우편번호 찾기</button>
                                                    </div>
                                                </div>
                                                <div>
                                                    <input type="text" id="mainAddress" placeholder="주소" readonly="readonly">
                                                </div>
                                                <div class="d-flex flex-row">
                                                    <input type="text" id="detailAddress" placeholder="상세주소">
                                                </div>
                                                <div class="addressm m" style="color: #55DDBD;"></div>
                                                <form:input type="hidden" path="agencyAddr" id="agencyAddr"></form:input>
                                                <form:errors path="agencyAddr"></form:errors>
                                            </div>
                                        </div>
                                        <!-- 전화번호 입력 -->
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>전화번호*</label>
                                                <form:input path="agencyTel" type="text" placeholder="02-111-1111" id="agencyTel"></form:input>
                                                <form:errors path="agencyTel"></form:errors>
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
                                </form:form>
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
    <script src="/js/admin/agency/regist.js"></script>
    <script src="/js/admin/util/nullCheck.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

</html>