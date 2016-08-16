$(document).ready(function () {
	$("#recruitform").on("ajax:success", function (e, data, status, xhr) {
		if (data.status == "success")
			alert("지원이 완료되었습니다. 3일 이내로 연락이 가지 않으면 다시 지원서를 보내주시거나 홈페이지 하단에 있는 회장 전화번호로 직접 메시지를 보내주세요.");
		else
			alert("전송에 실패했습니다.\n"+data.reason);
	});
	$("#recruitform").on("ajax:error", function (e, xhr, status, error) {
		alert("전송에 실패했습니다. 다시 시도해주세요.");
	});
});
