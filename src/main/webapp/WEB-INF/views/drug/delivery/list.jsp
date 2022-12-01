<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!--properties spring  -->
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
      <!DOCTYPE html>
      <html class="no-js" lang="zxx">

      <head>
        <meta charset="UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>에브리닥터</title>
        <c:import url="../../temp/boot.jsp"></c:import>
        <!-- ========================= CSS here ========================= -->
        <link rel="stylesheet" href="/webjars/github-com-twbs-bootstrap/v3.3.7/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="/webjars/github-com-twbs-bootstrap/v3.3.7/dist/css/bootstrap-theme.css">
        <link rel="stylesheet" href="../../static/css/parcel/tracking-sky.css">
        <link rel="stylesheet" href="/css/drug/delivery.css" type="text/css" />
      </head>

      <body>
        <spring:eval expression="@deliveryPropertiesFactoryBean['spring.delivery.t_key']" var="t_key"></spring:eval>
        <spring:eval expression="@deliveryPropertiesFactoryBean['spring.delivery.t_code']" var="t_code"></spring:eval>
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
                  <form action="http://info.sweettracker.co.kr/tracking/5" method="post">
                    <!-- <form action="http://localhost/drug/delivery/detail" method="get"> -->
                    <div class="form-group">
                      <!-- <label for="t_key">API key</label> -->
                      <input type="hidden" class="form-control" id="t_key" name="t_key" value="${t_key}">
                    </div>
                    <div class="form-group">
                      <!-- <label for="t_code">택배사 코드</label> -->
                      <input type="hidden" class="form-control" name="t_code" id="t_code" placeholder="택배사 코드"
                        value="${t_code}">
                    </div>
                    <div class="form-group">
                      <!-- <label for="t_code">택배사 코드</label> -->
                      <label for="t_code2">제휴 택배사</label>
                      <input type="text" class="form-control" name="t_code2" id="t_code2" placeholder="대한통운 입력하세요"
                        value="대한통운">
                    </div>
                    <div class="form-group">
                      <label for="t_invoice">운송장 번호</label>
                      <input type="text" class="form-control" name="t_invoice" id="t_invoice"
                        placeholder="운송장 번호 - 없이 입력하세요">
                    </div>
                    <div class="button">
                      <a href="" target="_parent" button type="submit" class="btn" onclick="openPop()">배송팝업</a>
                      <button type="submit" class="btn" onclick="openPop()">조회하기</button>
                    </div>

                    <!-- <body>
                      <a href="" target="_parent" onclick="openPop()">배송팝업</a>
                    </body> -->
                  </form>
                </div>
              </div>
            </div>
          </div>
        </section>


    <!-- 자주 묻는 질문 부분 -->
    <section class="faq section">
      <div class="container">
          <div class="row">
              <div class="col-12">
                  <div class="d-flex mb-5" style="justify-content: center;">
                      <h4>자주 묻는 질문</h4>
                  </div>
                  <div class="accordion" id="accordionExample">
                      <div class="accordion-item">
                          <h2 class="accordion-header" id="headingOne">
                              <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                  data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                  <span>상품 배송기간은 얼마나 걸려요?</span><i class="lni lni-plus"></i>
                              </button>
                          </h2>
                          <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                              data-bs-parent="#accordionExample">
                              <div class="accordion-body">
                                  <p>상품 배송기간은 배송방법, 고객님의 수령지역 및 배송사에 따라 차이가 있습니다.
                                    대부분 상품 배송기간은 판매자가 상품을 발송한 날로부터 영업일 기준 3~5일 정도 소요됩니다.
                                    - 오늘출발 : 상품정보에 기재된 제한 시한까지 결제하면 당일 발송 처리되며, 택배사 사정에 따라 배송기간은 영업일 기준 2~3일 정도 소요될 수 있습니다.<br>
                                    - 희망일배송 : 주문시 선택하신 배송희망일에 맞춰 배송이 진행되며 변경을 원하실 경우 판매자에게 문의해 주셔야 합니다.
                                    구매한 상품의 발송 예정일은 판매자에게 문의하면 자세하게 확인할 수 있습니다.
                                    판매자 문의는 결제내역&gt;쇼핑&gt;주문건 또는 주문상세정보 페이지의 판매자 연락처와 [문의하기]를 통해 할 수 있습니다.
                                  </p>
                              </div>
                          </div>
                      </div>
                      <div class="accordion-item">
                          <h2 class="accordion-header" id="headingTwo">
                              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                  data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                  <span>주문한 상품을 반품/교환하고 싶어요.</span><i
                                      class="lni lni-plus"></i>
                              </button>
                          </h2>
                          <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                              data-bs-parent="#accordionExample">
                              <div class="accordion-body">
                                  <p> '전자상거래에 의한 소비자보호에 관한 법률'에 의거, 반품기간 이내에는 언제든지 판매자(가맹점)에 반품/교환을 요청하실 수 있습니다.
                                    (반품운송비 원인제공자가 부담 원칙) 반품을 원하시는 경우 우선 판매자(가맹점)에 직접 연락하여 사유, 배송방법, 운송비를 협의하신 후 상품을 반송하시면 됩니다.</p>
                                  <p>반품/교환요청은 배송완료 후 7일 이내까지 결제내역 페이지에서 가능하며, 구매확정 이후에는 반품/교환요청을 하실 수 없습니다.
                                    하지만 에브리닥터는 반품이 안됩니다.</p>
                              </div>
                          </div>
                      </div>
                      <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <span>발송처리가 되었는데, 배송조회가 정상적으로 되지 않아요. 어떻게 해야 하나요?</span><i
                                    class="lni lni-plus"></i>
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <p> 판매자가 빠른 발송처리를 위해 실제 택배사 배송이 시작되기 전, 송장을 먼저 출력한 후 송장번호를 등록하는 경우가 있습니다.</p>
                                <p>반품이런 경우라면 보통 송장번호가 등록된 당일 또는 다음날 상품배송이 진행됨과 동시에 배송추적이 가능합니다.</p>
                            </div>
                        </div>
                    </div>
                  </div>
              </div>
          </div>
      </div>
  </section>
      <!-- Footer -->
      <c:import url="../../temp/footer.jsp"></c:import>

      <!-- ========================= scroll-top ========================= -->
      <a href="#" class="scroll-top btn-hover"> <i class="lni lni-chevron-up"></i>
      </a>

      <!-- ========================= JS here ========================= -->
      <script src="/js/drug/delivery.js"></script>
      </body>

      </html>