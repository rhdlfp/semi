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
    <title>CHACAM</title>
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
        <h1 style="font-size: 60px; font-weight: 700; margin-top: 10%; text-align: center;">혼캠 꿀팁 대방출! 소형 레이 캠핑카, 캠핑용품 추천까지</h1>
    </div>
        <div class="cartext">
        <div class="carimage_text">
            <p style="text-align: center;"><i class="fa-solid fa-calendar-days"></i> <strong>2023년 08월 24일</strong></p>
        </div>
        <div class="carimage_tag"></div> 
         
    </div>
    <div class="carsection">
        <div class="carsection_text">
            <img style="margin-bottom: 30px; border-radius: 10px; width: 100%; height: 50%;" src="guide/solo/1.png" alt="">
            <p><strong>혼캠 두근거리기도 하지만 낯설고 어렵기도 하죠?</strong></p>
            <p>코로나19로 인해서 여행에 많은 제약이 생기면서 프라이빗하게 즐길 수 있는 캠핑, 나홀로여행, 혼캠 등의 캠핑 문화가 활성화되었습니다. 2030세대까지 본격적으로 캠핑을 즐기기 시작하면서 차에서 숙박을 하며 캠핑을 즐긴다는 뜻의 ‘차박’이라는 새로운 문화가 등장하기도 했는데요. 이외에도 차와 피크닉의 합성어인 ‘차크닉’, 캠핑과 피크닉의 합성어인 ‘캠프닉’ 등의 신조어가 생기기도 했습니다. 오늘은 혼자캠핑을 즐기고 싶은! 혼캠족들을 위한 꿀팁을 전수해보도록 할게요!</p>
            <hr>
            <p><strong>혼캠의 장점! 나홀로 조용하고 잔잔하게~</strong></p>

            <p>혼자 여행하는 것의 가장 큰 장점 중 하나는 조용하고 잔잔한 시간을 보낼 수 있다는 거죠! 나만의 시간을 온전히 즐기기 위한 캠핑 필수템들을 소개해 드릴게요!</p>
            <p>우선, 안전을 위해 비상용 랜턴, 상비약(해열제, 소독약, 지혈제 등), 미니 소화기를 챙겨주세요! 혼자서 떠났는데 갑자기 아프거나 다쳤을 경우 빠르게 대처하기 위함이에요. 다음으로 급격한 일교차에 대비한 여분의 옷과 긴 겉옷과 바지, 담요를 챙겨주세요. 더불어 운동화나 크록스, 슬리퍼와 같이 편한 신발도 챙겨주시면 좋아요!(찡긋) 차의 배터리가 나갈수도 있기 때문에 밤에도 춥지 않게 침낭은 꼭꼭 챙겨주시구요. 이외에도 간단하게 먹을 수 있는 간식이나 비상식량, 현금 등도 꼭 준비해가세요. 혼자 캠핑의 가장 중요한 점은 안전입니다!! 캠핑을 떠나는 장소를 가족이나 지인들에게 미리 알려 혹시 모를 변수에 대비하세요!</p>
            <hr>
            <p>번거로움은 가라! 미니멀하게 즐기는 혼캠 </p>
            <img style="margin-bottom: 30px;" src="guide/solo/2.jpeg" alt="">

            <p>혼자 캠핑을 갈 때에는 먹고 마시는 데에 에너지를 쏟기 보다는 나만의 시간을 온전히 즐기고 싶습니다. 블루투스 스피커에서 나오는 내가 좋아하는 음악과 좋아하는 술 또는 음료, 간단한 음식으로 힐링해보는 건 어떨까요?</p>
            <img style="margin-bottom: 30px;" src="guide/solo/3.jpeg" alt="">
            <p>테이블은 조그마한 트레킹테이블을 추천드려요! </p>
            <p>작고 가벼울 뿐만 아니라 가격도 비싸지 않아서 한번 구비해 놓으면 다용도로 사용하실 거라고 장담해요!</p>

            <img style="margin-bottom: 30px;" src="guide/solo/4.jpeg" alt="">
            <p>반찬그릇, 밥그릇, 컵 등등 다양한 용도로 활용 가능한 시에라컵도 추천드려요!</p>
            <p>혼자 캠핑을 갈 때에는 여러가지 식기를 챙겨갈 필요없이 만능 시에라컵으로 해결해보시는 건 어떨까요?</p>

            <img style="margin-bottom: 30px;" src="guide/solo/5.jpeg" alt="">
            <p>음식의 경우, 적은 양을 조리해 먹기 때문에 간편하게 즐길 수 있는 혼캠 밀키트를 추천드려요! 내가 좋아하는 음식과 함께라면 더욱 즐거운 캠핑을 보낼 수 있겠죠? 다양한 종류의 밀키트가 있기 때문에 취향과 입맛에 맞게 구매해가시길 바라요~ !캠핑카를 운전해야 하기 때문에 술의 경우는 조금만, 적당히 마시고 꼭 술이 완전히 깬 후 출발하도록 하는 것! 잊으시면 안됩니다. 밀키트를 구매할 수 있는 링크도 함께 알려드릴게요(찡긋)</p>
            <p>캠핑용 밀키트 구매링크</p>

            <img style="width: 90%; height: 40%; margin-bottom: 30px;" src="guide/solo/6.jpeg" alt="">
            <p>혼캠을 위한 소형캠핑카 추천, 레이캠핑카가 제격!</p>
            <p>홀로 여행을 갈 때 너무 큰 캠핑카는 크기 뿐만 아니라 가격적으로 조금 부담스럽기도 하죠! 그런 분들을 위해 나홀로 혹은 친구, 연인과 함께 하기에 딱인 레이캠핑카를 소개해드려요! 소형차지만 내부는 꽤나 넓어서 혼자서 차박을 즐기기엔 딱이랍니다 혼캠을 위한 레이캠핑카도 차캠에서 만나보세요! 그럼 즐겁고 안전한 캠핑이 되도록 저희 캠박도 혼캠 러들을 응원할게요!</p>

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
</body>
</html>
