<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>결제확인</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
	<c:import url="../temp/boot.jsp"></c:import>
    <!-- Place favicon.ico in the root directory -->

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

    <!-- Start Header Area -->
    <c:import url="../temp/header.jsp"></c:import>
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">결제확인</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>결제확인</li>
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
                    <!-- Start Dashboard Sidebar -->
                    <c:import url="../pet/diagnosis/sidebar.jsp"></c:import>
                    <!-- Start Dashboard Sidebar -->
                </div>
                <div class="col-lg-9 col-md-12 col-12">
                    <div class="main-content">
                        <div class="dashboard-block mt-0">
                            <h3 class="block-title">결제확인</h3>
                            <!-- Start Invoice Items Area -->
                            <div class="invoice-items default-list-style">
                                <!-- Start List Title -->
                                <div class="default-list-title">
                                    <div class="row align-items-center">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <p>결제항목</p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12">
                                            <p>관련내용</p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12">
                                            <p>상태</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- End List Title -->
                                <c:forEach items="${payList }" var="pay">
                                <!-- Start Single List -->
                                <div class="single-list">
                                    <div class="row align-items-center">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <p>${pay.orderName }
                                                <span>${pay.amount }원</span>
                                            </p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12">
                                        	<p><a href="/pet/diagnosis/completedDetail?n=${pay.PDansNum }">관련진료</a></p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12">
                                        	<c:if test="${pay.status == 'READY' }">
                                        	<p class="unpaid">미납</p>
                                        	</c:if>
                                            <c:if test="${pay.status == 'DONE' }">
                                        	<p class="paid">완료</p>
                                        	</c:if>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single List -->
                                </c:forEach>
                                
                                <!-- Pagination -->
                                <div class="pagination left" style="margin-left: 1rem;">
                                    <ul class="pagination-list">
                                        <c:if test="${pager.pre }">
                                        	<li><a href="/pay/payAboutPetdocList?username=${user.username }&page=${pager.startNum - 1 }"><i class="lni lni-chevron-left"></i></a></li>
                                        </c:if>
                                        <c:forEach begin="${pager.startNum }" end="${pager.lastNum }" step="1" var="i">
                                        	<li><a href="/pay/payAboutPetdocList?username=${user.username }&page=${i }">${i }</a></li>
                                        </c:forEach>
                                        <c:if test="${pager.next }">
                                        	<li><a href="/pay/payAboutPetdocList?username=${user.username }&page=${pager.lastNum + 1 }"><i class="lni lni-chevron-right"></i></a></li>
                                        </c:if>
                                    </ul>
                                </div>
                                <!--/ End Pagination -->
                            </div>
                            <!-- End Invoice Items Area -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Dashboard Section -->

    <!-- Start Footer Area -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

</body>

</html>