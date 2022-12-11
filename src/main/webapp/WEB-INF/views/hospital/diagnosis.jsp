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
                        <h1 class="page-title">Post Ad</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>Post Ad</li>
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
                <div class="col-12">
                    <div class="main-content">
                        <!-- Start Diagnosis Application Area -->
                        <div class="dashboard-block mt-0">
                            <h3 class="block-title">진료 신청서</h3>
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
                                                <span class="sub-title">증상등록</span>
                                            </button>
                                            <button class="nav-link" id="nav-item-details-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-item-details" type="button" role="tab"
                                                aria-controls="nav-item-details" aria-selected="false">
                                                <span class="serial">02</span>
                                                Step
                                                <span class="sub-title">사진첨부</span>
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
                                                                <label>과목 선택</label>
                                                                <div class="selector-head">
                                                                    <span class="arrow"><i
                                                                            class="lni lni-chevron-down"></i></span>
                                                                    <select class="user-chosen-select">
                                                                        <c:forEach items="${sectionList}" var="sectionVO">
                                                                            <option value="${sectionVO.sectionNum}">${sectionVO.sectionName}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <label>증상 입력</label>
                                                                <textarea class="form-control form-control-custom" name="" style="height: 164px;"
                                                                    placeholder="예) 감기 기운이 있고 머리가 아파요"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group button mb-0">
                                                                <button type="submit" class="btn ">Next Step</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <!-- End Post Ad Step One Content -->
                                        </div>
                                        <div class="tab-pane fade" id="nav-item-details" role="tabpanel"
                                            aria-labelledby="nav-item-details-tab">
                                            <!-- Start Post Ad Step Two Content -->
                                            <div class="step-two-content">
                                                <form class="default-form-style" method="post" action="#">
                                                    <div class="row">
                                                        <div class="col-lg-6 col-12">
                                                            <div class="upload-input">
                                                                <input type="file" id="upload" name="upload">
                                                                <label for="upload" class="text-center content">
                                                                    <span class="text">
                                                                        <span class="d-block mb-15">Drop files anywhere
                                                                            to Upload</span>
                                                                        <span class=" mb-15 plus-icon"><i
                                                                                class="lni lni-plus"></i></span>
                                                                        <span class="main-btn d-block btn-hover">Select
                                                                            File</span>
                                                                        <span class="d-block">Maximum upload file size
                                                                            10Mb</span>
                                                                    </span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group button mb-0">
                                                                <button type="submit"
                                                                    class="btn alt-btn">Previous</button>
                                                                <button type="submit" class="btn ">Next Step</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <!-- End Post Ad Step Two Content -->
                                        </div>
                                        <div class="tab-pane fade" id="nav-user-info" role="tabpanel"
                                            aria-labelledby="nav-user-info-tab">
                                            <!-- Start Post Ad Step Three Content -->
                                            <div class="step-three-content">
                                                <form class="default-form-style" method="post" action="#">
                                                    <div class="row" style="display: block;">
                                                        <div class="col-lg-6 col-12">
                                                            <div class="form-group">
                                                                <label>배송지 선택</label>
                                                                <div class="selector-head">
                                                                    <span class="arrow"><i
                                                                            class="lni lni-chevron-down"></i></span>
                                                                    <select class="user-chosen-select">
                                                                        <option value="none">저장한 배송지</option>
                                                                        <option value="none">New York</option>
                                                                        <option value="none">Washington</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group col-lg-6 col-12">
                                                            <label>배송지명</label>
                                                            <input type="text" id="deliName" name="deliName">
                                                        </div>
                                                        <div class="form-group col-lg-6 col-12">
                                                            <label>받는 사람</label>
                                                            <input type="text" id="addressee" name="addressee">
                                                        </div>
                                                        <div class="form-group col-lg-6 col-12">
                                                            <input type="hidden" name="phone" id="submitPhone">
                                                            <label for="inputPhone">연락처</label>
                                                            <div id="phone" class="d-flex justify-content-between">
                                                                <div class="selector-head" style="min-width: 30%;">
                                                                    <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                                                    <select name="phone1" id="phoneFirst" class="user-chosen-select">
                                                                        <option value="010" selected="selected">010</option>
                                                                        <option value="011">011</option>
                                                                        <option value="070">070</option>
                                                                    </select>
                                                                </div>
                                                                <input type="text" id="phoneLast" maxlength="9" name="phone1"
                                                                    placeholder="입력해주세요">
                                                            </div>
                                                        </div>
                                                        <div class="form-group col-lg-6 col-12">
                                                            <label>주소</label>
                                                            <div class="d-flex justify-content-between button">
                                                                <button type="button" class="sample-postcode searchAddress btn" style="width: 30%;">주소 찾기</button>
                                                                <input type="text" class="sample-postcode sample-postcode-input" name="postcode"
                                                                    style="width: 40%;" id="sample6_postcode" readonly>
                                                            </div>
                                                            <div class="d-flex mt-3">
                                                                <label for="sample6_address"></label>
                                                                <input type="text" class="sample-postcode sample-postcode-input" name="address"
                                                                    id="sample6_address"readonly>
                                                            </div>
                                                            <div class="d-flex mt-3">
                                                                <label for="sample6_address"></label>
                                                                <input type="text" name="detailAddress" id="sample6_detailAddress"
                                                                    placeholder="상세주소">
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" value=""
                                                                    id="flexCheckDefault">
                                                                <label class="form-check-label" for="flexCheckDefault">
                                                                    내 건강정보로 더 정확한 진료받기 NEW
                                                                </label>
                                                            </div>
                                                            <div class="form-group button mb-0">
                                                                <button type="submit"
                                                                    class="btn alt-btn">Previous</button>
                                                                <button type="submit" class="btn ">Submit Ad</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <!-- End Post Ad Step Three Content -->
                                        </div>
                                    </div>
                                </div>
                                <!-- End Post Ad Tab -->
                            </div>
                        </div>
                        <!-- End Diagnosis Application Area -->
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        const samplePostcode = document.querySelectorAll('.sample-postcode');
        const sample6_postcode = document.querySelector('#sample6_postcode');
        const sample6_address = document.querySelector('#sample6_address');
        const sample6_detailAddress = document.querySelector('#sample6_detailAddress');

        for (sp of samplePostcode) {
            sp.onclick = sample6_execDaumPostcode;
        }


        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>
</body>
</html>