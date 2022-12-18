<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>내 진료내역 상세</title>
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
                <div class="col-lg-3 col-md-3 col-12">
					<c:import url="sidebar.jsp"></c:import>
                </div>
                <div class="col-lg-9 col-md-9 col-12">
                    <div class="main-content">
                        <div class="dashboard-block mt-0">
                            <div class="profile-settings-block">
                                <h3 class="block-title">내 진료내역 상세</h3>
                                <div class="inner-block">
                                    <div class="image">
                                        <img src="/images/yeji.jpg" alt="#">
                                    </div>
                                    <form class="profile-setting-form" method="post" action="#">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group message">
                                                    <label>내 증상</label>
                                                    <textarea name="message" readonly onfocus="this.blur()">얼굴에 갑자기 붉은색 작은 점들이 생겼어요</textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group message">
                                                    <label>의사 소견</label>
                                                    <textarea name="message" readonly onfocus="this.blur()">풀에의한 접촉 알레르기 피부염으로 보입니다. 하이드로 코티존 연고 만으로는 치료 하기 힘들구요, 스테로이드 경구약을 짧은 기간이라도 더 복용 하시는 것이 좋습니다. 손에 있는 착색은 병이라기 보다, 풀에 있는 뭔가가 묻은 것으로 생각됩니다. 저절로 사라질 것으로 생각됩니다. 병이 다 치료 되고 나면, 소아과에 가시면 혈액을 이용한 알러지 항원 검사라는 것이 있는데 추천 드립니다.</textarea>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-12">
                                                <div class="form-group">
                                                    <label>진료비 결제</label>
                                                    <input name="first-name" type="text" value="1000원" readonly onfocus="this.blur()">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
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
    <c:import url="../temp/footer.jsp"></c:import>
    <script src="/js/user/mydiagnosis.js"></script>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
</body>
</html>