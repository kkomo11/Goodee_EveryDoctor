<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html class="no-js" lang="zxx">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>약처방</title>
      <meta name="description" content="" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
      <c:import url="../../temp/boot.jsp"></c:import>
      <!-- ========================= CSS here ========================= -->
      <link rel="stylesheet" href="/css/drug/drug.css" type="text/css" />
      <link rel="stylesheet" href="/css/admin/medic/chosen.css">
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
      <c:import url="../../temp/header.jsp"></c:import>

      <!-- Start Breadcrumbs -->
      <div class="breadcrumbs">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="breadcrumbs-content">
                <h1 class="page-title">조제내역</h1>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
              <ul class="breadcrumb-nav">
                <li><a href="/">Home</a></li>
                <li>조제내역</li>
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
            <div class="col-lg-12 col-md-12 col-12">
              <div class="main-content">
                <!-- Start Post Ad Block Area -->
                <div class="dashboard-block mt-0">
                  <h3 class="block-title">조제접수</h3>
                  <div class="inner-block">
                    <!-- Start Post Ad Tab -->
                    <div class="post-ad-tab">
                      <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                          <button class="nav-link active" id="nav-item-info-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-item-info" type="button" role="tab" aria-controls="nav-item-info"
                            aria-selected="true">
                            <span class="serial">01</span>
                            Step
                            <span class="sub-title">조제접수</span>
                          </button>
                          <button class="nav-link" id="nav-item-details-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-item-details" type="button" role="tab" aria-controls="nav-item-details"
                            aria-selected="false">
                            <span class="serial">02</span>
                            Step
                            <span class="sub-title">배송정보확인</span>
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
                                  <c:forEach items="${drug.prescriptionDrug}" var="drugVO">
                                    <div class="form-group">
                                      <label>처방받은 약</label>
                                       <input name="price" type="text" placeholder="PRESCRIPTIONNUM"  readonly value="${drugVO.drugName}">
                                    </div>
                                  </c:forEach>
                                  
                                </div>

                                <!-- 진료 과목 증상 리스트 가져오기 -->
                                <!-- <div class="col-12">
                                  <div class="form-group">
                                    <label>진료과목</label>
                                    <div class="selector-head">
                                      <span class="arrow"><i class="lni lni-chevron-down"></i></span> <select
                                        class="user-chosen-select">
                                        
                                        <c:forEach items="${sectionList}" var="sectionVO">
                                          <option value="${sectionVO.sectionName}" data-sub="sub1">
                                            ${drugPrescriptionVO.sectionVO.sectionName}
                                          </option>
                                        </c:forEach>
                                      </select>
                                    </div>
                                  </div>
                                </div>

                                <div class="col-12">
                                  <div class="form-group">
                                    <label>환자증상</label>
                                    <div class="selector-head">
                                      <span class="arrow"><i class="lni lni-chevron-down"></i></span> <select
                                        class="user-chosen-select">
                                        
                                        <c:forEach items="${categoryList}" var="categoryVO">
                                          <option value="${categoryVO.categoryName}" data-sub="sub1">
                                            ${drugPrescriptionVO.categoryVO.categoryName}
                                          </option>
                                        </c:forEach>
                                      </select>
                                    </div>
                                  </div>
                                </div> -->


                                <!-- 약목록 -->
                                <div class="form-group col-12">
                                  <label>약목록</label>
                                  <div class="selector-head">
                                    <select class="user-chosen-select chosen-select agencyNum" name="agencyNum">
                                      <option value="" disabled selected>약을 선택해주세요</option>
                                      <c:forEach items="${list}" var="vo">
                                        <option value="detail?drugName=${vo.drugName}" data-sub="sub1">${vo.drugName} =>
                                          ${vo.drugInfo}</option>
                                      </c:forEach>
                                    </select>
                                  </div>
                                </div>

                                <!-- 약추가 -->
                                <div class="form-group col-12">
                                  <label>약추가</label>
                                  <div class="selector-head">
                                    <select class="user-chosen-select chosen-select agencyNum" name="agencyNum">
                                      <option value="" disabled selected>약을 선택해주세요</option>
                                      <c:forEach items="${list}" var="vo">
                                        <option value="detail?drugName=${vo.drugName}" data-sub="sub1">${vo.drugName} =>
                                          ${vo.drugInfo}</option>
                                      </c:forEach>
                                    </select>
                                  </div>
                                </div>

                                <!-- 약추가 -->
                                <div class="form-group col-12">
                                  <label>약추가</label>
                                  <div class="selector-head">
                                    <select class="user-chosen-select chosen-select agencyNum" name="agencyNum">
                                      <option value="" disabled selected>약을 선택해주세요</option>
                                      <c:forEach items="${list}" var="vo">
                                        <option value="detail?drugName=${vo.drugName}" data-sub="sub1">${vo.drugName} =>
                                          ${vo.drugInfo}</option>
                                      </c:forEach>
                                    </select>
                                  </div>
                                </div>

                                <div class="col-lg-6 col-12">
                                  <label>처방전넣을수도?</label>
                                  <div class="upload-input">
                                    <input type="file" id="upload" name="upload">
                                    <!-- <label for="upload" class="text-center content">
                                      <span class="text">
                                        <span class="d-block mb-15">처방전 ???</span>
                                        <span class=" mb-15 plus-icon"><i class="lni lni-plus"></i></span>
                                        <span class="main-btn d-block btn-hover">Select
                                          File</span>
                                        <span class="d-block">Maximum upload file size
                                          10Mb</span>
                                      </span>
                                    </label> -->
                                  </div>
                                </div>

                                <div class="col-12">
                                  <div class="form-group mt-30">
                                    <label>진료상담내용</label>
                                    <textarea name="message" placeholder="DANSCONTENT(값 받아오기)">${drug.dansContent}</textarea>
                                  </div>
                                </div>

                                <!-- <div class="col-12">
                                  <div class="form-group button mb-0">
                                    <button type="submit" class="btn " id="firstPreBtn">Next Step</button>
                                  </div>
                                </div> -->
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
                                    <label>회원아이디</label>
                                    <option value="detail?userName=${username}" data-sub="sub1">${drug.username}
                                    </option>
                                     <!-- <input name="name" type="text"
                                      placeholder="Enter your name(USERNAME)"> -->
                                  </div>
                                </div>

                                <div class="col-lg-6 col-12">
                                  <div class="form-group">
                                    <label>운송장번호*(랜덤출력)</label>
                                    <input type="text" class="form-control" id="drugDeliveryNum" name="drugDeliveryNum"
                                      readonly value=${deliveryNum}>
                                  </div>
                                </div>

                                
                                <label>환자주소*</label>
                                <div class="button">
                                  <input type="button" class="btn" onclick="sample6_execDaumPostcode()"
                                    value="우편번호 찾기"><br>
                                </div>
                              

                                <div class="form-group">
                                  <input type="text" id="sample6_postcode" placeholder="우편번호">
                                  <input type="text" id="sample6_address" placeholder="주소"><br>
                                  <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                                  <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                                </div>

                                <div class="col-12">
                                  <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault">
                                      모든 이용약관 및 규칙에 동의합니다. </label>
                                  </div>
                                </div>

                                <div class="col-12">
                                  <div class="form-group button mb-0">
                                    <!-- <button type="submit" class="btn alt-btn" id="thirdPreBtn">Previous</button> -->
                                    <a href="/drug/prescription/list" button type="submit" id="drug" class="btn">처방하기</a>
                                  </div>
                                </div>

                              </div>
                            </form>
                          </div>
                          <!-- Start Post Ad Step Two Content -->
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
      <c:import url="../../temp/footer.jsp"></c:import>

      <!-- ========================= scroll-top ========================= -->
      <a href="#" class="scroll-top btn-hover"> <i class="lni lni-chevron-up"></i>
      </a>

      <!-- ========================= JS here ========================= -->
      <script src="/js/drug/address.js"></script>
      <script src="/js/admin/medic/regist.js"></script>
      <script src="/js/admin/medic/chosen.jquery.js"></script>
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </body>

    </html>