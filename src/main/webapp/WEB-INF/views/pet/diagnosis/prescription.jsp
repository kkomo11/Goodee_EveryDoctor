<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Prescription</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
	<c:import url="../../temp/boot.jsp"></c:import>
    <!-- Place favicon.ico in the root directory -->

</head>

<body>
<sec:authentication property="Principal" var="user"/>
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
                        <h1 class="page-title">진단서</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>진단서</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- start Registration section -->
    <section class="login registration section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-md-8 offset-md-2 col-12">
                    <div class="form-head">
                        <h4 class="title">진단서</h4>
                        <form action="/pet/diagnosis/petPrescription" method="post" id="petPrescriptionForm">
                        	<input type="hidden" name="pDansNum" value="${detailForPrescription.PDansNum }">
                        	<input type="hidden" name="pDoctorname" value="${user.username }">
                        	<div class="form-group">
                                <label>보호자 명</label>
                                <input type="text" name="pUsername" value="${detailForPrescription.PUsername }" readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label>반려동물 명</label>
                                <input type="text" value="${detailForPrescription.petVO.petName }" readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label>반려동물 생일</label>
                                <input type="text" value="${detailForPrescription.petVO.petBirth }" readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label>반려동물 나이</label>
                                <input type="text" value="${detailForPrescription.petVO.petAge }" readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label>반려동물 성별</label>
                                <c:if test="${detailForPrescription.petVO.petSex == 0 }">
                                	<input type="text" readonly="readonly" value="암">
                                </c:if>
                                <c:if test="${detailForPrescription.petVO.petSex == 1 }">
                                	<input type="text" readonly="readonly" value="수">
                                </c:if>
                            </div>
                            <div class="form-group">
                                <label>반려동물 중성화 여부</label>
                                <c:if test="${detailForPrescription.petVO.neutered == 0 }">
                                	<input type="text" readonly="readonly" value="안됨">
                                </c:if>
                                <c:if test="${detailForPrescription.petVO.neutered == 1 }">
                                	<input type="text" readonly="readonly" value="됨">
                                </c:if>
                            </div>
                            <div class="form-group">
                                <label>반려동물 예방접종</label>
                                <c:if test="${detailForPrescription.petVO.vaccinnation == 0 }">
                                	<input type="text" readonly="readonly" value="안함">
                                </c:if>
                                <c:if test="${detailForPrescription.petVO.vaccinnation == 1 }">
                                	<input type="text" readonly="readonly" value="부분접종">
                                </c:if>
                                <c:if test="${detailForPrescription.petVO.vaccinnation == 2 }">
                                	<input type="text" readonly="readonly" value="함">
                                </c:if>
                                <c:if test="${detailForPrescription.petVO.vaccinnation == 3 }">
                                	<input type="text" readonly="readonly" value="모르겠음">
                                </c:if>
                            </div>
                            <div class="form-group">
                                <label>반려동물 종류</label>
                                <input type="text" readonly="readonly" value="${detailForPrescription.petBioVO.petBioName }">
                            </div>
                            <div class="form-group">
                                <label>진료범주</label>
                                <input type="text" readonly="readonly" value="${detailForPrescription.PDansCategory }">
                            </div>
                            <div class="form-group">
                                <label>상담내용</label>
                                <input type="text" readonly="readonly" value="${detailForPrescription.PDansContent }">
                            </div>
                            <div class="form-group">
                            	<label>의사소견</label>
                            	<textarea rows="3" cols="100" name="pDansResponse" id="pDansResponseInput"></textarea>
                            </div>
                            <div class="form-group">
                            	<label>의사조치내용</label>
                            	<textarea rows="3" cols="100" name="pDansAid" id="pDansAidInput"></textarea>
                            </div>
                            <div class="form-group">
                            	<label>진료비 (약 비용도 포함해서 작성해주세요)</label>
                            	<input type="text" name="pDansCost" id="pDansCostInput">
                            </div>
                            <div class="button col-3">
                            	<button class="btn" type="button" id="addDrugBtn">약 추가</button>
                            </div>
                            
                            <div class="form-group" id="drugListFrame">
                            	
                            </div>
                            <div class="button">
                                <button type="button" class="btn" id="prescriptionSendBtn">진단서 작성 완료</button>
                            </div>
                        </form>
                        <button type="button" id="drugSearchModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#drugSearchModal" data-bs-whatever="@getbootstrap" style="display: none;"></button>
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
    </section>
    <!-- End Registration section -->

    <!-- Start Footer Area -->
    <c:import url="../../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>
    
    <script type="text/javascript" src="/js/pet/diagnosis/prescription.js"></script>
    
    <script type="text/template" id="drugTemplate">
		<div class="form-group">
			<div class="button col-3">
				<label>처방약</label>
				<button class="btn drugSearchBtn" type="button">약 찾기</button>
			</div>
			<label></label>
        	<input type="text" name="druges">
		</div>
	</script>
	
	<script type="text/template" id="drugListTemplate">
		<li class="list-group-item drugListItem" data-drugnum="{drugNum}" style="cursor:pointer;">{drugName}</li>
	</script>
    
</body>

</html>