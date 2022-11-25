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
      <!-- Place favicon.ico in the root directory -->

      <!-- Web Font -->
      <link
        href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

      <!-- ========================= CSS here ========================= -->
      <link rel="stylesheet" href="/css/bootstrap.min.css" />
      <link rel="stylesheet" href="/css/LineIcons.2.0.css" />
      <link rel="stylesheet" href="/css/animate.css" />
      <link rel="stylesheet" href="/css/tiny-slider.css" />
      <link rel="stylesheet" href="/css/glightbox.min.css" />
      <link rel="stylesheet" href="/css/main.css" />

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
                <h1 class="page-title">Drug List</h1>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
              <ul class="breadcrumb-nav">
                <li><a href="index.html">Home</a></li>
                <li>Drug List</li>
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
                  <h3 class="block-title">
                    <!-- 검색창 -->
                    <nav class="navbar bg-light">
                      <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                      </form>
                    </nav>
                  </h3>
                  <div class="inner-block">
                    <!-- 약목록 -->
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>약번호</th>
                          <th>약이름</th>
                          <th>약정보</th>
                          <th>약사용법</th>
                          <th>약주의사항</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${list}" var="vo">
                          <tr>
                            <td>${vo.drugNum}</td>
                            <td>${vo.drugName}</td>
                            <td>${vo.drugInfo}</td>
                            <td>${vo.drugUse}</td>
                            <td>${vo.drugCare}</td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
<!-- 페이징 처리 -->
                    <nav aria-label="Page navigation example">
                      <ul class="pagination">
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

                    <!-- Start Post Ad Tab -->
                    <div class="post-ad-tab">
                      <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                          <button class="nav-link active" id="nav-item-info-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-item-info" type="button" role="tab" aria-controls="nav-item-info"
                            aria-selected="true">
                            <span class="serial">01</span> Step <span class="sub-title">Ad
                              Information</span>
                          </button>
                          <button class="nav-link" id="nav-item-details-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-item-details" type="button" role="tab" aria-controls="nav-item-details"
                            aria-selected="false">
                            <span class="serial">02</span> Step <span class="sub-title">Ad
                              Details</span>
                          </button>
                          <button class="nav-link" id="nav-user-info-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-user-info" type="button" role="tab" aria-controls="nav-user-info"
                            aria-selected="false">
                            <span class="serial">03</span> Step <span class="sub-title">User
                              Information</span>
                          </button>
                        </div>
                      </nav>
                      <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-item-info" role="tabpanel"
                          aria-labelledby="nav-item-info-tab">
                          <!-- Start Post Ad Step One Content -->
                          <div class="step-one-content">
                            <form class="default-form-style" method="post" action="#">
                              <div class="row">
                                <div class="col-12">
                                  <div class="form-group">
                                    <label>Add Title*</label> <input name="title" type="text" placeholder="Enter Title">
                                  </div>
                                </div>
                                <div class="col-12">
                                  <div class="form-group">
                                    <label>Category*</label>
                                    <div class="selector-head">
                                      <span class="arrow"><i class="lni lni-chevron-down"></i></span> <select
                                        class="user-chosen-select">
                                        <option value="none">Select a Category</option>
                                        <option value="none">Mobile Phones</option>
                                        <option value="none">Electronics</option>
                                        <option value="none">Computers</option>
                                        <option value="none">Headphones</option>
                                        <option value="none">Furnitures</option>
                                        <option value="none">Books</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-12">
                                  <div class="form-group button mb-0">
                                    <button type="submit" class="btn ">Next Step</button>
                                  </div>
                                </div>
                              </div>
                            </form>
                          </div>
                          <!-- Start Post Ad Step One Content -->
                        </div>
                        <div class="tab-pane fade" id="nav-item-details" role="tabpanel"
                          aria-labelledby="nav-item-details-tab">
                          <!-- Start Post Ad Step Two Content -->
                          <div class="step-two-content">
                            <form class="default-form-style" method="post" action="#">
                              <div class="row">
                                <div class="col-12">
                                  <div class="form-group">
                                    <label>Add Price*</label> <input name="price" type="text" placeholder="Enter Price">
                                  </div>
                                </div>
                                <div class="col-12">
                                  <div class="form-group">
                                    <label>Price Type*</label>
                                    <div class="selector-head">
                                      <span class="arrow"><i class="lni lni-chevron-down"></i></span> <select
                                        class="user-chosen-select">
                                        <option value="none">Select an option</option>
                                        <option value="none">Fixed</option>
                                        <option value="none">Price On Call</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-12">
                                  <div class="form-group">
                                    <label>Select Currency*</label>
                                    <div class="selector-head">
                                      <span class="arrow"><i class="lni lni-chevron-down"></i></span> <select
                                        class="user-chosen-select">
                                        <option value="none">Select an option</option>
                                        <option value="none">Dollar</option>
                                        <option value="none">Euro</option>
                                        <option value="none">Rupee</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                  <div class="upload-input">
                                    <input type="file" id="upload" name="upload"> <label for="upload"
                                      class="text-center content"> <span class="text"> <span class="d-block mb-15">Drop
                                          files anywhere to Upload</span> <span class=" mb-15 plus-icon"><i
                                            class="lni lni-plus"></i></span> <span
                                          class="main-btn d-block btn-hover">Select File</span>
                                        <span class="d-block">Maximum upload file size
                                          10Mb</span>
                                      </span>
                                    </label>
                                  </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                  <div class="form-group">
                                    <label class="video-label">Video Link* <span>Input
                                        only YouTube & Vimeo</span></label> <input name="video" type="text"
                                      placeholder="Input link"> <a href="javascript:void(0)" class="add-video"><i
                                        class="lni lni-plus"></i> Add Video</a>
                                  </div>
                                </div>
                                <div class="col-12">
                                  <div class="form-group mt-30">
                                    <label>Ad Description*</label>
                                    <textarea name="message" placeholder="Input ad description"></textarea>
                                  </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                  <div class="form-group">
                                    <label>Type of Ad*</label>
                                    <div class="selector-head">
                                      <span class="arrow"><i class="lni lni-chevron-down"></i></span> <select
                                        class="user-chosen-select">
                                        <option value="none">Select an option</option>
                                        <option value="none">Option 1</option>
                                        <option value="none">Option 2</option>
                                        <option value="none">Option 3</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                  <div class="form-group">
                                    <label>Item Condition*</label>
                                    <div class="selector-head">
                                      <span class="arrow"><i class="lni lni-chevron-down"></i></span> <select
                                        class="user-chosen-select">
                                        <option value="none">Select an option</option>
                                        <option value="none">Used</option>
                                        <option value="none">Brand New</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-12">
                                  <div class="form-group">
                                    <label class="tag-label">Tags* <span>Comma(,)
                                        separated</span></label> <input name="tag" type="text"
                                      placeholder="Type Product tag">
                                  </div>
                                </div>
                                <div class="col-12">
                                  <div class="form-group button mb-0">
                                    <button type="submit" class="btn alt-btn">Previous</button>
                                    <button type="submit" class="btn ">Next Step</button>
                                  </div>
                                </div>
                              </div>
                            </form>
                          </div>
                          <!-- Start Post Ad Step Two Content -->
                        </div>
                        <div class="tab-pane fade" id="nav-user-info" role="tabpanel"
                          aria-labelledby="nav-user-info-tab">
                          <!-- Start Post Ad Step Three Content -->
                          <div class="step-three-content">
                            <form class="default-form-style" method="post" action="#">
                              <div class="row">
                                <div class="col-lg-6 col-12">
                                  <div class="form-group">
                                    <label>Name*</label> <input name="name" type="text" placeholder="Enter your name">
                                  </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                  <div class="form-group">
                                    <label>Mobile Numbe*</label> <input name="number" type="text"
                                      placeholder="Enter mobile number">
                                  </div>
                                </div>
                                <div class="col-12">
                                  <div class="form-group">
                                    <label>Country*</label>
                                    <div class="selector-head">
                                      <span class="arrow"><i class="lni lni-chevron-down"></i></span> <select
                                        class="user-chosen-select">
                                        <option value="none">Select a Country</option>
                                        <option value="none">Afghanistan</option>
                                        <option value="none">America</option>
                                        <option value="none">Albania</option>
                                        <option value="none">Bangladesh</option>
                                        <option value="none">Brazil</option>
                                        <option value="none">India</option>
                                        <option value="none">South Africa</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                  <div class="form-group">
                                    <label>Select City*</label>
                                    <div class="selector-head">
                                      <span class="arrow"><i class="lni lni-chevron-down"></i></span> <select
                                        class="user-chosen-select">
                                        <option value="none">Select City</option>
                                        <option value="none">New York</option>
                                        <option value="none">Los Angeles</option>
                                        <option value="none">Chicago</option>
                                        <option value="none">San Diego</option>
                                        <option value="none">San Jose</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-lg-6 col-12">
                                  <div class="form-group">
                                    <label>Select State*</label>
                                    <div class="selector-head">
                                      <span class="arrow"><i class="lni lni-chevron-down"></i></span> <select
                                        class="user-chosen-select">
                                        <option value="none">Select State</option>
                                        <option value="none">New York</option>
                                        <option value="none">Texas</option>
                                        <option value="none">Arizona</option>
                                        <option value="none">Florida</option>
                                        <option value="none">Washington</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-12">
                                  <div class="form-group">
                                    <label>Address*</label> <input name="address" type="text"
                                      placeholder="Enter a location">
                                  </div>
                                </div>
                                <div class="col-12">
                                  <div class="google-map">
                                    <div class="mapouter">
                                      <div class="gmap_canvas">
                                        <iframe width="100%" height="300" id="gmap_canvas"
                                          src="https://maps.google.com/maps?q=2880%20Broadway,%20New%20York&t=&z=13&ie=UTF8&iwloc=&output=embed"
                                          frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                                        <a href="https://123movies-to.org"></a><br>
                                        <style>
                                          .mapouter {
                                            position: relative;
                                            text-align: right;
                                            height: 300px;
                                            width: 100%;
                                          }
                                        </style>
                                        <a href="https://www.embedgooglemap.net">embed
                                          google maps wordpress</a>
                                        <style>
                                          .gmap_canvas {
                                            overflow: hidden;
                                            background: none !important;
                                            height: 300px;
                                            width: 100%;
                                          }
                                        </style>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-12">
                                  <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault">
                                      I agree to all Terms of Use & Posting Rules </label>
                                  </div>
                                  <div class="form-group button mb-0">
                                    <button type="submit" class="btn alt-btn">Previous</button>
                                    <button type="submit" class="btn ">Submit Ad</button>
                                  </div>
                                </div>
                              </div>
                            </form>
                          </div>
                          <!-- Start Post Ad Step Three Content -->
                        </div>
                      </div>
                    </div>
                    <!-- End Post Ad Tab -->
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
      <script src="/js/bootstrap.min.js"></script>
      <script src="/js/wow.min.js"></script>
      <script src="/js/tiny-slider.js"></script>
      <script src="/js/glightbox.min.js"></script>
      <script src="/js/main.js"></script>
      <script src="/js/drug.js"></script>
    </body>

    </html>