<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- SPRING_SECURITY_CONTEXT를 쉽게 사용할 수 있도록 도와주는 taglib -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- Start Header Area -->
<header class="header navbar-area">
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="Principal" var="member"/>
	</sec:authorize>
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
                                    <ul class="sub-menu mega-menu collapse" id="submenu-1-4" style="width: 250px;">
                                        <li class="single-block" style="width: 100% !important;">
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
                                <sec:authorize access="hasAnyRole('DOCTOR', 'PETDOC')">
                                <li class="nav-item">
                                    <a class=" dd-menu collapsed" href="javascript:void(0)"
                                        data-bs-toggle="collapse" data-bs-target="#submenu-1-3"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation">의사</a>
                                        <ul class="sub-menu collapse" id="submenu-1-3">
                                          <sec:authorize access="hasRole('DOCTOR')">
                                          <li class="nav-item"><a href="/hospital/diagnosis/management">진료 대기</a></li>
                                          <li class="nav-item"><a href="/hospital/diagnosis/completedList?username=${member.username}">진료 완료</a></li>
                                          </sec:authorize>
                                          <sec:authorize access="hasRole('PETDOC')">
                                          <li class="nav-item"><a href="/pet/diagnosis/reservatedList?d=${member.username }">수의사</a></li>
                                          </sec:authorize>
                                      </ul>
                                </li>
                                </sec:authorize>
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
                                <input type="hidden" id="AuthProfile" value="${member.fileName}">
                                <input id="authUsername" value="${member.username}" style="display:none;">
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
								<!-- <button type="button" class="btn btn-primary" id="liveToastBtn">Show live toast</button> -->
								<a href="/telemedicine">Telemedicine</a>
                                <!--웹알림 목록 보여주기 위함-->
                                <li class="nav-item dropdown no-arrow mx-1" id="Ajaxlist">
                                    <a class="nav-link dropdown-toggle" id="alarmBell" href="javascript:void(0)" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                                            <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
                                        </svg>
                                        <!-- Counter - Alerts -->
                                        <i class="fas fa-bell fa-fw"></i>
                                    </a>
                                    <!-- Dropdown - Alerts -->
                                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" id="dropDownList" aria-labelledby="alertsDropdown"
                                    style="z-index:555; margin-top: 10px !important; overflow-y: auto; height:400px;">
                                        <h6 class="dropdown-header" >
                                            Alerts Center
                                        </h6>
                                        <hr id="alarmList">
                                        <!--웹알림 목록 리스트 들어갈 자리-->
                                        <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                                    </div>
                                </li>
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
	      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="certiClose" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="certificationBtn">인증요청</button>
      </div>
    </div>
  </div>
</div>
</sec:authorize>

<!--출력되는 웹알림 담아주는 곳 -->
<div id="toastAlert" class="toast-container position-fixed top-0 end-0 pt-5 m-5" style="z-index:555; margin-top: 72px !important; overflow-y: auto; height:400px;">
</div>


<!-- End Header Area -->

<script type="text/javascript">




</script>