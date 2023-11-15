<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="chacamList.ChacamListDAO"%>
<%@ page import="chacamList.ChacamList"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="user.User" %>
<%@ page import="reservation.ReservationDAO"%>
<%@ page import="reservation.Reservation" %>
<%@ page import="reservation.CarInformation" %>

<%
String userID = (String) session.getAttribute("userID");
String userName = (String) session.getAttribute("userName");
String userEmail = (String) session.getAttribute("userEmail");
String nickName = (String) session.getAttribute("nickName");


ChacamListDAO chacamDAO = new ChacamListDAO();
UserDAO dao = new UserDAO();

ReservationDAO reservationDAO = new ReservationDAO();
ArrayList<Reservation> reservations = reservationDAO.getReservations(userID);

%>

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

<title>마이페이지</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

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
		<h2>마이페이지</h2>
		<%
		if (userID != null) {
		%>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">회원 정보</h3>
			</div>
			<div class="panel-body">
				<p>
					<strong>UserID:</strong>
					<%=userID%></p>
				<p>
					<strong>UserName:</strong>
					<%=(userName != null) ? userName : "사용할 수 없음"%></p>
				<p>
					<strong>UserEmail:</strong>
					<%=(userEmail != null) ? userEmail : "사용할 수 없음"%></p>
				<p>
					<strong>nickName:</strong>
					<%=(nickName != null) ? nickName : "사용할 수 없음"%></p>
			</div>
		</div>
		

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">즐겨찾기</h3>
    </div>
    <div class="panel-body">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th style="vertical-align: middle; text-align: center;">순번</th>
                    <th style="vertical-align: middle; text-align: center;">내 찜목록</th>
                    <th style="vertical-align: middle; text-align: center;">목록 삭제</th>
                </tr>
            </thead>
            <tbody>
                <%
                ArrayList<Integer> wishlistItems = dao.getWishlist(userID);
                for (int i = 0; i < wishlistItems.size(); i++) {
                    int infoid = wishlistItems.get(i);

                    ChacamList chamItem = chacamDAO.getChacam(infoid);

                    %>
                    <tr>
                        <td style="vertical-align: middle; text-align: center;"><%= i + 1 %></td>
                        <td>
                            <a href="chacamList?action=getChacam&infoid=<%=chamItem.getInfoid()%>">
                                <%
                                if (chamItem.getImg1() != null) {
                                %>
                                <img src="<%=chamItem.getImg1()%>" alt="Image" width="60" height="40">
                                <%
                                }
                                %>
                                <%=chamItem.getInfotitle()%><%=chamItem.getInfoid()%>
                            </a>
                        </td>
                        <td style="vertical-align: middle; text-align: center;">
                            <%-- <button class="btn btn-danger" onclick="deleteWishlist('<%=chamItem.getInfoid()%>', '<%=userID%>')">삭제</button> --%>
							<form action="deleteWish.jsp" method="post">
				            <input type="hidden" name="itemName" value="<%=chamItem.getInfoid()%>">
            				<input type="hidden" name="userID" value="<%=userID%>">
            				<button type="submit" class="btn btn-danger" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</button>
        					</form>
                        </td>
                    </tr>
                    <%
                }
                %>
            </tbody>
        </table>
    </div>
</div>



<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">캠핑카 예약 목록</h3>
    </div>
    <div class="panel-body">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th style="vertical-align: middle; text-align: center;">순번</th>
                    <th style="vertical-align: middle; text-align: center;">차량 이미지</th>
                    <th style="vertical-align: middle; text-align: center;">차량명</th>
                    <th style="vertical-align: middle; text-align: center;">대여 시작일</th>
                    <th style="vertical-align: middle; text-align: center;">반납일</th>
                    <th style="vertical-align: middle; text-align: center;">대여 금액</th>
                    <th style="vertical-align: middle; text-align: center;">예약 취소</th>
                </tr>
            </thead>
            <tbody>
                <%
                ArrayList<Reservation> reservationss = reservationDAO.getReservations(userID);
                for (int i = 0; i < reservations.size(); i++) {
                    Reservation reservation = reservationss.get(i);

                    // 예약된 차량의 정보 가져오기
                    CarInformation carInfo = reservationDAO.getCarInfo(reservation.getCarID());

                    %>
                    <tr>
                        <td style="vertical-align: middle; text-align: center;"><%= i + 1 %></td>
                        <td style="vertical-align: middle; text-align: center;">
                            <%
                            if (carInfo != null && carInfo.getCarImage() != null) {
                            %>
                            <a href="car<%= carInfo.getCarID() %>.jsp">
                            <img src="<%= carInfo.getCarImage() %>" alt="Car Image" width="60" height="40">
                    	   </a>
                            <%
                            }
                            %>
                        </td>
                        <td style="vertical-align: middle; text-align: center;">
                        <a href="car<%= carInfo.getCarID() %>.jsp">
                        <%= carInfo != null ? carInfo.getCarName() : "" %>
                        </a>
                        </td>
                        <td style="vertical-align: middle; text-align: center;"><%= reservation.getStartDate() %></td>
                        <td style="vertical-align: middle; text-align: center;"><%= reservation.getEndDate() %></td>
                        <td style="vertical-align: middle; text-align: center;"><%= reservation.getRentalPrice() %></td>
                        <td style="vertical-align: middle; text-align: center;">
                            <form action="cancelReservation.jsp" method="post">
                                <input type="hidden" name="reservationID" value="<%= reservation.getReservationID() %>">
                                <button type="submit" class="btn btn-danger" onclick="return confirm('예약을 취소하시겠습니까?')">예약 취소</button>
                            </form>
                        </td>
                    </tr>
                    <%
                }
                %>
            </tbody>
        </table>
    </div>
</div>




<!-- <script>
	function deleteWishlist(infoid, userID) {
    console.log('infoid:', infoid); // infoid 값을 콘솔에 출력
    console.log('userID:', userID); // userID 값을 콘솔에 출력
    if (confirm('정말로 삭제하시겠습니까?')) {
        location.href = `deleteWish.jsp?infoid=${infoid}&userID=${userID}`;
        
    }
    
}
</script> -->


<div class="container mt-4">
    <div class="row">
        <div class="col-md-6">
            <button class="btn btn-primary" type="button"
                    data-toggle="collapse" data-target="#addForm"
                    aria-expanded="false" aria-controls="addForm">회원수정</button>
        </div>
        <div class="col-md-6 text-right"> <!-- text-right 클래스 사용 -->
            <form method="post" action="dropOutAction.jsp">
                <button type="submit" class="btn btn-primary"
                    onclick="return confirm('정말로 회원 탈퇴하시겠습니까?')">회원탈퇴</button>
            </form>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="collapse" id="addForm">
                <div class="card card-body">
                    <form method="post" action="updateProfile.jsp" accept-charset="UTF-8">
                        <div class="form-group">
                            <label for="userPassword">Password:</label>
                            <input type="password" class="form-control" id="userPassword" name="userPassword" maxlength="20">
                        </div>
                        <div class="form-group">
                            <label for="userEmail">Email:</label>
                            <input type="email" class="form-control" id="userEmail" name="userEmail">
                        </div>
                        <div class="form-group">
                            <label for="nickName">Nickname:</label>
                            <input type="text" class="form-control" id="nickName" name="nickName" maxlength="50">
                        </div>
                        <button type="submit" class="btn btn-primary">적용</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
		<%
		} else {
		%>
		<p>로그인 후에 마이페이지에 접근하실 수 있습니다.</p>
		<script>
			alert('로그인 후에 접근하실 수 있습니다.');
			location.href = 'login.jsp';
		</script>
		<%
		}
		%>
</div>



		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>