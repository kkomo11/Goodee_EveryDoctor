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
    <c:import url="../temp/boot.jsp"></c:import>
    <!-- chatbot -->
    <c:import url="../temp/chatbot.jsp"></c:import>

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
                                        <div class="col-lg-3 col-md-3  col-12">
                                            <!-- Start Single Category -->
                                            <a href="#petDocListSection" class="single-cat wow fadeInUp"
                                                data-wow-delay=".8s" id="petdocListIcon">
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
                                            <a href="/location/animal24" class="single-cat wow fadeInUp"
                                                data-wow-delay="1s">
                                                <div class="icon">
                                                    <img src="/images/pet/home/stamp_icon.svg" alt="#">
                                                </div> 
                                                <h3>24시 병원</h3>
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
    <section class="items-tab section custom-padding" id="petDocListSection">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">Veterinarian</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">에브리닥터는 반려동물과 보호자들에게 필요한 서비스를 제공하고자<br>여러 전문 분야의 인력들을 통해 진료를 진행합니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <button class="nav-link active" id="nav-dog-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-latest" type="button" role="tab" aria-controls="nav-latest"
                                aria-selected="true">강아지 전문의</button>
                            <button class="nav-link" id="nav-cat-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-popular" type="button" role="tab" aria-controls="nav-popular"
                                aria-selected="false">고양이 전문의</button>
                            <button class="nav-link" id="nav-other-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-random" type="button" role="tab" aria-controls="nav-random"
                                aria-selected="false">특수동물 전문의</button>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-latest" role="tabpanel"
                            aria-labelledby="nav-latest-tab">
                            <div class="row" id="petdogList">
                                
                            </div>
                            <!-- Pagination -->
                            <div class="pagination center">
                                <ul class="pagination-list" id="petdogPagination">
                                	
                                </ul>
                            </div>
                            <!--/ End Pagination -->
                        </div>
                        <div class="tab-pane fade" id="nav-popular" role="tabpanel" aria-labelledby="nav-popular-tab">
                            <div class="row" id="petcatList">
                                
                            </div>
                            <!-- Pagination -->
                            <div class="pagination center">
                                <ul class="pagination-list" id="petcatPagination">
                                	
                                </ul>
                            </div>
                            <!--/ End Pagination -->
                        </div>
                        <div class="tab-pane fade" id="nav-random" role="tabpanel" aria-labelledby="nav-random-tab">
                            <div class="row" id="petotherList">
                                
                            </div>
                            <!-- Pagination -->
                            <div class="pagination center">
                                <ul class="pagination-list" id="petotherPagination">
                                	
                                </ul>
                            </div>
                            <!--/ End Pagination -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Items Tab Area -->

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

    <!-- Start Testimonials Area -->
    <section class="testimonials section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title align-center gray-bg">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">이용 후기</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">에브리닥터를 이용한 사람들의 솔직한 후기를 보세요</p>
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
                            <img src="/images/pet/home/user_profile_icon.svg" alt="#">
                            <h4 class="name">
                                김만석
                                <span class="deg">Founder & CEO</span>
                            </h4>
                        </div>
                        <div class="text">
                            <p>편리하게 집에서 진료를 받으니 좋아요. 아파서 밖에 나가기 부담될 때 정말 좋습니다.</p>
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
                            <img src="/images/pet/home/user_profile_icon.svg" alt="#">
                            <h4 class="name">
                                류만기
                                <span class="deg">Web Developer</span>
                            </h4>
                        </div>
                        <div class="text">
                            <p>이제 의료도 물리적 공간에 제한받지 않는 시대가 왔네요. 앞으로 번창하세요.</p>
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
                            <img src="/images/pet/home/user_profile_icon.svg" alt="#">
                            <h4 class="name">
                                곽택기
                                <span class="deg">Ui/Ux Designer</span>
                            </h4>
                        </div>
                        <div class="text">
                            <p>주변 사람들에게 소개해주고 싶네요. 아플 때 병원에 가는 것도 힘들고 부담되는데 에브리닥터 덕분에 삶의 질이 높아집니다.</p>
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
                            <img src="/images/pet/home/user_profile_icon.svg" alt="#">
                            <h4 class="name">
                                한현식
                                <span class="deg">Artist</span>
                            </h4>
                        </div>
                        <div class="text">
                            <p>이건 웹 서비스가 아니라 현대 예술입니다.</p>
                        </div>
                    </div>
                    <!-- End Single Testimonial -->
                </div>
            </div>
        </div>
    </section>
    <!-- End Testimonial Area -->

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
    <script src="/js/pet/home.js"></script>
    
    <!-- Template -->
    <script type="text/template" id="petdocListItemTemplate">
		<div class="col-lg-3 col-md-4 col-12">
			<div class="single-item-grid">
        		<div class="image">
        			<a href="/pet/petdocDetail?username={doctorId}"><img src="{userFileName}" alt="#" style="height: 180px;"></a>
        			<i class=" cross-badge lni lni-bolt"></i>
        			<span class="flat-badge sale">전문의</span>
        		</div>
        		<div class="content">
     	   			<a href="javascript:void(0)" class="tag">{sectionName} 전문의</a>
        			<h3 class="title">
        				<a href="/pet/petdocDetail?username={doctorId2}">{doctorName}</a>
        			</h3>
        			<p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
        				</i>{agencyName}</a></p>
        			
        		</div>
        	</div>
		</div>
	</script>
	
	<script type="text/template" id="">
		<li><a href="javascript:void(0)"><i class="lni lni-chevron-left"></i></a></li>
        <li><a href="javascript:void(0)">1</a></li>
        <li class="active"><a href="javascript:void(0)">2</a></li>
        <li><a href="javascript:void(0)">3</a></li>
        <li><a href="javascript:void(0)">4</a></li>
        <li><a href="javascript:void(0)"><i class="lni lni-chevron-right"></i></a></li>
	</script>
    
</body>

</html>