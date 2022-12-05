<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Profile</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />	
    <!-- Place favicon.ico in the root directory -->

	<c:import url="../temp/boot.jsp"></c:import>
</head>

<body>
<sec:authentication property="Principal" var="user"/>
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
    <c:import url="../temp/header.jsp"></c:import>

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">Profile Settings</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>Profile Settings</li>
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
                            <img src="${user.fileName}" alt="#" style="object-fit: cover;">
                            <h3>${user.name}
                                <span><a href="javascript:void(0)">${user.username}</a></span>
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
                                <li><a href="delete-account.html"><i class="lni lni-trash"></i> 회원 탈퇴</a></li>
                                <li><a href="invoice.html"><i class="lni lni-printer"></i> Invoice</a></li>
                            </ul>
                            <div class="button">
                                <a class="btn" href="javascript:void(0)">로그아웃</a>
                            </div>
                        </div>
                    </div>
                    <!-- Start Dashboard Sidebar -->
                </div>
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="main-content">
                        <!-- Start Profile Settings Area -->
                        <div class="dashboard-block mt-0 profile-settings-block">
                            <h3 class="block-title">내 정보</h3>
                            <div class="inner-block">
                                <form class="profile-setting-form" method="post" action="#">
	                                <div class="d-flex align-items-center">
	                                	<div class="flex-shrink-0">
		                                    <div class="form-group upload-image">
		                                        <label class="fw-bold">프로필 사진</label>
		                                        <div class="image">
		                                    		<img src="${user.fileName}" alt="#" style="object-fit: cover;">
		                                		</div>
		                                    </div>
	                                	</div>
	                                	<div class="flex-grow-1 ms-3">
	                                		<div class="button">
	                                			<label class="btn" for="profile-image">프로필 사진 수정</label>
		                                		<button type="button" class="btn" id="default-profile">기본 프로필로 변경</button>
			                                        <input name="profile-image" id="profile-image" type="file" class="d-none" placeholder="Upload Image">
	                                		</div>
	                                	</div>
	                                </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label class="fw-bold">아이디 ID</label>
                                                <input id="username" class="border-0 disabled" type="text" value="${user.username}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label class="fw-bold">이름 Name</label>
                                                <input name="name" type="text"  class="border-0 disabled" placeholder="Aldridge" value="${user.name}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label class="fw-bold">생일 Birth</label>
                                                <input name="birth" type="text" id="birth" class="border-0 disabled " value="${user.birth}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label class="fw-bold">이메일 Email</label>
                                                <input name="email" type="email" value="${user.email}" placeholder="username@gmail.com">
                                            	<button>이메일 인증할거야? 버튼</button>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label class="fw-bold">연락처 Phone</label>
                                                <input name="phone" type="text" placeholder="010-0000-0000" value="${user.phone }">
                                                <button>문자 인증할거야?버튼</button>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                        	<div class="form-group">
                                        		<button type="button" class="btn"></button>
                                        	</div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group button mb-0">
                                                <button type="button" class="btn" id="modifyBtn">프로필 수정</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- End Profile Settings Area -->
                        <!-- Start Password Change Area -->
                        <div class="dashboard-block password-change-block">
                            <h3 class="block-title">비밀번호 변경</h3>
                            <div class="inner-block">
                                <form class="default-form-style" method="post" action="#">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>현재 비밀번호</label>
                                                <input name="current-password" type="password"
                                                    placeholder="Enter old password">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>새로운 비밀번호</label>
                                                <input name="new-password" type="password"
                                                    placeholder="Enter new password">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>비밀번호 확인</label>
                                                <input name="retype-password" type="password"
                                                    placeholder="Retype password">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group button mb-0">
                                                <button type="button" class="btn" id="modifyPwBtn">비밀번호 변경</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- End Password Change Area -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Dashboard Section -->

    <!-- Start Newsletter Area -->
    <div class="newsletter section">
        <div class="container">
            <div class="inner-content">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="title">
                            <i class="lni lni-alarm"></i>
                            <h2>Newsletter</h2>
                            <p>We don't send spam so don't worry.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="form">
                            <form action="#" method="get" target="_blank" class="newsletter-form">
                                <input name="EMAIL" placeholder="Your email address" type="email">
                                <div class="button">
                                    <button class="btn">Subscribe<span class="dir-part"></span></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Newsletter Area -->

	<!-- Footer -->
    <c:import url="../temp/footer.jsp"></c:import>
    <script src="/js/user/profile.js"></script>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->

</body>

</html>