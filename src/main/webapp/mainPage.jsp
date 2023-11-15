<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="Main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>	
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dancing+Script&family=Kotta+One&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>CHACAM</title> 
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.js"></script>
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
    <section>
<div class="container">
    <div class="carousel-container" style="width: 100%; height: 100%;">
    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner" style="width:100%; height: 700%;">
          <div class="carousel-item active">
            <img src="${pageContext.request.contextPath}/tagcamping/bonfire-1867275_1920.jpg" class="d-block w-100" alt="firstImg" style="width: 100%; height: 800px; object-fit: cover;">
            <div class="carousel-caption d-none d-md-block">
              <h5>#캠프파이어</h5>
              <p>별들 아래, 우리의 모험과 추억이 만나는 캠프파이어의 빛 속으로!</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/tagcamping/camp-1163419_1920.jpg" class="d-block w-100" alt="..." style="width: 100%; height: 800px; object-fit: cover;">
            <div class="carousel-caption d-none d-md-block">
              <h5>#가족여행</h5>
              <p>자연의 품안에서 가족들과 함께하는 캠프 여행, 소중한 추억의 시작입니다.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/tagcamping/old-1617518_1920.jpg" class="d-block w-100" alt="..." style="width: 100%; height: 800px; object-fit: cover;">
            <div class="carousel-caption d-none d-md-block">
              <h5>#캠핑카 대여</h5>
              <p>편안한 여정을 위한 휴식처, 캠핑카 대여로 특별한 모험을 시작해보세요.</p>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
    
      </div>
    </div>
        </div>

<!--     <div class="fixed-div">
        <div class="optionBox"> 
            <h3 style="font-family: 'KOTRA_BOLD-Bold'; color: rgb(57, 116, 217);">캠핑카, 간편하게 예약 후 바로 떠나세요!</h3>
            <div class="reservation-form">
              <form id="reservation-form" action="/semiProject/carsection.jsp">
                <input type="text" id="date-range" name="date-range" readonly placeholder="     대여기간을 선택하세요">
                <div id="selected-dates" class="selected-dates"></div>  
                <input type="text" id="custom-date-range" name="custom-date-range" readonly placeholder="     지역을 선택하세요">
                
              <div class="custom-checkboxes">
                <label><input type="checkbox" value="경기"><span>경기</span></label>
                <label><input type="checkbox" value="강원"><span>강원</span></label>
                <label><input type="checkbox" value="충북"><span>충북</span></label>
                <label><input type="checkbox" value="충남"><span>충남</span></label>
                <label><input type="checkbox" value="전북"><span>전북</span></label>
                <label><input type="checkbox" value="전남"><span>전남</span></label>
                <label><input type="checkbox" value="경북"><span>경북</span></label>
                <label><input type="checkbox" value="경남"><span>경남</span></label>
                <label><input type="checkbox" value="제주"><span>제주</span></label>
                <button class="close-button" id="close-checkboxes">선택완료</button>
              </div>
            <button type="submit" class="fixed_btn"><i class="fa-solid fa-magnifying-glass fa-lg" style="color: #ffffff;" ></i></button>
          </form>
            </div>
          </div>
        </div> -->
 
<a href="carsection.jsp">        
<div class="fixed-div">
    <div class="optionBox"> 
        <h3 style="font-family: 'KOTRA_BOLD-Bold'; color: rgb(57, 116, 217);">캠핑카, 간편하게 예약 후 바로 떠나세요!</h3>
        <div class="reservation-form">
        	
            <form id="reservation-form" action="/path/to/your/target/file.jsp" onsubmit="return validateForm()"> <!-- 수정된 부분 -->
                <input type="text" id="date-range" name="date-range" readonly placeholder="     대여기간을 선택하세요">
                <div id="selected-dates" class="selected-dates"></div>  
                <input type="text" id="custom-date-range" name="custom-date-range" readonly placeholder="     지역을 선택하세요">
                
                <div class="custom-checkboxes">
                    <label><input type="checkbox" value="경기"><span>경기</span></label>
                    <!-- 다른 지역 체크박스들 -->
                    <button class="close-button" id="close-checkboxes">선택완료</button>
                </div>
                <button type="submit" class="fixed_btn"><i class="fa-solid fa-magnifying-glass fa-lg" style="color: #ffffff;"></i></button>
            </form>
            
        </div>
    </div>
</div>
</a>
<script>
    function validateForm() {
        // 여기서 대여기간과 지역 선택 여부를 검사하고,
        // 선택되지 않은 경우에 경고 메시지를 표시하거나 원하는 처리를 수행할 수 있습니다.
        // 예를 들어:
        // var dateRange = document.getElementById("date-range").value;
        // var customDateRange = document.getElementById("custom-date-range").value;
        // if (dateRange === "" || customDateRange === "") {
        //     alert("대여기간과 지역을 선택하세요.");
        //     return false; // 제출을 막음
        // }
        // return true; // 제출 허용
    }
</script>
        
    </section>
    
    <div class="favtag_text">
    <h1>태그별 추천</h1>
    <h4>유저들이 엄선한 장소들을 태그별로 만나보세요</h4>
</div>
<div class="favtag">
	<a href="carsection.jsp">
    <div class="favtag_place">
    <img src="${pageContext.request.contextPath}/tagcamping/ray.jpg" alt="">
      <div class="imgBox1">
      </div>
      <div class="textBox">
        <h4>작지만 있을건 다 있다</h4>
        <h6>#가성비 #2종보통 #소형 #레이</h6>
      </div>
    </div>
    </a>
    <a href="carsection.jsp">
    <div class="favtag_place2">
      <img src="${pageContext.request.contextPath}/tagcamping/pet.jpg" alt="">
      <div class="imgBox2">
      </div>
      <div class="textBox">
        <h4>애견동반</h4>
        <h6>#애견동반가능</h6>
      </div>
    </div>
    </a>
    <a href="carsection.jsp">
    <div class="favtag_place3">
      <img src="${pageContext.request.contextPath}/tagcamping/pri.jpg" alt="">
      <div class="imgBox2">
      </div>
      <div class="textBox">
        <h4>프리미엄</h4>
        <h6>#대형 #샤워부스 #고급</h6>
      </div>
    </div>
    </a>
</div>

<div class="favtag2">
	<a href="carsection.jsp">
    <div class="favtag2_place">
      <img src="${pageContext.request.contextPath}/tagcamping/holiday-1463951_1920.jpg" alt="">
      <div class="imgBox1">
      </div>
      <div class="textBox">
        <h4>가족여행</h4>
        <h6>#4인이상 #넓은내부</h6>
      </div>
    </div>
    </a>
    <a href="carsection.jsp">
    <div class="favtag2_place2">
      <img src="${pageContext.request.contextPath}/tagcamping/gamsung.jpg" alt="">
      <div class="imgBox2">
      </div>
      <div class="textBox">
        <h4>감성차박</h4>
        <h6>#인스타</h6>
      </div>
    </div>
    </a>
    <a href="carsection.jsp">
    <div class="favtag2_place3">
      <img src="${pageContext.request.contextPath}/tagcamping/tool.jpg" alt="">
      <div class="imgBox2">
      </div>
      <div class="textBox">
        <h4>장비대여</h4>
        <h6>#캠핑용품 #수면용품</h6>
      </div>
    </div>
    </a>
</div>

<!-- 실시간 캠핑카 추천 -->
<div class="camcar_text">
    <h1>차캠 실시간 인기 캠핑카</h1>
</div>
<div class="camcar">
  <div class="camcar_box1">
    <div class="card">
      <a href="car1.jsp">
          <img src="camcar/cf9bso3nuh1gzx0qmeyd5r24a8itpkw7.jpg" class="card-img-top" alt="...">
        </a>
        <button class="abtn2" type="button" onclick="location.href='car1.jsp'">
          <div class="btn_div2">
            <div class="btn_div_t2">
              <h5>[캠핑럽] 신혼여행전문! 스타모빌 최상프리미엄 ST9</h5>
              <p>만족도 높은 신혼여행 전문 업체입니다</p>
            </div>
                <p> <i class="fa-solid fa-location-dot" style="color: rgb(170, 170, 170);"></i>차고지: 대한민국 부산광역시 <i class="fa-regular fa-address-card"></i> 1종 보통 </p>
                  <p><span class="material-icons">supervisor_account</span> 동승 5명 <span class="material-icons">local_hotel</span> 취침 5명</p>
                <h6><span class="material-icons">event_available</span> 350,000원 부터</h6>
          </div>
        </button>
    </div>
  </div>
    <div class="camcar_box2">
      <div class="camcar_box1">
        <div class="card">
          <a href="car2.jsp"><img src="camcar/d2oa5ziw9nemkcgsuy7vf4hl3pxrt0q8-1920x1920.jpg" class="card-img-top" alt="...">
            </a>
            <button class="abtn2" type="button" onclick="location.href='car2.jsp'">
              <div class="btn_div2">
                <div class="btn_div_t2">
                  <h5>[미니칸 김포본점] 레이캠핑카 2인승</h5>
                  <p>작지만 강한 감성차박 캠핑카!</p>
                </div>
                <p><i class="fa-solid fa-location-dot" style="color: rgb(170, 170, 170);"></i> 차고지: 대한민국 경기도 용인시 <i class="fa-regular fa-address-card"></i> 2종 보통 </p>
                  <p><span class="material-icons">supervisor_account</span> 동승 2명 <span class="material-icons">local_hotel</span> 취침 2명</p>
                <h6><span class="material-icons">event_available</span> 150,000원 부터</h6>
              </div>
            </button>
        </div>
      </div>
    </div>
    <div class="camcar_box3">
      <div class="camcar_box1">
        <div class="card">
          <a href="car3.jsp"><img src="camcar/f368gv15sdaip2m7e4bnu0cqhwzkoxjy-1920x1920.jpg" class="card-img-top" alt="...">
            </a>
            <button class="abtn2" type="button" onclick="location.href='car.html'">
              <div class="btn_div2">
                <div class="btn_div_t2">
                  <h5>[미니칸 용인지점] 레이캠핑카 4인승</h5>
                  <p>작지만 강한 감성차박 캠핑카!</p>
                </div>
                <p> <i class="fa-solid fa-location-dot" style="color: rgb(170, 170, 170);"></i> 차고지: 대한민국 경기도 용인시 <i class="fa-regular fa-address-card"></i> 2종 보통 </p>
                  <p><span class="material-icons">supervisor_account</span> 동승 3명 <span class="material-icons">local_hotel</span> 취침 3명 <i class="fa-solid fa-paw"></i>반려동물 동반 가능</p>
                <h6><span class="material-icons">event_available</span> 150,000원 부터</h6>
              </div>
            </button>
        </div>
      </div>
    </div>
</div>
<div class="camcar2">
    <div class="camcar2_box1">
      <div class="camcar_box1">
        <div class="card">
          <a href="car4.jsp"><img src="camcar/KakaoTalk_Photo_2022-02-14-18-56-44-001.jpeg" class="card-img-top" alt="...">
            </a>
            <button class="abtn2" type="button" onclick="location.href='car.html'">
              <div class="btn_div2">
                <div class="btn_div_t2">
                  <h5>[엠알렌트카] 제일보빌DS9EU+ 캠핑카</h5>
                  <p>(풀옵션) 넓은 침대가 3개 캠핑카!</p>
                </div>
                <p><i class="fa-solid fa-location-dot" style="color: rgb(170, 170, 170);"></i> 차고지: 대한민국 충청남도 공주시 <i class="fa-regular fa-address-card"></i> 2종 보통 </p>
                  <p><span class="material-icons">supervisor_account</span> 동승 5명 <span class="material-icons">local_hotel</span> 취침 6명</p>
                <h6><span class="material-icons">event_available</span> 350,000원 부터</h6>
              </div>
            </button>
        </div>
      </div>
    </div>
    <div class="camcar2_box2">
      <div class="camcar_box1">
        <div class="card">
          <a href="car5.jsp"><img src="camcar/xnlfpj019hmg75ktczb8drae3s2q4uvo.jpg" class="card-img-top" alt="...">
            </a>
            <button class="abtn2" type="button" onclick="location.href='car.html'">
              <div class="btn_div2">
                <div class="btn_div_t2">
                  <h5>[캠핑에 반하다 부산] 쏠라티 4인승 차박</h5>
                  <p>부산 캠핑카 렌트, 4인승의 모터홈</p>
                </div>
                <p><i class="fa-solid fa-location-dot" style="color: rgb(170, 170, 170);"></i> 차고지: 대한민국 부산광역시 <i class="fa-regular fa-address-card"></i> 2종 보통 </p>
                  <p><span class="material-icons">supervisor_account</span> 동승 4명 <span class="material-icons">local_hotel</span> 취침 4명</p>
                <h6><span class="material-icons">event_available</span> 330,000원 부터</h6>
              </div>
            </button>
        </div>
      </div>
    </div>
    <div class="camcar2_box3">
      <div class="camcar_box1">
        <div class="card" >
          <a href="car6.jsp"><img src="camcar/rxo3gd4ckl2u1vtz9qhm86p70bwsnfj5.jpg" class="card-img-top" alt="...">
            </a>
            <button class="abtn2" type="button" onclick="location.href='car.html'">
              <div class="btn_div2">
                <div class="btn_div_t2">
                  <h5>[캠핑에 반하다 부산] 코치맨 오라이온 20cb</h5>
                  <p>부산 캠핑카 렌트, 6인승의 모터홈</p>
                </div>
                <p><i class="fa-solid fa-location-dot" style="color: rgb(170, 170, 170);"></i> 차고지: 대한민국 부산광역시 
                  <i class="fa-regular fa-address-card"></i> 2종 보통
                </p> 
                  <p><span class="material-icons">supervisor_account</span> 동승 1명 <span class="material-icons">local_hotel</span> 취침 5명</p>
                <h6><span class="material-icons">event_available</span> 330,000원 부터</h6>
              </div>
            </button>
        </div>
      </div>
    </div>
</div>
<!-- 더 많은 차량 보기 -->
<div class="morecar">
    <button type="button" onclick="location.href='carsection.jsp'"  class="morecar_btn">더 많은 차량 보기</button>
</div>
<!-- 차박지도 -->
<div class="chabak_text">
    <h1>차캠지도</h1>
    <h4>이제 어디로 떠날까? 차캠이 준비한 차박 장소들을 만나보세요</h4>
</div>
<div class="chabak">
    <div class="chabak_box1">
      <div class="condiv">
        <!-- <div class="container"> -->
            <!-- 첫 번째 캐러셀 -->
            <div id="carousel1" class="carousel slide carousel-container">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carousel1" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carousel1" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carousel1" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="${pageContext.request.contextPath}/chabakmap/gg.jpg" class="d-block w-100" alt="Image 1">
                </div>
                <div class="carousel-item">
                  <img src="chabakmap/0ujkan2rple3svc9ymzgqh7x6b4w8f15.jpeg" class="d-block w-100" alt="Image 2">
                </div>
                <div class="carousel-item">
                  <img src="chabakmap/uset518h4dqxrjz9an60wybfm3pv2l7k.jpeg" class="d-block w-100" alt="Image 3">
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carousel1" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carousel1" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
        </div>
        <button class="abtn" type="button" onclick="location.href='mapgg.jsp'">
          <div class="btn_div">
            <div class="btn_div_t">
              <h5>캠핑브릿지 캠핑장</h5>
              <p>인접한 곳에 임진강이 있어 낚시도 가능한 곳입니다. 경기권에 위치해 있어 가볍게 다녀오기 좋은 곳입니다.</p>
            </div>
            <p><span class="material-icons">attach_money</span>유료 <span class="material-icons">wc</span> 화장실 <span class="material-icons">storefront</span> 편의점/마트</p>
            <h6><i class="fa-solid fa-location-dot" style="color: #3a88fe;"></i> 대한민국 경기도 연천군</h6>
          </div>
            
        </button> 
      </div>
    <div class="chabak_box2">
      <div class="condiv">
        <div id="carousel2" class="carousel slide carousel-container">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carousel2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carousel2" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carousel2" data-bs-slide-to="2" aria-label="Slide 3"></button>
          </div>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="${pageContext.request.contextPath}/chabakmap/gw.jpg" class="d-block w-100" alt="Image 4">
            </div>
            <div class="carousel-item">
              <img src="${pageContext.request.contextPath}/chabakmap/gw/kjxnra9yqvc2s3g6uz1t5p7hwd8ble4i.jpeg" class="d-block w-100" alt="Image 5">
            </div>
            <div class="carousel-item">
              <img src="${pageContext.request.contextPath}/chabakmap/gw/m0jyikn8updt3ev2crfawbo17hqlsxz5.jpeg" class="d-block w-100" alt="Image 6">
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carousel2" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carousel2" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
          <button class="abtn" type="button" onclick="location.href='mapgw.jsp'">
            <div class="btn_div">
              <div class="btn_div_t">
                <h5>산으로 캠핑장</h5>
                <p>계단식 사이트 구역으로 보다 프라이빗한 캠핑을 즐길 수 있는 곳입니다.캠핑 스타일에 따라 데크 혹은 파쇄석 사이트 선택 가능합니다.</p>
              </div>
              <p><span class="material-icons">attach_money</span>유료 <span class="material-icons">wc</span> 화장실 <span class="material-icons">storefront</span> 편의점/마트</p>
              <h6><i class="fa-solid fa-location-dot" style="color: #3a88fe;"></i>  대한민국 강원도 흥청군</h6>
            </div>
          </button> 
    </div>
    </div>
    <div class="chabak_box3">
      <div class="condiv">
        <!-- <div class="container"> -->
            <!-- 첫 번째 캐러셀 -->
            <div id="carousel3" class="carousel slide carousel-container">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carousel3" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carousel3" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carousel3" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="${pageContext.request.contextPath}/chabakmap/cb/cb.jpg" class="d-block w-100" alt="Image 7">
                </div>
                <div class="carousel-item">
                  <img src="${pageContext.request.contextPath}/chabakmap/cb/ymv6to724ihsf0jua9kqcenxzg1rb38w.jpeg" class="d-block w-100" alt="Image 8">
                </div>
                <div class="carousel-item">
                  <img src="${pageContext.request.contextPath}/chabakmap/cb/feu5byq1p8ri93s7ng4ch6kvdtj0w2mo.jpeg" class="d-block w-100" alt="Image 9">
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carousel3" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carousel3" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
        </div>
        <button class="abtn" type="button" onclick="location.href='mapcb.jsp'">
          <div class="btn_div">
            <div class="btn_div_t">
              <h5>충주 카누캠핑장</h5>
              <p>아름다운 충주호가 눈앞에 펼쳐지는 오토캠핑장입니다. 사이트 간격이 넓다는 장점이 있습니다.</p>
            </div>
            <p><span class="material-icons">attach_money</span>유료 <span class="material-icons">wc</span> 화장실 <span class="material-icons">storefront</span> 편의점/마트</p>
            <h6><i class="fa-solid fa-location-dot" style="color: #3a88fe;"></i>  대한민국 충청북도 충주시</h6>
          </div>
        </button> 
    </div>
</div>
<div class="chabak2">
    <div class="chabak2_box1">
      <div class="condiv">
        <!-- <div class="container"> -->
            <!-- 첫 번째 캐러셀 -->
            <div id="carousel4" class="carousel slide carousel-container">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carousel4" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carousel4" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carousel4" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="${pageContext.request.contextPath}/chabakmap/cn/cn.jpg" class="d-block w-100" alt="Image 10">
                </div>
                <div class="carousel-item">
                  <img src="${pageContext.request.contextPath}/chabakmap/cn/5hnrjgy63pite7d4mqlcw0vkz98afo1u.jpeg" class="d-block w-100" alt="Image 11">
                </div>
                <div class="carousel-item">
                  <img src="${pageContext.request.contextPath}/chabakmap/cn/02ovksbm1gw36nt9rxe8q4dcaufpi7zl.jpeg" class="d-block w-100" alt="Image 12">
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carousel4" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carousel4" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
          <button class="abtn" type="button" onclick="location.href='mapcn.jsp'">
            <div class="btn_div">
              <div class="btn_div_t">
                <h5>몽산포 오션캠핑장</h5>
                <p>소나무숲과 바다가 만나는 캠핑장입니다. 인접해 있는 몽산포해변은 수심이 얕아 물놀이나 조개캐기를 하기에 적합합니다.</p>
              </div>
              <p><span class="material-icons">attach_money</span>유료 <span class="material-icons">wc</span> 화장실 <span class="material-icons">storefront</span> 편의점/마트</p>
              <h6><i class="fa-solid fa-location-dot" style="color: #3a88fe;"></i>  대한민국 충청남도 태안군</h6>
            </div>
        </button>
        </div>
      
    </div>
    <div class="chabak2_box2">
      <div class="condiv">
        <!-- <div class="container"> -->
            <!-- 첫 번째 캐러셀 -->
            <div id="carousel5" class="carousel slide carousel-container">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carousel5" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carousel5" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carousel5" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="${pageContext.request.contextPath}/chabakmap/jn/jn1.jpg" class="d-block w-100" alt="Image 13">
                </div>
                <div class="carousel-item">
                  <img src="${pageContext.request.contextPath}/chabakmap/jn/jn-18.png" class="d-block w-100" alt="Image 14">
                </div>
                <div class="carousel-item">
                  <img src="${pageContext.request.contextPath}/chabakmap/jn/jn-20.png" class="d-block w-100" alt="Image 15">
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carousel5" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carousel5" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
          <button class="abtn" type="button" onclick="location.href='mapjb.jsp'">
          <div class="btn_div">
              <div class="btn_div_t">
                <h5>곡성 압록유원지</h5>
                <p>곡성 압록유원지입니다. 화장실, 슈퍼, 개수대 등의 편의시설이 잘 갖추어져 있습니다.</p>
              </div>
              <p><span class="material-icons">money_off</span>무료 <span class="material-icons">wc</span> 화장실 <span class="material-icons">storefront</span> 편의점/마트</p>
              <h6><i class="fa-solid fa-location-dot" style="color: #3a88fe;"></i>  대한민국 전라남도 곡성군</h6>
          </div>
        </button>
        </div>
    </div>
    <div class="chabak2_box3">
      <div class="condiv">
            <!-- 첫 번째 캐러셀 -->
            <div id="carousel6" class="carousel slide carousel-container">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carousel6" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carousel6" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carousel6" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="${pageContext.request.contextPath}/chabakmap/jn/jn2.jpg" class="d-block w-100" alt="Image 16">
                </div>
                <div class="carousel-item">
                  <img src="${pageContext.request.contextPath}/chabakmap/jn/25dnc1ip3tjo9kb6mgqwuslafyh8v0e4-1920x1440.jpeg" class="d-block w-100" alt="Image 17">
                </div>
                <div class="carousel-item">
                  <img src="${pageContext.request.contextPath}/chabakmap/jn/rq04jeai6o1ndfkcbu3hvyp78ts5wgzm.jpg" class="d-block w-100" alt="Image 18">
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carousel6" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carousel6" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
          <button class="abtn" type="button" onclick="location.href='mapjn.jsp'">
          <div class="btn_div">
            <div class="btn_div_t">
              <h5>사구 어촌 체험마을</h5>
              <p>바지락, 낙지 체험등을 할 수 있는 마을입니다. 밤낚시체험 등 다양한 체험을 제공하나 분기별로 다르기 때문에 예약 확인을 하고 가시길 추천드립니다.</p>
            </div>
            <p><span class="material-icons">attach_money</span>유료 <span class="material-icons">wc</span> 화장실 </p>
            <h6><i class="fa-solid fa-location-dot" style="color: #3a88fe;"></i>  대한민국 전라남도 해남군</h6>
          </div>
        </button>
        </div>
    </div>
</div>

<div class="chabak3">
  <div class="chabak3_box1">
    <div class="condiv">
      <!-- <div class="container"> -->
          <!-- 첫 번째 캐러셀 -->
          <div id="carousel7" class="carousel slide carousel-container">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carousel7" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carousel7" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carousel7" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="${pageContext.request.contextPath}/chabakmap/gb/gb.jpg" class="d-block w-100" alt="Image 19">
              </div>
              <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/chabakmap/gb/nsdgl7m9zxrcebo21fh0vk6yqpua8i34.jpeg" class="d-block w-100" alt="Image 20">
              </div>
              <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/chabakmap/gb/fzp95wu4h83qdj1aibckr2nvo067lxyg-1920x910.jpeg" class="d-block w-100" alt="Image 21">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carousel7" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carousel7" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
        <button class="abtn" type="button" onclick="location.href='mapgb.jsp'">
        <div class="btn_div">
          <div class="btn_div_t">
            <h5>나아 해변</h5>
            <p>파도소리를 들으며 해돋이를 감상할 수 있는 해변입니다. 노지캠핑과 차박 모두 즐길 수 있는 곳입니다.</p>
          </div>
          <p><span class="material-icons">money_off</span>무료 <span class="material-icons">wc</span> 화장실 <span class="material-icons">storefront</span> 편의점/마트</p>
          <h6><i class="fa-solid fa-location-dot" style="color: #3a88fe;"></i>  대한민국 경상북도 경주시</h6>
        </div>
      </button>
      </div>
    
  </div>
  <div class="chabak3_box2">
    <div class="condiv">
      <!-- <div class="container"> -->
          <!-- 첫 번째 캐러셀 -->
          <div id="carousel8" class="carousel slide carousel-container">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carousel8" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carousel8" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carousel8" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="${pageContext.request.contextPath}/chabakmap/gn/gn.jpg" class="d-block w-100" alt="Image 22">
              </div>
              <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/chabakmap/gn/ls9b8p3m24gvqy6rkxd70htficza5unj.jpeg" class="d-block w-100" alt="Image 23">
              </div>
              <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/chabakmap/gn/kb9mqgyus0wn4xa3i1p5fvredo786j2z.jpeg" class="d-block w-100" alt="Image 24">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carousel8" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carousel8" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
        <button class="abtn" type="button" onclick="location.href='mapgn.jsp'">
        <div class="btn_div">
          <div class="btn_div_t">
            <h5>안녕 오토캠핑장</h5>
            <p>대부분의 사이트에서 오션뷰를 즐길 수 있으며, 사이트 옆에 주차도 가능합니다. 아름다운 일출을 바라볼 수 있는 곳입니다.</p>
          </div>
          <p><span class="material-icons">attach_money</span>유료 <span class="material-icons">wc</span> 화장실 </p>
          <h6><i class="fa-solid fa-location-dot" style="color: #3a88fe;"></i>  대한민국 경상남도 창원시</h6>
        </div>
      </button>
      </div>
  </div>
  <div class="chabak3_box3" style="background-color: white;">

  </div>
</div>
<!-- 더 많은 장소 보기 -->
<div class="morebak">
    <button class="morebak_btn" onclick="location.href='mapsection.jsp'">더 많은 장소 보기</button>
</div>
<!-- 가이드라인 -->
<div class="tip_text">
    <h1>가이드라인</h1>
    <h4>차박? 모든게 처음인 초보분들을 위해 차캠이 친절하게 알려드립니다.</h4>
</div>
<div class="tip">
    <div class="tip_box1">
      <div class="card" style="width: 23.26rem; height: 30rem">
        <img src="${pageContext.request.contextPath}/guide/jang.png" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">캠핑카 장비 준비물 이것만 챙긴다면 캠핑 초보 탈출</h5>
          <p class="card-text">1박 2일 캠핑카 여행, 차박에 필요한 최소장비 무엇이 있을까요?

            캠핑카 장비 무엇이 있는지 모르겠을 때! 초보자가 캠핑카 여행 또는 차박 여행을 가면 어떤 물품을 챙겨야하는지 감을 잡기 어려울텐데요. 초보 캠박러들을 위해 캠박에서 준비했습니다! 캠핑카 여행갈 때 준비해야 할 ★필★수★ 아이템!
            
            무엇보다도 캠핑카를 타거나 차박을 하게 되면 밤을 보낼 준비를 해야하는데요. 한여름이라도 밤이 되면 기온이 떨어지고, 빛이 사라지고, 주변에 편의점도 없습니다. 그렇다고 집에서처럼 모든 생활 용품을 모두 가져갈 필요는 없겠죠. 1박 2일 캠핑카 여행, 차박에 필요한 최소장비 무엇이 있을까요?</p>
          <a href="guide1.jsp" class="btn btn-primary">자세히 보기</a>
        </div>
      </div>
    </div>
    <div class="tip_box2">
      <div class="card" style="width: 23.26rem; height: 30rem">
        <img src="${pageContext.request.contextPath}/guide/rent.jpg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">캠핑카 렌트 방법 꿀팁 총정리 가격부터 종류까지</h5>
          <p class="card-text">캠핑카 렌트 붐이 일고 있다는 기사를 보신적 있으신가요? 코로나 시대 일반 여행에 제한이 생기고 안전한 실내에서 이동하는 캠핑카 여행열풍이 불고 있습니다. 캠핑카 여행은 가족과 연인과, 감성 넘치는 추억을 만들 수 있는 절호의 기회겠죠. 캠핑카 렌트 가격 방법 한 번에 정리해보았습니다.</p>
          <a href="guide2.jsp" class="btn btn-primary">자세히 보기</a>
        </div>
      </div>
    </div>
    <div class="tip_box3">
      <div class="card" style="width: 23.26rem; height: 30rem">
        <img src="${pageContext.request.contextPath}/guide/solo.png" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">혼캠 꿀팁 대방출! 소형 레이 캠핑카, 캠핑용춤 추천까지 </h5>
          <p class="card-text">혼캠 두근거리기도 하지만 낯설고 어렵기도 하죠? 코로나19로 인해서 여행에 많은 제약이 생기면서 프라이빗하게 즐길 수 있는 캠핑, 나홀로여행, 혼캠 등의 캠핑 문화가 활성화되었습니다. 2030세대까지 본격적으로 캠핑을 즐기기 시작하면서 차에서 숙박을 하며 캠핑을 즐긴다는 뜻의 ‘차박’이라는 새로운 문화가 등장하기도 했는데요. 이외에도 차와 피크닉의 합성어인 ‘차크닉’, 캠핑과 피크닉의 합성어인 ‘캠프닉’ 등의 신조어가 생기기도 했습니다. 오늘은 혼자캠핑을 즐기고 싶은! 혼캠족들을 위한 꿀팁을 전수해보도록 할게요!</p>
          <a href="guide3.jsp" class="btn btn-primary">자세히 보기</a>
        </div>
      </div>
    </div>
</div>
<div class="tip2">
    <div class="tip2_box1"></div>
    <div class="tip2_box2"></div>
    <div class="tip2_box3"></div>
</div>

    
    <footer class="foot">

    </footer>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="MainTest.js"></script>
</body>
</html>
