<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>DeliveryPay</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
	<c:import url="../temp/boot.jsp"></c:import>
    <!-- Place favicon.ico in the root directory -->

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

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">배송결제</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>배송결제</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- start login section -->
    <section class="login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                    <div class="form-head">
                        <h4 class="title">배송결제</h4>
                        <form action="#!" method="post">
                        	<input type="hidden" id="payNumInput" value="${deliveryPayVO.payNum }">
                        	<input type="hidden" id="usernameInput" value="${deliveryPayVO.username }">
                            <div class="form-group">
                                <label>배송지 선택</label>
                                <!-- <input type="text"> -->
                                <select class="form-select" id="addrSelect">
                                	<option value="null">배송지 선택</option>
                                	<c:forEach items="${addrList }" var="addr">
                                		<option value="${addr.addressNum }" data-mainaddr="${addr.userMainAddr }" data-subaddr="${addr.userSubAddr }" data-post="${addr.userPost }">${addr.addressNick }</option>
                                	</c:forEach>
                                </select>
                                <input type="text" readonly="readonly" id="mainAddrInput" style="margin-top: 1rem;">
                                <input type="text" readonly="readonly" id="subAddrInput">
                                <input type="text" readonly="readonly" id="postInput">
                            </div>
                            <div class="form-group">
                                <label>결제 금액</label>
                                <input type="text" id="amountInput" value="${deliveryPayVO.amount }" readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label>주문번호</label>
                                <input type="text" id="orderIdInput" value="${deliveryPayVO.orderId }" readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label>주문명</label>
                                <input type="text" id="orderNameInput" value="${deliveryPayVO.orderName }" readonly="readonly">
                            </div>
                            <div class="button">
                                <button type="button" class="btn" id="doDeliveryPayBtn">결제하기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end login section -->

    <!-- Start Footer Area -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

	<script type="text/javascript" src="/js/pay/doDeliveryPay.js"></script>

</body>

</html>