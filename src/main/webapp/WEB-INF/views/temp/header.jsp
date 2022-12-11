<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- SPRING_SECURITY_CONTEXT를 쉽게 사용할 수 있도록 도와주는 taglib -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- Start Header Area -->
<header class="header navbar-area">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-12">
                <div class="nav-inner">
                    <nav class="navbar navbar-expand-lg">
                        <a class="navbar-brand" href="/">
                            <img src="/images/logo/logo.jpg" alt="Logo">
                        </a>
                        <button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="toggler-icon"></span>
                            <span class="toggler-icon"></span>
                            <span class="toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                            <ul id="nav" class="navbar-nav ms-auto">
                                <li class="nav-item">
                                    <a class="dd-menu collapsed active" href="/hospital/home"
                                        aria-label="Toggle navigation">병원</a>
                                </li>
                                <li class="nav-item">
                                    <a class="dd-menu collapsed" href="/pet/home"
                                        aria-label="Toggle navigation">동물병원</a>
                                </li>
                                <li class="nav-item">
                                    <a class=" dd-menu collapsed" href="/location/viewCorona"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation">선별진료소</a>
                                </li>
                                <li class="nav-item">
                                    <a class=" dd-menu collapsed" href="/location/viewCorona"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation">24시</a>
                                </li>
                                <li class="nav-item">
                                    <a class=" dd-menu collapsed" href="javascript:void(0)"
                                        data-bs-toggle="collapse" data-bs-target="#submenu-1-4"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation">마이페이지</a>
                                    <ul class="sub-menu mega-menu collapse" id="submenu-1-4">
                                        <li class="single-block">
                                            <ul>
                                                <li class="mega-menu-title">Essential Pages</li>
                                                <li class="nav-item"><a href="about-us.html">About Us</a></li>
                                                <li class="nav-item"><a href="item-details.html">Ads Details</a></li>
                                                <li class="nav-item"><a href="post-item.html">Ads Post</a></li>
                                                <li class="nav-item"><a href="pricing.html">Pricing Table</a></li>
                                                <li class="nav-item"><a href="registration.html">Sign Up</a></li>
                                                <li class="nav-item"><a href="login.html">Sign In</a></li>
                                                <li class="nav-item"><a href="contact.html">Contact Us</a></li>
                                                <li class="nav-item"><a href="faq.html">FAQ</a></li>
                                                <li class="nav-item"><a href="404.html">Error Page</a></li>
                                                <li class="nav-item"><a href="mail-success.html">Mail Success</a>
                                                </li>
                                                <li class="nav-item"><a href="coming-soon.html">Comming Soon</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="single-block">
                                          <ul>
                                              <li class="mega-menu-title">마이페이지</li>
                                              <li class="nav-item"><a href="/user/profile">내 프로필</a>
                                              </li>
                                              <li class="nav-item"><a href="/user/mydiaglist">내 진료내역</a>
                                              </li>
                                              <li class="nav-item"><a href="#">내 주소 관리</a></li>
                                              <li class="nav-item"><a href="/user/petdiaglist">반려동물 진료내역</a></li>
                                              <li class="nav-item"><a href="#">내 상담내역</a></li>
                                              <li class="nav-item"><a href="#">반려동물 관리</a></li>
                                              <li class="nav-item"><a href="/drug/delivery/list">배송조회</a></li>
                                          </ul>
                                      </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class=" dd-menu collapsed" href="javascript:void(0)"
                                        data-bs-toggle="collapse" data-bs-target="#submenu-1-3"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation">의사</a>
                                        <ul class="sub-menu collapse" id="submenu-1-3">
                                          <li class="nav-item"><a href="item-listing-grid.html">Ad Grid</a></li>
                                          <li class="nav-item"><a href="item-listing-list.html">Ad Listing</a></li>
                                          <li class="nav-item"><a href="item-details.html">Ad Details</a></li>
                                      </ul>
                                </li>
                                <li class="nav-item">
                                  <a class="dd-menu collapsed" href="javascript:void(0)"
                                      data-bs-toggle="collapse" data-bs-target="#submenu-1-4"
                                      aria-controls="navbarSupportedContent" aria-expanded="false"
                                      aria-label="Toggle navigation">약사</a>
                                  <ul class="sub-menu collapse" id="submenu-1-4">
                                      <li class="nav-item"><a href="/drug/prescription/list">병원진료내역</a>
                                      </li>
                                      <li class="nav-item"><a href="/drug/list">보유약현황</a></li>
                                      <li class="nav-item"><a href="/drug/store">약국찾기</a></li>
                                  </ul>
                              </li>
                              <li class="nav-item">
                                  <a class="dd-menu collapsed" href="/admin/admin/reportList"
                                      data-bs-toggle="collapse" data-bs-target="#submenu-1-5"
                                      aria-controls="navbarSupportedContent" aria-expanded="false"
                                      aria-label="Toggle navigation">관리자</a>
                                  <ul class="sub-menu collapse" id="submenu-1-5">
                                      <li class="nav-item"><a href="/drug/prescription/list">병원진료내역</a>
                                      </li>
                                      <li class="nav-item"><a href="/drug/list">보유약현황</a></li>
                                      <li class="nav-item"><a href="/drug/store">약국찾기</a></li>
                                  </ul>
                              </li>
                            </ul>
                        </div> <!-- navbar collapse -->
                        <div class="login-button">
                            <!-- <c:when test="${not empty check}">
                                <c:choose>

                                <c:when test="${check.adminRoleVOs[0].roleName == 'Pharmacists'}">
                                    <div class="text-end">

                                            <a style="color:black; ">${check.adminRoleVOs[0].roleName} 계정 접속중 </a>

                                            <a href="/drug/prescription/list" class="btn btn-white shadow-warning text-primary prescriptionList">병원진료내역</a>
                                            <a href ="/drug/list" class="btn btn-white shadow-warning text-primary drugList">보유약리스트</a>
                                    </div>

                                </c:when>
                                </c:choose>
                            </c:when> -->

                            <ul>
                                <sec:authorize access="isAuthenticated()">
                                <sec:authentication property="Principal" var="member"/>
                                <input id="name" value="${member.name}" style="display:none;">
                                    ${member.name}님 환영합니다.

                                <li>
                                    <a href="/logout"><i class="lni lni-enter"></i> 로그아웃</a>
                                </li>
                                </sec:authorize>

								<sec:authorize access="isAnonymous()">
                                <li>
                                    <a href="/user/login"><i class="lni lni-enter"></i> 로그인</a>
                                </li>
                                <li>
                                    <a href="/user/registration"><i class="lni lni-user"></i> 회원가입</a>
                                </li>
								</sec:authorize>
								<button type="button" class="btn btn-primary" id="liveToastBtn">Show live toast</button>
								<a href="/telemedicine">Telemedicine</a>
                            </ul>
                        </div>
                        <div class="form-group button mb-0">
                            <a href="/admin/agency/regist" type="button" class="btn" style="margin-left: 4px !important;">제휴 신청</a>
                        </div>
                    </nav> <!-- navbar -->
                </div>
            </div>
        </div> <!-- row -->
    </div> <!-- container -->
</header>
    <!-- end login section -->

<sec:authorize access="hasRole('PRE')">

<button type="button" id="preModal" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#certificationModal">
</button>

<!-- Modal -->
<div class="modal fade" id="certificationModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">본인인증</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	      		<p class="text-center">서비스의 원활한 이용을 위해서는 본인인증이 필요합니다.</p>
	      <div class="login">
	      	<div class="form-head">
	      		<form action="" class="default-form-style" style="margin-top:0px" id="certiForm">
			        <p class="text-center" style="color:red" id="certiMsg"></p>
			        <input name="certiusername" type="text" id="certiusername" value="${member.username}" readonly="readonly" style="display:none;">
			        <div class="form-group">
			            <label>성함</label>
			            <input name="certiName" type="text" id="certiName">
			        </div>
	                     <label>성별</label>
			      	<div class="row">
			      		<div class="col-6 text-center">
			      			<label for="genderM">남성</label>
	                     	<input type="radio" id="genderM" name="gender" value="M">
			      		</div>
			      		<div class="col-6 text-center">
			      			<label for="genderF">여성</label>
	                     	<input type="radio" id="genderF" name="gender" value="F">
			      		</div>
                 	</div>
	      		</form>
			  </div>
	      	</div>
	      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="certiClose" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="certificationBtn">인증요청</button>
      </div>
    </div>
  </div>
</div>
</sec:authorize>

<div class="toast-container position-fixed bottom-0 p-3" style="z-index:555;">
  <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
    <div class="toast-header">
      <img src="..." class="rounded me-2" alt="...">
      <strong class="me-auto">Bootstrap</strong>
      <small>11 mins ago</small>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
      Hello, world! This is a toast message.
    </div>
  </div>
</div>
<!-- End Header Area -->

<script type="text/javascript">





</script>