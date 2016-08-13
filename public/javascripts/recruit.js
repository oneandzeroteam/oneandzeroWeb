$(document).ready(function () {
	$("#recruitform").on("ajax:success", function (e, data, status, xhr) {
		alert("Success!");
	});
	$("#recruitform").on("ajax:error", function (e, xhr, status, error) {
		alert("Fail...");
	});
});
