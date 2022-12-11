<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Profile</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />	
    <!-- Place favicon.ico in the root directory -->

	<c:import url="../temp/boot.jsp"></c:import>
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
    
    <!-- Header -->
    <c:import url="../temp/header.jsp"></c:import>

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">Profile Settings</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>Profile Settings</li>
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
					<c:import url="sidebar.jsp"></c:import>
                </div>
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="main-content">
                        <!-- Start Post Ad Block Area -->
                        <div class="dashboard-block mt-0">
                            <h3 class="block-title">Post Ad</h3>
                            <div class="inner-block">
                                <!-- Start Post Ad Tab -->
                                <div class="post-ad-tab">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <button class="nav-link active" id="nav-item-info-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-item-info" type="button" role="tab"
                                                aria-controls="nav-item-info" aria-selected="true">
                                                <span class="serial">01</span>
                                                Address
                                                <span class="sub-title">기본 주소</span>
                                            </button>
                                            <!-- <button class="nav-link" id="nav-item-details-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-item-details" type="button" role="tab"
                                                aria-controls="nav-item-details" aria-selected="false">
                                                <span class="serial">02</span>
                                                Step
                                                <span class="sub-title">Ad Details</span>
                                            </button>
                                            <button class="nav-link" id="nav-user-info-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-user-info" type="button" role="tab"
                                                aria-controls="nav-user-info" aria-selected="false">
                                                <span class="serial">03</span>
                                                Step
                                                <span class="sub-title">User Information</span>
                                            </button> -->
                                        </div>
                                    </nav>
                                    <div class="tab-content" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="nav-item-info" role="tabpanel"
                                            aria-labelledby="nav-item-info-tab">
                                            <!-- Start Post Ad Step One Content -->
                                            <div class="step-one-content">
                                                <form class="default-form-style" method="post" action="address">
                                                    <div class="row" style="display: block;">
                                                        <div class="form-group col-lg-6 col-12">
                                                            <label>배송지명</label>
                                                            <input type="text" id="addressNick" name="addressNick" value="기본 주소">
                                                        </div>
                                                        <div class="form-group col-lg-6 col-12">
                                                            <label>받는 사람</label>
                                                            <input type="text" id="addressReceiver" name="addressReceiver">
                                                        </div>
                                                        <div class="form-group col-lg-6 col-12">
                                                            <input type="hidden" name="addressPhone" id="submitPhone">
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
                                                        <div class="form-group col-12">
                                                            <label>주소</label>
                                                            <div class="d-flex justify-content-between button">
                                                                <button type="button" class="sample-postcode searchAddress btn" style="width: 30%;">주소 찾기</button>
                                                                <input type="text" class="sample-postcode sample-postcode-input" name="userPost"
                                                                    style="width: 60%;" id="sample6_postcode" readonly>
                                                            </div>
                                                            <div class="d-flex mt-3">
                                                                <label for="sample6_address"></label>
                                                                <input type="text" class="sample-postcode sample-postcode-input" name="userMainAddr"
                                                                    id="sample6_address" readonly>
                                                            </div>
                                                            <div class="d-flex mt-3">
                                                                <label for="sample6_address"></label>
                                                                <input type="text" name="userSubAddr" id="sample6_detailAddress"
                                                                    placeholder="상세주소">
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group button mb-0">
                                                                <button type="submit" class="btn ">주소 저장</button>
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
                                                </form>
                                            </div>
                                            <!-- Start Post Ad Step Two Content -->
                                        </div>
                                        <div class="tab-pane fade" id="nav-user-info" role="tabpanel"
                                            aria-labelledby="nav-user-info-tab">
                                            <!-- Start Post Ad Step Three Content -->
                                            <div class="step-three-content">
                                                <form class="default-form-style" method="post" action="#">
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

	<!-- Footer -->
    <c:import url="../temp/footer.jsp"></c:import>
    <script src="/js/user/profile.js"></script>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    
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

        $("#phoneLast").on("blur", function(){
            $("#submitPhone").val($("#phoneFirst").val()+$("#phoneLast").val())
            console.log("블러", $("#submitPhone").val())
        })
    </script>

</body>

</html>