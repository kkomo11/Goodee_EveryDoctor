<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>비대면 진료 예약</title>
    <c:import url="../temp/boot.jsp"></c:import>
    <link rel="stylesheet" href="/css/admin/medic/chosen.css">
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
                                                action="./regist" id="hospitalForm">
                                                <div class="row" style="flex-direction: column;">
                                                    <!-- 약품 검색 -->
                                                    <div class="form-group col-11">
                                                        <label>의약품 검색</label>
                                                        <div class="selector-head">
                                                            <select class="user-chosen-select chosen-select drugNum"
                                                                name="agencyNum">
                                                                <c:forEach items="${drugList}" var="drug">
                                                                    <option value="${drug.drugNum}">
                                                                        ${drug.drugName}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
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
                                                            <input style="width: 50%;" name="username" type="text" />
                                                        </div>
                                                    </div>
                                                    <!-- 작성 버튼 -->
                                                    <div class="col-12">
                                                        <div class="form-group button mb-0 d-flex"
                                                            style="flex-direction: row-reverse;">
                                                            <button type="button" class="btn inputButton"
                                                                id="inputButton">작성 완료</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
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
    <script src="/js/admin/medic/chosen.jquery.js"></script>
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