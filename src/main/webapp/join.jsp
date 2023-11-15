<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="joinAction.jsp">
               <h3 style="text-align: center;">회원가입 화면</h3>   
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
               </div>
                  
               <div class="form-group">
                  <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
               </div>  
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
               </div>
               <div class="form-group">
                  <input type="text" class="form-control" placeholder="닉네임" name="nickName" maxlength="20">
               </div>
               <div class="form-group" style="text-align: center;">
                <div class="btn-group" data-toggle="buttons">
                 <label class="btn btn-primary active">
                   <input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자                 
                 </label>
                 <label class="btn btn-primary">
                   <input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자                 
                 </label>
                </div>                 
               </div>
               <div class="form-group">
                  <input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
               </div>
               <input type="submit" class="btn btn-primary form-control" value="회원가입">       
               
                </form>
      
      </div>
      </div>
      <div class="col-lg-4"></div>
   </div>
   
   
   
   
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>

</body>
</html>














