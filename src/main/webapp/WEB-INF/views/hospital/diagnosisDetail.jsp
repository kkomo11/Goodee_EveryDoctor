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
    <!-- End Preloader -->

    <!-- Start Header Area -->
    <c:import url="../temp/header.jsp"></c:import>
    <!-- End Header Area -->

    <section class="dashboard section">
        <div class="container">
            <div class="row">
                <form class="default-form-style" method="post" action="#">
                    <div class="row">
                        <div class="dashboard-block">
                        <h3 class="block-title">환자 정보</h3>
                        <div class="d-flex justify-content-between">
                            <div class="col-lg-2 col-12">
                                <div class="form-group">
                                    <label>환자 이름</label>
                                    <input name="name" type="text" placeholder="Enter your name">
                                </div>
                            </div>
                            <div class="col-lg-4 col-12">
                                <div class="form-group">
                                    <label>전화번호</label>
                                    <input name="number" type="text" placeholder="Enter mobile number">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label>성별</label>
                                    <input name="sex" type="text" placeholder="Enter mobile number">
                                </div>
                            </div>
                            <div class="col-lg-2 col-12">
                                <div class="form-group">
                                    <label>개인정보제공 동의 여부</label>
                                    <input name="sex" type="text" placeholder="X">
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-6 col-12">
                            <div class="form-group">
                                <label>Select State*</label>
                                <div class="selector-head">
                                    <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                    <select class="user-chosen-select">
                                        <option value="none">Select State</option>
                                        <option value="none">New York</option>
                                        <option value="none">Texas</option>
                                        <option value="none">Arizona</option>
                                        <option value="none">Florida</option>
                                        <option value="none">Washington</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <label>Address*</label>
                                <input name="address" type="text" placeholder="Enter a location">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    I agree to all Terms of Use & Posting Rules
                                </label>
                            </div>
                            <div class="form-group button mb-0">
                                <button type="submit" class="btn alt-btn">Previous</button>
                                <button type="submit" class="btn ">Submit Ad</button>
                            </div>
                        </div>
                        </div>
                    </div>
                </form>
                <!-- Start Post Ad Step Three Content -->
            </div>
        </div>
    </section>

    <!-- Start Footer Area -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>
</body>
</html>