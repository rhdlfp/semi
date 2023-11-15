<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="chacamList.ChacamListDAO"%>
<%@ page import="chacamList.ChacamList"%>
<%@ page import="java.util.ArrayList"%>

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


<title>chacamList</title>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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

	<div class="container w-75 mt-5 mx-auto">
		<c:if test="${error != null}">
			<div class="alert alert-danger alert-dismissible fade show mt-3">
				에러 발생: ${error}
				<button type="button" class="btn-close" data-bs-dismissj="alert"></button>
			</div>
		</c:if>


		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">주소</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">좋아요</th>
					</tr>
				</thead>
				<tbody>
					<%
					ChacamListDAO chacamDAO = new ChacamListDAO();
					int pageSize = 10; // 한 페이지에 표시될 게시글 수
					int totalPosts = chacamDAO.getTotalPosts(); // 전체 게시글 수
					int totalPages = (int) Math.ceil((double) totalPosts / pageSize); // 전체 페이지 수
					int currentPage = pageNumber;
					ArrayList<ChacamList> list = chacamDAO.getList(pageNumber);

					for (int i = 0; i < list.size(); i++) {
						ChacamList chacam = list.get(i);
					%>
					<tr>
						<td><%=(currentPage - 1) * pageSize + i + 1%></td>
						<td style="text-align: left;">
							<a href="chacamList?action=getChacam&infoid=<%=chacam.getInfoid()%>">
								<%   
								if (chacam.getImg1() != null) {
								%>
								<img src="<%=chacam.getImg1()%>" alt="Image" width="60" height="40">
								<%
								 }
								 %>
								 <%=chacam.getInfotitle()%>
							</a>
						</td>
						<td><%=chacam.getInfoaddress()%></td>
						<td><%=chacam.getUserID()%></td>
						<td><%=chacam.getInfoDate()%></td>

						<td>
							<div class="d-flex align-items-center">
								<form method="post" action="chacamListlikeAction.jsp">
									<input type="hidden" name="infoid"
										value="<%=chacam.getInfoid()%>"> <input type="hidden"
										name="index" value="<%=i%>">
									<button type="button" class="btn btn-link like-button"
										data-index="<%=i%>" <%=userID == null ? "disabled" : ""%>>
										<span class="material-icons">thumb_up</span> 좋아요
									</button>
								</form>
								<span class="ml-2"> <span id="likeCount<%=i%>"><%=chacam.getLikeCount()%></span>
								</span>
							</div>
						</td>
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
						class="page-link" href="chacamList?pageNumber=<%=i%>"><%=i%></a></li>
					<%
					}
					%>
				</ul>
			</nav>
		</div>


		<button class="btn btn-primary pull-rigth" type="button"
			data-bs-toggle="collapse" data-bs-target="#addForm"
			aria-expanded="false" aria-controls="addForm">차박정보 등록</button>

		<div class="collapse" id="addForm">

			<div class="">

				<form method="post"
					action="/semiProject/chacamList?action=addChacamList"
					enctype="multipart/form-data" onsubmit="return checkUserID()">
					<label class="form-label">제목</label> <input type="text"
						name="infotitle" class="form-control"> <label
						class="form-label">주소</label> <input type="text"
						name="infoaddress" class="form-control"> <label
						class="form-label">이미지 (최대 5개 선택)</label> <input type="file"
						name="files[]" class="form-control" multiple accept="image/*"
						onchange="checkFileCount(this)"> <label class="form-label">설명</label>
					<textarea rows="5" cols="50" name="content" class="form-control"></textarea>
					<input type="hidden" name="userID"
						value="<%=session.getAttribute("userID")%>">
					<button type="submit" class="btn btn-success mt-3">저장</button>

				</form>



			</div>
		</div>
	</div>



<script>
    const likeButtons = document.querySelectorAll('.like-button');

    likeButtons.forEach(button => {
        button.addEventListener('click', async function () {
            const index = button.getAttribute('data-index');

            // Check if the user is logged in
            <% if (userID == null) { %>
                alert("로그인 후에 좋아요를 누를 수 있습니다.");
                return;
            <% } %>

            // Disable the button to prevent multiple clicks
            button.disabled = true;

            try {
                const response = await fetch(button.closest('form').getAttribute('action'), {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
                    },
                    body: new URLSearchParams(new FormData(button.closest('form'))).toString()
                });

                if (response.ok) {
                    const responseData = await response.text();
                    if (responseData.trim() === 'alreadyLiked') {
                        alert("이미 좋아요를 누르셨습니다.");
                    } else {
                        const newCount = parseInt(responseData);
                        if (!isNaN(newCount)) {
                            updateLikeCount(index, newCount);
                        } else {
                            console.error('좋아요 수 업데이트 중 잘못된 값이 반환되었습니다.');
                        }
                    }
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

    function updateLikeCount(index, newCount) {
        const likeCountElement = document.getElementById(`likeCount${index}`);
        if (likeCountElement) {
            likeCountElement.textContent = newCount;
        }
    }
</script>


	<script src="chacamList.js"></script>


</body>
</html>