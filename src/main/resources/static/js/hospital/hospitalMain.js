$('#nav-latest-tab').click(function() {
	let url = location.href;
	location.replace(url+'#sign');
	url = url.replace(/(#.*)/ig,'');
	history.replaceState(null, null, url);
})

$('#nav-popular-tab').click(function() {
	let url = location.href;
	location.replace(url+'#subject');
	url = url.replace(/(#.*)/ig,'');
	history.replaceState(null, null, url);
})

function loadDoctorList() {
	$.ajax({
		type:"GET",
		url:"/hospital/doctor/list",
		success: function(data) {
			$("#doctorSignList").html(data);
			$("#doctorSubjectList").html(data);
		}
	})
}

window.onload=loadDoctorList();