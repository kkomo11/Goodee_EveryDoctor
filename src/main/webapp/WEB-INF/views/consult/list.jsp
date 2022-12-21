<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Consult List</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="/css/consult/list.css">
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
                        <h1 class="page-title">무료 상담 목록</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>Consult List</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Items Listing List -->
    <section class="category-page section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-4 col-12">
                    <div class="category-sidebar">
                    	<sec:authorize access="isAuthenticated()">
                        	<sec:authentication property="Principal" var="member"/>
                        	<a id="consultWriteBtn" href="/consult/write" class="btn btn-primary" role="button">무료 상담 신청</a>
                        </sec:authorize>
                        <sec:authorize access="!isAuthenticated()">
                        	<a id="consultWriteBtn" href="/user/login" class="btn btn-primary" role="button">무료 상담 신청</a>
                        </sec:authorize>

                        <!-- Start Single Widget -->
                        <div class="single-widget">
                            <h3>카테고리</h3>
                            <ul class="list">
                                <c:forEach items="${categories }" var="category">
                                	<li>
                                    	<a href="/consult/list?kind=category&search=${category.categoryNum }">
                                    		<c:if test="${category.categoryIcon != null }">
                                    			<img class="categoryIconImg" src="${category.categoryIcon }">
                                    		</c:if>
                                    		${category.categoryName }
                                    	</a>
                                	</li>
                                </c:forEach>
                            </ul>
                        </div>
                        <!-- End Single Widget -->
                    </div>
                </div>
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="category-grid-list">
                        <div class="row">
                            <div class="col-12">
                                <div class="category-grid-topbar">
                                    <div class="row align-items-center">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <h3 class="title">정렬</h3>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <nav>
                                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                    <button class="nav-link" id="nav-grid-tab" data-bs-toggle="tab"
                                                        data-bs-target="#nav-grid" type="button" role="tab"
                                                        aria-controls="nav-grid" aria-selected="false"><i
                                                            class="lni lni-grid-alt"></i></button>
                                                    <button class="nav-link active" id="nav-list-tab"
                                                        data-bs-toggle="tab" data-bs-target="#nav-list" type="button"
                                                        role="tab" aria-controls="nav-list" aria-selected="true"><i
                                                            class="lni lni-list"></i></button>
                                                </div>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-content" id="nav-tabContent">
                                    <div class="tab-pane fade" id="nav-grid" role="tabpanel"
                                        aria-labelledby="nav-grid-tab">
                                        <div class="row">
                                        	<c:forEach items="${consultList }" var="consultItem">
                                        		<div class="col-lg-4 col-md-6 col-12">
	                                                <!-- Start Single Item -->
	                                                <div class="single-item-grid">
	                                                    <div class="image">
	                                                        <a href="/consult/detail?consultNum=${consultItem.consultNum }">
	                                                        	<c:if test="${consultItem.consultFiles.size() > 0 }">
			                                                    	<img src="/file/CONSULT/${consultItem.consultFiles[0].fileName }" alt="#">
			                                                    </c:if>
			                                                    <c:if test="${consultItem.consultFiles.size() <= 0 }">
			                                                    	<img src="/images/pet/home/website_icon.svg" alt="#" style="height: 10rem;">
			                                                    </c:if>
	                                                        </a>
	                                                        <i class=" cross-badge lni lni-bolt"></i>
	                                                        	<c:if test="${consultItem.consultKind == 0 }">
	                                                        		<span class="flat-badge sale">병원</span>
	                                                        	</c:if>
	                                                        	<c:if test="${consultItem.consultKind == 1 }">
	                                                        		<span class="flat-badge sale">동물병원</span>
	                                                        	</c:if>
	                                                    </div>
	                                                    <div class="content">
	                                                        <a href="/consult/detail?consultNum=${consultItem.consultNum }" class="tag">${consultItem.username }</a>
	                                                        <h3 class="title">
	                                                            <a href="/consult/detail?consultNum=${consultItem.consultNum }">${consultItem.consultTitle }</a>
	                                                        </h3>
	                                                        <p class="location"><a href="/consult/detail?consultNum=${consultItem.consultNum }">
	                                                        	<c:if test="${consultItem.hospitalCategoryVO[0].categoryIcon != null }">
	                                                        		<img class="categoryIconImg" alt="" src="${consultItem.hospitalCategoryVO[0].categoryIcon }">
	                                                        	</c:if>
	                                                        ${consultItem.hospitalCategoryVO[0].categoryName }</a>
	                                                        </p>
	                                                        <ul class="info">
	                                                            <li class="price">${consultItem.consultReqDate }</li>
	                                                            <li class="like"><a href="/consult/detail?consultNum=${consultItem.consultNum }"><i
	                                                                        class="lni lni-heart"></i></a>
	                                                            </li>
	                                                        </ul>
	                                                    </div>
	                                                </div>
	                                                <!-- End Single Item -->
	                                            </div>
                                        	</c:forEach>

                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <!-- Pagination -->
                                                <div class="pagination left">
                                                    <ul class="pagination-list">
                                                    	<c:if test="${pager.pre }">
                                                    		<li><a href="/consult/list?page=${pager.startNum - 1 }"><i class="lni lni-chevron-left"></i></a></li>
                                                    	</c:if>
                                                        <c:forEach begin="${pager.startNum }" end="${pager.lastNum }" step="1" var="i">
                                                        	<li><a href="/consult/list?page=${i }">${i }</a></li>
                                                        </c:forEach>
                                                        <c:if test="${pager.next }">
                                                        	<li><a href="/consult/list?page=${pager.lastNum + 1 }"><i class="lni lni-chevron-right"></i></a></li>
                                                        </c:if>
                                                    </ul>
                                                </div>
                                                <!--/ End Pagination -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade show active" id="nav-list" role="tabpanel"
                                        aria-labelledby="nav-list-tab">
                                        <div class="row">
                                        	<c:forEach items="${consultList }" var="consultItem">
                                        		<div class="col-lg-12 col-md-12 col-12">
	                                                <!-- Start Single Item -->
	                                                <div class="single-item-grid">
	                                                	<div class="row align-items-center">
	                                                		<div class="col-lg-5 col-md-7 col-12">
			                                                    <div class="image">
			                                                        <a href="/consult/detail?consultNum=${consultItem.consultNum }">
			                                                        	<c:if test="${consultItem.consultFiles.size() > 0 }">
			                                                        		<img src="/file/CONSULT/${consultItem.consultFiles[0].fileName }" alt="#">
			                                                        	</c:if>
			                                                        	<c:if test="${consultItem.consultFiles.size() <= 0 }">
			                                                        		<img src="/images/pet/home/website_icon.svg" alt="#" style="height: 10rem;">
			                                                        	</c:if>

			                                                        </a>
			                                                        <i class=" cross-badge lni lni-bolt"></i>
			                                                        	<c:if test="${consultItem.consultKind == 0 }">
			                                                        		<span class="flat-badge sale">병원</span>
			                                                        	</c:if>
			                                                        	<c:if test="${consultItem.consultKind == 1 }">
			                                                        		<span class="flat-badge sale">동물병원</span>
			                                                        	</c:if>
			                                                    </div>
		                                                    </div>
		                                                    <div class="col-lg-5 col-md-7 col-12">
			                                                    <div class="content">
			                                                        <a href="/consult/detail?consultNum=${consultItem.consultNum }" class="tag">${consultItem.username }</a>
			                                                        <h3 class="title">
			                                                            <a href="/consult/detail?consultNum=${consultItem.consultNum }">${consultItem.consultTitle }</a>
			                                                        </h3>
			                                                        <p class="location"><a href="/consult/detail?consultNum=${consultItem.consultNum }">
			                                                        	<c:if test="${consultItem.hospitalCategoryVO[0].categoryIcon != null }">
			                                                        		<img class="categoryIconImg" alt="" src="${consultItem.hospitalCategoryVO[0].categoryIcon }">
			                                                        	</c:if>
			                                                        ${consultItem.hospitalCategoryVO[0].categoryName }</a>
			                                                        </p>
			                                                        <ul class="info">
			                                                            <li class="price">${consultItem.consultReqDate }</li>
			                                                            <li class="like"><a href="/consult/detail?consultNum=${consultItem.consultNum }"><i
			                                                                        class="lni lni-heart"></i></a>
			                                                            </li>
			                                                        </ul>
			                                                    </div>
		                                                    </div>
	                                                    </div>
	                                                </div>
	                                                <!-- End Single Item -->
	                                            </div>
                                        	</c:forEach>

                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <!-- Pagination -->
                                                <div class="pagination left">
                                                    <ul class="pagination-list">
                                                    	<c:if test="${pager.pre }">
                                                    		<li><a href="/consult/list?page=${pager.startNum - 1 }"><i class="lni lni-chevron-left"></i></a></li>
                                                    	</c:if>
                                                        <c:forEach begin="${pager.startNum }" end="${pager.lastNum }" step="1" var="i">
                                                        	<li><a href="/consult/list?page=${i }">${i }</a></li>
                                                        </c:forEach>
                                                        <c:if test="${pager.next }">
                                                        	<li><a href="/consult/list?page=${pager.lastNum + 1 }"><i class="lni lni-chevron-right"></i></a></li>
                                                        </c:if>
                                                    </ul>
                                                </div>
                                                <!--/ End Pagination -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Items Listing List -->

    <!-- Start Footer Area -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>


</body>

</html>