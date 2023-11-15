function checkFileCount(input) {
	if (input.files.length > 5) {
		alert("파일은 최대 5개까지 선택할 수 있습니다.");
		input.value = "";
	}
}

function checkUserID() {
    var userID = '<%= session.getAttribute("userID") %>';
    if (userID === null || userID === "") {
        var confirmed = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
        if (confirmed) {
            window.location.href = "login.jsp"; // 로그인 페이지 URL로 변경
        }
        return false; // 폼 전송을 막음
    }
    return true; // 폼 전송을 허용
}
