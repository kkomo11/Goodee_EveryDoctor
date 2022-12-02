<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html class="no-js" lang="zxx">

    <head>
      <meta charset="UTF-8">
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>EveryDoctor</title>
      <c:import url="../../temp/boot.jsp"></c:import>
      <!-- ========================= CSS here ========================= -->
      <link rel="stylesheet" href="/webjars/github-com-twbs-bootstrap/v3.3.7/dist/css/bootstrap.min.css">
      <link rel="stylesheet" href="/webjars/github-com-twbs-bootstrap/v3.3.7/dist/css/bootstrap-theme.css">
      <link rel="stylesheet" href="../../static/css/parcel/tracking-sky.css">
      <link rel="stylesheet" href="/css/drug/delivery.css" type="text/css" />
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
                <li><a href="/">Home</a></li>
                <li>배송조회</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!-- End Breadcrumbs -->

      <!-- Header -->
      <c:import url="../../temp/header.jsp"></c:import>

      <!-- <div class="header-area">스마트택배 배송조회</div> -->
      <div class="title-border"></div>
      <div class="title-content">
        <div class="title-notice">운송장 번호</div>
        <div class="title-invoice">1234567890</div>
        <div class="title-company">CJ대한통운</div>
      </div>

      <div class="col-xs-12 info-area no-padding">
        <div class="info-back-line">

          <div class="col-xs-15 text-center">
            <img src="/resources/static/images/drug/ic_sky_delivery_step1_off.png" class="parcel-img">
            <div class="info-parcel-text-none">상품인수</div>
          </div>

          <div class="col-xs-15 text-center">
            <img src="../../static/images/drug/ic_sky_delivery_step2_off.svg" class="parcel-img">
            <div class="info-parcel-text-active">상품이동중</div>
          </div>

          <div class="col-xs-15 text-center">
            <img src="../../static/images/drug/ic_sky_delivery_step3_off.svg" class="parcel-img">
            <div class="info-parcel-text-none">배송지도착</div>
          </div>

          <div class="col-xs-15 text-center">
            <img src="../../static/images/drug/ic_sky_delivery_step4_off.svg" class="parcel-img">
            <div class="info-parcel-text-none">배송출발</div>
          </div>

          <div class="col-xs-15 text-center">
            <img src="../../static/images/drug/ic_sky_delivery_step5_off.svg" class="parcel-img">
            <div class="info-parcel-text-none">배송완료</div>
          </div>
        </div>
      </div>

      <div class="col-xs-12 tracking-status-item-list" style="padding-left: 0px; padding-right: 0px;">
        <div class="tracking-status-item">
          <div class="list-circle"></div>
          <span class="location-text">이천</span> | <span class="status-text">간선하차</span>
          <div class="time-text">2022-11-29 08:43:24</div>
          <div class="vertical-line"></div>
        </div>
        <div class="tracking-status-item">
          <div class="list-circle"></div>
          <span class="location-text">광진A</span> | <span class="status-text">간선하차</span>
          <div class="time-text">2022-11-26 07:05:23</div>
          <div class="vertical-line"></div>
        </div>
        <div class="tracking-status-item">
          <div class="list-circle"></div>
          <span class="location-text">곤지암Hub</span> | <span class="status-text">간선하차</span>
          <div class="time-text">2022-11-26 06:23:01</div>
          <div class="vertical-line" style="top:110px"></div>
        </div>
        <div class="tracking-status-item">
          <div class="list-circle"></div>
          <span class="location-text">곤지암Hub</span> | <span class="status-text">간선하차</span>
          <div class="time-text">2022-11-25 23:33:51</div>
          <div class="vertical-line" style="top:185px"></div>
        </div>
        <div class="tracking-status-item">
          <div class="list-circle"></div>
          <span class="location-text">곤지암Hub</span> | <span class="status-text">간선하차</span>
          <div class="time-text">2022-11-25 23:25:29</div>
          <div class="vertical-line" style="top:260px"></div>
        </div>
      </div>
      <div class="col-xs-12 notice-area">
        <img src="../../static/images/banner/ic_info-24px.png" style="width:20px; margin-right: 5px;">
        <span class="template-notice">

          배송 정보 제공 : 스윗트래커 스마트택배API
        </span>
      </div>
      <div class="col-xs-12 banner-area" style="text-align: center">
        <img src="../../static/images/drug/banner_sky.png" style="width: 100%; max-width: 450px; cursor: pointer"
          class="download-img">
      </div>
      <script src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
      <script src="/webjars/github-com-twbs-bootstrap/v3.3.7/dist/js/bootstrap.min.js"></script>

      <!-- Footer -->
      <c:import url="../../temp/footer.jsp"></c:import>

      <!-- ========================= scroll-top ========================= -->
      <a href="#" class="scroll-top btn-hover"> <i class="lni lni-chevron-up"></i>
      </a>

      <!-- ========================= JS here ========================= -->
      <script src="/js/drug/delivery.js"></script>
    </body>

    </html>