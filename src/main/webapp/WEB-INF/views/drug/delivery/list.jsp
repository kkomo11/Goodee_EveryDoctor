<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <!DOCTYPE html>
    <html class="no-js" lang="zxx">

    <head>
      <meta charset="utf-8" />
      <meta http-equiv="x-ua-compatible" content="ie=edge" />
      <title>에브리닥터</title>
      <meta name="description" content="" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <link rel="stylesheet" href="/webjars/github-com-twbs-bootstrap/v3.3.7/dist/css/bootstrap.min.css">
      <link rel="stylesheet" href="/webjars/github-com-twbs-bootstrap/v3.3.7/dist/css/bootstrap-theme.css">
      <link rel="stylesheet" href="../../static/css/parcel/tracking-tropical.css">
      <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.svg" />
      <c:import url="../../temp/boot.jsp"></c:import>
      <!-- Place favicon.ico in the root directory -->

      <!-- Web Font -->
      <link
        href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
      <!-- ========================= CSS here ========================= -->
      <!-- <link rel="stylesheet" href="/css/drug/delivery.css" type="text/css" /> -->

    </head>

    <body>
    <spring:eval expression="@deliveryPropertiesFactoryBean['spring.delivery.t_key']" var="t_key"></spring:eval>
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

      <!-- Start Breadcrumbs -->
      <div class="breadcrumbs">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="breadcrumbs-content">
                <h1 class="page-title">배송조회</h1>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
              <ul class="breadcrumb-nav">
                <li><a href="index.html">Home</a></li>
                <li>배송조회</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!-- End Breadcrumbs -->

      <!-- Header -->
      <c:import url="../../temp/header.jsp"></c:import>

      <!-- start login section -->
      <section class="login section">
        <div class="container">
          <div class="row">
            <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
              <div class="form-head">
                <h4 class="title">배송조회</h4>
                <!-- <form action="http://info.sweettracker.co.kr/tracking/5" method="post"> -->
                <form action="http://localhost/drug/delivery/detail" method="get">
                  <div class="form-group">
                    <!-- <label for="t_key">API key</label> -->
                    <input type="hidden" class="form-control" id="t_key" name="t_key" value="${t_key}">
                  </div>
                  <div class="form-group">
                    <label for="t_code">택배사 코드</label>
                    <input type="text" class="form-control" name="t_code" id="t_code" placeholder="택배사 코드">
                  </div>
                  <div class="form-group">
                    <label for="t_invoice">운송장 번호</label>
                    <input type="text" class="form-control" name="t_invoice" id="t_invoice" placeholder="운송장 번호">
                  </div>

                  <div class="button">
                    <button type="submit" class="btn">조회하기</button>
                  </div>

                </form>
              </div>
            </div>
          </div>
        </div>
      </section>

    </body>

    <!-- Footer -->
    <c:import url="../../temp/footer.jsp"></c:import>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover"> <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="/js/drug/delivery.js"></script>
    </body>

    </html>