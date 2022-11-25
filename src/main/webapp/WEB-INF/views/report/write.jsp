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
		
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

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
                                 <div class="tab-content" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="nav-item-info" role="tabpanel"
                                       aria-labelledby="nav-item-info-tab">
                                       <!-- Start Post Ad Step One Content -->
                                       <div class="step-one-content">
                                          <form class="default-form-style" method="post" action="#">
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
                                                <div class="col-12">
                                                   <div class="form-group button mb-0">
                                                      <button type="submit" class="btn ">신고하기</button>
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
                                                      <label>Add Price*</label> <input name="price" type="text"
                                                         placeholder="Enter Price">
                                                   </div>
                                                </div>
                                                <div class="col-12">
                                                   <div class="form-group">
                                                      <label>Price Type*</label>
                                                      <div class="selector-head">
                                                         <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                                         <select class="user-chosen-select">
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
                                                         <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                                         <select class="user-chosen-select">
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
                                                         class="text-center content"> <span class="text"> <span
                                                               class="d-block mb-15">Drop
                                                               files anywhere to Upload</span> <span
                                                               class=" mb-15 plus-icon"><i
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
                                                            only YouTube & Vimeo</span></label> <input name="video"
                                                         type="text" placeholder="Input link"> <a
                                                         href="javascript:void(0)" class="add-video"><i
                                                            class="lni lni-plus"></i> Add Video</a>
                                                   </div>
                                                </div>
                                                <div class="col-12">
                                                   <div class="form-group mt-30">
                                                      <label>Ad Description*</label>
                                                      <textarea name="message"
                                                         placeholder="Input ad description"></textarea>
                                                   </div>
                                                </div>
                                                <div class="col-lg-6 col-12">
                                                   <div class="form-group">
                                                      <label>Type of Ad*</label>
                                                      <div class="selector-head">
                                                         <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                                         <select class="user-chosen-select">
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
                                                         <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                                         <select class="user-chosen-select">
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
                                                      <label>Name*</label> <input name="name" type="text"
                                                         placeholder="Enter your name">
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
                                                         <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                                         <select class="user-chosen-select">
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
                                                         <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                                         <select class="user-chosen-select">
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
                                                         <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                                         <select class="user-chosen-select">
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
                                                               frameborder="0" scrolling="no" marginheight="0"
                                                               marginwidth="0"></iframe>
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
                                                      <input class="form-check-input" type="checkbox" value=""
                                                         id="flexCheckDefault"> <label class="form-check-label"
                                                         for="flexCheckDefault">
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
         
         <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
		 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

         <script type="text/javascript">
            $("#reportContents").summernote({
               tabsize: 4,
               height: 250
               // callbacks: { //summernote의 이벤트 콜백 함수 등록
               //    onImageUpload: function(file){ //이미지가 업로드 되면
               //       console.log("ImageUpload");
               //       console.log("File : ", file);
               //       uploadFile(file);
               //    },
               //    onMediaDelete: function(file){
               //       console.log("Delete Media");
               //       deleteFile(file);
               //    }
                  
               // }
            });
         </script>
      </body>

      </html>