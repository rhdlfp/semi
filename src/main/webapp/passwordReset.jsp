<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="Main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>	
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dancing+Script&family=Kotta+One&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<meta http-equiv="Content-Type" content="text-html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
    
    <title>JSP 게시판 웹사이트</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
        <h2>비밀번호 찾기</h2>
        <form method="post" action="resetPassword">
            <div class="form-group">
                <label for="userID">아이디:</label>
                <input type="text" class="form-control" id="userID" name="userID" required>
            </div>
            <div class="form-group">
                <label for="userEmail">이메일:</label>
                <input type="email" class="form-control" id="userEmail" name="userEmail" required>
            </div>
            <button type="submit" class="btn btn-primary">확인</button>
        </form>

        <div class="result-message mt-3">
            <% if (request.getAttribute("userPassword") != null) { %>
                <p class="text-success"><strong>비밀번호를 찾았습니다:</strong> <%= request.getAttribute("userPassword") %></p>
            <% } else if (request.getAttribute("error") != null) { %>
                <p class="text-danger"><strong>오류:</strong> <%= request.getAttribute("error") %></p>
            <% } %>
        </div>
    </div>
</body>
</html>

