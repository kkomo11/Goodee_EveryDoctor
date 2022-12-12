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
                <a href="doctor/detail?username=${doctorVO.username}">
                    <div class="image">
                        <img src="/file/profile/${doctorVO.fileName}" alt="#">
                        <span class="flat-badge sale">즉시</span>
                    </div>
                    <div class="content">
                        <div class="tag">
                            <c:if test="${not empty doctorVO.medicVO.medicSpecialty}">
                            	<span>${doctorVO.medicVO.medicSpecialty} 전문의</span>
                            </c:if>
                        </div>
                        <h5 class="title">
                            ${doctorVO.name}
                        </h5>
                        <p class="location"><i class="lni lni-map-marker">
                            </i>${doctorVO.agencyVO.agencyName}</p>
                        <ul class="info">
                            <li class="price">
                                <img class="grade-star" src="/images/star.png"> 4.9(300+)
                            </li>
                            <li class="like"><i class="lni lni-heart"></i>
                            </li>
                        </ul>
                    </div>
                </a>
            </div>
            <!-- End Single Item -->
        </div>
    </c:forEach>
</body>
</html>