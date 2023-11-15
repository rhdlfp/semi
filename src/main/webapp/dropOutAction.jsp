<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="mapsection.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>	
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dancing+Script&family=Kotta+One&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<meta http-equiv="Content-Type" content="text-html; charset=UTF-8">

<title>회원 탈퇴</title>




</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>

    <header>
        <nav class="chacam">
        <div class="chacam_logo">
            <a href="mainPage.jsp">CHACAM</a>
        </div>
        <ul class="chacam_menu">
            <li><a href="mainPage.jsp">HOME</a></li>
            <li><a href="car.html">CAR</a></li>
            <li><a href="spot.html">SPOT</a></li>
            <li><a href="chacamList">CUMUNITY</a></li>
            <li><a href="bbs.jsp">Q&A</a></li>
            
         <%   
                 if(userID == null){
    	 %>
						<li><a href="login.jsp">LOGIN</a></li>
						<li><a href="join.jsp">회원가입</a></li>
			<% 
     }else{
    	 %>
						<li><a href="myPage.jsp">마이페이지</a></li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
		<%
     		}
   		%>
        </ul>
    </nav>
    </header>
    <br>
	<br>
    <br>
	<br>
   
   
<div class="container">
        <form method="post" action="dropoutProcess.jsp" class="form-container">
            <h3 style="text-align: center;">회원 탈퇴</h3>
            <div class="form-group">
                <label for="userPassword">비밀번호:</label>
                <input type="password" id="userPassword" name="userPassword" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">비밀번호 확인:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">회원 탈퇴</button>
            </div>
        </form>
        <script>
        const form = document.querySelector('form');
        form.addEventListener('submit', function(event) {
            const userPassword = document.getElementById('userPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (userPassword !== confirmPassword) {
                alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
                event.preventDefault();
            } else {
                if (!confirm('진짜로 탈퇴하시겠습니까?')) {
                    event.preventDefault();
                }
            }
        });
    </script>
    </div>

</body>
</html>
