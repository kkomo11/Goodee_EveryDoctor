<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>내 결제정보</title>
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
                        <h1 class="page-title">내 결제 정보</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>내 결제 정보</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Contact Area -->
    <section id="contact-us" class="contact-us section">
        <div class="container">
            <div class="contact-head wow fadeInUp" data-wow-delay=".4s">
                <div class="row">
                    <div class="col-lg-5 col-12">
                        <div class="single-head">
                            <div class="contant-inner-title">
                                <h2>카드 번호</h2>
                                <c:if test="${myPay.cardNumber != null }">
                                	<p>${myPay.cardNumber }</p>
                                </c:if>
                                <c:if test="${myPay.cardNumber == null }">
                                	<p>미등록</p>
                                </c:if>
                            </div>
                            <div class="single-info">
                                <h3>유효 연</h3>
                                <ul>
                                	<c:if test="${myPay.cardExpirationYear != null }">
                                		<li>${myPay.cardExpirationYear }</li>
                                	</c:if>
                                    <c:if test="${myPay.cardExpirationYear == null }">
                                		<li>미등록</li>
                                	</c:if>
                                </ul>
                            </div>
                            <div class="single-info">
                                <h3>유효 월</h3>
                                <ul>
                                	<c:if test="${myPay.cardExpirationMonth != null }">
                                		<li>${myPay.cardExpirationMonth }</li>
                                	</c:if>
                                    <c:if test="${myPay.cardExpirationMonth == null }">
                                		<li>미등록</li>
                                	</c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 col-12">
                        <div class="form-main">
                            <div class="form-title">
                                <h2>결제 정보 등록</h2>
                                <p>결제를 위해 결제 정보를 등록해주세요. 재등록 시 기존 정보는 사라집니다.</p>
                            </div>
                            <form class="form" method="post" action="./regist" id="payInfoRegistForm">
                                <div class="row">
                                	<input type="hidden" name="username" value="${user.username }" id="usernameInput">
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <input name="cardNumber" type="text" placeholder="카드 번호" required="required" id="cardNumberInput">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <input name="cardExpirationYear" type="text" placeholder="유효 연"
                                                required="required" id="cardExpirationYearInput">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <input name="cardExpirationMonth" type="text" placeholder="유효 월"
                                                required="required" id="cardExpirationMonthInput">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <input name="cardTwo" type="password" placeholder="비밀번호 앞 두자리"
                                                required="required" id="cardTwoInput">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group button">
                                            <button type="button" class="btn " id="payInfoRegistBtn">등록</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/ End Contact Area -->

    <!-- Start Footer Area -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>
    
    <script type="text/javascript" src="/js/pay/regist.js"></script>

</body>

</html>