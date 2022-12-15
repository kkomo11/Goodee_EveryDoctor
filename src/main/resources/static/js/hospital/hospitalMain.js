function loadDoctorList(sectionNum) {
	$.ajax({
		type:"GET",
		url:"/hospital/doctor/list?sectionNum="+sectionNum,
		success: function(data) {
			$("#doctorSubjectList").html(data);
		}
	})
}

window.onload=loadDoctorList(0);