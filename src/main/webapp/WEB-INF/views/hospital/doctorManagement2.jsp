<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"></c:import>
<style>
.toggleLabel {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    cursor: pointer;
    padding: 25px 30px;
    font-size: 18px;
    font-weight: 500;
}

.text {
    padding: 25px 30px;
    font-size: 18px;
    font-weight: 500;
}

.toggleSwitch {
    appearance: none;
    position: relative;
    border: max(2px, 0.1em) solid gray;
    border-radius: 1.25em;
    width: 2.25em;
    height: 1.25em;
}

.toggleSwitch::before {
  content: "";
  position: absolute;
  left: 0;
  width: 1em;
  height: 1em;
  border-radius: 50%;
  transform: scale(0.8);
  background-color: gray;
  transition: left 250ms linear;
}

.toggleSwitch:checked::before {
  background-color: white;
  left: 1em;
}

.toggleSwitch:checked {
  background-color: #55DDBD;
  border-color: #55DDBD;
}

.toggleSwitch:focus-visible {
  outline-offset: max(2px, 0.1em);
  outline: max(2px, 0.1em) solid #55DDBD;
}

.toggleSwitch:enabled:hover {
  box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
}
</style>
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
    <!-- End Preloader -->

	<!-- Start Header Area -->
    <c:import url="../temp/header.jsp"></c:import>
    <!-- End Header Area -->

    <!-- Start Filter -->
    <section class="dashboard section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="main-content">
                        <div class="dashboard-block d-flex justify-content-between" style="padding-bottom: 0;">
                            <div>
                                <label class="toggleLabel">
                                    <span>화상진료</span>
                                    <input class="toggleSwitch" role="switch" type="checkbox" />
                                </label>
                                <label class="toggleLabel">
                                    <span>진료 요청</span>
                                    <input class="toggleSwitch" role="switch" type="checkbox" />
                                </label>
                                <label>
                                    <span class="text">최대 대기 인원</span>
                                </label>
                            </div>
                            <span class="text" style="color: #55DDBD;">당일 진료 내역</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Filter -->
    <section class="dashboard section pt-0">
        <div class="container">
            <div class="row">
                <!-- Start List -->
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="main-content">
                        <div class="dashboard-block mt-0">
                            <h3 class="block-title">진료 내역</h3>
                            <!-- Start Invoice Items Area -->
                            <div class="invoice-items default-list-style">
                                <!-- Start List Title -->
                                <div class="default-list-title">
                                    <div class="row align-items-center">
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>진료 상태</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>이름</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>전화번호</p>
                                        </div>
                                        <div class="col-lg-1 col-md-1 col-12">
                                            <p>진료관리</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>진료비</p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12">
                                            <p>진료 대기 시간</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- End List Title -->
                                <!-- Start Single List -->
                                <div class="single-list">
                                    <div class="row align-items-center">
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>진료전</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>이나우</p>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>010-1212-1212</p>
                                        </div>
                                        <div class="col-lg-1 col-md-1 col-12">
                                            <ul class="action-btn">
                                                <li><a href="javascript:void(0)" style="width: 70px; border-radius: 10px;">진료실</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <p>진료 대기중</p>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12">
                                            <ul class="action-btn">
                                                <li><a href="javascript:void(0)" style="width: 60px;">5분</a></li>
                                                <li><a href="javascript:void(0)" style="width: 60px;">10분</a></li>
                                                <li><a href="javascript:void(0)" style="width: 60px;">15분</a></li>
                                            </ul>
                                        </div>
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
                <!-- End List -->
            </div>
        </div>
    </section>

    <!-- Start Footer Area -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>
</body>
</html>