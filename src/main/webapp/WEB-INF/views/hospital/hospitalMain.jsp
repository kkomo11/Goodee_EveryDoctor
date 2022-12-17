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
            background-image: url('/images/hospital/home/hospitalMain.jpg');
        }

        .hero-area.overlay::before {
            opacity: 0.3;
        }

        .disabled {
            display: none;
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
                                            <a href="/consult/list" class="single-cat wow fadeInUp"
                                                data-wow-delay=".6s">
                                                <div class="icon">
                                                    <img src="/images/pet/home/website_icon.svg" alt="#">
                                                </div>
                                                <h3>무료 상담</h3>
                                                <!-- <h5 class="total">65</h5> -->
                                            </a>
                                            <!-- End Single Category -->
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12" id="doctors">
                                            <!-- Start Single Category -->
                                            <a href="javascript:void(0)" class="single-cat wow fadeInUp"
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
    <a name="doctorList"></a>
    <section class="items-tab section custom-padding">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">Doctor</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">진료 과목을 선택하면 전국 비대면 진료 병·의원을 한 번에 확인할 수 있어요.</p>
                    </div>
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
	                                                    <a class="selectSubject" onclick="loadDoctorList(${sectionVO.sectionNum},1)" href="javascript:void(0)"><img class="subjectIcon" src="/images/hospital/home/${sectionVO.sectionIcon}">
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