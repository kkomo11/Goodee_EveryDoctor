<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html class="no-js" lang="zxx">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>진료내역</title>
      <meta name="description" content="" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <c:import url="../../temp/boot.jsp"></c:import>
      <!-- ========================= CSS here ========================= -->
      <link rel="stylesheet" href="/css/drug/drug.css" type="text/css" />
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
            <span></span> <span></span>
          </div>
        </div>
      </div>
      <!-- /End Preloader -->

      <!-- Header -->
      <c:import url="../../temp/header.jsp"></c:import>

      <!-- Start Breadcrumbs -->
      <div class="breadcrumbs">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="breadcrumbs-content">
                <h1 class="page-title">요청된 조제내역</h1>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
              <ul class="breadcrumb-nav">
                <li><a href="/">Home</a></li>
                <li>요청된 조제내역</li>
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
              <c:import url="../../user/sidebar.jsp"></c:import>
                    </div>
              <!-- Start Dashboard Sidebar -->
            <div class="col-lg-9 col-md-12 col-12">
              <div class="main-content">
                <div class="dashboard-block mt-0">
                  <!-- <button id="alertStart">성공버튼</button>
                  <button id="errorStart">실패버튼</button>
                  <button id="confirmStart">정말 할거야?</button> -->
                  <h3 class="block-title">요청된 조제 내역</h3>

                  <!-- Start Items Area -->
                  <div class="my-items">
                    <!-- Start List Title -->
                    <div class="item-list-title">
                      <div class="row align-items-center">
                        <div class="col-lg-5 col-md-5 col-12">
                          <p>환자명</p>
                        </div>
                        <div class="col-lg-2 col-md-2 col-12">
                          <p>시간</p>
                        </div>
                        <div class="col-lg-2 col-md-2 col-12">
                          <p>주소</p>
                        </div>
                        <div class="col-lg-3 col-md-3 col-12 align-right">
                          <p>조제상태</p>
                        </div>
                      </div>
                    </div>
                    <!-- End List Title -->
                    
                    <!-- Start Single List -->
                    <div class="single-item-list">
                      <div class="row align-items-center">
                        <div class="col-lg-5 col-md-5 col-12">
                          <div class="item-image">
                            <img src="/images/hospital/manager.jpg" alt="#">
                            <img src="https://via.placeholder.com/100x100" alt="#">
                            <div class="content">
                              <h7 class="title"><a href="/drug/prescription/detail">이주은매니저${drugPrescriptionVO.userVO.username}</a></h7>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-12">
                          <p>Car</p>
                        </div>
                        <div class="col-lg-2 col-md-2 col-12">
                          <p>Vehicle</p>
                        </div>
                        <div class="col-lg-3 col-md-2 col-12 align-right">
                          <ul class="action-btn">
                            <li><a href="javascript:void(0)"><i class="lni lni-eye"></i></a></li>  
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
                    <!-- 페이징처리 -->
                    <!-- <div class="pagination left">
                        <nav aria-label="Page navigation example">
                          <ul class="pagination-list">
                            <c:if test="${pager.pre}">
                              <li class="page-item"><a class="page-link"
                                  href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">Previous</a>
                              </li>
                            </c:if>
                            <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                              <li class="page-item"><a class="page-link"
                                  href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
                            </c:forEach>
                            <li class="page-item ${pager.next?'':'disabled'}"><a class="page-link"
                                href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">Next</a>
                            </li>
                          </ul>
                        </nav>
                      </div> -->
                  </div>
                  <!-- End Items Area -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End Dashboard Section -->

      <!-- Footer -->
      <c:import url="../../temp/footer.jsp"></c:import>

      <!-- ========================= scroll-top ========================= -->
      <a href="#" class="scroll-top btn-hover"> <i class="lni lni-chevron-up"></i>
      </a>

      <!-- ========================= JS here ========================= -->
      <!-- <script src="/js/drug.js"></script> -->
      <script src="/js/drug/address.js"></script>
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </body>

    </html>