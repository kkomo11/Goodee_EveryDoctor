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
            <sec:authorize access="hasRole('PHARMACIST')">
            	<li><a href="/drug/prescription/list"><i class="lni lni-heart"></i>진료 대기</a></li>
            	<li><a href="/drug/prescription/list"><i class="lni lni-bookmark"></i>진료 완료</a></li>
            </sec:authorize>
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