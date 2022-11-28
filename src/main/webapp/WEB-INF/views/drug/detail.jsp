<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html class="no-js" lang="zxx">

    <head>
      <meta charset="utf-8" />
      <meta http-equiv="x-ua-compatible" content="ie=edge" />
      <title>에브리닥터</title>
      <meta name="description" content="" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.svg" />
      <c:import url="../temp/boot.jsp"></c:import>
      <!-- Place favicon.ico in the root directory -->

      <!-- Web Font -->
      <link
        href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

      <!-- ========================= CSS here ========================= -->
      <link rel="stylesheet" href="/css/drug/drug.css" type="text/css"/>

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
      <c:import url="../temp/header.jsp"></c:import>

      <!-- Start Breadcrumbs -->
      <div class="breadcrumbs">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="breadcrumbs-content">
                <h1 class="page-title">약 상세정보</h1>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
              <ul class="breadcrumb-nav">
                <li><a href="index.html">Home</a></li>
                <li>약 상세정보</li>
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
            <div class="col-lg-9 col-md-8 col-12">
              <div class="main-content">
                <!-- Start Post Ad Block Area -->
                <div class="dashboard-block mt-0">

                  <div class="inner-block">
                    <!-- 약목록 -->
                    <table class="table table-striped">

                      <tr class="table-danger">
                        <th>약정보</th>
                        <th>약사용법</th>
                        <th>약주의사항</th>
                      </tr>
                    
                        <tr class="table-info">
                          <td>${detail.drugInfo}</td>
                          <td>${detail.drugUse}</td>
                          <td>${detail.drugCare}</td>
                        </tr>

                    </table>
                  </div>
                </div>
                <!-- End Post Ad Block Area -->
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End Dashboard Section -->

      <!-- Footer -->
      <c:import url="../temp/footer.jsp"></c:import>

      <!-- ========================= scroll-top ========================= -->
      <a href="#" class="scroll-top btn-hover"> <i class="lni lni-chevron-up"></i>
      </a>

      <!-- ========================= JS here ========================= -->
      <script src="/js/drug.js"></script>
    </body>

    </html>