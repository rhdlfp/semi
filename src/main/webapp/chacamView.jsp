<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="chacamList.ChacamList" %> 
<%@ page import="chacamList.ChacamListDAO" %> 
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="user.UserDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="mapsection.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dancing+Script&family=Kotta+One&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<meta http-equiv="Content-Type" content="text-html; charset=UTF-8">

<title>차박뷰</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

	<%
        String userID = null;
     if(session.getAttribute("userID") != null){
    	 userID = (String) session.getAttribute("userID");
     }
     
     int infoid = 0;
     if(request.getParameter("infoid") != null){
    	 infoid = Integer.parseInt(request.getParameter("infoid"));
     }
     
     if(infoid == 0) {
         PrintWriter script = response.getWriter();
      	  script.println("<script>");
      	  script.println("alert('유효하지 않은 글입니다.')");
      	  script.println("location.href = 'chacamList.jsp'");
      	  script.println("</script>");
     }
     
     ChacamList chacam = new ChacamListDAO().getChacam(infoid);
     
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

	<div class="container w-75 mt-5 mx-auto" >
		
		<hr>
		<div class="container w-75 mt-5 mx-auto">
			<div class="card-body">
				<h2>${chacamlist.infotitle}</h2>
				<h5 class="card-text">주소 : ${chacamlist.infoaddress}</h5>
				
			</div>
			<br>
			<div class="container" style="width: 1000px; height: 500px; text-align: left;">
				<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:640px; height:480px;">

					<c:if test="${not empty chacamlist.img1}">
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<c:if test="${not empty chacamlist.img2}">
								<li data-target="#myCarousel" data-slide-to="1"></li>
							</c:if>
							<c:if test="${not empty chacamlist.img3}">
								<li data-target="#myCarousel" data-slide-to="2"></li>
							</c:if>
							<c:if test="${not empty chacamlist.img4}">
								<li data-target="#myCarousel" data-slide-to="3"></li>
							</c:if>
							<c:if test="${not empty chacamlist.img5}">
								<li data-target="#myCarousel" data-slide-to="4"></li>
							</c:if>
						</ol>
					</c:if>

					<div class="carousel-inner" style="height:450px;">
						<c:if test="${not empty chacamlist.img1}">
							<div class="item active">
								<img class="card-img-top" src="${chacamlist.img1}" alt="Image"
									style="width:100%; height:100%;" id="imageElement1">
									
							</div>
						</c:if>
						<c:if test="${not empty chacamlist.img2}">
							<div class="item">
								<img class="card-img-top" src="${chacamlist.img2}" alt="Image"
									style="width:100%; height:100%;" id="imageElement2">
							</div>
						</c:if>
						<c:if test="${not empty chacamlist.img3}">
							<div class="item">
								<img class="card-img-top" src="${chacamlist.img3}" alt="Image"
									style="width:100%; height:100%;" id="imageElement3">
							</div>
						</c:if>
						<c:if test="${not empty chacamlist.img4}">
							<div class="item">
								<img class="card-img-top" src="${chacamlist.img4}" alt="Image"
									style="width:100%; height:100%;" id="imageElement4">
							</div>
						</c:if>
						<c:if test="${not empty chacamlist.img5}">
							<div class="item">
								<img class="card-img-top" src="${chacamlist.img5}" alt="Image"
									style="width:100%; height:100%;" id="imageElement5">
							</div>
						</c:if>
					</div>

				</div>
			</div>
				<h5 class="card-text">설명 : ${chacamlist.content}</h5>
		</div>
		</div>
		<hr>
		<div style="margin-left:24%;">
		<a href="javascript:history.back()" class="btn btn-primary"> <<	Back </a>
						<a href="chacamList" class="btn btn-primary">목록</a>
						
		
		
		<% 
				   if(userID != null && userID.equals(chacam.getUserID())){
					   %>
					       <a href="chacamViewUpdate.jsp?infoid=<%= infoid %>" class="btn btn-primary">수정</a>
					       <a onclick="return confirm('정말로 삭제하시겠습니까?')"
					       href="chacamList?action=deleteChacam&infoid=<%= infoid %>" class="btn btn-primary">삭제</a>
					   <% 
				   }
				%>				
					<%
    if (userID != null) {
        UserDAO userDAO = new UserDAO();
        ArrayList<Integer> wishlist = userDAO.getWishlist(userID);
        boolean isItemInWishlist = wishlist.contains(infoid);

        %>
        <button class="btn btn-primary addToWishlist" data-infoid="<%= infoid %>"
            <% if (isItemInWishlist) { %> disabled <% } %>>
            <%= isItemInWishlist ? "이미 즐겨찾기에 추가됨" : "즐겨찾기" %>
        </button>
        <%
    }
%>
</div>

	

<script>
    function addToWishlist(infoid) {
        // JavaScript 코드로 DAO를 직접 호출하여 처리
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "processWishlist.jsp?infoid=" + infoid, true); // 처리하는 JSP 파일로 변경
        
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    alert("즐겨찾기에 추가되었습니다.");
                    location.reload();
                } else {
                    alert("오류가 발생하였습니다.");
                }
            }
        };
        
        xhr.send();
    }

    document.addEventListener("DOMContentLoaded", function() {
        var addToWishlistButtons = document.querySelectorAll(".addToWishlist");
        
        addToWishlistButtons.forEach(function(button) {
            button.addEventListener("click", function() {
                var infoid = button.getAttribute("data-infoid");
                addToWishlist(infoid);
            });
        });
    });
</script>
	
	

	<script src="chacamList/chacamView.js"></script>


</body>
</html>