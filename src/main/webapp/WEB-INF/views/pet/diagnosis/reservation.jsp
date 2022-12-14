<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Reservation</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />
    <!-- Place favicon.ico in the root directory -->

    <c:import url="../../temp/boot.jsp"></c:import>
	<link rel="stylesheet" href="/css/pet/diagnosis/reservation.css" />

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
                        <h1 class="page-title">Reservation</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>Reservation</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
	<sec:authentication property="Principal" var="member"/>
    <!-- Start Dashboard Section -->
    <section class="dashboard section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-4 col-12">
                    <!-- Start Dashboard Sidebar -->
                    <c:import url="../../user/sidebar.jsp"></c:import>
                    <!-- Start Dashboard Sidebar -->
                </div>
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="main-content">
                        <!-- Start Post Ad Block Area -->
                        <div class="dashboard-block mt-0">
                            <h3 class="block-title">비대면진료 예약</h3>
                            <div class="inner-block">
                                <!-- Start Post Ad Tab -->
                                <div class="post-ad-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <button class="nav-link active" id="nav-item-info-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-item-info" type="button" role="tab"
                                                aria-controls="nav-item-info" aria-selected="true">
                                                <span class="serial">01</span>
                                                Step
                                                <span class="sub-title">반려동물</span>
                                            </button>
                                            <button class="nav-link" id="nav-item-details-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-item-details" type="button" role="tab"
                                                aria-controls="nav-item-details" aria-selected="false">
                                                <span class="serial">02</span>
                                                Step
                                                <span class="sub-title">기본정보</span>
                                            </button>
                                            <button class="nav-link" id="nav-user-info-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-user-info" type="button" role="tab"
                                                aria-controls="nav-user-info" aria-selected="false">
                                                <span class="serial">03</span>
                                                Step
                                                <span class="sub-title">최종확인</span>
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
                                                                <label>반려동물 선택*</label>
                                                                <div id="ownedPetListFrame">
	                                                                <c:forEach items="${ownedPetList }" var="pet">

	                                                                	<div class="ownedPetFrame" data-petnum="${pet.petNum }">
	                                                                		<c:if test="${pet.petFileName != null && pet.petFileName != '' }">
	                                                                			<img class="ownedPetImage" alt="" src="/file/PET/${pet.petFileName }">
	                                                                		</c:if>
	                                                                		<c:if test="${pet.petFileName == null || pet.petFileName == '' }">
	                                                                			<img class="ownedPetImage" alt="" src="/images/pet/profile/default_pet_icon.svg">
	                                                                		</c:if>
	                                                                		<span class="ownedPetName">${pet.petName }</span>
	                                                                	</div>
	                                                                </c:forEach>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label>반려동물 이름*</label>
                                                                <input id="petNameInput" type="text" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label>반려동물 종류*</label>
                                                                <input id="speciesNameInput" type="text" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label>반려동물 생일*</label>
                                                                <input id="petBirthInput" type="date" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label>반려동물 나이*</label>
                                                                <input id="petAgeInput" type="number" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label>반려동물 성별*</label>
                                                                <input id="petSexInput" type="text" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label>반려동물 중성화여부*</label>
                                                                <input id="neuteredInput" type="text" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <label>반려동물 예방접종여부*</label>
                                                                <input id="vaccinnationInput" type="text" readonly="readonly">
                                                            </div>
                                                        </div>

                                                        <div class="col-12">
                                                            <div class="form-group button mb-0">
                                                                <button type="button" class="btn " id="firstNextBtn">Next Step</button>
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
                                                                <label>상담유형*</label>
                                                                <div class="selector-head">
                                                                    <span class="arrow"><i
                                                                            class="lni lni-chevron-down"></i></span>
                                                                    <select class="user-chosen-select" id="pDansCategory">

                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group mt-30">
                                                                <label>상담내용*</label>
                                                                <textarea
                                                                    placeholder="상담내용" id="pDansContentInput"></textarea>
                                                            </div>
                                                        </div>

                                                        <div class="col-12">
                                                            <div class="form-group button mb-0">
                                                                <button type="button"
                                                                    class="btn alt-btn" id="secondPreBtn">Previous</button>
                                                                <button type="button" class="btn " id="secondNextBtn">Next Step</button>
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
                                                <form class="default-form-style" method="post" action="./reservation" enctype="multipart/form-data" id="reservationForm">
                                                    <div class="row">
                                                    	<input type="hidden" name="pUsername" id="usernameInput" value="${member.username }">
                                                		<input type="hidden" name="pDoctorname" id="petdocUsernameInput" value="${petdoc }">
                                                		<input type="hidden" name="petNum" id="petNumInput">
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label>반려동물 이름*</label>
                                                                <input id="petNameInput2" type="text" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label>반려동물 종류*</label>
                                                                <input id="speciesNameInput2" type="text" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label>반려동물 생일*</label>
                                                                <input id="petBirthInput2" type="date" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label>반려동물 나이*</label>
                                                                <input id="petAgeInput2" type="number" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label>반려동물 성별*</label>
                                                                <input id="petSexInput2" type="text" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label>반려동물 중성화여부*</label>
                                                                <input id="neuteredInput2" type="text" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <label>반려동물 예방접종여부*</label>
                                                                <input id="vaccinnationInput2" type="text" readonly="readonly">
                                                            </div>
                                                        </div>

                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <label>상담유형*</label>
                                                                <div class="selector-head">
                                                                    <span class="arrow"><i
                                                                            class="lni lni-chevron-down"></i></span>
                                                                    <select class="user-chosen-select" name="pDansCategory" id="pDansCategory2">

                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group mt-30">
                                                                <label>상담내용*</label>
                                                                <textarea name="pDansContent"
                                                                    placeholder="상담내용" id="pDansContentInput2" readonly="readonly"></textarea>
                                                            </div>
                                                        </div>

                                                        <div class="col-12">
                                                            <div class="form-group button mb-0">
                                                                <button type="button" class="btn " id="addPhotoBtn">진료용 사진 추가</button>
                                                            </div>
                                                        </div>

                                                        <div class="col-12" id="photoFileFrame">
                                                        </div>

                                                            <div class="form-group button mb-0">
                                                                <button type="button"
                                                                    class="btn alt-btn" id="thirdPreBtn">Previous</button>
                                                                <button type="button" class="btn " id="submitBtn">진료신청</button>
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

    <!-- Start Footer Area -->
    <c:import url="../../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <script type="text/javascript" src="/js/pet/diagnosis/reservation.js"></script>

    <script type="text/template" id="pDansCategoryOptionTemplate">
		<option value="{category}">{categoryName}</option>
	</script>
	<script type="text/template" id="diagnosisFileInputTemplate">
		<div class="col-12 fileFrame">
        	<div class="filesInput">
				<div></div>
        		<input type="file" id="diagonsisFile" name="files" class="form-control">
				<button type="button" class="btn btn-danger fileDeleteBtn">파일 삭제</button>
        	</div>
		</div>
	</script>

</body>

</html>