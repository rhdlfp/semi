<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="chacamList.ChacamListDAO"%>
<%@ page import="chacamList.ChacamList"%>


<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="mapsection.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dancing+Script&family=Kotta+One&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<meta http-equiv="Content-Type" content="text-html; charset=UTF-8">

<title>chacamViewUpdate</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	int infoid = 0;
	if (request.getParameter("infoid") != null) {
		infoid = Integer.parseInt(request.getParameter("infoid"));
	}

	if (infoid == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
	ChacamList chacamList = new ChacamListDAO().getChacam(infoid);
	if (!userID.equals(chacamList.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'chacamList'");
		script.println("</script>");
	}
	%>


	<header>
        <nav class="chacam">
        <div class="chacam_logo">
            <a href="mainPage.jsp">CHACAM</a>
        </div>
        <ul class="chacam_menu">

            <li><a href="mainPage.jsp">HOME</a></li>
            <li><a href="carsection.jsp">CAR</a></li>
            <li><a href="mapsection.jsp">SPOT</a></li>
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
						<li><a href="myPage.jsp"><%=userID%> My</a></li>
						<li><a href="logoutAction.jsp">Logout</a></li>
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

		<div class="row">

			<form method="post" action="chacamViewUpdateAction.jsp?infoid=<%= infoid %>">
				<label class="form-label">제목</label>
				<input type="text" name="infotitle" class="form-control" value="<%=chacamList.getInfotitle()%>">
				<label class="form-label">주소</label>
				<input type="text" name="infoaddress" class="form-control" value="<%=chacamList.getInfoaddress()%>">
				<label class="form-label">이미지(최대 5개 선택)</label>
				<input type="file" name="files[]" class="form-control" multiple accept="image/*" onchange="checkFileCount(this)">
				<label class="form-label">설명</label>
				<textarea rows="5" cols="50" name="content" class="form-control"><%=chacamList.getContent()%></textarea>
				
				<input type="hidden" name="userID" value="<%=session.getAttribute("userID")%>">
				<button type="submit" class="btn btn-success mt-3">저장</button>

			</form>

		</div>

	</div>



</body>
</html>














