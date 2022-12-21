<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>결제</title>
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
                        <h1 class="page-title">결제</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>결제</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
    
    <!-- Start Pricing Table Area -->
    <section class="pricing-table section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">결제</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">결제를 완료해주세요</p>
                        <p class="wow fadeInUp" data-wow-delay=".6s">약을 배송받지 않거나 처방받은 약이 없다면 약 배송 미포함을 확인하세요</p>
                    </div>
                </div>
            </div>
            <div class="row" style="justify-content: center;">
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Single Table -->
                    <div class="single-table wow fadeInUp" data-wow-delay=".2s">
                        <!-- Table Head -->
                        <div class="table-head">
                            <div class="price">
                                <h2 class="amount">${unpaidDetail.amount }<span class="duration">원</span></h2>
                                <input type="hidden" id="amountInput" value="${unpaidDetail.amount}">
                            </div>
                            <h4 class="title">${unpaidDetail.orderName }</h4>
                            <input type="hidden" id="orderNameInput" value="${unpaidDetail.orderName}">
                        </div>
                        <!-- End Table Head -->
                        <!-- Table List -->
                        <ul class="table-list">
                        	<li>결제 요청 시각</li>
                            <li>${unpaidDetail.payReqDateString }</li>
                            <li>주문번호</li>
                            <li>${unpaidDetail.orderId }</li>
                            <li>약 배송 미포함</li>
                        </ul>
                        <input type="hidden" id="orderIdInput" value="${unpaidDetail.orderId}">
                        <input type="hidden" id="usernameInput" value="${user.username}">
                        <input type="hidden" id="payNumInput" value="${unpaidDetail.payNum}">
                        <!-- End Table List -->
                        <!-- Table Bottom -->
                        <div class="button">
                            <button type="button" class="btn" id="doPayBtn">결제하기</button>
                        </div>
                        <!-- End Table Bottom -->
                    </div>
                    <!-- End Single Table-->
                </div>
                
                <c:if test="${unpaidDetail.orderName == '반려동물 진료비'}">
                <div class="col-lg-4 col-md-6 col-12">
                    <!-- Single Table -->
                    <div class="single-table wow fadeInUp" data-wow-delay=".2s">
                        <!-- Table Head -->
                        <div class="table-head">
                            <div class="price">
                                <h2 class="amount">${unpaidDetail.amount + 3000 }<span class="duration">원</span></h2>
                                <input type="hidden" id="amountDeliveryInput" value="${unpaidDetail.amount + 3000}">
                            </div>
                            <h4 class="title">${unpaidDetail.orderName } + 배송비</h4>
                            <input type="hidden" id="orderNameDeliveryInput" value="${unpaidDetail.orderName}">
                        </div>
                        <!-- End Table Head -->
                        <!-- Table List -->
                        <ul class="table-list">
                        	<li>결제 요청 시각</li>
                            <li>${unpaidDetail.payReqDateString }</li>
                            <li>주문번호</li>
                            <li>${unpaidDetail.orderId }</li>
                            <li>배송비 포함</li>
                        </ul>
                        <input type="hidden" id="orderIdDeliveryInput" value="${unpaidDetail.orderId}">
                        <input type="hidden" id="usernameDeliveryInput" value="${user.username}">
                        <input type="hidden" id="payNumDeliveryInput" value="${unpaidDetail.payNum}">
                        <input type="hidden" id="pDansNumDeliveryInput" value="${unpaidDetail.PDansNum }">
                        <!-- End Table List -->
                        <!-- Table Bottom -->
                        <div class="button">
                            <button type="button" class="btn" id="doDeliveryPayBtn">결제하기</button>
                        </div>
                        <!-- End Table Bottom -->
                    </div>
                    <!-- End Single Table-->
                </div>
                </c:if>
            </div>
        </div>
    </section>
    <!--/ End Pricing Table Area -->

    <!-- Start Footer Area -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>
  	
  	<script type="text/javascript" src="/js/pay/doPay.js"></script>
    
</body>

</html>