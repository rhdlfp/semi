<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="reservation.ReservationDAO"%>
<%@ page import="reservation.CarInformation"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="car.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dancing+Script&family=Kotta+One&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

    <style>
        /* 모달 스타일 */

        .modal-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        .carousel-image {
            max-width: 100%;
            max-height: 100%;
        }

        #carouselExample {
            width: 100%;
            height: 100vh; /* 화면 세로 전체 높이 */
        }


        .modal .carousel-inner img {
            max-height: 80vh; /* 화면 세로 전체 높이의 80% */
            margin-top: 10%;
        }

        .carousel-inner img {
            width: 100%;
            height: 100%;
        
        }
        /* 모달 창이 뒤에 숨도록 */
        .modal {
            background: rgba(0, 0, 0, 0.5);
        }
        .modal-dialog {
            max-width: 1240px;
            width: 100%;
            margin: 30px auto;
        }

        .carousel{
                margin-top: 70%;
        }

    </style>
   
    <title>CHACAM 자동차 정보1</title>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://kit.fontawesome.com/9d2db6a920.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    

	<%
        String userID = null;
     if(session.getAttribute("userID") != null){
    	 userID = (String) session.getAttribute("userID");
     
     %>
	 <script>
        var loggedIn = true;
        var userID = "<%= userID %>";
    </script>
	<%
    } else {
	%>
    <script>
        var loggedIn = false;
    </script>
	<%
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
    
    
    <%
    ReservationDAO dao = new ReservationDAO();
    int carID = 1; // 화면과 연결할 carID 값으로 변경
    CarInformation carInfo = dao.getCarInfo(carID);
    int carPrice = (carInfo != null) ? carInfo.getCarPrice() : 0;
	%>
    

    <div class="carimage">
        <div class="carimage_img1">
            <img src="camcar/cf9bso3nuh1gzx0qmeyd5r24a8itpkw7.jpg" alt="">
        </div>
        <div class="carimage_img2">
            <img src="camcar/car1/5oyr9ndgwck0hujxemlt48zifsva37bp.jpg" alt="">
        </div>
        <div class="carimage_img3">
            <img src="camcar/car1/b6v7u5khawq2tlrz0o4n9pejgxi3cfsd.jpg" alt="">
        </div>
    </div>
    <div class="carimage2">
        <div class="carimage2_img4">
        </div>
        <div class="carimage2_img5">
            <img src="camcar/car1/qfpy8m4s0a7cxhk3uwtz6ngir1jolvde.jpg" alt="">
        </div>
        <div class="carimage2_img6">
            <img src="camcar/car1/r3gs6wu859yvoxc0azqd24fi1jlh7ktm.jpg" alt="">
            <button style="background: white; color:black; border: none;"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#imageModal"><i class="fa-regular fa-images"></i> 이미지 더 보기</button>
        </div>
    </div>
    
    <div class="cartext">
        <div class="carimage_text">
            <h1>[캠핑럽] 신혼여행전문! 스타모빌 최상프리미엄 ST9</h1>
        </div>
        <div class="carimage_tag"></div> 
        <div class="carborrow">
            <div class="carborrow_alert">
                <p>캠핑카 예약은 최대 1년내 날짜만 가능합니다.</p>
            </div>
        </div>  
    </div>
    <div class="carsection">
        <div class="carsection_text">
            <h2><i class="fa-solid fa-campground"></i> 기본 갬핑장비 제공 <i class="fa-solid fa-square-parking"></i> 주차가능</h2>
            <p>신혼여행 전문! 스타모빌제작사의 최상의 프리미엄모델 ST9 입니다. 견고한 전기시설 무시동 난방 넓은 공간성을 자랑합니다.</p>
            <p><span class="material-symbols-outlined">person</span> 동승가능인원: 5명 <span class="material-symbols-outlined">person</span> 취침가능인원: 5명</p>
            <p><span class="material-symbols-outlined">schedule</span> 대여일 출차시간 13:00 <span class="material-symbols-outlined">schedule</span> 반납일 반납시간 13:00</p>
            <p><span class="material-symbols-outlined">credit_card</span> 평일 가격: 350000원 /박 <span class="material-symbols-outlined">credit_card</span> 주말 가격: 400000원 /박</p>
            <p><span class="material-symbols-outlined">check</span> 만 27세 이상 <i class="fa-regular fa-address-card"></i> 1종 보통 이상 <span class="material-symbols-outlined">directions_car</span> 운전 경력 3년 이상</p>
            <p><i class="fa-solid fa-location-dot fa-lg" style="color: #000000;"></i> 차고지 주소: 대한민국 부산광역시 해운대구 우동2로 30번길 30</p>
            <h2>딜리버리(탁송) 가능지역</h2>
            <p>원하시는 장소로 가져다 드리고 또한 받아 오는 서비스 (유료) 계신곳 위치에 따라 가격변동</p>
            <h2>보유시설</h2>
            <ul class="optionUl">
                <li><i class="fa-solid fa-tv"></i> <p> TV </p></li>
                <li><i class="fa-solid fa-fire-flame-simple"></i> <p> 가스레인지</p></li>
                <li><span class="material-symbols-outlined">kitchen</span> <p> 냉장고</p></li>
                <li><span class="material-symbols-outlined">heat_pump</span><p>무시동 히터</p></li>
            </ul>
            <ul class="optionUl">
                <li><i class="fa-solid fa-water"></i> <p> 물탱크 </p></li>
                <li><i class="fa-solid fa-house-fire"></i> 바닥난방</li>
                <li><i class="fa-solid fa-bug-slash"></i> 방충망</li>
                <li><i class="fa-solid fa-wind"></i><p> 배기시설</p></li>
            </ul>
            <ul class="optionUl">
                <li><i class="fa-solid fa-camera"></i> <p> 블랙박스</p></li>
                <li><i class="fa-brands fa-bluetooth"></i> <p> 블루투스 스피커</p></li>
                <li><i class="fa-solid fa-tent"></i> <p> 사이드어닝</p></li>
                <li><i class="fa-solid fa-bath"></i> <p> 샤워실</p></li>
            </ul>
            <ul class="optionUl">
                <li><i class="fa-solid fa-bed"></i> <p> 수면용품</p></li>
                <li><i class="fa-solid fa-door-open"></i><p> 스카이창</p></li>
                <li><i class="fa-solid fa-sink"></i><p> 싱크대</p></li>
                <li><span class="material-symbols-outlined">curtains</span ><p> 암막커튼</p></li>
            </ul>
            <ul class="optionUl">
                <li><i class="fa-solid fa-fan"></i> <p> 에어컨</p></li>
                <li><i class="fa-solid fa-water"></i> <p> 오수탱크</p></li>
                <li><i class="fa-solid fa-fire-flame-simple"></i> <p> 온수기</p></li>
                <li><span class="material-symbols-outlined">table_restaurant</span> <p> 유압식테이블</p></li>
            </ul>
            <ul class="optionUl">
                <li><span class="material-symbols-outlined">microwave_gen</span><p> 전자레인지</p></li>
                <li><span class="material-symbols-outlined">outlet</span> <p> 전기콘센트</p></li>
                <li><i class="fa-solid fa-charging-station"></i> <p> 충전식배터리</p></li>
                <li><i class="fa-solid fa-bed"></i> <p> 침대</p></li>
            </ul>
            <ul class="optionUl">
                <li><span class="material-symbols-outlined">table_restaurant</span> <p> 테이블</p></li>
                <li><span class="material-symbols-outlined">table_restaurant</span> <p> 평탄화 키트</p></li>
                <li><i class="fa-solid fa-restroom"></i> <p> 화장실</p></li>
                <li><i class="fa-solid fa-video"></i> <p> 후방카메라</p></li>
            </ul>

            <h2>무료/유료 대여 옵션</h2>
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">무상 대여 품목</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">추가 옵션 품목</button>
                </li>
              </ul>
              <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                    <li>
                        <div>우드테이블 1개</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>캠핑의자 2개</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>욕실용품+세면도구</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>세탁기+세제</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>이불세트(2인용)</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>코펠세트</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>취사도구</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>드라이기, 고데기</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>노래방 무선마이크 2개+탬버린</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>가스버너</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>감성랜턴 5종</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>휴대용소화기</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>전기연결선+외부전기충전선</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                </div>
                <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                    <li>
                        <div>장작+숯불 세트<p>장작,숯,숯판,그릴,점화기,토치</p></div>
                        <div></div>
                        <span>30,000원</span>
                    </li>
                    <li>
                        <div>영화 세트<p>LG전자 빔프로젝트,블루투스 스피커,유압식 거치대</p></div>
                        <div></div>
                        <span>30,000원</span>
                    </li>
                    <li>
                        <div>전동킥보드<p>nq-02</p></div>
                        <div></div>
                        <span>30,000원</span>
                    </li>
                    <li>
                        <div>플레이스테이션 게임기<p>타이틀 각종게임 10종, 조이스틱 2개</p></div>
                        <div></div>
                        <span>10,000원</span>
                    </li>
                    <li>
                        <div>월광보합 게임기</div>
                        <div></div>
                        <span>10,000원</span>
                    </li>
                    <li>
                        <div>원터치 텐트</div>
                        <div></div>
                        <span>10,000원</span>
                    </li>
                    <li>
                        <div>필립스 LED 조명 렌턴</div>
                        <div></div>
                        <span>10,000원</span>
                    </li>
                    <li>
                        <div>침대 의자 특대형 2개</div>
                        <div></div>
                        <span>10,000원</span>
                    </li>
                </div>
                
              </div>
              <img src="camcar/car1/campinglove.png" alt="" style="width: 100%; height: 300%; margin-top:30px;">
    <h2 >차고지 위치</h2>
    <div class="carlocate">
            <div class="carlocatemap">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1759.7111589673084!2d129.1616225415142!3d35.16818019370421!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35688d643d202437%3A0xfa1874aa2378cafe!2z67aA7IKw6rSR7Jet7IucIO2VtOyatOuMgOq1rCDsmrDrj5ky66GcMzDrsojquLggMzA!5e0!3m2!1sko!2skr!4v1692600123820!5m2!1sko!2skr" width="760" height="380" style="border-radius:5px; border-top: 1px solid gray; " allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                <p><i class="fa-solid fa-location-dot fa-lg" style="color: #000000;"></i> 대한민국 부산광역시 해운대구 우동2로30번길 30</p>
        </div>
    </div>

    <h2 style=" margin-top: 20px; margin-bottom: 20px;">업체 프로필</h2>
    <div class="carpro">
            <div class="carProfile">
                <div class="carProfileP"><img src="camcar/cf9bso3nuh1gzx0qmeyd5r24a8itpkw7.jpg" alt="" style="width: 100%; height: 100%; border-radius: 50%;"></div>
                <p>캠핑럽 <i class="fa-solid fa-circle-check" style="color: rgb(57, 116, 217);"></i> 인증업체</p>
        </div>
        <p style="margin: 0; margin-left: 20px; margin-top: 10px;">신혼여행전문! 스타모빌의 최상의 프리미엄모델 ST9 입니다.</p>
        <button style="margin-top: 20px; margin-left: 20px;">캠핑럽에게 채팅하기</button>
    </div>
    <h2 style=" margin-top: 20px; margin-bottom: 20px;">후기</h2>
    <div class="review">
        <span>후기 0개</span><button>후기 등록하기</button>
    </div>
        </div>
        <div class="carsection_calendar">
                <label for="date-range"><h2 style="margin-left: 40px; margin-top: 20px;"><%= carPrice %>원 /1박 ~</h2></label>
                <h4 style="margin-left: 40px;">예약하기</h4>
                <div id="date-range"></div>
                <div class="dateForm">
            <div class="days">
                <label for="reservation-days">예약기간</label>
                <span id="reservation-days">0</span><span>일</span>
            </div>
            
            <div class="price">
                <label for="price">가격</label>
                <span id="price"><%= carPrice %></span><span>원</span>
            </div>
            
            <div class="total-price">
                <label for="total-price">결제금액</label>
                <span id="total-price">0</span><span>원</span>
            </div>

			<div>
    			<input type="hidden" id="carID" value="<%= carID %>"> <!-- carID 값을 지정하거나 동적으로 가져와야 함 -->
				<input type="hidden" id="userID" value="<%= userID %>">
			</div>
            <div class="priceBtn">
                <button id="reserve-button" disabled>예약하기</button>
				<button id="reset-button">날짜 선택 초기화</button>
            </div>
            </div>

    
          <div class="carchat">
                <div class="carProfile">
                    <div class="carProfileP" style="width: 64px; height: 64px;" ><img src="camcar/cf9bso3nuh1gzx0qmeyd5r24a8itpkw7.jpg" alt="" style="width: 100%; height: 100%; border-radius: 50%;"></div>
            </div>
                <p style="text-align: center; margin-top: 10px;" >캠핑럽</p>
            <p style="margin: 0; text-align: center;">신혼여행전문! 스타모빌의 최상의 프리미엄모델 ST9 입니다.</p>
            <button style="margin-top: 25px;margin-left: 12%; width: 200px; height: 30px; border: none; border-radius: 5px; background-color: black; color:white">채팅하기</button>
            </div>
            <div class="carphonenum">
                <h4 style="text-align: center; margin: auto;">대표번호: 010-0123-0123</h4>
            </div>
        </div> 
        </div>
          
       <!-- 모달 -->
        <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="imageModalLabel">이미지 더 보기</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="carouselExample" class="carousel slide" >
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="camcar/car1/r7wcphj9tnai2df3105koq6mzvslyb4u.jpg" class="d-block w-100" alt="Image 1">
                                </div>
                                <div class="carousel-item">
                                    <img src="camcar/car1/5oyr9ndgwck0hujxemlt48zifsva37bp.jpg" class="d-block w-100" alt="Image 2">
                                </div>
                                <div class="carousel-item">
                                    <img src="camcar/car1/b6v7u5khawq2tlrz0o4n9pejgxi3cfsd.jpg" class="d-block w-100" alt="Image 3">
                                </div>
                                <div class="carousel-item">
                                    <img src="camcar/car1/qfpy8m4s0a7cxhk3uwtz6ngir1jolvde.jpg" class="d-block w-100" alt="Image 3">
                                </div>
                                <div class="carousel-item">
                                    <img src="camcar/car1/r3gs6wu859yvoxc0azqd24fi1jlh7ktm.jpg" class="d-block w-100" alt="Image 3">
                                </div>
                                <div class="carousel-item">
                                    <img src="camcar/car1/shcd97gbxqw1mpz5aj62yru4leo8if3k.jpg" class="d-block w-100" alt="Image 3">
                                </div>
                                <div class="carousel-item">
                                    <img src="camcar/car1/vxlhbif47tckm5a6pro231y89wnuzqej.jpg" class="d-block w-100" alt="Image 3">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="car.js"></script>
    <script>var pricePerDay = <%= carPrice %>;</script> 



    
</body>
</html>
