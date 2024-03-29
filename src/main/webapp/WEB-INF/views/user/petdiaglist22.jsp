<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Profile</title>
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
                <div class="col-lg-3 col-md-12 col-12">
					<c:import url="sidebar.jsp"></c:import>
                </div>
                <div class="col-lg-9 col-md-12 col-12">
                    <div class="main-content">
                        <div class="dashboard-block mt-0">
                            <h3 class="block-title mb-0">반려동물 진료내역</h3>
                            <!-- Start Invoice Items Area -->
                            <div class="invoice-items default-list-style">
                                
                                <!-- Start Single List -->
                                <div class="single-list  my-items">
                                <!-- Start Item List Title -->
                                <div class="item-list-title">
                                    <div class="row align-items-center">
                                        <div class=" col-12">
                                            <p style="font-family : Wedrive;">아롱이</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- End List Title -->
                                <!-- Start Single List -->
                                <div class="single-item-list">
                                    <div class="row align-items-center">
                                        <div class="col-lg-5 col-md-5 col-12">
                                            <div class="item-image">
                                                <img src="https://via.placeholder.com/100x100" alt="#">
                                                <div class="content">
                                                    <h3 class="title"><a href="javascript:void(0)">Brand New Iphone 11 Pro Max</a></h3>
                                                    <span class="price">$800</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>Electronic</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>New</p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12 align-right">
                                            <ul class="action-btn">
                                                <li><a href="javascript:void(0)"><i class="lni lni-pencil"></i></a></li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-eye"></i></a></li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-trash"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single List -->
                                <!-- Start Single List -->
                                <div class="single-item-list">
                                    <div class="row align-items-center">
                                        <div class="col-lg-5 col-md-5 col-12">
                                            <div class="item-image">
                                                <img src="https://via.placeholder.com/100x100" alt="#">
                                                <div class="content">
                                                    <h3 class="title"><a href="javascript:void(0)">New Ferrari F80 Car</a></h3>
                                                    <span class="price">$13000</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>Car</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>Vehicle</p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12 align-right">
                                            <ul class="action-btn">
                                                <li><a href="javascript:void(0)"><i class="lni lni-pencil"></i></a></li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-eye"></i></a></li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-trash"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single List -->
                                <!-- Start Single List -->
                                <div class="single-item-list">
                                    <div class="row align-items-center">
                                        <div class="col-lg-5 col-md-5 col-12">
                                            <div class="item-image">
                                                <img src="https://via.placeholder.com/100x100" alt="#">
                                                <div class="content">
                                                    <h3 class="title"><a href="javascript:void(0)">Rick Morton- Magicius Chase</a></h3>
                                                    <span class="price">$500</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>Electronic</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>New</p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12 align-right">
                                            <ul class="action-btn">
                                                <li><a href="javascript:void(0)"><i class="lni lni-pencil"></i></a></li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-eye"></i></a></li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-trash"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single List -->
                                <!-- Start Single List -->
                                <div class="single-item-list">
                                    <div class="row align-items-center">
                                        <div class="col-lg-5 col-md-5 col-12">
                                            <div class="item-image">
                                                <img src="https://via.placeholder.com/100x100" alt="#">
                                                <div class="content">
                                                    <h3 class="title"><a href="javascript:void(0)">HP Laptop 6560b core i7</a></h3>
                                                    <span class="price">$750</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>Electronic</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>New</p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12 align-right">
                                            <ul class="action-btn">
                                                <li><a href="javascript:void(0)"><i class="lni lni-pencil"></i></a></li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-eye"></i></a></li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-trash"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single List -->
                                </div>
                                <!-- End Single List -->
                                <!-- Start Single List -->
                                <div class="single-list">
                                    <div class="row align-items-center">
                                        <div class="col-lg-4 col-md-4 col-12">
                                            <p>Premium Package
                                                <span>$79.00</span>
                                            </p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>Apr 11,2023</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>May 23,2022</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p class="unpaid">Unpaid</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12 align-right">
                                            <ul class="action-btn">
                                                <li><a href="javascript:void(0)"><i class="lni lni-eye"></i></a></li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-trash"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single List -->
                                <!-- Start Single List -->
                                <div class="single-list my-items">
                                    <div class="row align-items-center">
                                <!-- Start Single List -->
                                <div class="single-item-list">
                                    <div class="row align-items-center">
                                        <div class="col-lg-5 col-md-5 col-12">
                                            <div class="item-image">
                                                <img src="https://via.placeholder.com/100x100" alt="#">
                                                <div class="content">
                                                    <h3 class="title"><a href="javascript:void(0)">Brand New Iphone 11 Pro Max</a></h3>
                                                    <span class="price">$800</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>Electronic</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>New</p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12 align-right">
                                            <ul class="action-btn">
                                                <li><a href="javascript:void(0)"><i class="lni lni-pencil"></i></a></li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-eye"></i></a></li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-trash"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single List -->
                                <!-- Start Single List -->
                                <div class="single-item-list">
                                    <div class="row align-items-center">
                                        <div class="col-lg-5 col-md-5 col-12">
                                            <div class="item-image">
                                                <img src="https://via.placeholder.com/100x100" alt="#">
                                                <div class="content">
                                                    <h3 class="title"><a href="javascript:void(0)">New Ferrari F80 Car</a></h3>
                                                    <span class="price">$13000</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>Car</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>Vehicle</p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12 align-right">
                                            <ul class="action-btn">
                                                <li><a href="javascript:void(0)"><i class="lni lni-pencil"></i></a></li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-eye"></i></a></li>
                                                <li><a href="javascript:void(0)"><i class="lni lni-trash"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single List -->
                                    </div>
                                </div>
                                <!-- End Single List -->
                                <!-- Pagination -->
                                <div class="pagination left">
                                    <ul class="pagination-list">
                                        <li><a href="javascript:void(0)">1</a></li>
                                        <li class="active"><a href="javascript:void(0)">2</a></li>
                                        <li><a href="javascript:void(0)">3</a></li>
                                        <li><a href="javascript:void(0)">4</a></li>
                                        <li><a href="javascript:void(0)"><i class="lni lni-chevron-right"></i></a></li>
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
    <c:import url="../temp/footer.jsp"></c:import>
    <script src="/js/user/profile.js"></script>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
</body>
</html>