<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>마이페이지</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />	
    <!-- Place favicon.ico in the root directory -->

	<c:import url="../temp/boot.jsp"></c:import>
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
    <c:import url="../temp/header.jsp"></c:import>
    
    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">My Ads</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>My Ads</li>
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
					<c:import url="sidebar.jsp"></c:import>
                </div>
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="main-content">
                        <!-- Start Details Lists -->
                        <div class="details-lists">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-12">
                                    <!-- Start Single List -->
                                    <div class="single-list">
                                        <div class="list-icon">
                                            <i class="lni lni-checkmark-circle"></i>
                                        </div>
                                        <h3>
                                            340
                                            <span>Total Ad Posted</span>
                                        </h3>
                                    </div>
                                    <!-- End Single List -->
                                </div>
                                <div class="col-lg-4 col-md-4 col-12">
                                    <!-- Start Single List -->
                                    <div class="single-list two">
                                        <div class="list-icon">
                                            <i class="lni lni-bolt"></i>
                                        </div>
                                        <h3>
                                            23
                                            <span>Featured Ads </span>
                                        </h3>
                                    </div>
                                    <!-- End Single List -->
                                </div>
                                <div class="col-lg-4 col-md-4 col-12">
                                    <!-- Start Single List -->
                                    <div class="single-list three">
                                        <div class="list-icon">
                                            <i class="lni lni-emoji-sad"></i>
                                        </div>
                                        <h3>
                                            45
                                            <span>Expired Ads </span>
                                        </h3>
                                    </div>
                                    <!-- End Single List -->
                                </div>
                            </div>
                        </div>
                        <!-- End Details Lists -->
                        <div class="row">
                            <div class="col-lg-6 col-md-12 col-12">
                                <!-- Start Activity Log -->
                                <div class="activity-log dashboard-block">
                                    <h3 class="block-title">My Activity Log</h3>
                                    <ul>
                                        <li>
                                            <div class="log-icon">
                                                <i class="lni lni-alarm"></i>
                                            </div>
                                            <a href="javascript:void(0)" class="title">Your Profile Updated!</a>
                                            <span class="time">12 Minutes Ago</span>
                                            <span class="remove"><a href="javascript:void(0)"><i class="lni lni-close"></i></a></span>
                                        </li>
                                        <li>
                                            <div class="log-icon">
                                                <i class="lni lni-alarm"></i>
                                            </div>
                                            <a href="javascript:void(0)" class="title">You change your password</a>
                                            <span class="time">59 Minutes Ago</span>
                                            <span class="remove"><a href="javascript:void(0)"><i class="lni lni-close"></i></a></span>
                                        </li>
                                        <li>
                                            <div class="log-icon">
                                                <i class="lni lni-alarm"></i>
                                            </div>
                                            <a href="javascript:void(0)" class="title">Your ads approved!</a>
                                            <span class="time">5 Hours Ago</span>
                                            <span class="remove"><a href="javascript:void(0)"><i class="lni lni-close"></i></a></span>
                                        </li>
                                        <li>
                                            <div class="log-icon">
                                                <i class="lni lni-alarm"></i>
                                            </div>
                                            <a href="javascript:void(0)" class="title">You submit a new ads</a>
                                            <span class="time">8 hours Ago</span>
                                            <span class="remove"><a href="javascript:void(0)"><i class="lni lni-close"></i></a></span>
                                        </li>
                                        <li>
                                            <div class="log-icon">
                                                <i class="lni lni-alarm"></i>
                                            </div>
                                            <a href="javascript:void(0)" class="title">You subscribe as a pro user!</a>
                                            <span class="time">1 day Ago</span>
                                            <span class="remove"><a href="javascript:void(0)"><i class="lni lni-close"></i></a></span>
                                        </li>
                                    </ul>
                                </div>
                                <!-- End Activity Log -->
                            </div>
                            <div class="col-lg-6 col-md-12 col-12">
                                <!-- Start Recent Items -->
                                <div class="recent-items dashboard-block">
                                    <h3 class="block-title">Recent Ads</h3>
                                    <ul>
                                        <li>
                                            <div class="image">
                                                <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#"></a>
                                            </div>
                                            <a href="javascript:void(0)" class="title">iPhone 11 Pro Max</a>
                                            <span class="time">12 Minutes Ago</span>
                                            <span class="remove"><a href="javascript:void(0)"><i class="lni lni-close"></i></a></span>
                                        </li>
                                        <li>
                                            <div class="image">
                                                <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#"></a>
                                            </div>
                                            <a href="javascript:void(0)" class="title">Polaris 600 Assault 144</a>
                                            <span class="time">5 days Ago</span>
                                            <span class="remove"><a href="javascript:void(0)"><i class="lni lni-close"></i></a></span>
                                        </li>
                                        <li>
                                            <div class="image">
                                                <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#"></a>
                                            </div>
                                            <a href="javascript:void(0)" class="title">Brand New Bagpack</a>
                                            <span class="time">1 week Ago</span>
                                            <span class="remove"><a href="javascript:void(0)"><i class="lni lni-close"></i></a></span>
                                        </li>
                                        <li>
                                            <div class="image">
                                                <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#"></a>
                                            </div>
                                            <a href="javascript:void(0)" class="title">Honda Civic VTi 2023</a>
                                            <span class="time">3 week Ago</span>
                                            <span class="remove"><a href="javascript:void(0)"><i class="lni lni-close"></i></a></span>
                                        </li>
                                    </ul>
                                </div>
                                <!-- End Recent Items -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Dashboard Section -->
    

	<!-- Footer -->
    <c:import url="../temp/footer.jsp"></c:import>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="/js/user/profile.js"></script>
</body>
</html>