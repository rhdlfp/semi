<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="carsection.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dancing+Script&family=Kotta+One&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>car</title>
    <style>
        .custom-reservation-form {
            display: flex;
            flex-direction: column;
            max-width: 1135px;
            margin: 0 auto;
            border:none; 
            border-bottom: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            border-bottom: 1px solid rgba(0, 0, 0, 0.15);
        }
        
        .optionBox {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .reservation-form {
            margin-top: 40px;
            display: flex;
            justify-content: space-around;
        }
        
        .reservation-form input[type="text"] {
            width: 200px;
        }
        
        #custom-date-range {
            width: 300px;
        }

        .custom-checkboxes {
            position: absolute;
            top: 15%;
            left: 21%;
            z-index: 3;
            display: none;
            width: 200px;
            height: 260px;
            background-color: white;
            border-radius: 10px;
            padding-left: 10px;
        }
        
        .custom-reservation-form input[type="text"]:focus + .custom-checkboxes {
            display: block;
        }
        
        .custom-checkboxes input {
            width: 20px;
        }
        
        .custom-checkboxes label {
            width: 100%;
        }
        
         #checkboxe-div input {
            width: 20px;
        }
        
        #checkbox-div label {
            width: 200px;
            height: 30px;
        }
        
        .close-button {
            display: inline-block;
            background-color: rgb(57, 116, 217);
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .fixed_btn i {
            color: #ffffff;
        }

        .submit-line {
            display: flex;
            justify-content: flex-start;
            margin-left: 6%;
            margin-top: 10px;
            margin-bottom: 15px;
            
        }
        
        .submit-button {
            background-color: rgb(57, 116, 217);
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body onload="initializeMap()">
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
    <section>

        <div class="carlist">
            
        
    <form id="reservation-form">    
        <div class="carsection_box">
            <div class="custom-reservation-form">
                    <div class="reservation-form">
                        <input style="background-color: #F1F1F1;" type="text" id="date-range" name="date-range" readonly placeholder="     대여기간을 선택하세요">
                        <input style="background-color: #F1F1F1;" type="text" id="custom-date-range" name="custom-date-range" readonly placeholder="     지역을 선택하세요">
                        <input style="background-color: #F1F1F1;" type="text" id="additional-input" placeholder="     더 보기">
                        <div id="selected-dates" class="selected-dates"></div>
                        <div id="checkbox-div">
                <label><input type="checkbox" value="반려동물 동반 가능"><span>반려동물 동반 가능</span></label>
                <label><input type="checkbox" value="딜리버리 가능"><span>딜리버리 가능</span></label>
                <label><input type="checkbox" value="기본 캠핑장비 제공"><span>기본 캠핑장비 제공</span></label>
                <label><input type="checkbox" value="1종 보통"><span>1종 보통</span></label>
                <label><input type="checkbox" value="2종 보통"><span>2종 보통</span></label>
                <button id="submit-button">선택완료</button>
                </div>
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
            
                    </div>
                <div class="submit-line">
                    <button type="submit" class="close-button" id="close-checkboxes"><i class="fa-solid fa-magnifying-glass" style="color: #ffffff;" ></i> 검색</button>
                </div>
            </div>
            <ul class="carsection_list">
                <li>
                    <div class="carsection_list_box">
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
                </li>
                <li>
                    <div class="carsection_list_box">
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
                </li>
                <li>
                    <div class="carsection_list_box">
                        <div class="card">
                            <a href="car3.jsp"><img src="camcar/f368gv15sdaip2m7e4bnu0cqhwzkoxjy-1920x1920.jpg" class="card-img-top" alt="...">
                                </a>
                                <button class="abtn2" type="button" onclick="location.href='car3.jsp'">
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
                </li>
            </ul>
            <ul class="carsection_list1">
                <li>
                    <div class="carsection_list_box">
                        <div class="card">
                            <a href="car4.jsp"><img src="camcar/KakaoTalk_Photo_2022-02-14-18-56-44-001.jpeg" class="card-img-top" alt="...">
                              </a>
                              <button class="abtn2" type="button" onclick="location.href='car4.jsp'">
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
                </li>
                <li>
                    <div class="carsection_list_box">
                        <div class="card">
                            <a href="car5.jsp"><img src="camcar/xnlfpj019hmg75ktczb8drae3s2q4uvo.jpg" class="card-img-top" alt="...">
                              </a>
                              <button class="abtn2" type="button" onclick="location.href='car5.jsp'">
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
                </li>
                <li>
                    <div class="carsection_list_box">
                        <div class="card" >
                            <a href="car6.jsp"><img src="camcar/rxo3gd4ckl2u1vtz9qhm86p70bwsnfj5.jpg" class="card-img-top" alt="...">
                              </a>
                              <button class="abtn2" type="button" onclick="location.href='car6.jsp'">
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
                </li>
            </ul>
        </div>
    </form>
        <div class="carsection_map">
                 
                  <div id="map" style="width: 800px; height: 120vh;"></div>
            </div>
    </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c99709bc79b60bfa6dba46aada2b4799&libraries=services"></script>

                  <script>
                      function initializeMap() {
                          var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
                          var mapOption = {
                              center: new kakao.maps.LatLng(36.305, 127.571111), // 지도의 중심좌표
                              level: 12 // 지도의 확대 레벨
                          };  
              
                          // 지도를 생성합니다    
                          var map = new kakao.maps.Map(mapContainer, mapOption); 
              
                          // 주소-좌표 변환 객체를 생성합니다
                          var geocoder = new kakao.maps.services.Geocoder();
              
                          // 주소들 배열
                          var addresses = [
    { address: '대한민국 부산광역시 해운대구 우동2로30번길 30', link: 'http://192.168.0.63:8080/semiProject/car1.jsp' },
    { address: '대한민국 충청남도 공주시 신관로 26', link: 'http://192.168.0.63:8080/semiProject/car4.jsp' },
    { address: '대한민국 경기도 김포시 고촌읍 신기신동로 44', link: 'http://192.168.0.63:8080/semiProject/car2.jsp' },
    { address: '대한민국 부산광역시 해운대구 송정동', link: 'http://192.168.0.63:8080/semiProject/car5.jsp' },
    { address: '대한민국 경기도 용인시 처인구 유방동 231-1', link: 'http://192.168.0.63:8080/semiProject/car3.jsp' },
    { address: '대한민국 부산광역시 기장군 일광면 일광로', link: 'http://192.168.0.63:8080/semiProject/car6.jsp' }
];
              
                          // 주소들에 대한 마커와 인포윈도우 추가
                          for (var i = 0; i < addresses.length; i++) {
                              geocodeAddress(addresses[i], map, geocoder);
                          }
              
                          var openInfoWindow = null;
              
                          function geocodeAddress(data, map, geocoder) {
                              geocoder.addressSearch(data.address, function(result, status) {
                                  if (status === kakao.maps.services.Status.OK) {
                                      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
              
                                      var marker = new kakao.maps.Marker({
                                          map: map,
                                          position: coords
                                      });
              
                                      var infowindow = new kakao.maps.InfoWindow({
                                          content: data.address // Display address in the infowindow
                                      });
              
                                      kakao.maps.event.addListener(marker, 'click', function() {
                                          if (openInfoWindow) {
                                              openInfoWindow.close(); // Close the previously open infowindow
                                          }
                                          infowindow.open(map, marker);
                                          openInfoWindow = infowindow;
              
                                          var clickCount = 0;
                                          var clickTimer = null;
                                          marker.addListener('click', function() {
                                              clickCount++;
                                              if (clickCount === 1) {
                                                  clickTimer = setTimeout(function() {
                                                      clickCount = 0;
                                                  }, 300); // Set a timeout to differentiate single-click from double-click
                                              } else if (clickCount === 2) {
                                                  clearTimeout(clickTimer);
                                                  clickCount = 0;
                                                  window.location.href = data.link;
                                              }
                                          });
                                      });
              
                                      if (i === 0) {
                                          map.setCenter(coords);
                                      }
                                  }
                              });
                          }
                      }
                  </script>
    <script>
    
    document.getElementById("additional-input").addEventListener("focus", function() {
        document.getElementById("checkbox-div").style.display = "block";
    });

    document.getElementById("submit-button").addEventListener("click", function() {
        const selectedOptions = Array.from(document.querySelectorAll('input[type="checkbox"]:checked')).map(checkbox => checkbox.value);
        const inputField = document.getElementById("additional-input");

        // 선택된 값들을 입력창에 입력하는 코드
        inputField.value = selectedOptions.join(", ");
        
        // 선택된 값들을 폼으로 넘기는 코드
        // 여기서 선택된 값을 서버로 전송하거나 다른 처리를 할 수 있습니다.
        console.log("선택된 값들:", selectedOptions);
        
        // 체크박스 옵션을 다시 숨김
        document.getElementById("checkbox-div").style.display = "none";
    });    
    
const reservationForm = document.getElementById("reservation-form");
const dateRangeInput = document.getElementById("date-range");
const selectedDatesDiv = document.getElementById("selected-dates");

const currentDate = new Date();
const oneYearLater = new Date();
oneYearLater.setFullYear(currentDate.getFullYear() + 1);

const options = {
  mode: "range",
  minDate: currentDate,
  maxDate: oneYearLater,
  dateFormat: "Y년 m월 d일",
  onClose: selectedDates => {
    if (selectedDates.length === 2) {
      const [startDate, endDate] = selectedDates;
      dateRangeInput.value = `${startDate.toLocaleDateString('ko-KR')} - ${endDate.toLocaleDateString('ko-KR')}`;
    }
  }
};

flatpickr(dateRangeInput, options);

reservationForm.addEventListener("submit", event => {
  event.preventDefault();

  const selectedDates = dateRangeInput.value.split(" - ");
  const startDate = new Date(selectedDates[0]);
  const endDate = new Date(selectedDates[1]);

  if (startDate <= endDate) {
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    selectedDatesDiv.innerText = `예약 날짜: ${startDate.toLocaleDateString('ko-KR', options)} - ${endDate.toLocaleDateString('ko-KR', options)}`;
  } else {
    selectedDatesDiv.innerText = "날짜 범위가 올바르지 않습니다.";
  }
});

document.addEventListener("DOMContentLoaded", function () {
  const customDateRangeInput = document.getElementById("custom-date-range");
  const customCheckboxes = document.querySelector(".custom-checkboxes");
  const closeButton = document.getElementById("close-checkboxes");

  customDateRangeInput.addEventListener("focus", function () {
    customCheckboxes.style.display = "block";
  });

  closeButton.addEventListener("click", function () {
    customCheckboxes.style.display = "none";
  });

  customCheckboxes.addEventListener("change", function () {
    const selectedOptions = Array.from(customCheckboxes.querySelectorAll("input[type='checkbox']:checked"))
      .map(checkbox => checkbox.value);

    // 선택된 옵션을 input에 표시
    customDateRangeInput.value = selectedOptions.join(", ");
  });
});
    </script>
</body>
</html>