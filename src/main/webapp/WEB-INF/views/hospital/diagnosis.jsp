<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <h1 class="page-title">진료 신청서</h1>
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

    <!-- start Application Diagnosis section -->
    <section class="login registration section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                    <div class="form-head post-ad-tab">
                        <h4 class="title">진료 신청서</h4>
                        <form class="default-form-style" action="#!" method="post">
                            <div class="form-group">
                                <label>과목 선택</label>
                                <div class="selector-head">
                                    <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                    <select class="user-chosen-select">
                                        <c:forEach items="${sectionList}" var="sectionVO">
                                            <option value="${sectionVO.sectionNum}">${sectionVO.sectionName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>증상 입력</label>
                                <textarea class="form-control form-control-custom" name="" style="height: 164px;"></textarea>
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
                            <div class="form-group">
                                <label>배달 주소</label>
                                <input name="password" type="password">
                            </div>
                            <div class="form-group">
                                <label>결제 카드</label>
                            </div>
                            <div class="check-and-pass">
                                <div class="row align-items-center">
                                    <div class="col-12">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input width-auto"
                                                id="exampleCheck1">
                                            <label class="form-check-label">내 건강정보로 더 정확한 진료 받기</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="button">
                                <button type="submit" class="btn">진료 신청</button>
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