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