<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="Principal" var="user"/>
<!-- Start Dashboard Sidebar -->
<div class="dashboard-sidebar">
    <div class="user-image">
        <img src="${user.fileName}" alt="#" style="object-fit: cover;">
        <h3>${user.name}
            <span><a href="javascript:void(0)">${user.username}</a></span>
        </h3>
    </div>
    <div class="dashboard-menu">
        <ul id="sidebarMenu">
            <li><a href="/user/dashboard"><i class="lni lni-dashboard"></i> 마이페이지</a></li>
            <li><a href="/user/profile"><i class="lni lni-pencil-alt"></i>
                    내 프로필</a></li>
            <li><a href="/user/mydiaglist"><i class="lni lni-printer"></i> 내 진료내역</a></li>
            <li><a href="/user/petdiaglist"><i class="lni lni-bookmark"></i> 반려동물 진료내역</a></li>
            <sec:authorize access="hasAnyRole('PETDOC')">
            	<li><a href="/pet/diagnosis/reservatedList?d=${user.username }"><i class="lni lni-bookmark"></i>요청된 진료</a></li>
            </sec:authorize>
            <li><a href="/pet/profile/myPetList?username=${user.username }"><i class="lni lni-heart"></i> 반려동물 관리</a></li>
            <li><a href="#"><i class="lni lni-envelope"></i> 내 주소관리</a></li>
            <li><a href="#"><i class="lni lni-circle-plus"></i> 스케줄러</a></li>
            <li><a href="#"><i class="lni lni-trash"></i> 회원 탈퇴</a></li>
        </ul>
        <div class="button">
            <a class="btn" href="/logout">로그아웃</a>
        </div>
    </div>
</div>
<!-- End Dashboard Sidebar -->
<script type="text/javascript">
let currentlocation = location.href

$("#sidebarMenu").children().each(function(index, item){
	if(item.children[0].href==currentlocation){
		item.children[0].className="active"
	}
})
</script>