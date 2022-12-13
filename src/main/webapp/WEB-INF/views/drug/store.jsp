<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html class="no-js" lang="zxx">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>약국찾기</title>
      <meta name="description" content="" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
      <c:import url="../temp/boot.jsp"></c:import>
      <!-- 지도 -->
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f74af817be66222985c3a1eadae6b460&libraries=services"></script>
      <!-- ========================= CSS here ========================= -->
      <link rel="stylesheet" href="/css/drug/drug.css" type="text/css" />
      <link rel="stylesheet" href="/css/admin/medic/chosen.css">
      <link rel="stylesheet" href="/css/location/findPharmacy.css">
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
                <h1 class="page-title">약국찾기</h1>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
              <ul class="breadcrumb-nav">
                <li><a href="/">Home</a></li>
                <li>약국찾기</li>
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
      
          </nav>
              <!-- Start Post Ad Step Three Content -->
              <div class="step-three-content">
                <form class="default-form-style" method="post" action="#">
                  <div class="row">
                    <div class="col-12">
                      <div class="google-map">
                        <label>약국위치*</label>
                        <div class="mapouter" style=" height:360px ">
                          <div class="gmap_canvas" id="map" style="height:360px">
                            <iframe width="100%" height="300" id="gmap_canvas"
                              frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                            <a href="#"></a><br>

                            <a href="https://www.embedgooglemap.net">embed google maps wordpress</a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- <label>환자주소*(값 받아오는 걸로)</label>
                    <div class="button">
                      <input type="button" class="btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                    </div>

                    <div class="form-group">
                      <input type="text" id="sample6_postcode" placeholder="우편번호">
                      <input type="text" id="sample6_address" placeholder="주소"><br>
                      <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                      <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                    </div> -->
                  </div>
                </form>
              </div>

              
                <div class="container">
                  <div class="row">
                    <div class="col-12">
                      <div class="main-content">
                        <!-- Start Post Ad Block Area -->
                        <div class="dashboard-block mt-0">
                          <h3 class="block-title">처방 받은 약이 궁금하다면?
                            <!-- 검색창 -->
                            <div class="row mb-3">
                              <form action="./list" class="row row-cols-lg-auto g-3 align-items-center">
        
                                <div class="navbar bg-light">
                                  <label class="visually-hidden" for="Kind">Kind</label>
                                  <select name="kind" class="form-select" id="Kind">
                                    <!-- <option class="kinds" value="drugNum">약번호</option> -->
                                    <option class="kinds" value="drugName">약이름</option>
                                  </select>
                                </div>
        
                                <div class="navbar bg-light">
                                  <label class="visually-hidden" for="search">Search</label>
                                  <div class="input-group">
                                    <input type="text" name="search" value="${param.search}" class="form-control" id="search"
                                      placeholder="Search">
                                  </div>
                                </div>
                                <div class="navbar bg-light">
                                  <button class="btn btn-outline-success" type="submit"><i class="lni lni-search-alt"></i> Search</button>
                                </div>
                              </form>
                            </div>
                          </h3>
                          <div class="inner-block">
        
                            <!-- 약목록 -->
                            <table class="table table-hover">
                              <thead>
                                <tr>
                                  <th>약이름</th>
                                </tr>
                              </thead>
                              <tbody>
                                <c:forEach items="${list}" var="vo">
                                  <tr>
                                    <td><a href="detail?drugName=${vo.drugName}">${vo.drugName}</a></td>
                                  </tr>
                                </c:forEach>
                              </tbody>
                            </table>
                            <!-- 페이징처리 -->
                            <div class="pagination left">
                              <nav aria-label="Page navigation example">
                                <ul class="pagination-list">
                                  <c:if test="${pager.pre}">
                                    <li class="page-item">
                                      <a class="page-link"
                                        href="./store?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">&laquo;</a>
                                    </li>
                                  </c:if>
                                  <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                                    <li class="page-item"><a class="page-link"
                                        href="./store?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
                                  </c:forEach>
                                  <c:if test="${pager.next}">
                                    <li class="page-item">
                                      <a class="page-link"
                                        href="./store?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">&raquo;</a>
                                    </li>
                                  </c:if>
                                </ul>
                              </nav>
                            </div>
        
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              
            </div>

              
        <!-- End Post Ad Tab -->
                     <!-- 자주 묻는 질문 부분 -->
                     <div class="container">
                      <div class="row">
                        <div class="col-12">
                          <div class="d-flex mb-5" style="justify-content: center;">
                            <h4>약 받는 방법 궁금해요</h4>
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
      <c:import url="../temp/footer.jsp"></c:import>

      <!-- ========================= scroll-top ========================= -->
      <a href="#" class="scroll-top btn-hover"> <i class="lni lni-chevron-up"></i>
      </a>

      <!-- ========================= JS here ========================= -->
      <!-- <script src="/js/drug.js"></script> -->
      <script src="/js/alert.js"></script>
      <script src="/js/drug/address.js"></script>
      <script src="/js/location/findPharmacy.js"></script>
      <script src="/js/admin/medic/regist.js"></script>
      <script src="/js/admin/medic/chosen.jquery.js"></script>
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </body>

    </html>