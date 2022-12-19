<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>결제내역</title>
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
                        <h1 class="page-title">결제내역</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>결제내역</li>
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
                            <h3 class="block-title">결제내역</h3>
                            <!-- Start Invoice Items Area -->
                            <div class="invoice-items default-list-style">
                                <!-- Start List Title -->
                                <div class="default-list-title">
                                    <div class="row align-items-center">
                                        <div class="col-lg-4 col-md-4 col-12">
                                            <p>결제항목</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>완료시간</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>관련내용</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>상태</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12 align-right">
                                            <p>영수증</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- End List Title -->
                                <c:forEach items="${completedPayList }" var="completedPay">
                                <!-- Start Single List -->
                                <div class="single-list">
                                    <div class="row align-items-center">
                                        <div class="col-lg-4 col-md-4 col-12">
                                            <p>${completedPay.orderName }
                                                <span>${completedPay.totalAmount }원</span>
                                            </p>
                                            <button class="badge bg-info" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample${completedPay.payNum }" aria-expanded="false" aria-controls="collapseExample${completedPay.payNum }">
												결제정보보기
											</button>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>${completedPay.approvedAtString}</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                        	<c:if test="${completedPay.dansNum != null }">
                                        		<p><a>관련진료</a></p>
                                        	</c:if>
                                            <c:if test="${completedPay.prescriptionNum != null }">
                                        		<p><a>관련처방</a></p>
                                        	</c:if>
                                        	<c:if test="${completedPay.PDansNum != null }">
                                        		<p><a href="/pet/diagnosis/completedDetail?n=${completedPay.PDansNum }">관련진료</a></p>
                                        	</c:if>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p class="paid">완료</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12 align-right">
                                            <ul>
                                            	<li><a href="${completedPay.receiptUrl }">바로가기</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="collapse" id="collapseExample${completedPay.payNum }" style="margin-top: 1rem;">
									  <div class="card card-body">
									    <ul>
									    	<li>결제카드번호 : ${completedPay.payCardNumber }</li>
									    	<li>결제카드회사 : ${completedPay.payCardCompany }</li>
									    	<li>결제카드유형 : ${completedPay.payCardType }</li>
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
                                        	<li><a href="/pay/completedPayList?m=${user.username }&page=${pager.startNum - 1 }"><i class="lni lni-chevron-left"></i></a></li>
                                        </c:if>
                                        <c:forEach begin="${pager.startNum }" end="${pager.lastNum }" step="1" var="i">
                                        	<li><a href="/pay/completedPayList?m=${user.username }&page=${i }">${i }</a></li>
                                        </c:forEach>
                                        <c:if test="${pager.next }">
                                        	<li><a href="/pay/completedPayList?m=${user.username }&page=${pager.lastNum + 1 }"><i class="lni lni-chevron-right"></i></a></li>
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