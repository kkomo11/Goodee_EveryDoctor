<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>비대면 진료 예약</title>
    <c:import url="../temp/boot.jsp"></c:import>
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
    <!-- /End Preloader -->

    <!-- Start Header Area -->
    <c:import url="../temp/header.jsp"></c:import>
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">처방전 작성</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>Diagnosis</li>
                        <li>Application</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Dashboard Section -->
    <section class="dashboard section">
        <div class="container">
            <div class="row" style="justify-content: center;">
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="main-content">
                        <!-- 처방전 작성 폼 시작 -->
                        <div class="dashboard-block mt-0 profile-settings-block">
                            <h3 class="block-title">처방전 작성</h3>
                            <div class="inner-block">
                                <div class="post-ad-tab">
                                    <div class="tab-content" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="hospital" role="tabpanel"
                                            aria-labelledby="hospital-tab">
                                            <form class="profile-setting-form default-form-style" method="post"
                                                action="/hospital/diagnosis/prescription" id="prescriptionForm">
                                                <div class="row" style="flex-direction: column;">
                                                	<input type="hidden" value="${hospitalDiagnosisVO.dansNum}" name="dansNum">
                                                	<input type="hidden" value="${hospitalDiagnosisVO.patientVO.username}" name="username">
                                                    <!-- 의사소견 입력 -->
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>의사 소견</label>
                                                            <textarea name="dansResponse"
                                                                class="agencyInfo"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>진료비 청구</label>
                                                            <input style="width: 50%;" name="dansCost" type="text" id="dansCostInput" />
                                                        </div>
                                                    </div>
                                                    <div class="button col-3">
                                                        <button class="btn" type="button" id="addDrugBtn">약 추가</button>
                                                    </div>

                                                    <div class="form-group" id="drugListFrame">

                                                    </div>
                                                    <!-- 작성 버튼 -->
                                                    <div class="col-12">
                                                        <div class="form-group button mb-0 d-flex"
                                                            style="flex-direction: row-reverse;">
                                                            <button type="button" class="btn inputButton"
                                                                id="prescriptionSendBtn">작성 완료</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <button type="button" id="drugSearchModalBtn" class="btn btn-primary" data-bs-toggle="modal"
                                                data-bs-target="#drugSearchModal" data-bs-whatever="@getbootstrap" style="display: none;"></button>
                                            <div class="modal fade" id="drugSearchModal" tabindex="-1" aria-labelledby="drugSearchModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="exampleModalLabel">처방약 검색</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="mb-3">
                                                                <label for="drugSearch" class="col-form-label">약 이름:</label>
                                                                <input type="text" class="form-control" id="drugSearch">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label for="drugResult" class="col-form-label">약 선택:</label>
                                                                <ul class="list-group" id="drugSearchList">
                                                                </ul>
                                                                <div id="drugSearchItemFrame"></div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                                            <button type="button" class="btn btn-primary" id="drugSetBtn" data-bs-dismiss="modal">처방</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Dashboard Section -->

    <!-- Start Footer Area -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>
    <script type="text/javascript" src="/js/hospital/diagnosis.js"></script>
    <script type="text/javascript" src="/js/hospital/prescription.js"></script>
    <script type="text/template" id="diagnosisFileInputTemplate">
        <div class="col-12 fileFrame">
            <div class="filesInput">
                <div></div>
                <input type="file" id="diagonsisFile" name="files" class="form-control">
                <button type="button" class="btn btn-danger fileDeleteBtn">파일 삭제</button>
            </div>
        </div>
    </script>

    <script type="text/template" id="drugTemplate">
    		<div class="form-group">
    			<div class="button col-3">
    				<label>처방약</label>
    				<button class="btn drugSearchBtn" type="button">약 찾기</button>
    			</div>
    			<label></label>
            	<input type="text" name="druges" readonly>
				<input type="text" name="doses">
				<input type="text" name="doseHits">
				<input type="text" name="doseDays">
    		</div>
    	</script>

    <script type="text/template" id="drugListTemplate">
    		<li class="list-group-item drugListItem" data-drugnum="{drugNum}" style="cursor:pointer;">{drugName}</li>
    	</script>
</body>

</html>