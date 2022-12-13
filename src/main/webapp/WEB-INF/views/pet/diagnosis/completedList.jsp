<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Completed List</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />	
    <!-- Place favicon.ico in the root directory -->

	<c:import url="../../temp/boot.jsp"></c:import>
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
    <sec:authentication property="Principal" var="user"/>
    <!-- Header -->
    <c:import url="../../temp/header.jsp"></c:import>
    
    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">완료된 진료</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>완료된 진료</li>
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
					<c:import url="./sidebar.jsp"></c:import>
                </div>
                <div class="col-lg-9 col-md-12 col-12">
                    <div class="main-content">
                        <div class="dashboard-block mt-0">
                            <h3 class="block-title">완료된 진료</h3>
                            <!-- Start Invoice Items Area -->
                            <div class="invoice-items default-list-style">
                                
                                <!-- Start Single List -->
                                <div class="single-list  my-items">
                                <!-- Start Item List Title -->
                                <div class="item-list-title">
                                    <div class="row align-items-center">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <p>진료</p>
                                        </div>
                                        <div class="col-lg-1 col-md-1 col-12">
                                            <p>분류</p>
                                        </div>
                                        <div class="col-lg-1 col-md-1 col-12">
                                            <p>상태</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>진료비</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12 align-right">
                                            <p>완료시간</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- End List Title -->
                            <c:forEach items="${completedList}" var="completed">
                             	<!-- Start Single List -->
	                            <div class="single-item-list">
		                            <div class="row align-items-center">
		                                <div class="col-lg-6 col-md-6 col-12">
		                                    <div class="item-image">
		                                        <c:if test="${completed.PDansFiles.size() > 0 }">
		                                        	<img src="/file/PETDANS/${completed.PDansFiles[0].fileName }" alt="#">
		                                        </c:if>
		                                        <c:if test="${completed.PDansFiles.size() <= 0 }">
		                                        	<img src="https://via.placeholder.com/100x100" alt="#">
		                                        </c:if>
		                                            
		                                        <div class="content">
		                                            <!-- 엄밀히 따지면 멤버변수명이 아니라 getter명이라 getter명으로 맨 앞을 대문자로 바꿨더니 된다. -->
		                                            <h3 class="title"><a href="/pet/diagnosis/completedDetail?n=${completed.PDansNum }">${completed.PUsername}</a></h3>
		                                            <span class="price">${completed.PDansReqTime}</span>
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="col-lg-1 col-md-1 col-12">
		                                    <p>${completed.PDansCategory}</p>
		                                </div>
		                                <div class="col-lg-1 col-md-1 col-12">
		                                    <p>완료</p>
		                                </div>
		                                <div class="col-lg-2 col-md-2 col-12">
		                                    <p>${completed.PDansCost }</p>
		                                </div>
		                                <div class="col-lg-2 col-md-2 col-12 align-right">
		                                    <p>${completed.PDansEndTime }</p>
		                                </div>
		                            </div>
	                            </div>
	                            <!-- End Single List -->
                            </c:forEach>
                                
                                    </div>
                                </div>
                                <!-- End Single List -->
                                <!-- Pagination -->
                                <div class="pagination left" style="margin-left: 1rem;">
                                    <ul class="pagination-list">
                                        <c:if test="${pager.pre }">
                                        	<li><a href="/pet/diagnosis/completedList?d=${user.username }&page=${pager.startNum - 1 }"><i class="lni lni-chevron-left"></i></a></li>
                                        </c:if>
                                        <c:forEach begin="${pager.startNum }" end="${pager.lastNum }" step="1" var="i">
                                        	<li><a href="/pet/diagnosis/completedList?d=${user.username }&page=${i }">${i }</a></li>
                                        </c:forEach>
                                        <c:if test="${pager.next }">
                                        	<li><a href="/pet/diagnosis/completedList?d=${user.username }&page=${pager.lastNum + 1 }"><i class="lni lni-chevron-right"></i></a></li>
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

	<!-- Footer -->
    <c:import url="../../temp/footer.jsp"></c:import>
    <!-- <script src="/js/user/profile.js"></script> -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
</body>
</html>