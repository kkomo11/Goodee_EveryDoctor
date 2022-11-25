<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <!DOCTYPE html>
      <html class="no-js" lang="zxx">

      <head>
         <meta charset="utf-8" />
         <meta http-equiv="x-ua-compatible" content="ie=edge" />
         <title>신고하기</title>
         <meta name="description" content="" />
         <meta name="viewport" content="width=device-width, initial-scale=1" />
         <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.svg" />
         <!-- Place favicon.ico in the root directory -->

         <!-- Web Font -->
         <link
            href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
         <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

         <c:import url="../temp/boot.jsp"></c:import>
         <%-- <c:import url="../temp/summer.jsp"></c:import> --%>
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
                        <h1 class="page-title">신고하기</h1>
                     </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                     <ul class="breadcrumb-nav">
                        <li><a href="index.jsp">메인</a></li>
                        <li>신고하기</li>
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
                  <div class="col-lg-3 col-md-4 col-12">
                     <!-- Start Dashboard Sidebar -->
                     <div class="dashboard-sidebar">
                        <div class="user-image">
                           <img src="https://via.placeholder.com/300x300" alt="#">
                           <h3>
                              Steve Aldridge <span><a href="javascript:void(0)">@username</a></span>
                           </h3>
                        </div>
                        <div class="dashboard-menu">
                           <ul>
                              <li><a href="dashboard.html"><i class="lni lni-dashboard"></i> Dashboard</a></li>
                              <li><a href="profile-settings.html"><i class="lni lni-pencil-alt"></i> Edit Profile</a>
                              </li>
                              <li><a href="my-items.html"><i class="lni lni-bolt-alt"></i>
                                    My Ads</a></li>
                              <li><a href="favourite-items.html"><i class="lni lni-heart"></i> Favourite ads</a></li>
                              <li><a class="active" href="post-item.html"><i class="lni lni-circle-plus"></i> Post An
                                    Ad</a></li>
                              <li><a href="bookmarked-items.html"><i class="lni lni-bookmark"></i> Bookmarked</a></li>
                              <li><a href="messages.html"><i class="lni lni-envelope"></i>
                                    Messages</a></li>
                              <li><a href="delete-account.html"><i class="lni lni-trash"></i> Close account</a></li>
                              <li><a href="invoice.html"><i class="lni lni-printer"></i>
                                    Invoice</a></li>
                           </ul>
                           <div class="button">
                              <a class="btn" href="javascript:void(0)">Logout</a>
                           </div>
                        </div>
                     </div>
                     <!-- Start Dashboard Sidebar -->
                  </div>
                  <div class="col-lg-9 col-md-8 col-12">
                     <div class="main-content">
                        <!-- Start Post Ad Block Area -->
                        <div class="dashboard-block mt-0">
                           <h3 class="block-title">신고하기</h3>
                           <div class="inner-block">
                              <!-- Start Post Ad Tab -->
                              <div class="post-ad-tab">
                                 <div>아래 양식에 따라 작성해주세요</div>
                                       <!-- Start Post Ad Step One Content -->
                                       <div class="step-one-content">
                                          <form class="default-form-style" method="post" action="./write" enctype="multipart/form-data">
                                             <div class="row">
                                                <!-- 신고 제목 -->
                                                <div class="col-12">
                                                   <div class="form-group">
                                                      <label>제목*</label> 
                                                      <input name="reportTitle" type="text" placeholder="제목을 입력해주세요" />
                                                   </div>
                                                </div>
                                                <!-- 신고 유형 -->
                                                <div class="col-12">
                                                   <div class="form-group">
                                                      <label>신고유형*</label>
                                                      <div class="selector-head">
                                                         <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                                         <select class="user-chosen-select" name="reportTypeNum">
                                                            <option value=null>신고 유형을 선택해주세요</option>
                                                            <option value=1>서비스와 관련 없는 내용</option>
                                                            <option value=2>개인정보 유출 위험</option>
                                                            <option value=3>광고 또는 홍보 글</option>
                                                            <option value=4>음란성, 욕설 등 부적절한 내용</option>
                                                            <option value=5>기타</option>
                                                         </select>
                                                      </div>
                                                   </div>
                                                </div>
                                                <!-- 신고 내용 -->
                                                <div class="col-12">
                                                   <div class="form-group">
                                                      <label>신고내용*</label>
                                                      <textarea name="reportContents" id="reportContents"></textarea>
                                                   </div>
                                                </div>

                                                <!-- 파일추가 버튼 누르면 파일추가 폼 생성되는 부분 -->
                                                <div id="fileAdd"></div>

                                                <!-- 파일 추가 버튼 -->
                                                <div class="col-12">
                                                   <div class="form-group button mb-0">
                                                      <button type="button" id="fileAddButton" class="btn">파일추가</button>
                                                   </div>
                                                </div>

                                                <!-- 신고하기 버튼 -->
                                                <div class="col-12">
                                                   <div class="form-group button mb-0 d-flex" style="flex-direction: row-reverse;">
                                                      <button type="submit" class="btn ">신고하기</button>
                                                   </div>
                                                </div>
                                             </div>
                                          </form>
                                       </div>
                                       <!-- Finish Post Ad Step One Content -->
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

         <!-- Start Newsletter Area -->
         <div class="newsletter section">
            <div class="container">
               <div class="inner-content">
                  <div class="row align-items-center">
                     <div class="col-lg-6 col-md-6 col-12">
                        <div class="title">
                           <i class="lni lni-alarm"></i>
                           <h2>Newsletter</h2>
                           <p>We don't send spam so don't worry.</p>
                        </div>
                     </div>
                     <div class="col-lg-6 col-md-6 col-12">
                        <div class="form">
                           <form action="#" method="get" target="_blank" class="newsletter-form">
                              <input name="EMAIL" placeholder="Your email address" type="email">
                              <div class="button">
                                 <button class="btn">
                                    Subscribe<span class="dir-part"></span>
                                 </button>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- End Newsletter Area -->

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
         <script src="/js/report/write.js"></script>

         <!-- 파일추가 버튼 누르면 파일추가 폼 생성 -->

         <script type="java/template" id="fileAddForm">
            <div class="col-12 d-flex file">
               <div class="form-group upload-image">
                  <input name="files" type="file" placeholder="첨부파일명">
               </div>
               <div class="form-group button mb-0">
                  <button type="button" class="btn del">취소</button>
               </div>
           </div>
         </script>
         
      </body>

      </html>