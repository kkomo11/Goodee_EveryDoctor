<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>미납된 결제</title>
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
                        <h1 class="page-title">미납된 결제</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>미납된 결제</li>
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
                    <c:import url="../user/sidebar.jsp"></c:import>
                    <!-- Start Dashboard Sidebar -->
                </div>
                <div class="col-lg-9 col-md-12 col-12">
                    <div class="main-content">
                        <div class="dashboard-block mt-0">
                            <h3 class="block-title">미납된 결제</h3>
                            <!-- Start Invoice Items Area -->
                            <div class="invoice-items default-list-style">
                                <!-- Start List Title -->
                                <div class="default-list-title">
                                    <div class="row align-items-center">
                                        <div class="col-lg-4 col-md-4 col-12">
                                            <p>결제항목</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>요청시간</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>관련내용</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>상태</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12 align-right">
                                            <p>결제하기</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- End List Title -->
                                <c:forEach items="${requestedPayList }" var="requestedPay">
                                <!-- Start Single List -->
                                <div class="single-list">
                                    <div class="row align-items-center">
                                        <div class="col-lg-4 col-md-4 col-12">
                                            <p>${requestedPay.orderName }
                                                <span>${requestedPay.amount }원</span>
                                            </p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>${requestedPay.payReqDateString}</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                        	<c:if test="${requestedPay.dansNum != null }">
                                        		<p><a>관련진료</a></p>
                                        	</c:if>
                                            <c:if test="${requestedPay.prescriptionNum != null }">
                                        		<p><a>관련처방</a></p>
                                        	</c:if>
                                        	<c:if test="${requestedPay.PDansNum != null }">
                                        		<p><a href="/pet/diagnosis/completedDetail?n=${requestedPay.PDansNum }">관련진료</a></p>
                                        	</c:if>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p class="unpaid">미납</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12 align-right">
                                            <ul>
                                            	<c:if test="${isPayInfoRegisted }">
                                            		<li><a href="/pay/doPay?pn=${requestedPay.payNum }">결제하기</a></li>
                                            	</c:if>
                                                <c:if test="${!isPayInfoRegisted }">
                                            		<li><a href="/pay/myPay?m=${user.username }">결제하기</a></li>
                                            	</c:if>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single List -->
                                </c:forEach>
                                
                                <!-- Pagination -->
                                <div class="pagination left" style="margin-left: 1rem;">
                                    <ul class="pagination-list">
                                        <c:if test="${pager.pre }">
                                        	<li><a href="/pay/requestedPayList?m=${user.username }&page=${pager.startNum - 1 }"><i class="lni lni-chevron-left"></i></a></li>
                                        </c:if>
                                        <c:forEach begin="${pager.startNum }" end="${pager.lastNum }" step="1" var="i">
                                        	<li><a href="/pay/requestedPayList?m=${user.username }&page=${i }">${i }</a></li>
                                        </c:forEach>
                                        <c:if test="${pager.next }">
                                        	<li><a href="/pay/requestedPayList?m=${user.username }&page=${pager.lastNum + 1 }"><i class="lni lni-chevron-right"></i></a></li>
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