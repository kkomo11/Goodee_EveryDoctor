<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤헤헤</title>
</head>
<body>
	<c:import url="./temp/boot.jsp"></c:import>
	<form action="/fileUpload" method="post" enctype="multipart/form-data">
		<label>NUM</label>
		<input type="text" name="num" id="num">
		<br>
		<label>Files</label>
		<input type="file" name="files">
		<br>
		<button type="submit">submit</button>
	</form>
	
	
	<h1>구분선</h1>
	<div class="toast-container position-static">
	  <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
	    <div class="toast-header">
	      <img src="..." class="rounded me-2" alt="...">
	      <strong class="me-auto">Bootstrap</strong>
	      <small class="text-muted">just now</small>
	      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
	    </div>
	    <div class="toast-body">
	      See? Just like this.
	    </div>
	  </div>
	
	  <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
	    <div class="toast-header">
	      <img src="..." class="rounded me-2" alt="...">
	      <strong class="me-auto">Bootstrap</strong>
	      <small class="text-muted">2 seconds ago</small>
	      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
	    </div>
	    <div class="toast-body">
	      Heads up, toasts will stack automatically
	    </div>
	  </div>
	</div>
	<script type="text/javascript">
		let num = document.getElementById("num");
		let cur = new Date();
		let nv = cur.getHours()*10000
		nv += cur.getMinutes()*100
		nv += cur.getSeconds()
		num.value=nv;
	</script>
</body>
</html>