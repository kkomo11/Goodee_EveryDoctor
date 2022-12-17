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
                        <img src="${doctorVO.fileName}" style="object-fit: cover;">
                        <span class="flat-badge sale">즉시</span>
                    </div>
                    <div class="content">
                        <h5 class="title">
                            ${doctorVO.name} <c:if test="${not empty doctorVO.medicVO.medicSpecialty}">
                                <span style="font-size: 14px; color: #888; font-weight: 500;">${doctorVO.medicVO.medicSpecialty} 전문의</span>
                            </c:if>
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
    <div class="row">
        <div class="col-12">
            <!-- Pagination -->
            <div class="pagination left">
                <ul class="pagination-list">
                    <a ${pager.pre?'class="lni lni-chevron-left"':' class="disabled"'} href="list?page=${pager.startNum-1}"><</a>
                    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                        <li><a href="javascript:void(0)" onclick="loadDoctorList(${pager.sectionNum}, ${i})">${i}</a></li>
                    </c:forEach>
                    <a ${pager.next?'class="lni lni-chevron-right"':' class="disabled"'} href="list?page=${pager.lastNum+1}">></a>
                </ul>
            </div>
            <!--/ End Pagination -->
        </div>
    </div>
</body>
</html>