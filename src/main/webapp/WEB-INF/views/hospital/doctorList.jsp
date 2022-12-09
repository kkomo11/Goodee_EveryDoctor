<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <c:forEach items="${doctorList}" var="doctorVO">
    	<div class="col-lg-4 col-md-6 col-12">
            <!-- Start Single Item -->
            <div class="single-item-grid">
                <div class="image">
                    <a href="doctor/detail"><img src="/file/profile/${doctorVO.userVO.fileName}" alt="#"></a>
                    <span class="flat-badge sale">즉시</span>
                </div>
                <div class="content">
                    <a href="javascript:void(0)" class="tag">가정의학과 전문의</a>
                    <h3 class="title">
                        <a href="doctor/detail">${doctorVO.userVO.name}</a>
                    </h3>
                    <p class="location"><a href="javascript:void(0)"><i class="lni lni-map-marker">
                            </i>${doctorVO.agencyVO.agencyName}</a></p>
                    <ul class="info">
                        <li class="price">
                            <img class="grade-star" src="/images/star.png"> 4.9(300+)
                        </li>
                        <li class="like"><a href="doctor/detail"><i class="lni lni-heart"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- End Single Item -->
        </div>
    </c:forEach>
</body>
</html>