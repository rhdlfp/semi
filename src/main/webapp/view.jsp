<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Comment"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>

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

<title>JSP 게시판 웹사이트</title>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID") != null){
            userID = (String) session.getAttribute("userID");
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
	<br>

	<div class="container">
		<div class="">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">게시판 글
							보기</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분"%></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>


				</tbody>

			</table>
			<a href="bbs.jsp" class="btn btn-primary">목록</a>
			<button class="btn btn-primary" onclick="toggleCommentForm()">댓글 작성</button>
			<% 
				   if(userID != null && userID.equals(bbs.getUserID())){
					   %>
			<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')"
				href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
				
			<% 
				   }
				
				%>
				
				</div>
				</div>
				

		
<!-- 댓글 작성 폼 숨기기/보이기를 위한 함수 -->
<script>
    function toggleCommentForm() {
        var commentForm = document.getElementById("commentForm");
        if (commentForm.style.display === "none") {
            commentForm.style.display = "block";
        } else {
            commentForm.style.display = "none";
        }
    }
</script>



    <div class="container">
        <div class="row mt-4">
            <div class="col-md-3"></div>
            <div class="col-md-6" id="commentForm" style="display: none;">
                <form method="post" action="addCommentAction.jsp">
                    <input type="hidden" name="bbsID" value="<%= bbsID %>">
                    <div class="mb-3">
                        <label for="commentContent" class="form-label">댓글 내용</label>
                        <textarea class="form-control" id="commentContent" name="commentContent" rows="3" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-sm btn-primary">작성</button>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>

        <div class="row mt-4">
            <div class="col-md-3"></div>
            <div class="col-md-12">
                <ul class="list-group mt-3">
                    <% 
                    List<Comment> commentList = new BbsDAO().getComments(bbsID);
                    ArrayList<Comment> commentArrayList = new ArrayList<>(commentList);
                    for (Comment comment : commentArrayList) {
                    %>
                    <li class="list-group-item">
                        <div class="d-flex justify-content-between align-items-center">
                            <!-- 삭제 버튼 추가: 작성자 본인 댓글인 경우에만 표시 -->

                            <!-- 대댓글 작성 버튼 -->
                            <% if (userID != null && userID.equals(bbs.getUserID())) { %>
                            <button class="btn btn-sm btn-primary reply-button" data-toggle="collapse" data-target="#replyForm_<%= comment.getCommentID() %>">답글달기</button>
                            <% } %>
                        </div>
                        <p class="text-left"><%= comment.getUserID() %>: <%= comment.getCommentContent() %></p>
                                                    <% if (userID != null && userID.equals(comment.getUserID())) { %>
                            <form action="deleteComment.jsp" method="post">
                                <input type="hidden" name="commentID" value="<%= comment.getCommentID() %>">
                                <input type="hidden" name="bbsID" value="<%= bbsID %>">
                                <button type="submit" class="btn btn-link">댓글 삭제</button>
                            </form>
                            <% } %>
                        <!-- 대댓글 작성 폼: 게시물 작성자만 표시 -->
                        <div id="replyForm_<%= comment.getCommentID() %>" class="collapse">
                            <form method="post" action="addCommentAction.jsp">
                                <input type="hidden" name="bbsID" value="<%= bbsID %>">
                                <input type="hidden" name="commentID" value="<%= comment.getCommentID() %>">
                                <div class="mb-3">
                                    <label for="replyContent_<%= comment.getCommentID() %>" class="form-label">대댓글 내용</label>
                                    <textarea class="form-control" id="replyContent_<%= comment.getCommentID() %>" name="commentContent" rows="2" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-sm btn-primary">대댓글 작성</button>
                            </form>
                        </div>
                        
                    </li>
                    <% } %>
                </ul>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>














