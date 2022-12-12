<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Login</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

	<c:import url="../temp/boot.jsp"></c:import>

</head>

<body>
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
                        <h1 class="page-title">Login</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>Login</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- start login section -->
    <section class="login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                    <div class="form-head">
                        <h4 class="title">Login</h4>
                        <div class="text-center">
                            <span style="color: red;">${message}</span>
                        </div>
                        <form action="./login" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<div class="form-group">
                                <label>Username</label>
                                <input name="username" type="text" value="${cookie.rememberUN.value}">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input name="password" type="password">
                            </div>
                            <div class="check-and-pass">
                                <div class="row align-items-center">
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input width-auto"
                                                name="rememberId">
                                            <label class="form-check-label">Remember ID</label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <a href="javascript:void(0)" class="lost-pass">Lost your password?</a>
                                    </div>
                                </div>
                            </div>
                            <div class="button">
                                <button type="submit" class="btn">Login Now</button>
                            </div>
                            <div class="alt-option">
                                <span>Or</span>
                            </div>
                            <div class="socila-login">
                                <ul>
                                    <li><a href="/oauth2/authorization/kakao">카카오로그인</a></li>
                                    <li><a href="/oauth2/authorization/naver" class="google" id="naver_id_login">네이버로그인</a>
                                    </li>
                                </ul>
                            </div>
                            <p class="outer-link">Don't have an account? <a href="registration">Register here</a>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>


	<script type="text/javascript">

	$("#preModal").trigger("click")
	

	</script>


	<!-- Footer -->
    <c:import url="../temp/footer.jsp"></c:import>


    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

</body>

</html>