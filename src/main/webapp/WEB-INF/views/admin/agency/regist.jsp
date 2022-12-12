<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>제휴 문의</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Place favicon.ico in the root directory -->

	<c:import url="../../temp/boot.jsp"></c:import>
    <link rel="stylesheet" href="/css/admin/medic/chosen.css">
	<link rel="stylesheet" href="/css/admin/medic/regist.css">
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
	<c:import url="../../temp/header.jsp"></c:import>
    
    <!-- Start Hero Area -->
    <section class="hero-area overlay">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1 col-md-12 col-12">
                    <div class="hero-text text-center">
                        <!-- Start Hero Text -->
                        <div class="section-heading">
                            <h2 class="wow fadeInUp" data-wow-delay=".3s">에브리닥터와 지금 함께하세요!</h2>
                            <p class="wow fadeInUp" data-wow-delay=".5s">제휴관련 궁금한 점이 있다면 연락주세요.</p>
                        </div>
                        <!-- End Search Form -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Hero Area -->

    <!-- 에브리닥터 혜택 부분 Start -->
    <section class="why-choose section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">에브리닥터 제휴사에 혜택을 드립니다</h2>
                        <p class="wow fadeInUp" data-wow-delay=".6s">에브리닥터와 함께해야 하는 이유 6가지</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="choose-content">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-12">
                                <!-- Start Single List -->
                                <div class="single-list wow fadeInUp" data-wow-delay=".2s">
                                    <i class="lni lni-book"></i>
                                    <h4>에브리닥터 의사, 약사 전용 사이트</h4>
                                    <p>효율적인 비대면 진료 및 처방약 배송 업무 지원</p>
                                </div>
                                <!-- Start Single List -->
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                <!-- Start Single List -->
                                <div class="single-list wow fadeInUp" data-wow-delay=".4s">
                                    <i class="lni lni-leaf"></i>
                                    <h4>고도화된 정산 내역 제공</h4>
                                    <p>일별, 월별 등
                                        정산 내역 관리 가능</p>
                                </div>
                                <!-- Start Single List -->
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                <!-- Start Single List -->
                                <div class="single-list wow fadeInUp" data-wow-delay=".6s">
                                    <i class="lni lni-cog"></i>
                                    <h4>비대면 진료·처방약 배송 관련 장비 제공</h4>
                                    <p>진료 및 배송에 필요한
                                        패키지 프로모션 1회 제공</p>
                                </div>
                                <!-- Start Single List -->
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                <!-- Start Single List -->
                                <div class="single-list wow fadeInUp" data-wow-delay=".2s">
                                    <i class="lni lni-pointer-up"></i>
                                    <h4>수익 창구 추가로 매출 증대</h4>
                                    <p>기존 매출에 비대면진료-
                                        처방약 조제 추가 수익 발생</p>
                                </div>
                                <!-- Start Single List -->
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                <!-- Start Single List -->
                                <div class="single-list wow fadeInUp" data-wow-delay=".4s">
                                    <i class="lni lni-layout"></i>
                                    <h4>전담 CS파트 운영</h4>
                                    <p>신속하고 편리한
                                        관리 및 응대</p>
                                </div>
                                <!-- Start Single List -->
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                <!-- Start Single List -->
                                <div class="single-list wow fadeInUp" data-wow-delay=".6s">
                                    <i class="lni lni-laptop-phone"></i>
                                    <h4>원스톱 배송 시스템</h4>
                                    <p>오늘 배송 및 전국
                                        택배 배송 운영</p>
                                </div>
                                <!-- Start Single List -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 에브리닥터 혜택 부분 End -->

    <!-- 자주 묻는 질문 부분 Start -->
    <section class="faq section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="d-flex mb-5" style="justify-content: center;">
                        <h1>자주 묻는 질문</h1>
                    </div>
                    <div class="accordion" id="accordionExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <span>비대면 진료 - 약배송은 법적으로 문제가 없나요?</span><i class="lni lni-plus"></i>
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <p>코로나 19 상황에서 환자와 의료인의 감염 예방, 의료기관 보호 등을 위하여 비대면 진료 및 의약품 수령을 2020년 2월 24일부터 한시적으로 허용하였습니다.</p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <span>에브리닥터를 통한 비대면 진료는 병원에서 어떻게 진행이 되나요?</span><i
                                        class="lni lni-plus"></i>
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <p>에브리닥터가 제공하는 의사 전용 사이트를 통해 진행됩니다.
                                        진료접수(알람) → 진료정보 확인 → 진료시작 (전화/화상) → 처방전 업로드 및 진료비 입력 순서로 진행이 됩니다.</p>
                                    <p>비대면 진료는 유무선 전화, 화상통화 등을 활용하여 이루어지며 진료의 질을 보장하기 위하여 문자메시지, 메신저만을 이용한 진료는 불가합니다.</p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <span>비대면 진료 처방전 양식이 따로 있나요?</span><i class="lni lni-plus"></i>
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <p>종이처방전 법정서식(의료법 별지 제9호 서식)에 따라 발급된 처방전이라면 어떠한 형태로 전송하더라도 무방합니다.</p>
                                    <p>처방전 약국 전송 시, 본인확인에 필요한 환자 전화번호를 필수 기재해 주셔야 합니다.</p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    <span>화상 진료는 어떻게 진행이 되나요?</span><i class="lni lni-plus"></i>
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <p>에브리닥터 의사 전용 사이트에서 별도의 프로그램 설치 없이 진행 가능합니다.</p>
                                    <p>원내에 웹캠과 이어폰(마이크 포함)이 있으시면 진행하실 수 있습니다.</p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFive">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                    <span>가입절차가 어떻게 되나요?</span><i class="lni lni-plus"></i>
                                </button>
                            </h2>
                            <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <p>제휴 문의서를 작성하여 전송하시면 담당자 배정 후 순차적으로 연락드리겠습니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/ End Faq Area -->

    <!-- 정보 등록 Area Start -->
    <section class="dashboard section" style="background-color: #fff; padding-top: 0px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="main-content step-one-content">
                        <!-- 기관 등록 폼 시작 -->
                        <div class="dashboard-block mt-0 profile-settings-block">
                            <sec:authorize access="!isAuthenticated()">
                                <h2 style="color: #55DDBD;">제휴 신청은 회원가입 후에 가능합니다!!</h2>
                            </sec:authorize>
                            <h3 class="block-title">기관 등록</h3>
                            <div class="inner-block">
                                <form class="profile-setting-form default-form-style" method="post" action="./regist" enctype="multipart/form-data" id="form">
                                    <div class="row">
                                        <div style="flex-direction: column;">
                                            <!-- 종사자 문의 구분자 -->
                                            <div class="d-flex" style="align-items: center;">
                                                <div class="form-group col-6">
                                                    <label>문의유형*</label>
                                                    <div class="selector-head">
                                                        <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                                        <select class="user-chosen-select" name="medicRole" id="medicRole">
                                                            <option disabled selected>문의 유형을 선택해주세요</option>
                                                            <option value="의사">의사 제휴 문의</option>
                                                            <option value="간호사">간호사 제휴 문의</option>
                                                            <option value="수의사">수의사 제휴 문의</option>
                                                            <option value="약사">약사 제휴 문의</option>
                                                            <option value="보호소관리자">보호소 제휴 문의</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <!-- 진료과목 추가 버튼 -->
                                                <div id="medicSectionBtn">

                                                </div>
                                            </div>
                                            <!-- 진료 과목 -->
                                            <div id="medicSection">

                                            </div>

                                            <!-- 기관 문의 구분자 -->
                                            <!-- 위에 종사자 문의 구분에 따라 자동으로 기관 구분자가 결정되게 -->
                                            <input type="hidden" name="agencyRole" id="agencyRole" />

                                            <!-- 전문의 구분 -->
                                            <div class="form-group col-6" id="specialty">

                                            </div>
                                            <!-- 성함 -->
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>성함*</label>
                                                    <sec:authorize access="isAuthenticated()">
                                                        <sec:authentication property="Principal" var="member"/>
                                                            <input class="username" value="${member.name}" readonly="readonly" />
                                                            <input name="username" type="hidden" value="${member.username}" />
                                                    </sec:authorize>
                                                    <sec:authorize access="!isAuthenticated()">
                                                        <input type="text" value="제휴신청은 회원가입 후에 가능합니다!!" disabled style="color: #55DDBD;">
                                                    </sec:authorize>
                                                </div>
                                            </div>
                                            <!-- 상호명 입력 -->
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>상호명*</label>
                                                    <input name="agencyName" placeholder="상호명" id="agencyName" />
                                                    <div class="agencyNamem" style="color: #55DDBD;"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 전화번호 입력 -->
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>전화번호*</label>
                                                <input name="agencyTel" type="text" placeholder="02-111-1111" value="02-111-1111" id="agencyTel" />
                                                <div class="agencyTelm" style="color: #55DDBD;"></div>
                                            </div>
                                        </div>
                                        <!-- 주소 입력 -->
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>주소*</label>
                                                <div class="d-flex flex-row" style="justify-content: space-between;">
                                                    <div class="col-lg-6">
                                                        <input type="text" id="postcode" placeholder="우편번호" readonly="readonly" />
                                                    </div>
                                                    <div class="form-group button mb-0">
                                                        <button class="btn findPost" type="button" onclick="checkPost();" value="우편번호 찾기">우편번호 찾기</button>
                                                    </div>
                                                </div>
                                                <div>
                                                    <input type="text" id="mainAddress" placeholder="주소" readonly="readonly" style="margin-top: 3px;" />
                                                </div>
                                                <div class="d-flex flex-row">
                                                    <input type="text" id="detailAddress" placeholder="상세주소" style="margin-top: 3px;" />
                                                </div>
                                                <div class="addressm m" style="color: #55DDBD;"></div>
                                                <input type="hidden" name="agencyAddr" id="agencyAddr" />
                                            </div>
                                        </div>
                                        <!-- 기관 소개글 입력 -->
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>기관 소개글*</label>
                                                <textarea name="agencyInfo" placeholder="기관에 대한 정보를 입력해주세요">TEST 기관 소개글입니다</textarea>
                                            </div>
                                        </div>
                                        <!-- 종사자 소개글 입력 -->
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>본인 소개글*</label>
                                                <textarea name="medicInfo" placeholder="본인에 대한 정보를 입력해주세요">TEST 종사자 소개글입니다</textarea>
                                            </div>
                                        </div>
                                        <!-- 기관 운영 시간 -->
                                        <div class="form-group">
                                            <label>기관 운영 시간*</label>
                                            <label>입력 예시(08:00~18:00)</label>
                                        </div>
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>월요일</label>
                                                    <input name="mon" type="text" id="mon" />
                                                    <div class="m" style="color: #55DDBD;"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>화요일</label>
                                                    <input name="tue" type="text" id="tue" />
                                                    <div class="m" style="color: #55DDBD;"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>수요일</label>
                                                    <input name="wed" type="text" id="wed" />
                                                    <div class="agencyTelm" style="color: #55DDBD;"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>목요일</label>
                                                    <input name="thu" type="text" id="thu" />
                                                    <div class="agencyTelm" style="color: #55DDBD;"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>금요일</label>
                                                    <input name="fri" type="text" id="fri" />
                                                    <div class="agencyTelm" style="color: #55DDBD;"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>토요일</label>
                                                    <input name="sat" type="text" id="sat" />
                                                    <div class="agencyTelm" style="color: #55DDBD;"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>일요일</label>
                                                    <input name="sun" type="text" id="sun" />
                                                    <div class="agencyTelm" style="color: #55DDBD;"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>공휴일</label>
                                                    <input name="holiday" type="text" id="holiday" />
                                                    <div class="agencyTelm" style="color: #55DDBD;"></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <div class="form-group">
                                                    <label>점심시간</label>
                                                    <input name="lunch" type="text" id="lunch" />
                                                    <div class="agencyTelm" style="color: #55DDBD;"></div>
                                                </div>
                                            </div>
                                        <!-- AGENCYTYPE 임의로 값 입력 -->
                                        <input type="hidden" value="" name="agencyType" />
                                        <!-- USERNAME 임의로 값 입력 -->
                                        <!-- <input type="hidden" value="TestDoc1" name="username" /> -->
                                        <!-- 파일추가 버튼 누르면 파일추가 폼 생성되는 부분 -->
                                        <div id="fileAdd"></div>
                                        <!-- 파일 추가 버튼 -->
                                        <div class="col-12">
                                            <div class="form-group button mb-0">
                                               <button type="button" id="fileAddButton" class="btn">파일추가</button>
                                            </div>
                                         </div>
                                        <!-- 기관 등록 신청 버튼 -->
                                            <div class="form-group button mb-0 d-flex" style="flex-direction: row-reverse;">
                                                <button type="button" class="btn" id="registButton">기관 등록 신청</button>
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
    </section>
    <!-- 정보 등록 Area Finish -->

    <!-- Start Footer Area -->
	<c:import url="../../temp/footer.jsp"></c:import>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- JS -->
    <script src="/js/admin/agency/regist.js"></script>
    <script src="/js/admin/medic/chosen.jquery.js"></script>
    <!-- 다음 주소 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- 파일 추가 Script -->
    <script type="java/template" id="fileAddForm">
        <div class="col-12 d-flex file">
           <div class="form-group upload-image">
              <input name="files" type="file" placeholder="첨부파일명">
           </div>
           <div class="form-group button mb-0">
              <button type="button" class="btn del">취소</button>
           </div>
        </div>
    </script>

    <!-- 진료과목 추가 버튼 -->
    <script type="java/template" id="medicSectionBtnForm">
        <div class="form-group button mb-0">
            <button type="button" class="btn sectionAddBtn">진료과목 추가</button>
        </div>
    </script>

    <!-- 진료과목 select 폼 -->
    <script type="text/template" id="medicSectionForm">
        <div class="form-group col-6">
            <label>진료과목*</label>
            <div class="selector-head">
                <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                <select class="user-chosen-select" name="medicRole" id="medicSection">
                    <option disabled selected>진료 과목을 선택해주세요</option>
                    
                </select>
            </div>
        </div>
    </script>

     <script type="java/template" id="specialtyAddForm">
        <label>전문의 여부*</label>
        <div class="selector-head">
            <span class="arrow"><i class="lni lni-chevron-down"></i></span>
            <select class="user-chosen-select" name="medicSpecialty" id="medicSpecialty">
                <option disabled selected>문의 유형을 선택해주세요</option>
                <option value="null">해당없음</option>
                                                    
            </select>
        </div>
     </script>

</body>

</html>