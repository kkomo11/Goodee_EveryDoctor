<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>무료상담 작성</title>
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
                        <h1 class="page-title">무료상담 질문</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>Consult</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- start Application Diagnosis section -->
    <section class="login registration section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                    <div class="form-head post-ad-tab">
                        <h4 class="title">무료상담 질문</h4>
                        <div>
                            전문의료인에게 고민상담,
                            지금 바로 답변해 드려요
                        </div>
                        <form class="default-form-style" action="./write" method="post" enctype="multipart/form-data" id="consultWriteForm">
                        	<sec:authentication property="Principal" var="member"/>
                        	<input type="hidden" name="username" value="${member.username }">
                            <div class="form-group">
                                <label>제목</label>
                                <input name="consultTitle" type="text" placeholder="예) 약 복용중이에요." id="consultTitleInput">
                            </div>
                            <div class="form-group">
                                <label>질문</label>
                                <textarea class="form-control form-control-custom" name="consultContent" style="height: 164px;"
                                    placeholder="예) 약을 처방 받았는데 술을 마셔도 될까요?" id="consultContentInput"></textarea>
                            </div>
                            <div class="form-group">
                                <label>유형</label>
                                <div class="selector-head">
                                    <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                    <select class="user-chosen-select" id="consultKindSelect" name="consultKind">
                                    	<option value="none"></option>
                                        <option value="0">병원</option>
                                        <option value="1">동물병원</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>카테고리</label>
                                <div class="selector-head">
                                    <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                    <select class="user-chosen-select" id="consultCategorySelect" name="consultCategory">
                                        
                                    </select>
                                </div>
                            </div>
                            <button type="button" class="btn btn-primary" id="fileAddBtn">파일추가</button>
                            
                            <div id="filesFrame">
                            
                            </div>

                            <div class="button">
                                <button type="button" class="btn" id="consultWriteBtn">물어보기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Application Diagnosis section -->

    <!-- Start Footer Area -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>
    
    <script src="/js/consult/write.js"></script>
    
    <script type="text/template" id="consultCategoryTemplate">
		<option value="{categoryNum}">{categoryName}</option>
	</script>
    
    <script type="text/template" id="fileInputTemplate">
		<div class="fileFrame" style="margin: 20px 0;">
        	<div class="upload-input">
				<div id="thumnail"></div>
                <input type="file" name="files">
				<button type="button" class="btn btn-danger fileDeleteBtn">파일삭제</button>
        	</div>
        </div>
	</script>
    
</body>

</html>