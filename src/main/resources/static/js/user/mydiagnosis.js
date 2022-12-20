/**
 *
 */

console.log("mydiagnosis.js")

$('.diagnosis-detail').click(function() {
	console.log()
	// page 이동할 예정
	location.href='/user/diagnosis/mydetail?dansnum='+$(this).attr("data-dansnum");
})