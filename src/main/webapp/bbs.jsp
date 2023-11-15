
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet" href="mapsection.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dancing+Script&family=Kotta+One&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<meta http-equiv="Content-Type" content="text-html; charset=UTF-8">

<title>Q&A</title>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

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
				<a href="chacam">CHACAM</a>
			</div>
			<ul class="chacam_menu">

				<li><a href="chacam">HOME</a></li>
				<li><a href="carsection.jsp">CAR</a></li>
				<li><a href="mapsection.jsp">SPOT</a></li>
				<li><a href="chacamList">CUMUNITY</a></li>
				<li><a href="bbs.jsp">Q&A</a></li>

				<%
				if (userID == null) {
				%>
				<li><a href="login.jsp">LOGIN</a></li>
				<li><a href="join.jsp">회원가입</a></li>
				<%
				} else {
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
			<form class="search-form" method="GET" action="searchAction.jsp">
				<input type="text" class="form-control" name="searchKeyword"
					placeholder="검색어 입력"> <label><input type="radio"
					name="searchType" value="title" checked> 제목</label> <label><input
					type="radio" name="searchType" value="author"> 작성자</label>
				<button type="submit" class="btn btn-primary">검색</button>
			</form>
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<!-- <th style="background-color: #eeeeee; text-align: center;">좋아요</th> -->
					</tr>
				</thead>
				<tbody>
					<%
					BbsDAO bbsDAO = new BbsDAO();
					int pageSize = 10; // 한 페이지에 표시될 게시글 수
					int totalPosts = bbsDAO.getTotalPosts(); // 전체 게시글 수
					int totalPages = (int) Math.ceil((double) totalPosts / pageSize); // 전체 페이지 수
					int currentPage = pageNumber;
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=(currentPage - 1) * pageSize + i + 1%></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
								<%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
		.replaceAll("\n", "<br>")%>
						</a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
		+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>

					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<%
					int startPage = ((currentPage - 1) / 10) * 10 + 1; // 시작 페이지 계산
					int endPage = startPage + 9;
					if (endPage > totalPages) {
						endPage = totalPages;
					}
					for (int i = startPage; i <= endPage; i++) {
					%>
					<li class="page-item <%=currentPage == i ? "active" : ""%>"><a
						class="page-link" href="bbs.jsp?pageNumber=<%=i%>"><%=i%></a></li>
					<%
					}
					%>
				</ul>
			</nav>
		</div>

		<button class="btn btn-primary float-start" type="button"
			data-bs-toggle="collapse" data-bs-target="#addForm"
			aria-expanded="false" aria-controls="addForm">Q&A 등록</button>
		<br> <br>
		<div class="collapse" id="addForm">
			<div class="card card-body">
				<form method="post" action="writeAction.jsp">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2"
									style="background-color: #eeeeee; text-align: center;">게시판
									글쓰기 양식</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control"
									placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
							</tr>
							<tr>
								<td><textarea class="form-control" placeholder="글 내용"
										name="bbsContent" maxlength="2048" style="height: 250px;"></textarea></td>
							</tr>
						</tbody>
					</table>
					<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
				</form>
			</div>
		</div>

		<script>
    const likeButtons = document.querySelectorAll('.like-button');

    likeButtons.forEach(button => {
        button.addEventListener('click', async function () {
            const form = button.closest('form');
            const index = button.getAttribute('data-index');

            // Disable the button to prevent multiple clicks
            button.disabled = true;

            try {
                const response = await fetch(form.getAttribute('action'), {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
                    },
                    body: new URLSearchParams(new FormData(form)).toString()
                });

                if (response.ok) {
                    const responseData = await response.text();
                    if (responseData.trim() === 'alreadyLiked') { // Trim the response to remove whitespace
                        alert("이미 좋아요를 누르셨습니다.");
                    } else {
                        const newCount = parseInt(responseData); // Convert the new count to a number
                        if (!isNaN(newCount)) { // Check if newCount is a valid number
                            updateLikeCount(index, newCount);
                            // Reload the page after updating like count
                           
                        } else {
                            console.error('좋아요 수 업데이트 중 잘못된 값이 반환되었습니다.');
                        }
                        
                    }
                    location.reload();
                }
            } catch (error) {
                console.error('Fetch 오류:', error);
            } finally {
                // Re-enable the button after the request is completed
                button.disabled = false;
                location.reload();
            }
        });
    });
</script>


	</div>
</body>
</html>


