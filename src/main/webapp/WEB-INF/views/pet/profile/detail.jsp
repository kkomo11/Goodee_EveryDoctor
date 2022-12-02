<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Pet Profile Detail</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />
    <!-- Place favicon.ico in the root directory -->

    <!-- Web Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/LineIcons.2.0.css" />
    <link rel="stylesheet" href="/css/animate.css" />
    <link rel="stylesheet" href="/css/tiny-slider.css" />
    <link rel="stylesheet" href="/css/glightbox.min.css" />
    <link rel="stylesheet" href="/css/main.css" />

	<c:import url="../../temp/boot.jsp"></c:import>
	<link rel="stylesheet" href="/css/pet/profile/regist.css"/>

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

    <!-- Start Header Area -->
    <c:import url="../../temp/header.jsp"></c:import>
    <!-- End Header Area -->
	<sec:authentication property="Principal" var="member"/>
    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">Pet Profile Detail</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>Pet Profile Detail</li>
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
                            <h3>${member.username }
                                <span><a href="javascript:void(0)">${member.name }</a></span>
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
                            <h3 class="block-title">Pet Profile Detail</h3>
                            <div class="inner-block">
                                <div class="image">
                                    <img id="petProfileImage" src="/images/pet/profile/default_pet_icon.svg" alt="#">
                                    <input type="hidden" name="petFileName" id="petFileNameInput">
                                </div>
                                <form class="profile-setting-form" method="post" action="#">
                                    <div class="row">
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>이름*</label>
                                                <input name="petName" type="text" readonly="readonly" id="petNameInput">
                                                <input name="petNum" type="hidden" id="petNumInput" value="${petNum}">
                                                <input type="hidden" id="userNameInputFromController" value="${member.username }">
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>종족*</label>
                                                <input id="speciesName" type="text" readonly="readonly">
                                            </div>
                                            
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>생년월일*</label>
                                                <input name="petBirth" type="date" readonly="readonly" id="petBirthInput">
                                                
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>나이*</label>
                                                <input name="petAge" type="number" readonly="readonly" id="petAgeInput">
                                            </div>
                                        </div>
                                        
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>성별*</label>
                                                <div class="radioFrame">
                                                	<p class="radioDetailFrameFirst">
                                                		<input class="radioDetail petSexInput" name="petSex" type="radio" value="0"><span style="font-size: 1rem;">암</span>
                                                	</p>
                                                	<p class="radioDetailFrameOther">
                                                		<input class="radioDetail petSexInput" name="petSex" type="radio" value="1"><span style="font-size: 1rem;">수</span>
                                                	</p>
                                            	</div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>중성화여부*</label>
                                                <div class="radioFrame">
	                                                <p class="radioDetailFrameFirst">
		                                            	<input class="radioDetail neuteredInput" name="neutered" type="radio" value="0"><span style="font-size: 1rem;">중성화안됨</span>
		                                            </p>
		                                            <p class="radioDetailFrameOther">
		                                            	<input class="radioDetail neuteredInput" name="neutered" type="radio" value="1"><span style="font-size: 1rem;">중성화됨</span>
		                                            </p>
	                                            </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>예방접종여부*</label>
                                                <div class="radioFrame">
	                                                <p class="radioDetailFrameFirst">
	                                                	<input class="radioDetail vaccinnationInput" name="vaccinnation" type="radio" value="0"><span style="font-size: 1rem;">안함</span>
	                                                </p>
	                                                <p class="radioDetailFrameOther">
	                                                	<input class="radioDetail vaccinnationInput" name="vaccinnation" type="radio" value="1"><span style="font-size: 1rem;">부분접종</span>
	                                                </p>
	                                                <p class="radioDetailFrameOther">
	                                                	<input class="radioDetail vaccinnationInput" name="vaccinnation" type="radio" value="2"><span style="font-size: 1rem;">함</span>
	                                                </p>
	                                                <p class="radioDetailFrameOther">
	                                                	<input class="radioDetail vaccinnationInput" name="vaccinnation" type="radio" value="3"><span style="font-size: 1rem;">모르겠음</span>
	                                                </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group button mb-0">
                                            	<input type="hidden" id="userNameInputFromDB">
                                                <button type="button" class="btn " id="petProfileUpdateBtn">수정하기</button>
                                                <button type="button" class="btn " id="petProfileDeleteBtn">삭제하기</button>
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

    <!-- Start Footer Area -->
    <c:import url="../../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

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
    <script type="text/javascript" src="/js/pet/profile/detail.js"></script>
    
    
</body>

</html>