function loadDoctorList(sectionNum, page) {
	$.ajax({
		type:"GET",
		url:"/hospital/doctor/list?sectionNum="+sectionNum+"&page="+page,
		success: function(data) {
			$("#doctorSubjectList").html(data);
		}
	})
}

window.onload=loadDoctorList(0, 1);

$('#doctors').click(function() {
    let url = location.href;
    location.replace(url+'#doctorList');
    url = url.replace(/(#.*)/ig,'');
    history.replaceState(null, null, url);
})