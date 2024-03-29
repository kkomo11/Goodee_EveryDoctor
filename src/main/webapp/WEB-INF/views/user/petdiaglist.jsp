<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                            <h3 class="block-title">반려동물 진료내역</h3>
                            <!-- Start Invoice Items Area -->
                            <div class="invoice-items default-list-style">
                                <!-- Start Single List -->
                                <div class="single-list  my-items">
                                <!-- Start Item List Title -->
                                <div class="item-list-title">
                                    <div class="row align-items-center">
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>반려동물</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>병원이름</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>의사이름</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>병원번호</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>진료시간</p>
                                        </div>
                                        <div class="col-lg-1 col-md-1 col-12"></div>
                                    </div>
                                </div>
                                <!-- End List Title -->
                                <c:forEach items="${diagnosisVOs}" var="diagnosisVO">
	                                <!-- Start Single List -->
	                                <div class="diagnosis-detail single-item-list" data-dansnum="${diagnosisVO.getPDansNum()}">
	                                    <div class="row">
	                                        <div class="col-lg-2 col-md-2 col-12">
	                                                <p>${diagnosisVO.petVO.petName }</p>
	                                            <%-- <div class="item-image" style="padding-left: 0;">
	                                                <div class="">
                                                        <img src="/file/PET/${diagnosisVO.petVO.petFileName}">
	                                                </div>
	                                            </div> --%>
	                                        </div>
	                                        <div class="col-lg-2 col-md-2 col-12">
	                                            <p>${diagnosisVO.medicVO.agencyVO.agencyName}</p>
	                                        </div>
	                                        <div class="col-lg-2 col-md-2 col-12">
	                                            <p>${diagnosisVO.medicVO.userVO.name}</p>
	                                        </div>
	                                        <div class="col-lg-2 col-md-2 col-12">
	                                            <p>${diagnosisVO.medicVO.agencyVO.agencyTel}</p>
	                                        </div>
	                                        <div class="col-lg-2 col-md-2 col-12">
	                                        	<fmt:parseDate value="${diagnosisVO.getPDansReqTime()}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDT" type="both"></fmt:parseDate>
												<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${parseDT}"/>					                     
												  
	                                        </div>
	                                        <div class="col-lg-2 col-md-2 col-12">
	                                            <ul class="action-btn">
	                                                <li><a href="/pet/diagnosis/reservation?username=${diagnosisVO.getPUsername()}&petdoc=${diagnosisVO.getPDoctorname()}" style="width: 100px; border-radius: 10%; margin-right: 5px;">다시 접수하기</a></li>
	                                            </ul>
	                                        </div>
	                                    </div>
	                                </div>
	                                <!-- End Single List -->
                                </c:forEach>
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