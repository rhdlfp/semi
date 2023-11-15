<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>    

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="/semiProject/Main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>	
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dancing+Script&family=Kotta+One&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<meta http-equiv="Content-Type" content="text-html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<%
        String userID = null;
     if(session.getAttribute("userID") != null){
    	 userID = (String) session.getAttribute("userID");
     }
     
     if(userID == null){
         PrintWriter script = response.getWriter();
      	  script.println("<script>");
      	  script.println("alert('로그인을 하세요.')");
      	  script.println("location.href = 'login.jsp'");
      	  script.println("</script>");
     }
     int bbsID = 0;
     if(request.getParameter("bbsID") != null){
    	 bbsID = Integer.parseInt(request.getParameter("bbsID"));
     }
     
     if(bbsID == 0) {
         PrintWriter script = response.getWriter();
      	  script.println("<script>");
      	  script.println("alert('유효하지 않은 글입니다.')");
      	  script.println("location.href = 'bbs.jsp'");
      	  script.println("</script>");
     }
     Bbs bbs = new BbsDAO().getBbs(bbsID);
     if(!userID.equals(bbs.getUserID())){
         PrintWriter script = response.getWriter();
      	  script.println("<script>");
      	  script.println("alert('권한이 없습니다.')");
      	  script.println("location.href = 'bbs.jsp'");
      	  script.println("</script>");
     }
     
     %>


    <header>
        <nav class="chacam">
        <div class="chacam_logo">
            <a href="chacam">CHACAM</a>
        </div>
        <ul class="chacam_menu">

            <li><a href="chacam">HOME</a></li>
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
	
	
	<div class="container">
		<div class="row">
			<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판 글 수정양식</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
							</tr>
							
							<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bbs.getBbsContent() %></textarea></td>

						</tr>

					</tbody>

				</table>
				<a href="javascript:history.back()" class="btn btn-primary"> <<	Back </a>
				<input type="submit" class="btn btn-primary pull-rigth" value="글 수정">
			</form>


		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>














