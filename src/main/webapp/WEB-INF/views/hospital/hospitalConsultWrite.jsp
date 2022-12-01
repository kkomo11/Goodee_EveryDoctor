<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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
                        <form class="default-form-style" action="#!" method="post">
                            <div class="form-group">
                                <label>제목</label>
                                <input name="password" type="text" placeholder="예) 약 복용중이에요.">
                            </div>
                            <div class="form-group">
                                <label>질문</label>
                                <textarea class="form-control form-control-custom" name="" style="height: 164px;"
                                    placeholder="예) 약을 처방 받았는데 술을 마셔도 될까요?"></textarea>
                            </div>
                            <div class="form-group">
                                <label>카테고리</label>
                                <div class="selector-head">
                                    <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                    <select class="user-chosen-select">
                                        <c:forEach items="${sectionList}" var="sectionVO">
                                            <option value="${sectionVO.sectionNum}">${sectionVO.sectionName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="step-two-content" style="margin: 20px 0;">
                                <div class="upload-input">
                                    <input type="file" id="upload" name="upload">
                                    <label for="upload" class="text-center content">
                                        <span class="text">
                                            <span class="d-block mb-15">사진 첨부(선택)</span>
                                            <span class=" mb-15 plus-icon"><i class="lni lni-plus"></i></span>
                                            <span class="d-block">최대 4장까지 가능해요.</span>
                                        </span>
                                    </label>
                                </div>
                            </div>
                            <div>
                                실시간 무료상담은 이렇게 운영돼요.
                            </div>
                            <div class="button">
                                <button type="submit" class="btn">물어보기</button>
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
</body>

</html>