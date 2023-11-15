<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="guide.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dancing+Script&family=Kotta+One&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

</head>
<body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://kit.fontawesome.com/9d2db6a920.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <%
        String userID = null;
     if(session.getAttribute("userID") != null){
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
    
    <div class="carimage2">
      
        <h1 style="font-size: 60px; font-weight: 700; margin-top: 10%; text-align: center;">캠핑카 장비 준비물 이것만 챙긴다면 캠핑 초보 탈출!</h1>
    </div>
    <div class="cartext">
        <div class="carimage_text">
            <p style="text-align: center;"><i class="fa-solid fa-calendar-days"></i> <strong>2023년 08월 24일</strong></p>
        </div>
        <div class="carimage_tag"></div> 
         
    </div>
    <div class="carsection" style="height: 210vh;">
        <div class="carsection_text">
            <img style="margin-bottom: 30px; border-radius: 10px; width: 100%; height: 50%;" src="guide/jang.png" alt="">
            <p style="font-size: 24px;"><strong>1박 2일 캠핑카 여행, 차박에 필요한 최소장비 무엇이 있을까요?</strong></p>
            <br>
            <p>캠핑카 장비 무엇이 있는지 모르겠을 때! 초보자가 캠핑카 여행 또는 차박 여행을 가면 어떤 물품을 챙겨야하는지 감을 잡기 어려울텐데요. 초보 캠박러들을 위해 캠박에서 준비했습니다! 캠핑카 여행갈 때 준비해야 할 ★필★수★ 아이템!</p>
            <br>
            <p>무엇보다도 캠핑카를 타거나 차박을 하게 되면 밤을 보낼 준비를 해야하는데요. 한여름이라도 밤이 되면 기온이 떨어지고, 빛이 사라지고, 주변에 편의점도 없습니다. 그렇다고 집에서처럼 모든 생활 용품을 모두 가져갈 필요는 없겠죠. 1박 2일 캠핑카 여행, 차박에 필요한 최소장비 무엇이 있을까요?</p>
            <hr>
            <br>
            <h3 style="font-size: 32px; font-weight: 700;"><strong>-캠핑카 장비</strong></h3>
            <p>먹을 것: 식수, 가스버너, 코펠, 간편하게 먹을 수 있는 간식, 비상 식량(초코바 등)</p>
            <p>입을 것: 재킷, 긴 바지, 편한 신발(운동화, 크록스)</p>
            <p>자는 것: 침낭 (침낭은 필수입니다!)</p>
            <p>안전을 위한 것: 배터리를 쓰는 랜턴, 미니 소화기, 응급 약품(해열제, 지사제, 소독약, 지혈제 등)</p>
            <p>불멍을 위한 것: 땔감으로 쓰는 에코로그, 삼각대, 신문지 등</p>
            <p>조심해야 할 것: 운전 조심, 물 조심, 불 조심</p>
            <hr>
            <p>오늘은 초보자가 꼭 챙겨야 할 캠핑카 장비 몇 가지 알아봤는데요,</p>
            <p>준비물은 꼭 챙기고 안전하게 여행을 떠나야겠죠?</p>
            <p>그리고 준비물을 잘 챙겨도 다양한 변수가 생길 수 있으니 여행 기간은 짧게 가져가는 게 좋습니다. 식수, 빨래, 전기 등 다양한 변수를 최소화 하기 위해서는 1박2일에서 2박3일의 여행이 적당하겠죠?</p>
            <p>캠박러들을 위해 캠박은 다음 시간에 더 많은 정보로 찾아뵙겠습니다 ~*^^* 찡긋</p>
    </div>
        
        <div class="carsection_calendar">
                <div class="textli">
               <h4><strong>최신 글</strong></h4>
                <ul>
                    
                    <li><a href="guide1.jsp">혼캠 꿀팁 대방출! 소형 레이 캠핑카, 캠핑용품 추천까지</a></li>
                    <li><a href="guide2.jsp">캠핑카 렌트 방법 꿀팁 총정리 가격부터 종류까지</a></li>
                    <li><a href="guide3.jsp">캠핑카 장비 준비물 이것만 챙긴다면 캠핑 초보 탈출!</a></li>
                </ul>
                </div>
                <div class="textli1">
                    <h4><strong>카테고리</strong></h4>
                <ul>
                    <li><a href="">미분류</a></li>
                    <li><a href="">차캠꿀팁</a></li>
                    
                </ul>
                </div>
                
        </div>
        <!-- 모달 -->
   
</body>
</html>