<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>내 진료내역</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />	
    <!-- Place favicon.ico in the root directory -->

	<c:import url="../temp/boot.jsp"></c:import>
    <style>
        .none {
            display: none;
        }

        .detail {
            background-color: honeydew;
            padding: 5%;
        }

        .diagnosisImg>img {
            width: 24%;
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
                <div class="col-lg-3 col-md-12 col-12">
					<c:import url="sidebar.jsp"></c:import>
                </div>
                <div class="col-lg-9 col-md-12 col-12">
                    <div class="main-content">
                        <div class="dashboard-block mt-0">
                            <h3 class="block-title">내 진료내역</h3>
                            <!-- Start Invoice Items Area -->
                            <div class="invoice-items default-list-style">
                                <!-- Start Single List -->
                                <div class="single-list  my-items">
                                <!-- Start Item List Title -->
                                <div class="item-list-title">
                                    <div class="row align-items-center">
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>의사이름</p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12">
                                            <p>병원이름</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>병원번호</p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12">
                                            <p>진료시간</p>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-12"></div>
                                    </div>
                                </div>
                                <!-- End List Title -->
                                <!-- Start Single List -->
                                <div class="diagnosis-detail single-item-list">
                                    <div class="row align-items-center">
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <div class="item-image" style="padding-left: 0;">
                                                <div class="content">
                                                    <h3 class="title"><a href="javascript:void(0)">이성관</a></h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12">
                                            <p>서울바른세상병원</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>02-2111-9700</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            2022-12-12 00:00
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <ul class="action-btn">
                                                <li><a href="javascript:void(0)" style="width: 100px; border-radius: 10%; margin-right: 5px;">다시 접수하기</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- <div class="detail none mt-3">
                                        <div>
                                            <div class="mb-3">
                                                <h4 style="margin-bottom: 5px;">내 증상</h4>
                                                <p style="padding: 5px;">얼굴에 갑자기 붉은색 작은 점들이 생겼어요</p>
                                            </div>
                                            <div class="diagnosisImg mb-3" style="width: 100%;">
                                                <img src="/images/yeji.jpg">
                                                <img src="/images/defaultProfile.png">
                                                <img src="/images/yeji.jpg">
                                                <img src="/images/defaultProfile.png">
                                            </div>
                                            <div class="mb-3">
                                                <h4 style="margin-bottom: 5px;">의사 소견</h4>
                                                <p style="padding: 5px;">풀에의한 접촉 알레르기 피부염으로 보입니다. 하이드로 코티존 연고 만으로는 치료 하기 힘들구요, 
                                                    스테로이드 경구약을 짧은 기간이라도 더 복용 하시는 것이 좋습니다. 손에 있는 착색은 병이라기 보다, 
                                                    풀에 있는 뭔가가 묻은 것으로 생각됩니다. 저절로 사라질 것으로 생각됩니다. 병이 다 치료 되고 나면, 
                                                    소아과에 가시면 혈액을 이용한 알러지 항원 검사라는 것이 있는데 추천 드립니다.</p>
                                            </div>
                                            <hr>
                                            <div class="mb-5">
                                                <span style="font-size: 20px;">진료비 결제 <span>4000</span> 원</span>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="row align-items-center mb-2">
                                                <div class="col-lg-1 col-md-1 col-12">
                                                    <p>번호</p>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-12">
                                                    <p>진료(처방)일자</p>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-12">
                                                    <p>처방약품명</p>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-12">
                                                    <p>투여량</p>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-12">
                                                    <p>투여횟수</p>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-12">
                                                    <p>투약일수</p>
                                                </div>
                                            </div>
                                            <div class="row align-items-center">
                                                <div class="col-lg-1 col-md-1 col-12">
                                                    <p>1</p>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-12">
                                                    <p>2022-11-06</p>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-12">
                                                    <p>프리마란정 (Primalan Tab.)</p>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-12">
                                                    <p>3 정</p>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-12">
                                                    <p>2 회</p>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-12">
                                                    <p>2</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->
                                </div>
                                <!-- End Single List -->
                                <!-- Start Single List -->
                                <div class="diagnosis-detail single-item-list">
                                    <div class="row align-items-center">
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <div class="item-image" style="padding-left: 0;">
                                                <div class="content">
                                                    <h3 class="title"><a href="javascript:void(0)">최민정</a></h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12">
                                            <p>경희리솜한방병원</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>02-896-0010</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            2022-12-12 00:00
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <ul class="action-btn">
                                                <li><a href="javascript:void(0)" style="width: 100px; border-radius: 10%; margin-right: 5px;">다시 접수하기</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single List -->
                                
                            </div>
                            <!-- End Invoice Items Area -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Dashboard Section -->

	<!-- Footer -->
    <c:import url="../temp/footer.jsp"></c:import>
    <script src="/js/user/mydiagnosis.js"></script>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
</body>
</html>