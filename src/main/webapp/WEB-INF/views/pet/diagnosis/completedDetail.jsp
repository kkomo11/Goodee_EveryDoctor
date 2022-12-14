<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>진료상세</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
	<c:import url="../../temp/boot.jsp"></c:import>
    <!-- Place favicon.ico in the root directory -->

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
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">진료상세</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>진료상세</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Item Details -->
    <section class="item-details section">
        <div class="container">
            <div class="top-area">
                <div class="row">
                    <div class="col-lg-6 col-md-12 col-12">
                        <div class="product-images">
                            <main id="gallery">
                                <div class="main-img">
                                	<c:if test="${completedDetail.PDansFiles.size() > 0 }">
                                		<img src="/file/PETDANS/${completedDetail.PDansFiles[0].fileName }" id="current" alt="#" style="width: 100%; height: 25rem;">
                                	</c:if>
                                	<c:if test="${completedDetail.PDansFiles.size() <= 0 }">
                                		<img src="/images/pet/home/no_image_icon.svg" id="current" alt="#" style="width: 100%; height: 25rem;">
                                	</c:if>
                                    
                                </div>
                                <div class="images">
                                	<c:if test="${completedDetail.PDansFiles.size() > 0 }">
                                		<c:forEach items="${completedDetail.PDansFiles }" var="pDansFile">
                                			<img src="/file/PETDANS/${pDansFile.fileName }" class="img" alt="#">
                                		</c:forEach>
                                	</c:if>
                                </div>
                            </main>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-12">
                        <div class="product-info">
                            <h2 class="title">${completedDetail.userVO.name }</h2>
                            <p class="location"><i class="lni lni-map-marker"></i><a>비대면</a></p>
                            <h3 class="price">${completedDetail.PDansCost }원</h3>
                            <div class="list-info">
                                <h4>부가정보</h4>
                                <ul>
                                    <li><span>증상분류:</span> ${completedDetail.PDansCategory }</li>
                                    <li><span>신청시간:</span> ${completedDetail.reqTimeString }</li>
                                    <li><span>종료시간:</span> ${completedDetail.endTimeString }</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item-details-blocks">
                <div class="row">
                    <div class="col-lg-8 col-md-7 col-12">
                        <!-- Start Single Block -->
                        <div class="single-block description">
                            <h3>반려동물 정보</h3>
                            <ul>
                                <li>이름: ${completedDetail.petVO.petName }</li>
                                <li>상위분류: ${completedDetail.refBioName }</li>
                                <li>하위분류: ${completedDetail.petBioVO.petBioName }</li>
                                <li>생일: ${completedDetail.petVO.petBirth }</li>
                                <li>나이: ${completedDetail.petVO.petAge }</li>
                                <c:if test="${completedDetail.petVO.petSex == 0 }">
                                	<li>성별: 암</li>
                                </c:if>
                                <c:if test="${completedDetail.petVO.petSex == 1 }">
                                	<li>성별: 수</li>
                                </c:if>
                                <c:if test="${completedDetail.petVO.neutered == 0 }">
                                	<li>중성화: 안함</li>
                                </c:if>
                                <c:if test="${completedDetail.petVO.neutered == 1 }">
                                	<li>중성화: 함</li>
                                </c:if>
                                <c:choose>
                                	<c:when test="${completedDetail.petVO.vaccinnation == 0 }">
                                		<li>예방접종: 안함</li>
                                	</c:when>
                                	<c:when test="${completedDetail.petVO.vaccinnation == 1 }">
                                		<li>예방접종: 부분접종</li>
                                	</c:when>
                                	<c:when test="${completedDetail.petVO.vaccinnation == 2 }">
                                		<li>예방접종: 함</li>
                                	</c:when>
                                	<c:otherwise>
                                		<li>예방접종: 모르겠음</li>
                                	</c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                        <!-- End Single Block -->
                        <!-- Start Single Block -->
                        <div class="single-block description">
                            <h3>상담내용</h3>
                            <p>
                                ${completedDetail.PDansContent }
                            </p>
                            
                        </div>
                        <!-- End Single Block -->
                        <!-- Start Single Block -->
                        <div class="single-block description">
                            <h3>소견</h3>
                            <p>
                                ${completedDetail.PDansResponse }
                            </p>
                            
                        </div>
                        <!-- End Single Block -->
                        <!-- Start Single Block -->
                        <div class="single-block description">
                            <h3>조치내용</h3>
                            <p>
                                ${completedDetail.PDansAid }
                            </p>
                            
                        </div>
                        <!-- End Single Block -->
                    </div>
                    <div class="col-lg-4 col-md-5 col-12">
                        <div class="item-details-sidebar">
                            <!-- Start Single Block -->
                            <div class="single-block author">
                                <h3>신청자 정보</h3>
                                <div class="content">
                                	<c:if test="${completedDetail.userVO.fileName != null && completedDetail.userVO.fileName != '' }">
                                		<img src="${completedDetail.userVO.fileName }" alt="#">
                                	</c:if>
                                	<c:if test="${completedDetail.userVO.fileName == null || completedDetail.userVO.fileName == '' }">
                                		<img src="/images/pet/home/user_profile_icon.svg" alt="#">
                                	</c:if>
                                    <h4>${completedDetail.userVO.name }</h4>
                                    <c:if test="${completedDetail.userVO.phone != null }">
                                    	<span>${completedDetail.userVO.phone }</span>
                                    </c:if>
                                    <c:if test="${completedDetail.userVO.phone == null }">
                                    	<span>전화번호 등록 안됨</span>
                                    </c:if>
                                    <c:if test="${completedDetail.userVO.email != null }">
                                    	<a class="see-all">${completedDetail.userVO.email }</a>
                                    </c:if>
                                    <c:if test="${completedDetail.userVO.email == null }">
                                    	<a class="see-all">이메일 등록 안됨</a>
                                    </c:if>
                                </div>
                            </div>
                            <!-- End Single Block -->
                            <!-- Start Single Block -->
                            <div class="single-block ">
                                <h3>약 처방</h3>
                                <div class="content">
                                	<c:if test="${completedDetail.petFills.size() > 0 }">
                                		<c:forEach items="${completedDetail.petFills }" var="fill">
                                			<a class="see-all">${fill.drugName }</a>
                                			<ul>
                                				<li>${fill.drugInfo }</li>
                                				<br>
                                				<li>${fill.drugUse }</li>
                                			</ul>
                                			<br>
                                		</c:forEach>
                                		
                                	</c:if>
                                	<c:if test="${completedDetail.petFills.size() <= 0 }">
                                		<span>약 처방 안함</span>
                                	</c:if>
                                </div>
                            </div>
                            <!-- End Single Block -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Item Details -->

    <!-- Start Footer Area -->
    <c:import url="../../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <script type="text/javascript">
        const current = document.getElementById("current");
        const opacity = 0.6;
        const imgs = document.querySelectorAll(".img");
        imgs.forEach(img => {
            img.addEventListener("click", (e) => {
                //reset opacity
                imgs.forEach(img => {
                    img.style.opacity = 1;
                });
                current.src = e.target.src;
                //adding class 
                //current.classList.add("fade-in");
                //opacity
                e.target.style.opacity = opacity;
            });
        });
    </script>
</body>

</html>