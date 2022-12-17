<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Hospital Home</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="/css/hospital/hospitalMain.css">
	<c:import url="../temp/boot.jsp"></c:import>
	<!-- chatbot -->
	<c:import url="../temp/chatbot.jsp"></c:import>
    <!-- Place favicon.ico in the root directory -->
    <style>
        #mainSection {
            background-image: url('/images/hospital/home/hospitalMain.png');
        }

        .hero-area.overlay::before {
            opacity: 0.3;
        }
    </style>
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
    <!-- End Preloader -->

    <!-- Start Header Area -->
    <c:import url="../temp/header.jsp"></c:import>
    <!-- End Header Area -->

    <!-- Start Hero Area -->
    <section class="hero-area style3 overlay" id="mainSection">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="hero-text text-center">
                        <!-- Start Hero Text -->
                        <div class="section-heading">
                            <h2 class="wow fadeInUp" data-wow-delay=".3s">소비자가 선택한 No.1 에브리닥터</h2>
                            <p class="wow fadeInUp" data-wow-delay=".5s">365일 모두의 비대면 진료 & 약 배송<br>건강 고민은 에브리닥터에게!</p>
                        </div>
                        <!-- End Search Form -->
                        <!-- Start Categories -->
                        <div class="categories style2">
                            <div class="row">
                                <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3  col-12">
                                            <!-- Start Single Category -->
                                            <a href="category.html" class="single-cat wow fadeInUp"
                                                data-wow-delay=".4s">
                                                <div class="icon">
                                                    <img src="/images/pet/home/online_doctor_icon.svg" alt="#">
                                                </div>
                                                <h3>비대면 진료 신청</h3>
                                                <!-- <h5 class="total">35</h5> -->
                                            </a>
                                            <!-- End Single Category -->
                                        </div>
                                        <div class="col-lg-3 col-md-3  col-12">
                                            <!-- Start Single Category -->
                                            <a href="/hospital/consult/write" class="single-cat wow fadeInUp"
                                                data-wow-delay=".6s">
                                                <div class="icon">
                                                    <img src="/images/pet/home/website_icon.svg" alt="#">
                                                </div>
                                                <h3>무료 상담</h3>
                                                <!-- <h5 class="total">65</h5> -->
                                            </a>
                                            <!-- End Single Category -->
                                        </div>
                                        <div class="col-lg-3 col-md-3  col-12">
                                            <!-- Start Single Category -->
                                            <a href="category.html" class="single-cat wow fadeInUp"
                                                data-wow-delay=".8s">
                                                <div class="icon">
                                                    <img src="/images/pet/home/medical_care_icon.svg" alt="#">
                                                </div>
                                                <h3>의료진</h3>
                                                <!-- <h5 class="total">22</h5> -->
                                            </a>
                                            <!-- End Single Category -->
                                        </div>
                                        <div class="col-lg-3 col-md-3  col-12">
                                            <!-- Start Single Category -->
                                            <a href="/board/tip/list" class="single-cat wow fadeInUp"
                                                data-wow-delay="1s">
                                                <div class="icon">
                                                    <img src="/images/pet/home/stamp_icon.svg" alt="#">
                                                </div>
                                                <h3>야간 운영 약국</h3>
                                                <!-- <h5 class="total">55</h5> -->
                                            </a>
                                            <!-- End Single Category -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Categories -->
                        <!-- Start Search Form -->
                        <div class="search-form">
                            <div class="row">
                            </div>
                        </div>
                        <!-- End Search Form -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Hero Area -->

    <!-- Start Items Tab Area -->
    <a name="sign"></a>
    <section class="items-tab section custom-padding">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">Doctor</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">증상과 진료 과목을 선택하면 전국 비대면 진료 병·의원을 한 번에 확인할 수 있어요.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <button class="nav-link active"
                                data-bs-target="#nav-latest" type="button" role="tab" aria-controls="nav-latest"
                                aria-selected="true">증상</button>
                            <button class="nav-link" id="nav-popular-tab" data-bs-target="#nav-popular"
                                type="button" role="tab" aria-controls="nav-popular" aria-selected="false">진료 과목</button>
                        </div>
                    </nav>
                    <section class="category-page section" style="padding-top: 0;">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-12">
                                    <div class="category-sidebar">
                                        <!-- Start Single Widget -->
                                        <div class="single-widget" style="padding: 25px;">
                                            <h3>증상</h3>
                                            <ul class="list">
                                                <c:forEach items="${categoryList}" var="categoryVO">
                                                    <li>
                                                        <a href="javascript:void(0)">
                                                            <img class="subjectIcon"
                                                                src="/images/hospital/home/${categoryVO.categoryIcon}">
                                                            ${categoryVO.categoryName}
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <!-- End Single Widget -->
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-8 col-12">
                                    <div class="category-grid-list">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="tab-content" id="nav-tabContent">
                                                    <div class="tab-pane fade show active" id="nav-grid" role="tabpanel"
                                                        aria-labelledby="nav-grid-tab">
                                                        <div class="row" id="doctorSignList">

                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <!-- Pagination -->
                                                                <div class="pagination left">
                                                                    <ul class="pagination-list">
                                                                        <li><a href="javascript:void(0)">1</a></li>
                                                                        <li class="active"><a
                                                                                href="javascript:void(0)">2</a></li>
                                                                        <li><a href="javascript:void(0)">3</a></li>
                                                                        <li><a href="javascript:void(0)">4</a></li>
                                                                        <li><a href="javascript:void(0)"><i
                                                                                    class="lni lni-chevron-right"></i></a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <!--/ End Pagination -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </section>
    <!-- End Category -->

    <!-- Start Items Tab Area -->
    <a name="subject"></a>
    <section class="items-tab section custom-padding">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <button class="nav-link" id="nav-latest-tab"
                                data-bs-target="#nav-latest" type="button" role="tab" aria-controls="nav-latest"
                                aria-selected="false">증상</button>
                            <button class="nav-link active"
                                data-bs-target="#nav-popular" type="button" role="tab" aria-controls="nav-popular"
                                aria-selected="true">진료 과목</button>
                        </div>
                    </nav>
                    <section class="category-page section" style="padding-top: 0;">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-12">
                                    <div class="category-sidebar">
                                        <!-- Start Single Widget -->
                                        <div class="single-widget" style="padding: 25px;">
                                            <h3>진료 과목</h3>
                                            <ul class="list">
                                                <c:forEach items="${sectionList}" var="sectionVO">
                                                	<li>
	                                                    <a href="javascript:void(0)"><img class="subjectIcon" src="/images/hospital/home/${sectionVO.sectionIcon}">
	                                                    	${sectionVO.sectionName}
	                                                    </a>
	                                                </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <!-- End Single Widget -->
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-8 col-12">
                                    <div class="category-grid-list">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="tab-content" id="nav-tabContent">
                                                    <div class="tab-pane fade show active" id="nav-grid" role="tabpanel"
                                                        aria-labelledby="nav-grid-tab">
                                                        <div class="row" id="doctorSubjectList">

                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <!-- Pagination -->
                                                                <div class="pagination left">
                                                                    <ul class="pagination-list">
                                                                        <li><a href="javascript:void(0)">1</a></li>
                                                                        <li class="active"><a href="javascript:void(0)">2</a></li>
                                                                        <li><a href="javascript:void(0)">3</a></li>
                                                                        <li><a href="javascript:void(0)">4</a></li>
                                                                        <li><a href="javascript:void(0)"><i
                                                                                    class="lni lni-chevron-right"></i></a></li>
                                                                    </ul>
                                                                </div>
                                                                <!--/ End Pagination -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </section>
    <!-- End Category -->

    <!-- Start Items Grid Area -->
    <section class="items-grid section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">건강 꿀팁</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">반려동물의 몰랐던 정보와 상식을 얻어가세요.</p>
                    </div>
                </div>
            </div>
            <div class="single-head">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Grid -->
                        <div class="single-grid wow fadeInUp" data-wow-delay=".2s">
                            <div class="image">
                                <a href="item-details.html" class="thumbnail"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                <div class="author">
                                    <div class="author-image">
                                        <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#">
                                            <span>Smith jeko</span></a>
                                    </div>
                                    <p class="sale">For Sale</p>
                                </div>
                            </div>
                            <div class="content">
                                <div class="top-content">
                                    <a href="javascript:void(0)" class="tag">Mobile Phones</a>
                                    <h3 class="title">
                                        <a href="item-details.html">Apple Iphone X</a>
                                    </h3>
                                    <p class="update-time">Last Updated: 1 hours ago</p>
                                    <ul class="rating">
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><a href="javascript:void(0)">(35)</a></li>
                                    </ul>
                                    <ul class="info-list">
                                        <li><a href="javascript:void(0)"><i class="lni lni-map-marker"></i> New York, US</a></li>
                                        <li><a href="javascript:void(0)"><i class="lni lni-timer"></i> Feb 18, 2023</a></li>
                                    </ul>
                                </div>
                                <div class="bottom-content">
                                    <p class="price">Start From: <span>$200.00</span></p>
                                    <a href="javascript:void(0)" class="like"><i class="lni lni-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Grid -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Grid -->
                        <div class="single-grid wow fadeInUp" data-wow-delay=".4s">
                            <div class="image">
                                <a href="item-details.html" class="thumbnail"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                <div class="author">
                                    <div class="author-image">
                                        <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#">
                                            <span>Alex Jui</span></a>
                                    </div>
                                    <p class="sale">For Sale</p>
                                </div>
                            </div>
                            <div class="content">
                                <div class="top-content">
                                    <a href="javascript:void(0)" class="tag">Real Estate</a>
                                    <h3 class="title">
                                        <a href="item-details.html">Amazing Room for Rent</a>
                                    </h3>
                                    <p class="update-time">Last Updated: 2 hours ago</p>
                                    <ul class="rating">
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><a href="javascript:void(0)">(20)</a></li>
                                    </ul>
                                    <ul class="info-list">
                                        <li><a href="javascript:void(0)"><i class="lni lni-map-marker"></i> Dallas, Washington</a></li>
                                        <li><a href="javascript:void(0)"><i class="lni lni-timer"></i> Jan 7, 2023</a></li>
                                    </ul>
                                </div>
                                <div class="bottom-content">
                                    <p class="price">Start From: <span>$450.00</span></p>
                                    <a href="javascript:void(0)" class="like"><i class="lni lni-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Grid -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Grid -->
                        <div class="single-grid wow fadeInUp" data-wow-delay=".6s">
                            <div class="image">
                                <a href="item-details.html" class="thumbnail"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                <div class="author">
                                    <div class="author-image">
                                        <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#">
                                            <span>Devid Milan</span></a>
                                    </div>
                                    <p class="sale">For Sale</p>
                                </div>
                                <p class="item-position"><i class="lni lni-bolt"></i> Featured</p>
                            </div>
                            <div class="content">
                                <div class="top-content">
                                    <a href="javascript:void(0)" class="tag">Mobile Phones</a>
                                    <h3 class="title">
                                        <a href="item-details.html">Canon SX Powershot D-SLR</a>
                                    </h3>
                                    <p class="update-time">Last Updated: 3 hours ago</p>
                                    <ul class="rating">
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><a href="javascript:void(0)">(55)</a></li>
                                    </ul>
                                    <ul class="info-list">
                                        <li><a href="javascript:void(0)"><i class="lni lni-map-marker"></i> New York, US</a></li>
                                        <li><a href="javascript:void(0)"><i class="lni lni-timer"></i> Mar 18, 2023</a></li>
                                    </ul>
                                </div>
                                <div class="bottom-content">
                                    <p class="price">Start From: <span>$700.00</span></p>
                                    <a href="javascript:void(0)" class="like"><i class="lni lni-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Grid -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Grid -->
                        <div class="single-grid wow fadeInUp" data-wow-delay=".2s">
                            <div class="image">
                                <a href="item-details.html" class="thumbnail"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                <div class="author">
                                    <div class="author-image">
                                        <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#">
                                            <span>Jesia Jully</span></a>
                                    </div>
                                    <p class="sale">For Sale</p>
                                </div>
                            </div>
                            <div class="content">
                                <div class="top-content">
                                    <a href="javascript:void(0)" class="tag">Vehicles</a>
                                    <h3 class="title">
                                        <a href="item-details.html">BMW 5 Series GT Car</a>
                                    </h3>
                                    <p class="update-time">Last Updated: 4 hours ago</p>
                                    <ul class="rating">
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><a href="javascript:void(0)">(35)</a></li>
                                    </ul>
                                    <ul class="info-list">
                                        <li><a href="javascript:void(0)"><i class="lni lni-map-marker"></i> New York, US</a></li>
                                        <li><a href="javascript:void(0)"><i class="lni lni-timer"></i> Apr 12, 2023</a></li>
                                    </ul>
                                </div>
                                <div class="bottom-content">
                                    <p class="price">Start From: <span>$1000.00</span></p>
                                    <a href="javascript:void(0)" class="like"><i class="lni lni-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Grid -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Grid -->
                        <div class="single-grid wow fadeInUp" data-wow-delay=".4s">
                            <div class="image">
                                <a href="item-details.html" class="thumbnail"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                <div class="author">
                                    <div class="author-image">
                                        <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#">
                                            <span>Thomas Deco</span></a>
                                    </div>
                                    <p class="sale">For Sale</p>
                                </div>
                                <p class="item-position"><i class="lni lni-bolt"></i> Featured</p>
                            </div>
                            <div class="content">
                                <div class="top-content">
                                    <a href="javascript:void(0)" class="tag">Apple</a>
                                    <h3 class="title">
                                        <a href="item-details.html">Apple Macbook Pro 13 Inch</a>
                                    </h3>
                                    <p class="update-time">Last Updated: 5 hours ago</p>
                                    <ul class="rating">
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><a href="javascript:void(0)">(35)</a></li>
                                    </ul>
                                    <ul class="info-list">
                                        <li><a href="javascript:void(0)"><i class="lni lni-map-marker"></i> Louis, Missouri, US</a></li>
                                        <li><a href="javascript:void(0)"><i class="lni lni-timer"></i> May 25, 2023</a></li>
                                    </ul>
                                </div>
                                <div class="bottom-content">
                                    <p class="price">Start From: <span>$550.00</span></p>
                                    <a href="javascript:void(0)" class="like"><i class="lni lni-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Grid -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Grid -->
                        <div class="single-grid wow fadeInUp" data-wow-delay=".6s">
                            <div class="image">
                                <a href="item-details.html" class="thumbnail"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                <div class="author">
                                    <div class="author-image">
                                        <a href="javascript:void(0)"><img src="https://via.placeholder.com/100x100" alt="#">
                                            <span>Jonson zack</span></a>
                                    </div>
                                    <p class="sale">For Sale</p>
                                </div>
                            </div>
                            <div class="content">
                                <div class="top-content">
                                    <a href="javascript:void(0)" class="tag">Restaurant</a>
                                    <h3 class="title">
                                        <a href="item-details.html">Cream Restaurant</a>
                                    </h3>
                                    <p class="update-time">Last Updated: 7 hours ago</p>
                                    <ul class="rating">
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><a href="javascript:void(0)">(20)</a></li>
                                    </ul>
                                    <ul class="info-list">
                                        <li><a href="javascript:void(0)"><i class="lni lni-map-marker"></i> New York, US</a></li>
                                        <li><a href="javascript:void(0)"><i class="lni lni-timer"></i> Feb 18, 2023</a></li>
                                    </ul>
                                </div>
                                <div class="bottom-content">
                                    <p class="price">Start From: <span>$500.00</span></p>
                                    <a href="javascript:void(0)" class="like"><i class="lni lni-heart"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- End Single Grid -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /End Items Grid Area -->

    <!-- Start Why Choose Area -->
    <section class="why-choose section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">에브리닥터를 선택할 이유</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">수많은 비대면 진료 플랫폼 중에서 에브리닥터를 선택해야 하는 이유</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="choose-content">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-12">
                                <!-- Start Single List -->
                                <div class="single-list wow fadeInUp" data-wow-delay=".2s">
                                    <i class="lni lni-book"></i>
                                    <h4>뛰어난 의료진</h4>
                                    <p>에브리닥터의 의료진은 까다로운 검증을 통해 선정된 전문가</p>
                                </div>
                                <!-- Start Single List -->
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                <!-- Start Single List -->
                                <div class="single-list wow fadeInUp" data-wow-delay=".4s">
                                    <i class="lni lni-leaf"></i>
                                    <h4>사용자 친화적 인터페이스</h4>
                                    <p>복잡하고 화려하고 눈 아픈 사이트가 아니라 편하고 직관적인 사이트</p>
                                </div>
                                <!-- Start Single List -->
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                <!-- Start Single List -->
                                <div class="single-list wow fadeInUp" data-wow-delay=".6s">
                                    <i class="lni lni-cog"></i>
                                    <h4>진료내역</h4>
                                    <p>이전에 어떤 진료를 받고 어떤 처방을 받았는지 기억할 필요없이 확인 가능</p>
                                </div>
                                <!-- Start Single List -->
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                <!-- Start Single List -->
                                <div class="single-list wow fadeInUp" data-wow-delay=".2s">
                                    <i class="lni lni-pointer-up"></i>
                                    <h4>커뮤니티</h4>
                                    <p>다른 이용자들과 정보를 나누면서 교류</p>
                                </div>
                                <!-- Start Single List -->
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                <!-- Start Single List -->
                                <div class="single-list wow fadeInUp" data-wow-delay=".4s">
                                    <i class="lni lni-layout"></i>
                                    <h4>쉬운 의료 접근성</h4>
                                    <p>번거롭고 불편하게 병원가지 말고 집에서 편하게 진료</p>
                                </div>
                                <!-- Start Single List -->
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                <!-- Start Single List -->
                                <div class="single-list wow fadeInUp" data-wow-delay=".6s">
                                    <i class="lni lni-laptop-phone"></i>
                                    <h4>한번에 해결</h4>
                                    <p>진료, 처방, 배송, 결제까지 한번에 해결</p>
                                </div>
                                <!-- Start Single List -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /End Why Choose Area -->

    <!-- Start Footer Area -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>
    <script src="/js/hospital/hospitalMain.js"></script>
</body>
</html>