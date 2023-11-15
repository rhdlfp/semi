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
      
        <h1 style="font-size: 60px; font-weight: 700; margin-top: 10%; text-align: center;">캠핑카 렌트 방법 꿀팁 총정리 가격부터 종류까지</h1>
    </div>
    <div class="cartext">
        <div class="carimage_text">
            <p style="text-align: center;"><i class="fa-solid fa-calendar-days"></i> <strong>2023년 08월 24일</strong></p>
        </div>
        <div class="carimage_tag"></div> 
         
    </div>
    <div class="carsection" style="height: 380vh;">
        <div class="carsection_text">
            <img style="margin-bottom: 30px; border-radius: 10px; width: 100%; height: 50%;" src="guide/rent.jpg" alt="">
        
            <p>캠핑카 렌트 붐이 일고 있다는 기사를 보신적 있으신가요? 코로나 시대 일반 여행에 제한이 생기고 안전한 실내에서 이동하는 캠핑카 여행열풍이 불고 있습니다. 캠핑카 여행은 가족과 연인과, 감성 넘치는 추억을 만들 수 있는 절호의 기회겠죠. 캠핑카 렌트 가격 방법 한 번에 정리해보았습니다.</p>
            <hr>
            <h3 style="font-size: 32px; font-weight: 700;"><strong>-캠핑카</strong></h3>
            <img style="margin-bottom: 30px;" src="guide/rent/1.png" alt="">

            <p>캠핑카 렌트 하려고 해도 워낙 다양한 차종 때문에 헷갈려 하시는 분들이 많습니다. 캠핑카의 개념은 숙박과 식사를 해결할 수 있는 가구와 공간이 갖춰져있는 자동차입니다. 그 중에 분류를 한다면 캠퍼밴, 카라반, 폴딩 트레일러가 있습니다.</p>
            
            <ol>
                <li>캠퍼밴: 자동차 자체에 캠핑을 할 수 있는 모든 시설이 갖춰져 있는 캠핑카</li>
                <li>카라반: 자동차 뒤에 캠핑 트레일러를 달고 다니는 것</li>
                <li>폴딩 트레일러: 이동이 편리하게 접어서 크기를 줄일 수 있는 카라반</li>
            </ol>
            
            <p>카라반과 폴딩 트레일러는 큰 크기와 막대한 비용 때문에 한국에서 운용하기 다소 어렵다고 합니다. 캠핑카 여행을 처음 떠난다면 캠퍼밴을 빌리는 것이 캠핑카 여행을 떠나기에 가장 편리한 방법입니다.</p>
            <hr>
            
            <h3 style="font-size: 32px; font-weight: 700;"><strong>-캠핑카 렌트 방법</strong></h3>
            
            <img style="width: 90%; margin-bottom: 30px;" src="guide/rent/2.jpeg" alt="">
            <p>*캠핑카 렌트 자격*</p>
            
            <ol>
                <li>만 26세 이상</li>
                <li>캠퍼밴은 2종 보통 면허로 운전할 수 있다. (9인승 이상은 1종 보통 면허가 필요하다.)</li>
                <li>카라반은 크기에 따라 특수 면허가 필요하다. (750~3000kg: 소형 견인차 면허, 3000kg 이상: 대형 견인차 면허)</li>
                <li>위 자격을 충족한다면 1시간 가량의 교육을 받은 후 운전이 가능하다.</li>
            </ol>
            <hr>
            
            <h3 style="font-size: 32px; font-weight: 700;"><strong>-캠핑카 렌트 가격</strong></h3>
            
            <ol>
                <li>국산 캠핑카: 20만원에서 50만원 가량 (1박 2일 기준)</li>
                <li>해외 캠핑카: 40만원에서 80만원 가량 (1박 2일 기준)</li>
            </ol>
            <p>*성수기, 주말은 요금이 추가되는 경우가 많음.</p>
            <br>
            <br>
            <p>캠핑카 구매보다 렌트가 합리적인 이유가 무엇일까요? 캠핑카를 한대 구매했을 때 비용을 계산 한다면 180일 이상 여행을 다녀야 1박당 렌트가격과 비슷해진다고 합니다. 정말 flex하지 않는다면 캠핑카를 구매하는 것보다는 렌트하는 것이 합리적인 소비이겠죠.</p>
            <br>
            <hr>

            <h3 style="font-size: 32px; font-weight: 700;"><strong>-캠핑카 여행 꿀팁</strong></h3>
            
            <ol>
                <li>짧게 여행 가자! 여행이 길어지면 샤워, 오수 처리, 수면, 빨래 등 다양한 문제에 봉착하게 됩니다. 짧고 낭만적인 여행이 가장 좋겠죠.</li>
                <li>전기를 체크하자! 캠핑카 여행 중에 차량이 방전되면 큰 문제가 생기니 지속적으로 전기를 체크해야 합니다.</li>
                <li>물공급을 항상 생각하자! 캠핑카의 물탱크가 금방 고갈될 수 있으니 물을 공급할 수 있는 곳을 잘 찾아야 합니다.</li>
            </ol>
            <br>
            <p>운전에 주의하자! 차량의 큰 크기와 높이 때문에 주차장, 터널, 교각 등을 지날 때 조심해야 합니다. 또 급커브 등도 평소보다 천천히 트는 것이 중요합니다.</p>
            <hr>
            <p>캠핑카 렌트 다양한 정보 알아보았습니다. 이제 컴퓨터 앞에서 떠나서 지금 캠핑카 여행을 떠나보는 것은 어떨까요?</p>

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