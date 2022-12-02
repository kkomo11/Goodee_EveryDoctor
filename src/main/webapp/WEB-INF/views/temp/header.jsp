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
                                    <a class="dd-menu collapsed active" href="/"
                                        aria-label="Toggle navigation">Home</a>
                                    <!-- <ul class="sub-menu collapse" id="submenu-1-1">
                                        <li class="nav-item active"><a href="index.html">Home Default</a></li>
                                        <li class="nav-item"><a href="javascript:void(0)">Home Version 2</a></li>
                                        <li class="nav-item"><a href="javascript:void(0)">Home Version 3</a></li>
                                    </ul> -->
                                </li>
                                <li class="nav-item">
                                    <a href="/hospital/home" data-bs-toggle="collapse" data-bs-target="#submenu-1-2"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                       	 aria-label="Toggle navigation">Hospital</a>
                                       	 <ul class="sub-menu collapse" id="submenu-1-2">
                                       	  <li class="nav-item"><a href="/hospital/home">Hospital</a></li>
                                          <li class="nav-item"><a href="/pet/home">Animal Hospital</a></li>
                                      </ul>
                                </li>
                                <li class="nav-item">
                                    <a class=" dd-menu collapsed" href="javascript:void(0)"
                                        data-bs-toggle="collapse" data-bs-target="#submenu-1-3"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation">Listings</a>
                                        <ul class="sub-menu collapse" id="submenu-1-3">
                                          <li class="nav-item"><a href="item-listing-grid.html">Ad Grid</a></li>
                                          <li class="nav-item"><a href="item-listing-list.html">Ad Listing</a></li>
                                          <li class="nav-item"><a href="item-details.html">Ad Details</a></li>
                                      </ul>
                                </li>
                                <li class="nav-item">
                                    <a class=" dd-menu collapsed" href="/location/viewCorona"
                                        data-bs-toggle="collapse" data-bs-target="#submenu-1-5"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation">선별진료소</a>
                                    <ul class="sub-menu collapse" id="submenu-1-5">
                                        <li class="nav-item"><a href="/location/viewCorona">선별진료소보러가기</a>
                                        </li>
                                        <li class="nav-item"><a href="javascript:void(0)">Blog Single</a></li>
                                        <li class="nav-item"><a href="javascript:void(0)">Blog Single
                                                Sibebar</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class=" dd-menu collapsed" href="javascript:void(0)"
                                        data-bs-toggle="collapse" data-bs-target="#submenu-1-4"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation">Pages</a>
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
                                              <li class="mega-menu-title">Dashboard</li>
                                              <li class="nav-item"><a href="dashboard.html">Account Overview</a>
                                              </li>
                                              <li class="nav-item"><a href="profile-settings.html">My Profile</a>
                                              </li>
                                              <li class="nav-item"><a href="my-items.html">My Ads</a></li>
                                              <li class="nav-item"><a href="favourite-items.html">Favorite Ads</a>
                                              </li>
                                              <li class="nav-item"><a href="post-item.html">Ad post</a></li>
                                              <li class="nav-item"><a href="bookmarked-items.html">Bookmarked Ad</a>
                                              </li>
                                              <li class="nav-item"><a href="messages.html">Messages</a></li>
                                              <li class="nav-item"><a href="delete-account.html">Close account</a>
                                              </li>
                                              <li class="nav-item"><a href="invoice.html">Invoice</a></li>
                                          </ul>
                                      </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                  <a class="dd-menu collapsed" href="javascript:void(0)"
                                      data-bs-toggle="collapse" data-bs-target="#submenu-1-5"
                                      aria-controls="navbarSupportedContent" aria-expanded="false"
                                      aria-label="Toggle navigation">Blog</a>
                                  <ul class="sub-menu collapse" id="submenu-1-5">
                                      <li class="nav-item"><a href="blog-grid-sidebar.html">Blog Grid Sidebar</a>
                                      </li>
                                      <li class="nav-item"><a href="blog-single.html">Blog Single</a></li>
                                      <li class="nav-item"><a href="blog-single-sidebar.html">Blog Single
                                              Sibebar</a></li>
                                  </ul>
                              </li>
                            </ul>
                        </div> <!-- navbar collapse -->
                        <div class="login-button">
                            <ul>
                                <sec:authentication property="Principal" var="member"/>
                                <sec:authorize access="isAuthenticated()">
                                    ${member.username},${member.name}, ${member.roles}

                                </sec:authorize>

                                <li>
                                    <a href="/user/login"><i class="lni lni-enter"></i> Login</a>
                                </li>
                                <li>
                                    <a href="/user/registration"><i class="lni lni-user"></i> Register</a>
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
<!-- End Header Area -->