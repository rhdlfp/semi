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
<script src="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.js"></script>
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
    int carID = 3; // 화면과 연결할 carID 값으로 변경
    CarInformation carInfo = dao.getCarInfo(carID);
    int carPrice = (carInfo != null) ? carInfo.getCarPrice() : 0;
	%>
    

    <div class="carimage">
        <div class="carimage_img1">
            <img src="camcar/minikhan2/1.jpeg" alt="">
        </div>
        <div class="carimage_img2">
            <img src="camcar/minikhan2/2.jpeg" alt="">
        </div>
        <div class="carimage_img3">
            <img src="camcar/minikhan2/3.png" alt="">
        </div>
    </div>
    <div class="carimage2">
        <div class="carimage2_img4">
        </div>
        <div class="carimage2_img5">
            <img src="camcar/minikhan2/4.jpeg" alt="">
        </div>
        <div class="carimage2_img6">
            <img src="camcar/minikhan2/5.jpeg" alt="">
            <button style="background: white; color:black; border: none;"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#imageModal"><i class="fa-regular fa-images"></i> 이미지 더 보기</button>
        </div>
    </div>
    <div class="cartext">
        <div class="carimage_text">
            <h1>[미니칸 용인지점] 레이캠핑카 4인승</h1>
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
            <h2><i class="fa-solid fa-dog"></i> 반려동물 동반 가능 <i class="fa-solid fa-campground"></i> 기본 갬핑장비 제공 <i class="fa-solid fa-square-parking"></i> 주차가능</h2>
            <p>- 레이 기반의 프리미엄 완성형 캠핑카(2021년 6월 출고 신차)</p>
            <p>- 상부 루프탑 텐트에서 여유 있게 2명 취침 + 차량 내 평탄화 시트 위에서 2명 취침 가능</p>
            <p>- 상부 루프탑 텐트 : 외부에서 이동할 수 있는 2021년 최신형 툴레 테푸이 풋힐 루프탑</p>
            <p>- 무시동 히터로 완벽 난방</p>
            <p>- 풀 플랫 시트 제공으로 매트리스처럼 편안하고 안락한 취침 가능</p>
            <p>- 내부 구조물 최소화로 개방감 극대화</p>
            <p>- 주행 충전 장치 및 100A 파워뱅크 장착, 12V 시가잭, USB 포트 제공으로 다양한 전기장치 활용 가능</p>
            <p>- 프리미엄급 어닝 장착 : 외부 활동 시, 별도의 그늘막 필요 없음</p>

            
            <p><span class="material-symbols-outlined">person</span> 동승가능인원: 3명 <span class="material-symbols-outlined">person</span> 취침가능인원: 3명</p>
            <p><span class="material-symbols-outlined">schedule</span> 대여일 출차시간 9:00~18:00 <span class="material-symbols-outlined">schedule</span> 반납일 반납시간 9:00~18:00</p>
            <p><span class="material-symbols-outlined">credit_card</span> 평일 가격: 150,000원 /박 <span class="material-symbols-outlined">credit_card</span> 주말 가격: 180,000원 /박</p>
            <p><span class="material-symbols-outlined">check</span> 만 26세 이상 <i class="fa-regular fa-address-card"></i> 2종 보통 이상 <span class="material-symbols-outlined">directions_car</span> 운전 경력 1년 이상</p>
            <p><i class="fa-solid fa-location-dot fa-lg" style="color: #000000;"></i> 차고지 주소: 대한민국 경기도 용인시 처인구 유방동 231-1</p>
            
            
            <h2>보유시설</h2>
            <ul class="optionUl">
                <li><span class="material-symbols-outlined">heat_pump</span><p>무시동 히터</p></li>
                <li><i class="fa-solid fa-water"></i> <p> 물탱크 </p></li>
                <li><i class="fa-solid fa-camera"></i> <p> 블랙박스</p></li>
                <li><i class="fa-brands fa-bluetooth"></i> <p> 블루투스 스피커</p></li>
            </ul>
            <ul class="optionUl">
                <li><i class="fa-solid fa-tent"></i> <p> 사이드어닝</p></li>
                <li><span class="material-symbols-outlined">outlet</span> <p> 전기콘센트</p></li>
                <li><i class="fa-solid fa-bed"></i><p> 침대</p></li>
                <li><i class="fa-solid fa-door-open"></i><p> 팝업루프</p></li>
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
                        <div>우드테이블 의자 세트 <p>접의식 우드 롤 테이블, 캔버스 의자, 실내용 우드 테이블</p></div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>수납 폴딩 박스 및 3단 우드 선반, 레디백</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>아이스박스 쿨러(13L)</div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>감성 세트 <p>감성 카펫, LED 루미너스 클래식 조명, 스트링 라이트 조명</p></div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>아웃도어 스마트 가스버너 5종 세트<p>버너,냄비,구이판,가위,집게</p></div>
                        <div></div>
                        <span>무료</span>
                    </li>
                    <li>
                        <div>불멍 패키지 <p>화로대,가스 토치 (부탄가스 별도 판매)</p></div>
                        <div></div>
                        <span>무료</span>
                    </li>
                </div>
                <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                    <li>
                        <div>반려견 동반<p>반려견 동반 (PET카시트 + PET카펜스 대여 + 청소비 포함)</p></div>
                        <div></div>
                        <span>30,000원</span>
                    </li>
                </div>
                 <img src="camcar/minikhan2/minikhan2.png" style="width: 100%; height: 100%; margin-top:30px;" alt="">
                  
                  <h2 style="margin-top: 10%">차고지 위치</h2>
    <div class="carlocate" style="width: 602px;height: 520px;">
            <div class="carlocatemap">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3160.6834588992715!2d126.77321049999999!3d37.60960819999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c84b717ef8567%3A0x2b080cf7b74f0a9c!2z6rK96riw64-EIOq5gO2PrOyLnCDqs6DstIzsnY0g7Iug6riw7Iug64-Z66GcIDQ0!5e0!3m2!1sko!2skr!4v1692714685498!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                <p style="font-size: 16px; width: 500px;"><i class="fa-solid fa-location-dot fa-lg " style="color: #000000;"></i> 대한민국 경기도 김포시 고촌읍 신기신동로 44</p>
        </div>
    </div>
    <div>
    <h2 style="margin-top: 80px; margin-bottom: 20px;">업체 프로필</h2>
    <div class="carpro">
            <div class="carProfile">
                <div class="carProfileP"><img src="camcar/minikhan/mjz13klsxnvd2tf9r6wopg8qih70cu5a-150x150.png" alt="" style="width: 100%; height: 100%; border-radius: 50%;"></div>
                <p style="font-size: 16px">미니칸 <i class="fa-solid fa-circle-check" style="color: rgb(57, 116, 217);"></i> 인증업체</p>
        </div>
        <p style="font-size: 16px;margin: 0; margin-left: 20px; margin-top: 10px;">차박 캠핑을 떠나는 가장 간편한 방법</p>
        <button style="margin-top: 20px; margin-left: 20px;">미니칸에게 채팅하기</button>
    </div>
    <h2 style="margin-top: 20px; margin-bottom: 20px;">후기</h2>
    <div class="review">
        <span style="font-size: 18px;">후기 0개</span><button>후기 등록하기</button>
    </div>
    <div style="width: 762px; height: 500px;">
    </div>
</div>
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
			</div>
            <div class="priceBtn">
                <button id="reserve-button" disabled>예약하기</button>
				<button id="reset-button">날짜 선택 초기화</button>
            </div>
            </div>

    
            <div class="carchat">
                <div class="carProfile">
                    <div class="carProfileP" style="width: 64px; height: 64px;" ><img src="camcar/minikhan/mjz13klsxnvd2tf9r6wopg8qih70cu5a-150x150.png" alt="" style="width: 100%; height: 100%; border-radius: 50%;"></div>
            </div>
                <p style="text-align: center; margin-top: 10px;" >미니칸</p>
            <p style="margin: 0; text-align: center;">차박 캠핑을 떠나는 가장 간편한 방법</p>
            <button style="margin-top: 50px;margin-left: 12%; width: 200px; height: 30px; border: none; border-radius: 5px; background-color: black; color:white">캠핑럽에게 채팅하기</button>
            </div>
            <div class="carphonenum">
                <h4 style="text-align: center; margin: auto;">대표번호: 010-1234-1234</h4>
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
                                    <img src="camcar/minikhan2/1.jpeg" class="d-block w-100" alt="Image 1">
                                </div>
                                <div class="carousel-item">
                                    <img src="camcar/minikhan2/2.jpeg" class="d-block w-100" alt="Image 2">
                                </div>
                                <div class="carousel-item">
                                    <img src="camcar/minikhan2/3.png" class="d-block w-100" alt="Image 3">
                                </div>
                                <div class="carousel-item">
                                    <img src="camcar/minikhan2/4.jpeg" class="d-block w-100" alt="Image 4">
                                </div>
                                <div class="carousel-item">
                                    <img src="camcar/minikhan2/5.jpeg" class="d-block w-100" alt="Image 5">
                                </div>
                                <div class="carousel-item">
                                    <img src="camcar/minikhan2/6.jpeg" class="d-block w-100" alt="Image 6">
                                </div>
                                <div class="carousel-item">
                                    <img src="camcar/minikhan2/7.jpeg" class="d-block w-100" alt="Image 7">
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
    
    <script src="car.js"></script>
    <script>var pricePerDay = <%= carPrice %>;</script> 
</body>
</html>
