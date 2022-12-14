<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Consult Detail</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <link rel="stylesheet" href="/css/consult/detail.css">
	<c:import url="../temp/boot.jsp"></c:import>
    <!-- Place favicon.ico in the root directory -->

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

    <!-- Start Header Area -->
    <c:import url="../temp/header.jsp"></c:import>
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">무료상담</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>무료상담</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
	<sec:authentication property="Principal" var="member"/>
    <!-- Start Blog Singel Area -->
    <section class="section blog-single">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1 col-md-12 col-12">
                    <div class="single-inner">
                        <div class="post-thumbnils">
                            <c:forEach items="${consultDetail.consultFiles }" var="file">
                            	<img class="detailImages" alt="" src="/file/CONSULT/${file.fileName }">
                            </c:forEach>
                        </div>
                        <div class="post-details">
                            <div class="detail-inner">
                                <h2 class="post-title">
                                    <a href="blog-single.html">${consultDetail.consultTitle }</a>
                                </h2>
                                <!-- post meta -->
                                <ul class="custom-flex post-meta">
                                    <li>
                                        <img class="calendarIconImg" alt="" src="/images/consult/detail_calendar_clock_icon.svg">
                                        ${consultDetail.consultReqDate }
                                    </li>
                                    <li>
                                        <img class="commentIconImg" alt="" src="/images/consult/comment_icon.svg">
                                        <span id="answerCountSpan"></span>
                                    </li>
                                    <li>
                                        <c:if test="${consultDetail.hospitalCategoryVO[0].categoryIcon != null }">
	                                     	<img class="categoryIconImg" alt="" src="/images/hospital/home/${consultDetail.hospitalCategoryVO[0].categoryIcon }">
	                                    </c:if>
	                                    ${consultDetail.hospitalCategoryVO[0].categoryName }
                                    </li>
                                </ul>
                                <p data-content-consultnum="${consultDetail.consultNum }" id="consultContentParagraph">${consultDetail.consultContent }</p>
                                
                            </div>
                            
                            <c:if test="${member.username == consultDetail.username }">
                            	<div class="button" data-consultnum="${consultDetail.consultNum }" id="buttonFrame">
                                	<button type="button" class="btn" id="updateBtn">수정하기</button>
                                	<button type="button" class="btn" id="deleteBtn">삭제하기</button>
                                </div>
                            </c:if>
                            
                            <sec:authorize access="hasAnyRole('ADMIN', 'DOCTOR', 'PETDOC', 'NURSE', 'PETNURSE')">
	                            <div class="comment-form">
	                                <h3 class="comment-reply-title"><span>답글달기</span></h3>
	                                <form action="/consult/answer/write" method="POST" id="consultAnswerForm">
	                                	<input type="hidden" name="username" value="${member.username }" id="answerUsernameInput">
	                                	<input type="hidden" name="consultNum" value="${consultDetail.consultNum }" id="answerConsultNumInput">
	                                    <div class="row">
	                                        <div class="col-12">
	                                            <div class="form-box form-group">
	                                                <textarea name="answerContent" class="form-control form-control-custom"
	                                                    placeholder="Your Comments" id="answerContentInput"></textarea>
	                                            </div>
	                                        </div>
	                                        <div class="col-12">
	                                            <div class="button">
	                                                <button type="button" class="btn" id="consultAnswerBtn">Post Comment</button>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </form>
	                            </div>
                            </sec:authorize>
                            
                            <!-- Comments -->
                            <div class="post-comments">
                                <h3 class="comment-title"><span><span id="consultAnswerCountSpan"></span>comments on this post</span></h3>
                                <ul class="comments-list" id="consultAnswerList">
                                    
                                </ul>
                                
                            </div>
                            <div class="col-12">
	                        	<div class="button">
	                            	<button type="button" class="btn" id="consultAnswerMoreBtn">더보기</button>
	                            </div>
	                        </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Blog Singel Area -->

    <!-- Start Footer Area -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>
    
    <script type="text/javascript" src="/js/consult/detail.js"></script>
    <script type="text/javascript" src="/js/consult/answer/write.js"></script>
    
    <script type="text/template" id="consultAnswerTemplate">
		<li>
        	<div class="comment-img">
            	<img src="{userFileName}" class="rounded-circle" alt="img">
            </div>
            <div class="comment-desc">
            	<div class="desc-top">
                    <h6>{name}</h6>
                    <span class="date">{consultAnswerRegDate}</span>
                </div>
                <p>
					{consultAnswerContent}
                </p>
        	</div>
        </li>
	</script>

</body>

</html>