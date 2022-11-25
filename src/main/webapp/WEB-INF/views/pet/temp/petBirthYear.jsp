<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select name="petBirthYear" class="btn btn-success">
	<option selected="selected">Year</option>
	<c:forEach begin="2000" end="2022" step="1" var="i">
		<option value="${i }">${i }</option>
	</c:forEach>
</select>