<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <div class="col-lg-6 col-12">
                            <div class="form-group">
                                <label>Name*</label>
                                <input name="name" type="text" placeholder="Enter your name">
                            </div>
                        </div>
                        <div class="col-lg-6 col-12">
                            <div class="form-group">
                                <label>Mobile Numbe*</label>
                                <input name="number" type="text" placeholder="Enter mobile number">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <label>Country*</label>
                                <div class="selector-head">
                                    <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                    <select class="user-chosen-select">
                                        <option value="none">Select a Country</option>
                                        <option value="none">Afghanistan</option>
                                        <option value="none">America</option>
                                        <option value="none">Albania</option>
                                        <option value="none">Bangladesh</option>
                                        <option value="none">Brazil</option>
                                        <option value="none">India</option>
                                        <option value="none">South Africa</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-12">
                            <div class="form-group">
                                <label>Select City*</label>
                                <div class="selector-head">
                                    <span class="arrow"><i class="lni lni-chevron-down"></i></span>
                                    <select class="user-chosen-select">
                                        <option value="none">Select City</option>
                                        <option value="none">New York</option>
                                        <option value="none">Los Angeles</option>
                                        <option value="none">Chicago</option>
                                        <option value="none">San Diego</option>
                                        <option value="none">San Jose</option>
                                    </select>
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
                            <div class="google-map">
                                <div class="mapouter">
                                    <div class="gmap_canvas"><iframe width="100%" height="300" id="gmap_canvas"
                                            src="https://maps.google.com/maps?q=2880%20Broadway,%20New%20York&t=&z=13&ie=UTF8&iwloc=&output=embed"
                                            frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a
                                            href="https://123movies-to.org"></a><br>
                                        <style>
                                            .mapouter {
                                                position: relative;
                                                text-align: right;
                                                height: 300px;
                                                width: 100%;
                                            }
                                        </style><a href="https://www.embedgooglemap.net">embed
                                            google maps wordpress</a>
                                        <style>
                                            .gmap_canvas {
                                                overflow: hidden;
                                                background: none !important;
                                                height: 300px;
                                                width: 100%;
                                            }
                                        </style>
                                    </div>
                                </div>
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