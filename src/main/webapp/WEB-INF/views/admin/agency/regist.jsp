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

    <!-- Web Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

    <c:import url="../../temp/boot.jsp"></c:import>
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/LineIcons.2.0.css" />
    <link rel="stylesheet" href="/css/animate.css" />
    <link rel="stylesheet" href="/css/tiny-slider.css" />
    <link rel="stylesheet" href="/css/glightbox.min.css" />
    <link rel="stylesheet" href="/css/main.css" />

</head>

<body>
    <!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

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
                <div class="col-lg-3 col-md-4 col-12">
                    <!-- Start Dashboard Sidebar -->
                    <div class="dashboard-sidebar">
                        <div class="user-image">
                            <img src="https://via.placeholder.com/300x300" alt="#">
                            <h3>Steve Aldridge
                                <span><a href="javascript:void(0)">@username</a></span>
                            </h3>
                        </div>
                        <div class="dashboard-menu">
                            <ul>
                                <li><a href="dashboard.html"><i class="lni lni-dashboard"></i> Dashboard</a></li>
                                <li><a class="active" href="profile-settings.html"><i class="lni lni-pencil-alt"></i>
                                        Edit Profile</a></li>
                                <li><a href="my-items.html"><i class="lni lni-bolt-alt"></i> My Ads</a></li>
                                <li><a href="favourite-items.html"><i class="lni lni-heart"></i> Favourite ads</a></li>
                                <li><a href="post-item.html"><i class="lni lni-circle-plus"></i> Post An Ad</a></li>
                                <li><a href="bookmarked-items.html"><i class="lni lni-bookmark"></i> Bookmarked</a></li>
                                <li><a href="messages.html"><i class="lni lni-envelope"></i> Messages</a></li>
                                <li><a href="delete-account.html"><i class="lni lni-trash"></i> Close account</a></li>
                                <li><a href="invoice.html"><i class="lni lni-printer"></i> Invoice</a></li>
                            </ul>
                            <div class="button">
                                <a class="btn" href="javascript:void(0)">Logout</a>
                            </div>
                        </div>
                    </div>
                    <!-- Start Dashboard Sidebar -->
                </div>
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="main-content">
                        <!-- Start Profile Settings Area -->
                        <div class="dashboard-block mt-0 profile-settings-block">
                            <h3 class="block-title">기관 등록</h3>
                            <div class="inner-block">
                                <div class="image">
                                    <img src="https://via.placeholder.com/300x300" alt="#">
                                </div>
                                <form class="profile-setting-form" method="post" modelAttribute="AgencyVO" action="./regist" enctype="multipart/form-data" id="form">
                                    <div class="row">
                                        <!-- 상호명 입력 -->
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>상호명*</label>
                                                <input name="agencyName" type="text" placeholder="상호명" id="agencyName">
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
                                                <input type="hidden" name="agencyAddr" id="agencyAddr">
                                            </div>
                                        </div>
                                        <!-- 전화번호 입력 -->
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>전화번호*</label>
                                                <input name="agencyTel" type="text" placeholder="02-111-1111" id="agencyTel">
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
                                            <div class="form-group button mb-0">
                                                <button type="button" class="btn regist">기관 등록 신청</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- End Profile Settings Area -->
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
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/wow.min.js"></script>
    <script src="/js/tiny-slider.js"></script>
    <script src="/js/glightbox.min.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/admin/agency/regist.js"></script>
    <script src="/js/admin/util/nullCheck.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

</html>