<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Pet Hospital Home</title>
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
    
    <link rel="stylesheet" href="/css/pet/home.css"/>

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
                            <h2 class="wow fadeInUp" data-wow-delay=".3s">반려동물 비대면 진료</h2>
                            <p class="wow fadeInUp" data-wow-delay=".5s">반려동물에 맞춘 전문적이고 간편한 케어를 위해<br>에브리닥터는 보호자들에게 최적화된 서비스들을 제공합니다.</p>
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
                                            <a href="category.html" class="single-cat wow fadeInUp"
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
                                            <a href="category.html" class="single-cat wow fadeInUp"
                                                data-wow-delay="1s">
                                                <div class="icon">
                                                    <img src="/images/pet/home/stamp_icon.svg" alt="#">
                                                </div> 
                                                <h3>반려동물 팁</h3>
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
                                <div class="col-lg-4 col-md-4 col-12 p-0">
                                    <div class="search-input">
                                        <label for="keyword"><i class="lni lni-search-alt theme-color"></i></label>
                                        <input type="text" name="keyword" id="keyword" placeholder="Product keyword">
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-12 p-0">
                                    <div class="search-input">
                                        <label for="category"><i class="lni lni-grid-alt theme-color"></i></label>
                                        <select name="category" id="category">
                                            <option value="none" selected disabled>Categories</option>
                                            <option value="none">Vehicle</option>
                                            <option value="none">Electronics</option>
                                            <option value="none">Mobiles</option>
                                            <option value="none">Furniture</option>
                                            <option value="none">Fashion</option>
                                            <option value="none">Jobs</option>
                                            <option value="none">Real Estate</option>
                                            <option value="none">Animals</option>
                                            <option value="none">Education</option>
                                            <option value="none">Matrimony</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-12 p-0">
                                    <div class="search-input">
                                        <label for="location"><i class="lni lni-map-marker theme-color"></i></label>
                                        <select name="location" id="location">
                                            <option value="none" selected disabled>Locations</option>
                                            <option value="none">New York</option>
                                            <option value="none">California</option>
                                            <option value="none">Washington</option>
                                            <option value="none">Birmingham</option>
                                            <option value="none">Chicago</option>
                                            <option value="none">Phoenix</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-2 col-12 p-0">
                                    <div class="search-btn button">
                                        <button class="btn"><i class="lni lni-search-alt"></i> Search</button>
                                    </div>
                                </div>
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
    <section class="items-tab section custom-padding">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">Veterinarian</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">에브리닥터는 반려동물과 보호자들에게 필요한 서비스를 제공하고자 여러 전문 분야의 인력들을 통해 진료를 진행합니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <button class="nav-link active" id="nav-latest-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-latest" type="button" role="tab" aria-controls="nav-latest"
                                aria-selected="true">강아지 전문의</button>
                            <button class="nav-link" id="nav-popular-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-popular" type="button" role="tab" aria-controls="nav-popular"
                                aria-selected="false">고양이 전문의</button>
                            <button class="nav-link" id="nav-random-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-random" type="button" role="tab" aria-controls="nav-random"
                                aria-selected="false">특수동물 전문의</button>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-latest" role="tabpanel"
                            aria-labelledby="nav-latest-tab">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">전문의</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">강아지</a>
                                            <h3 class="title">
                                                <a href="item-details.html">김춘배</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>서울 강남</a></p>
                                            <ul class="info">
                                                <li class="price">병원명</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">전문의</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">강아지</a>
                                            <h3 class="title">
                                                <a href="item-details.html">김갑동</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>서울</a></p>
                                            <ul class="info">
                                                <li class="price">병원명</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">전문의</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">강아지</a>
                                            <h3 class="title">
                                                <a href="item-details.html">박만희</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>서울</a></p>
                                            <ul class="info">
                                                <li class="price">병원명</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Furniture</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Poster Paint</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Las Vegas</a></p>
                                            <ul class="info">
                                                <li class="price">$85.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Furniture</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Official Metting Chair</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Alaska, USA</a></p>
                                            <ul class="info">
                                                <li class="price">$750.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge rent">Rent</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Books & Magazine</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Story Book</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>New York, USA</a></p>
                                            <ul class="info">
                                                <li class="price">$120.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Electronic</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Cctv camera</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Delhi, India</a></p>
                                            <ul class="info">
                                                <li class="price">$350.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Mobile</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Samsung Glalaxy S8</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Delaware, USA</a></p>
                                            <ul class="info">
                                                <li class="price">$299.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-popular" role="tabpanel" aria-labelledby="nav-popular-tab">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Others</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Travel Kit</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>San Francisco</a></p>
                                            <ul class="info">
                                                <li class="price">$580.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Electronic</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Nikon DSLR Camera</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Alaska, USA</a></p>
                                            <ul class="info">
                                                <li class="price">$560.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Mobile</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Apple Iphone X</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Boston</a></p>
                                            <ul class="info">
                                                <li class="price">$890.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Furniture</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Poster Paint</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Las Vegas</a></p>
                                            <ul class="info">
                                                <li class="price">$85.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Electronic</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Cctv camera</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Delhi, India</a></p>
                                            <ul class="info">
                                                <li class="price">$350.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Mobile</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Samsung Glalaxy S8</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Delaware, USA</a></p>
                                            <ul class="info">
                                                <li class="price">$299.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Furniture</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Official Metting Chair</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Alaska, USA</a></p>
                                            <ul class="info">
                                                <li class="price">$750.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge rent">Rent</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Books & Magazine</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Story Book</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>New York, USA</a></p>
                                            <ul class="info">
                                                <li class="price">$120.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="nav-random" role="tabpanel" aria-labelledby="nav-random-tab">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Electronic</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Nikon DSLR Camera</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Alaska, USA</a></p>
                                            <ul class="info">
                                                <li class="price">$560.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Furniture</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Poster Paint</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Las Vegas</a></p>
                                            <ul class="info">
                                                <li class="price">$85.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Furniture</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Official Metting Chair</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Alaska, USA</a></p>
                                            <ul class="info">
                                                <li class="price">$750.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Mobile</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Apple Iphone X</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Boston</a></p>
                                            <ul class="info">
                                                <li class="price">$890.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Others</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Travel Kit</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>San Francisco</a></p>
                                            <ul class="info">
                                                <li class="price">$580.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge rent">Rent</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Books & Magazine</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Story Book</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>New York, USA</a></p>
                                            <ul class="info">
                                                <li class="price">$120.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Electronic</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Cctv camera</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Delhi, India</a></p>
                                            <ul class="info">
                                                <li class="price">$350.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                                <div class="col-lg-3 col-md-4 col-12">
                                    <!-- Start Single Item -->
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="item-details.html"><img src="https://via.placeholder.com/600x400" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">Sale</span>
                                        </div>
                                        <div class="content">
                                            <a href="javascript:void(0)" class="tag">Mobile</a>
                                            <h3 class="title">
                                                <a href="item-details.html">Samsung Glalaxy S8</a>
                                            </h3>
                                            <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                                                    </i>Delaware, USA</a></p>
                                            <ul class="info">
                                                <li class="price">$299.00</li>
                                                <li class="like"><a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Item -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Items Tab Area -->

    <!-- Start Items Grid Area -->
    <section class="items-grid section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">반려동물 팁</h2>
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

    <!-- Start Browse Cities Area -->
    <section class="browse-cities section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">Browse By Cities</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">There are many variations of passages of Lorem
                            Ipsum available, but the majority have suffered alteration in some form.</p>
                    </div>
                </div>
            </div>
            <div class="row ">
                <div class="col-lg-4 col-md-4 col-12">
                    <!-- Start Single City -->
                    <div class="single-city wow fadeInUp" data-wow-delay=".2s">
                        <a href="category.html" class="info-box">
                            <div class="image">
                                <img src="https://via.placeholder.com/425x290" alt="#">
                            </div>
                            <div class="content">
                                <h4 class="name">
                                    New York City
                                    <span>155 Ads</span>
                                </h4>
                            </div>
                            <div class="more-btn">
                                <i class="lni lni-circle-plus"></i>
                            </div>
                        </a>
                    </div>
                    <!-- Start Single City -->
                </div>
                <div class="col-lg-4 col-md-4 col-12">
                    <!-- Start Single City -->
                    <div class="single-city wow fadeInUp" data-wow-delay=".4s">
                        <a href="category.html" class="info-box">
                            <div class="image">
                                <img src="https://via.placeholder.com/425x290" alt="#">
                            </div>
                            <div class="content">
                                <h4 class="name">
                                    Philadelphia
                                    <span>288 Ads</span>
                                </h4>
                            </div>
                            <div class="more-btn">
                                <i class="lni lni-circle-plus"></i>
                            </div>
                        </a>
                    </div>
                    <!-- Start Single City -->
                </div>
                <div class="col-lg-4 col-md-4 col-12">
                    <!-- Start Single City -->
                    <div class="single-city wow fadeInUp" data-wow-delay=".6s">
                        <a href="category.html" class="info-box">
                            <div class="image">
                                <img src="https://via.placeholder.com/425x290" alt="#">
                            </div>
                            <div class="content">
                                <h4 class="name">
                                    Los Angeles
                                    <span>95 Ads</span>
                                </h4>
                            </div>
                            <div class="more-btn">
                                <i class="lni lni-circle-plus"></i>
                            </div>
                        </a>
                    </div>
                    <!-- Start Single City -->
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <!-- Start Single City -->
                    <div class="single-city wow fadeInUp" data-wow-delay=".2s">
                        <a href="category.html" class="info-box">
                            <div class="image">
                                <img src="https://via.placeholder.com/635x325" alt="#">
                            </div>
                            <div class="content">
                                <h4 class="name">
                                    San Francisco
                                    <span>355 Ads</span>
                                </h4>
                            </div>
                            <div class="more-btn">
                                <i class="lni lni-circle-plus"></i>
                            </div>
                        </a>
                    </div>
                    <!-- Start Single City -->
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <!-- Start Single City -->
                    <div class="single-city wow fadeInUp" data-wow-delay=".4s">
                        <a href="category.html" class="info-box">
                            <div class="image">
                                <img src="https://via.placeholder.com/635x325" alt="#">
                            </div>
                            <div class="content">
                                <h4 class="name">
                                    Newe Orleans
                                    <span>76 Ads</span>
                                </h4>
                            </div>
                            <div class="more-btn">
                                <i class="lni lni-circle-plus"></i>
                            </div>
                        </a>
                    </div>
                    <!-- Start Single City -->
                </div>
            </div>
        </div>
    </section>
    <!-- /End Browse Cities Area -->

    <!-- Start Call Action Area -->
    <section class="call-action overlay section">
        <div class="container">
            <div class="row ">
                <div class="col-lg-8 offset-lg-2 col-12">
                    <div class="inner">
                        <div class="content">
                            <h2 class="wow fadeInUp" data-wow-delay=".4s">Do you have something to sell?</h2>
                            <p class="wow fadeInUp" data-wow-delay=".6s">Post your ad for free on ClassiGrids</p>
                            <div class="button wow fadeInUp" data-wow-delay=".8s">
                                <a href="javascript:void(0)" class="btn">Post an ad now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Call Action Area -->

    <!-- Start Pricing Table Area -->
    <section class="pricing-table section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">Pricing Plan</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">There are many variations of passages of Lorem
                            Ipsum available, but the majority have suffered alteration in some form.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Single Table -->
                    <div class="single-table wow fadeInUp" data-wow-delay=".2s">
                        <!-- Table Head -->
                        <div class="table-head">
                            <div class="price">
                                <h2 class="amount">$00<span class="duration">/ Month</span></h2>
                            </div>
                            <h4 class="title">Free</h4>
                        </div>
                        <!-- End Table Head -->
                        <!-- Table List -->
                        <ul class="table-list">
                            <li>One Listing</li>
                            <li>Contact Display</li>
                            <li>Image Gallery</li>
                            <li>30 Days Availablity</li>
                            <li>Non-Featured</li>
                            <li>Business Tagline</li>
                        </ul>
                        <!-- End Table List -->
                        <!-- Table Bottom -->
                        <div class="button">
                            <a class="btn" href="javascript:void(0)">Select Plan</a>
                        </div>
                        <!-- End Table Bottom -->
                    </div>
                    <!-- End Single Table-->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Single Table -->
                    <div class="single-table wow fadeInUp" data-wow-delay=".4s">
                        <!-- Table Head -->
                        <div class="table-head">
                            <div class="price">
                                <h2 class="amount">$59<span class="duration">/ Month</span></h2>
                            </div>
                            <h4 class="title">Standard</h4>
                        </div>
                        <!-- End Table Head -->
                        <!-- Table List -->
                        <ul class="table-list">
                            <li>One Listing</li>
                            <li>Contact Display</li>
                            <li>Image Gallery</li>
                            <li>60 Days Availablity</li>
                            <li>Non-Featured</li>
                            <li>Business Tagline</li>
                        </ul>
                        <!-- End Table List -->
                        <!-- Table Bottom -->
                        <div class="button">
                            <a class="btn" href="javascript:void(0)">Select Plan</a>
                        </div>
                        <!-- End Table Bottom -->
                    </div>
                    <!-- End Single Table-->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Single Table -->
                    <div class="single-table wow fadeInUp" data-wow-delay=".6s">
                        <!-- Table Head -->
                        <div class="table-head">
                            <div class="price">
                                <h2 class="amount">$99<span class="duration">/ Month</span></h2>
                            </div>
                            <h4 class="title">Premium</h4>
                        </div>
                        <!-- End Table Head -->
                        <!-- Table List -->
                        <ul class="table-list">
                            <li>One Listing</li>
                            <li>Contact Display</li>
                            <li>Image Gallery</li>
                            <li>90 Days Availablity</li>
                            <li>Non-Featured</li>
                            <li>Business Tagline</li>
                        </ul>
                        <!-- End Table List -->
                        <!-- Table Bottom -->
                        <div class="button">
                            <a class="btn" href="javascript:void(0)">Select Plan</a>
                        </div>
                        <!-- End Table Bottom -->
                    </div>
                    <!-- End Single Table-->
                </div>
            </div>
        </div>
    </section>
    <!--/ End Pricing Table Area -->

    <!-- Start Testimonials Area -->
    <section class="testimonials section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title align-center gray-bg">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">What People Say</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">There are many variations of passages of Lorem
                            Ipsum available, but the majority have suffered alteration in some form.</p>
                    </div>
                </div>
            </div>
            <div class="row testimonial-slider">
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Start Single Testimonial -->
                    <div class="single-testimonial">
                        <div class="quote-icon">
                            <i class="lni lni-quotation"></i>
                        </div>
                        <div class="author">
                            <img src="https://via.placeholder.com/300x300" alt="#">
                            <h4 class="name">
                                Jane Anderson
                                <span class="deg">Founder & CEO</span>
                            </h4>
                        </div>
                        <div class="text">
                            <p>"Itâs amazing how much easier it has been to meet new people and create instant
                                connections. I have the exact same personality, the only thing that has changed is my
                                mindset and a few behaviors."</p>
                        </div>
                    </div>
                    <!-- End Single Testimonial -->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Start Single Testimonial -->
                    <div class="single-testimonial">
                        <div class="quote-icon">
                            <i class="lni lni-quotation"></i>
                        </div>
                        <div class="author">
                            <img src="https://via.placeholder.com/300x300" alt="#">
                            <h4 class="name">
                                Devid Samuyel
                                <span class="deg">Web Developer</span>
                            </h4>
                        </div>
                        <div class="text">
                            <p>"Itâs amazing how much easier it has been to meet new people and create instant
                                connections. I have the exact same personality, the only thing that has changed is my
                                mindset and a few behaviors."</p>
                        </div>
                    </div>
                    <!-- End Single Testimonial -->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Start Single Testimonial -->
                    <div class="single-testimonial">
                        <div class="quote-icon">
                            <i class="lni lni-quotation"></i>
                        </div>
                        <div class="author">
                            <img src="https://via.placeholder.com/300x300" alt="#">
                            <h4 class="name">
                                Jully Sulli
                                <span class="deg">Ui/Ux Designer</span>
                            </h4>
                        </div>
                        <div class="text">
                            <p>"Itâs amazing how much easier it has been to meet new people and create instant
                                connections. I have the exact same personality, the only thing that has changed is my
                                mindset and a few behaviors."</p>
                        </div>
                    </div>
                    <!-- End Single Testimonial -->
                </div>
            </div>
        </div>
    </section>
    <!-- End Testimonial Area -->

    <!-- Start How Works Area -->
    <section class="how-works section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">How it Works</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">There are many variations of passages of Lorem
                            Ipsum available, but the majority have suffered alteration in some form.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-12">
                    <!-- Start Single Work -->
                    <div class="single-work">
                        <span class="serial">01</span>
                        <h3>Create Account</h3>
                        <p>Lorem ipsum dolor sit amet constur adipisicing sed do eiusmod tempor incididunt labore.</p>
                    </div>
                    <!-- End Single Work -->
                </div>
                <div class="col-lg-4 col-md-4 col-12">
                    <!-- Start Single Work -->
                    <div class="single-work">
                        <span class="serial">02</span>
                        <h3>Post Your Ads</h3>
                        <p>Lorem ipsum dolor sit amet constur adipisicing sed do eiusmod tempor incididunt labore.</p>
                    </div>
                    <!-- End Single Work -->
                </div>
                <div class="col-lg-4 col-md-4 col-12">
                    <!-- Start Single Work -->
                    <div class="single-work">
                        <span class="serial">03</span>
                        <h3>Sell Your Item</h3>
                        <p>Lorem ipsum dolor sit amet constur adipisicing sed do eiusmod tempor incididunt labore.</p>
                    </div>
                    <!-- End Single Work -->
                </div>
            </div>
        </div>
    </section>
    <!-- End How Works Area -->

    <!-- Start Latest News Area -->
    <div class="latest-news-area section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">latest news</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">There are many variations of passages of Lorem
                            Ipsum available, but the majority have suffered alteration in some form.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Single News -->
                    <div class="single-news wow fadeInUp" data-wow-delay=".3s">
                        <div class="image">
                            <a href="blog-single-sidebar.html"><img class="thumb" src="https://via.placeholder.com/370x230" alt="#"></a>
                        </div>
                        <div class="content-body">
                            <h4 class="title"><a href="blog-single-sidebar.html">10 Things Successful Mompreneurs Do
                                    Different</a></h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis soluta libero molestiae,
                                id reiciendis ipsum. </p>
                            <div class="meta-details">
                                <ul>
                                    <li><a href="javascript:void(0)">Jan 24,2023</a></li>
                                    <li><a href="javascript:void(0)">Technology</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- End Single News -->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Single News -->
                    <div class="single-news wow fadeInUp" data-wow-delay=".5s">
                        <div class="image">
                            <a href="blog-single-sidebar.html"><img class="thumb" src="https://via.placeholder.com/370x230" alt="#"></a>
                        </div>
                        <div class="content-body">
                            <h4 class="title"><a href="blog-single-sidebar.html">A digital prescription for the industry.</a>
                            </h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis soluta libero molestiae,
                                id reiciendis ipsum. </p>
                            <div class="meta-details">
                                <ul>
                                    <li><a href="javascript:void(0)">Feb 20,2023</a></li>
                                    <li><a href="javascript:void(0)">Magazine</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- End Single News -->
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Single News -->
                    <div class="single-news wow fadeInUp" data-wow-delay=".7s">
                        <div class="image">
                            <a href="blog-single-sidebar.html"><img class="thumb" src="https://via.placeholder.com/370x230" alt="#"></a>
                        </div>
                        <div class="content-body">
                            <h4 class="title"><a href="blog-single-sidebar.html">Strategic & commercial approach with
                                    issues.</a></h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis soluta libero molestiae,
                                id reiciendis ipsum. </p>
                            <div class="meta-details">
                                <ul>
                                    <li><a href="javascript:void(0)">Mar 15,2023</a></li>
                                    <li><a href="javascript:void(0)">Technology</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- End Single News -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Latest News Area -->

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

    <!-- Start Footer Area -->
    <c:import url="../temp/footer.jsp"></c:import>
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
    <script type="text/javascript">
        //========= testimonial 
        tns({
            container: '.testimonial-slider',
            items: 3,
            slideBy: 'page',
            autoplay: false,
            mouseDrag: true,
            gutter: 0,
            nav: true,
            controls: false,
            controlsText: ['<i class="lni lni-arrow-left"></i>', '<i class="lni lni-arrow-right"></i>'],
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 1,
                },
                768: {
                    items: 2,
                },
                992: {
                    items: 2,
                },
                1170: {
                    items: 2,
                }
            }
        });
    </script>
</body>

</html>