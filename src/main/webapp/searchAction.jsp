<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>

<%
String searchKeyword = request.getParameter("searchKeyword");
String searchType = request.getParameter("searchType");

if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
    response.sendRedirect("bbs.jsp");
} else {
    searchKeyword = searchKeyword.trim();
    BbsDAO bbsDAO = new BbsDAO();
    ArrayList<Bbs> searchResults = bbsDAO.searchPosts(searchType, searchKeyword);
%>

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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

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
    <br><br><br><br>
    <div class="container">
     <form class="search-form" method="GET" action="searchAction.jsp">
				<input type="text" class="form-control" name="searchKeyword"
					placeholder="검색어 입력"> <label><input type="radio"
					name="searchType" value="title" checked> 제목</label> <label><input
					type="radio" name="searchType" value="author"> 작성자</label>
				<button type="submit" class="btn btn-primary">검색</button>
			</form>

    <div class="container">
        <h2>"<%= searchKeyword %>" 검색 결과</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
                </tr>
            </thead>
            <tbody>
                <% for (Bbs post : searchResults) { %>
                <tr>
                    <td><%= post.getBbsID() %></td>
                    <td><a href="view.jsp?bbsID=<%= post.getBbsID() %>"><%= post.getBbsTitle() %></a></td>
                    <td><%= post.getUserID() %></td>
                    <td><%= post.getBbsDate() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="bbs.jsp" class="btn btn-primary">목록</a>
    </div>

</body>
</html>

<%
}
%>
