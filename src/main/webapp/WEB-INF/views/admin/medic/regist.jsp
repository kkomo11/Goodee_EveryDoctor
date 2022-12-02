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
	<link rel="stylesheet" href="/css/admin/medic/regist.css">
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
            <div class="row" style="justify-content: center;">
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="main-content">
                        <!-- 기관 등록 폼 시작 -->
                        <div class="dashboard-block mt-0 profile-settings-block">
                            <h3 class="block-title">종사자 추가 등록</h3>
                            <div class="inner-block">
                                <!-- Nav Tab 시작 -->
                                <div class="post-ad-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist" style="flex-wrap: nowrap;">
                                            <button class="nav-link active" id="hospital-tab" data-bs-toggle="tab"
                                                data-bs-target="#hospital" type="button" role="tab"
                                                aria-controls="hospital" aria-selected="true">
                                                <span class="serial">01</span>
                                                병원
                                                <span class="sub-title">의사, 간호사 추가 등록</span>
                                            </button>
                                            <button class="nav-link" id="pet-tab" data-bs-toggle="tab"
                                                data-bs-target="#pet" type="button" role="tab"
                                                aria-controls="pet" aria-selected="false">
                                                <span class="serial">02</span>
                                                동물병원
                                                <span class="sub-title">수의사, 수간호가 추가 등록</span>
                                            </button>
                                            <button class="nav-link" id="pharmacy-tab" data-bs-toggle="tab"
                                                data-bs-target="#pharmacy" type="button" role="tab"
                                                aria-controls="pharmacy" aria-selected="false">
                                                <span class="serial">03</span>
                                                약국
                                                <span class="sub-title">약사 추가 등록</span>
                                            </button>
                                            <button class="nav-link" id="pethotel-tab" data-bs-toggle="tab"
                                                data-bs-target="#pethotel" type="button" role="tab"
                                                aria-controls="pethotel" aria-selected="false">
                                                <span class="serial">04</span>
                                                보호소
                                                <span class="sub-title">보호소 관리자 추가 등록</span>
                                            </button>
                                        </div>
                                    </nav>
                                    <div class="tab-content" id="nav-tabContent">
                                        <!-- 병원 인원 등록 시작 -->
                                        <div class="tab-pane fade show active" id="hospital" role="tabpanel"
                                            aria-labelledby="hospital-tab">
                                            <form class="profile-setting-form default-form-style" method="post" action="./regist" id="hospitalForm">
                                                <div class="row" style="flex-direction: column;">
                                                    <!-- Role 선택 -->
                                                    <div class="col-lg-6 col-12">
                                                        <div class="form-group">
                                                            <div class="radioFrame">
                                                                <p class="radioDetailFrameFirst">
                                                                    <input class="radioDetail neuteredInput" name="medicRole" type="radio" value="의사"><span style="font-size: 1rem;">의사</span>
                                                                </p>
                                                                <p class="radioDetailFrameOther">
                                                                    <input class="radioDetail neuteredInput" name="medicRole" type="radio" value="간호사"><span style="font-size: 1rem;">간호사</span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- 병원 검색 -->
                                                    <div class="form-group col-11">
                                                        <label>병원검색(상호명/주소)*</label>
                                                        <div class="selector-head">
                                                            <select class="user-chosen-select chosen-select agencyNum" name="agencyNum">
                                                            <c:forEach items="${hospitalList}" var="hospitalList">
                                                                <option value="${hospitalList.agencyNum}">${hospitalList.agencyName}/${hospitalList.agencyAddr}</option>
                                                            </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 상호명 입력 -->
                                                    <div class="col-lg-6 col-6">
                                                        <div class="form-group">
                                                            <label>성함*</label>
                                                            <input name="username" placeholder="성함" class="username" />
                                                            <div class="usernamem" style="color: #55DDBD;"></div>
                                                        </div>
                                                    </div>
                                                    <!-- 기관 소개글 입력 -->
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>본인 소개글*</label>
                                                            <textarea name="agencyInfo" placeholder="본인에 대한 정보를 입력해주세요" class="agencyInfo"></textarea>
                                                        </div>
                                                    </div>
                                                    <!-- 기관 등록 신청 버튼 -->
                                                    <div class="col-12">
                                                        <div class="form-group button mb-0 d-flex" style="flex-direction: row-reverse;">
                                                            <button type="button" class="btn inputButton" id="inputButton">기관 등록 신청</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- 병원 인원 등록 끝 -->
                                        <!-- 동물 병원 인원 등록 시작 -->
                                        <div class="tab-pane fade" id="pet" role="tabpanel"
                                            aria-labelledby="pet-tab">
                                            <form class="profile-setting-form default-form-style" method="post" action="./regist" id="petForm">
                                                <div class="row" style="flex-direction: column;">
                                                    <!-- 역할 선택 -->
                                                    <div class="col-lg-6 col-12">
                                                        <div class="form-group">
                                                            <div class="radioFrame">
                                                                <p class="radioDetailFrameFirst">
                                                                    <input class="radioDetail neuteredInput" name="medicRole" type="radio" value="수의사"><span style="font-size: 1rem;">수의사</span>
                                                                </p>
                                                                <p class="radioDetailFrameOther">
                                                                    <input class="radioDetail neuteredInput" name="medicRole" type="radio" value="수간호사"><span style="font-size: 1rem;">수간호사</span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- 병원 검색 -->
                                                    <div class="form-group col-11">
                                                        <label>동물병원검색(상호명/주소)*</label>
                                                        <div class="selector-head">
                                                            <select class="user-chosen-select chosen-select agencyNum" name="agencyNum">
                                                            <c:forEach items="${petHospitalList}" var="petHospitalList">
                                                                <option value="${petHospitalList.agencyNum}">${petHospitalList.agencyName}/${petHospitalList.agencyAddr}</option>
                                                            </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 상호명 입력 -->
                                                    <div class="col-lg-6 col-6">
                                                        <div class="form-group">
                                                            <label>성함*</label>
                                                            <input name="username" placeholder="성함" class="username" />
                                                            <div class="usernamem" style="color: #55DDBD;"></div>
                                                        </div>
                                                    </div>
                                                    <!-- 기관 소개글 입력 -->
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>본인 소개글*</label>
                                                            <textarea name="agencyInfo" placeholder="본인에 대한 정보를 입력해주세요" class="agencyInfo"></textarea>
                                                        </div>
                                                    </div>
                                                    <!-- 기관 등록 신청 버튼 -->
                                                    <div class="col-12">
                                                        <div class="form-group button mb-0 d-flex" style="flex-direction: row-reverse;">
                                                            <button type="button" class="btn inputButton">기관 등록 신청</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- 동물 병원 인원 등록 끝 -->
                                        <!-- 약국 인원 등록 시작 -->
                                        <div class="tab-pane fade" id="pharmacy" role="tabpanel"
                                            aria-labelledby="pharmacy-tab">
                                            <form class="profile-setting-form default-form-style" method="post" action="./regist" id="pharmacyForm">
                                                <div class="row" style="flex-direction: column;">
                                                    <div class="form-group col-11">
                                                        <label>약국검색(상호명/주소)*</label>
                                                        <div class="selector-head">
                                                            <select class="user-chosen-select chosen-select agencyNum" name="agencyNum">
                                                            <c:forEach items="${pharmacyList}" var="pharmacyList">
                                                                <option value="${pharmacyList.agencyNum}">${pharmacyList.agencyName}/${pharmacyList.agencyAddr}</option>
                                                            </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 성함 입력 -->
                                                    <div class="col-lg-6 col-6">
                                                        <div class="form-group">
                                                            <label>성함*</label>
                                                            <input name="username" placeholder="성함" class="username" />
                                                            <div class="usernamem" style="color: #55DDBD;"></div>
                                                        </div>
                                                    </div>
                                                    <!-- 기관 소개글 입력 -->
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>본인 소개글*</label>
                                                            <textarea name="agencyInfo" placeholder="본인에 대한 정보를 입력해주세요" class="agencyInfo"></textarea>
                                                        </div>
                                                    </div>
                                                    <!-- 기관 등록 신청 버튼 -->
                                                    <div class="col-12">
                                                        <div class="form-group button mb-0 d-flex" style="flex-direction: row-reverse;">
                                                            <button type="button" class="btn inputButton">기관 등록 신청</button>
                                                        </div>
                                                    </div>
                                                    <!-- 역할 입력 -->
                                                    <input type="hidden" name="medicRole" value="약사">
                                                </div>
                                            </form>
                                        </div>
                                        <!-- 약국 인원 등록 끝 -->
                                        <!-- 보호소 인원 등록 시작 -->
                                        <div class="tab-pane fade" id="pethotel" role="tabpanel"
                                            aria-labelledby="pethotel-tab">
                                            <form class="profile-setting-form default-form-style" method="post" action="./regist" id="petHospitalForm">
                                                <div class="row" style="flex-direction: column;">
                                                    <div class="form-group col-11">
                                                        <label>보호소검색(상호명/주소)*</label>
                                                        <div class="selector-head">
                                                            <select class="user-chosen-select chosen-select agencyNum" name="agencyNum">
                                                            <c:forEach items="${petHotelList}" var="petHotelList">
                                                                <option value="${petHotelList.agencyNum}">${petHotelList.agencyName}/${petHotelList.agencyAddr}</option>
                                                            </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 상호명 입력 -->
                                                    <div class="col-lg-6 col-6">
                                                        <div class="form-group">
                                                            <label>성함*</label>
                                                            <input name="username" placeholder="성함" id="username" />
                                                            <div class="usernamem" style="color: #55DDBD;"></div>
                                                        </div>
                                                    </div>
                                                    <!-- 기관 소개글 입력 -->
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>본인 소개글*</label>
                                                            <textarea name="agencyInfo" placeholder="본인에 대한 정보를 입력해주세요" class="agencyInfo"></textarea>
                                                        </div>
                                                    </div>
                                                    <!-- 기관 등록 신청 버튼 -->
                                                    <div class="col-12">
                                                        <div class="form-group button mb-0 d-flex" style="flex-direction: row-reverse;">
                                                            <button type="button" class="btn inputButton">기관 등록 신청</button>
                                                        </div>
                                                    </div>
                                                    <!-- 역할 입력 -->
                                                    <input type="hidden" name="medicRole" value="보호소관리자">
                                                </div>
                                            </form>
                                        </div>
                                        <!-- 보호소 인원 등록 끝 -->
                                    </div>
                                </div>
                            </div>
                        </div>        
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