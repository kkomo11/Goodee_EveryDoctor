<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤헤헤</title>
</head>
<body>
	<form action="/fileUpload" method="post" enctype="multipart/form-data">
		<label>NUM</label>
		<input type="text" name="num" id="num">
		<br>
		<label>Files</label>
		<input type="file" name="files">
		<br>
		<button type="submit">submit</button>
	</form>
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