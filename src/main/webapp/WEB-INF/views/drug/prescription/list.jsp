<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html class="no-js" lang="zxx">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>EveryDoctor</title>
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
                <h1 class="page-title">약 처방(약사 페이지)</h1>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
              <ul class="breadcrumb-nav">
                <li><a href="/">Home</a></li>
                <li>약 처방</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!-- End Breadcrumbs -->

      <!-- Start Dashboard Section -->
      <section class="dashboard section">
        <!-- Start Post Ad Tab -->
        <div class="post-ad-tab">
          <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
              <button class="nav-link active" id="nav-item-info-tab" data-bs-toggle="tab"
                data-bs-target="#nav-item-info" type="button" role="tab" aria-controls="nav-item-info"
                aria-selected="true">
                <span class="serial">01</span> Step <span class="sub-title">조제접수</span>
              </button>

              <button class="nav-link" id="nav-item-details-tab" data-bs-toggle="tab" data-bs-target="#nav-item-details"
                type="button" role="tab" aria-controls="nav-item-details" aria-selected="false">
                <span class="serial">02</span> Step <span class="sub-title">조제내역</span>
              </button>

              <button class="nav-link" id="nav-user-info-tab" data-bs-toggle="tab" data-bs-target="#nav-user-info"
                type="button" role="tab" aria-controls="nav-user-info" aria-selected="false">
                <span class="serial">03</span> Step <span class="sub-title">배송정보확인</span>
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
                        <label>전담의사명</label> <input name="title" type="text" placeholder="Enter Title(값 받아오기)">
                      </div>
                    </div>

                    <div class="col-12">
                      <div class="form-group">
                        <label>처방전번호</label> <input name="title" type="text" placeholder="Enter Title(값 받아오기)">
                      </div>
                    </div>

                    <div class="col-12">
                      <div class="form-group">
                        <label>진료번호</label> <input name="title" type="text" placeholder="Enter Title(값 받아오기)">
                      </div>
                    </div>

                    <div class="col-12">
                      <div class="form-group">
                        <label>진료과목</label>
                        <div class="selector-head">
                          <span class="arrow"><i class="lni lni-chevron-down"></i></span> <select
                            class="user-chosen-select">
                            <!-- 증상 리스트 가져오기 -->
                            <c:forEach items="${sectionList}" var="sectionVO">
                              <option value="${sectionVO.sectionName}" data-sub="sub1">${sectionVO.sectionName}
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
                            <!-- 증상 리스트 가져오기 -->
                            <c:forEach items="${categoryList}" var="categoryVO">
                              <option value="${categoryVO.categoryName}" data-sub="sub1">${categoryVO.categoryName}
                              </option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
              <!-- Start Post Ad Step One Content -->
            </div>
            <div class="tab-pane fade" id="nav-item-details" role="tabpanel" aria-labelledby="nav-item-details-tab">
              <!-- Start Post Ad Step Two Content -->
              <div class="step-two-content">
                <form class="default-form-style" method="post" action="#">
                  <div class="row">
                    <div class="col-12">
                      <div class="form-group">
                        <label>처방 받은 약리스트</label> <input name="price" type="text" placeholder="Enter Price">
                      </div>
                    </div>
                    <!-- 약 상세 리스트로 이동 -->
                    <div class="button">
                      <a href="/drug/list" button type="submit" class="btn">뭔약인데</a>
                    </div>
                    <!-- 약목록 -->
                    <div class="col-12">
                      <div class="form-group">
                        <label>약목록</label>
                        <div class="selector-head">
                          <span class="arrow"><i class="lni lni-chevron-down"></i></span> <select
                            class="user-chosen-select">
                            <c:forEach items="${list}" var="vo">
                              <option value="detail?drugName=${vo.drugName}" data-sub="sub1">${vo.drugName}</option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                    </div>
                    <!-- 약추가 -->
                    <div class="col-12">
                      <div class="form-group">
                        <label>약추가</label>
                        <div class="selector-head">
                          <span class="arrow"><i class="lni lni-chevron-down"></i></span> <select
                            class="user-chosen-select">
                            <c:forEach items="${list}" var="vo">
                              <option value="detail?drugName=${vo.drugName}" data-sub="sub1">${vo.drugName}</option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                    </div>

                    <div class="col-lg-6 col-12">
                      <div class="upload-input">
                        <input type="file" id="upload" name="upload"> <label for="upload" class="text-center content">
                          <span class="text"> <span class="d-block mb-15">Drop
                              files anywhere to Upload</span> <span class=" mb-15 plus-icon"><i
                                class="lni lni-plus"></i></span> <span class="main-btn d-block btn-hover">Select
                              File</span>
                            <span class="d-block">Maximum upload file size
                              10Mb</span>
                          </span>
                        </label>
                      </div>
                    </div>

                    <div class="col-12">
                      <div class="form-group mt-30">
                        <label>진료상담내용</label>
                        <textarea name="message" placeholder="Input ad description(값 받아오기)"></textarea>
                      </div>
                    </div>

                  </div>
                </form>
              </div>
              <!-- Start Post Ad Step Two Content -->
            </div>
            <div class="tab-pane fade" id="nav-user-info" role="tabpanel" aria-labelledby="nav-user-info-tab">
              <!-- Start Post Ad Step Three Content -->
              <div class="step-three-content">
                <form class="default-form-style" method="post" action="#">
                  <div class="row">

                    <div class="col-lg-6 col-12">
                      <div class="form-group">
                        <label>환자명*</label> <input name="name" type="text" placeholder="Enter your name(값 받아오기)">
                      </div>
                    </div>

                    <div class="col-lg-6 col-12">
                      <div class="form-group">
                        <label>환자번호*</label> <input name="number" type="text" placeholder="Enter mobile number(값 받아오기)">
                      </div>
                    </div>

                    <label>환자주소*(값 받아오는 걸로)</label>
                    <div class="button">
                      <input type="button" class="btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                    </div>

                    <div class="form-group">
                      <input type="text" id="sample6_postcode" placeholder="우편번호">
                      <input type="text" id="sample6_address" placeholder="주소"><br>
                      <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                      <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                    </div>

                    <div class="col-12">
                      <div class="google-map">
                        <label>약국위치*</label>
                        <div class="button">
                          <a href="/location/findPharmacy" button type="submit" class="btn">가까운 약국 찾기</a>
                        </div>
                        <div class="mapouter">
                          <div class="gmap_canvas">
                            <iframe width="100%" height="300" id="gmap_canvas"
                              src="https://maps.google.com/maps?q=2880%20Broadway,%20New%20York&t=&z=13&ie=UTF8&iwloc=&output=embed"
                              frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                            <a href="https://123movies-to.org"></a><br>

                            <a href="https://www.embedgooglemap.net">embed
                              google maps wordpress</a>

                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">
                          모든 이용약관 및 게시물 규칙에 동의합니다. </label>
                      </div>

                      <div class="button">
                        <a href="" button type="submit" class="btn">처방받기</a>
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

        <!-- End Post Ad Block Area -->

        <!-- 자주 묻는 질문 부분 -->

        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="d-flex mb-5" style="justify-content: center;">
                <h5>약 받는 방법 궁금해요</h5>
              </div>
              <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                      data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      <span>진료 신청서에서 배송 방법을 선택해주세요</span><i class="lni lni-plus"></i>
                    </button>
                  </h2>
                  <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <p>주소지 설정에 따라 배송이 가능한 서비스 화면은 다르게 보일 수 있어요.
                      </p>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                      data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      <span>약을 받을 수 있는 방법은 5가지에요.</span><i class="lni lni-plus"></i>
                    </button>
                  </h2>
                  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <p>[퀵으로 빠르게 받기]</p>
                      <p>평일 오후 9시, 주말 오후 8시까지 약값을 결제하면 처방약이 당일 퀵으로 배송돼요.
                        퀵비는 8.000원이지만 지역,상황(우천), 주말, 시간 등에 따라 달라질 수 있어요.
                      </p>
                      <p>[새벽배송으로 내일 아침에 받기]</p>
                      <p>평일 오후 7시(일요일 포함), 토요일 오후 3시 까지 약값을 결제하면 처방약이 다음날 아침7시까지 배송돼요.
                        배송비는 4.000원이에요.
                      </p>
                      <p>[오늘배송으로 당일에 받기]</p>
                      <p>평일/토요일 오후 3시 30분까지 약값을 결제하면 처방약이 당일 배송돼요.
                        배송비는 4.500원이에요.
                      </p>
                      <p>[택배로 받기]</p>
                      <p>평일 오후 9시까지 약값을 결제하면 처방전 접수일 기준으로 영업일 2~3일 내 택배로 약이 배송돼요.
                        배송비는 2.500원이에요.
                        주말, 휴일에는 영업 개시일 이후 배송이 시작돼요.
                      </p>
                      <p>[약국에서 직접 받기]</p>
                      <p>가까운 약국에 직접 찾아가 약을 받을 수 있어요. 방문 전, 약국에 확인 전화를 꼭 해주셔야 해요.
                      </p>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                      data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      <span>진료 없이 일반약 배송 가능한가요?</span><i class="lni lni-plus"></i>
                    </button>
                  </h2>
                  <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <p>에브리닥터에서는 비대면 진료 후 발행된 처방전 기반으로만 약 조제 및 배송 서비스를 이용할 수 있어요.</p>
                      <p>비대면 진료 없이 약만 수령할수는 없는 점, 양해 부탁드려요.</p>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingFour">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                      data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                      <span>집 근처 모든 약국이 조제를 거부하는데 어떻게 해야 하나요?</span><i class="lni lni-plus"></i>
                    </button>
                  </h2>
                  <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <p>근처 약국에서 조제가 어렵다면 오늘배송, 퀵,택배를 통해 약을 받으실 수 있어요. 단, 선택한 배송 방법에 따라 배송비가 부과될 수 있는 점 참고 부탁드려요.</p>
                      <p>처방약 조제 거부 사례를 겪으셨다면, 홈 화면 배너에 있는 [신고하기]를 통해 저희에게 공유해주세요.</p>

                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingFive">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                      data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                      <span>약 배송 소요시간이 궁금해요.</span><i class="lni lni-plus"></i>
                    </button>
                  </h2>
                  <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      <p>지역에 따라 배송 소요시간은 달라질 수 있으나 평균적으로는 아래와 같아요.</p>
                      <p>[퀵배달]</p>
                      <p>평균 3시간 이내</p>
                      <p>[새벽 배송]</p>
                      <p>다음 날 아침 7시까지</p>
                      <p>[오늘 배송]</p>
                      <p>자정 전까지</p>
                      <p>[택배 배송]</p>
                      <p>평균 영업일 2~3일 내</p>
                      <p>날씨나 배송사 사정 등 외부적인 요인에 의해 유동적으로 달라질 수 있어요.</p>
                    </div>
                  </div>
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