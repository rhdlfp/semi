<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="mapsection.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dancing+Script&family=Kotta+One&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>캠박 - 캠핑장 검색</title>
    <style>
        .custom-reservation-form {
            display: flex;
            flex-direction: column;
            max-width: 780px;
            
            
            border: none;
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
            left: 7%;
            z-index: 5;
            display: none;
            width: 200px;
            height: 320px;
            background-color: white;
            border-radius: 10px;
            padding-left: 10px;
            border: 1px solid rgb(0,0,0,0.15);
        }
        
        .custom-reservation-form input[type="text"]:focus + .custom-checkboxes {
            display: block;
        }
        
        .custom-checkboxes input {
            width: 20px;
        }
        
        .custom-checkboxes label {
            width: 200px;
            height: 30px;
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
                        <input style="display: none; background-color: darkgrey;" type="text" id="date-range" name="date-range" readonly placeholder="     대여기간을 선택하세요">
                        <input style="background-color: aliceblue;" type="text" id="custom-date-range" name="custom-date-range" readonly placeholder="     지역을 선택하세요">
                        
                        <div id="selected-dates" class="selected-dates"></div>
                        <input style="background-color: aliceblue; margin-left: -10%;" type="text" id="additional-input" placeholder="세부검색">
<div id="checkbox-div" style="display: none;">
    <label><input type="checkbox" name="option" value="옵션 1"> 옵션 1</label>
    <label><input type="checkbox" name="option" value="옵션 2"> 옵션 2</label>
    <label><input type="checkbox" name="option" value="옵션 3"> 옵션 3</label>
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
                                <img  src="chabakmap/gg/gg.jpg" class="d-block w-100" alt="Image 1">
                              </div>
                              <div class="carousel-item">
                                <img src="chabakmap/gg/1.jpeg" class="d-block w-100" alt="Image 2">
                              </div>
                              <div class="carousel-item">
                                <img src="chabakmap/gg/2.jpeg" class="d-block w-100" alt="Image 3">
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
                </li>
                <li>
                    <div class="carsection_list_box">
                      <div class="condiv">
                        <div id="carousel2" class="carousel slide carousel-container">
                          <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carousel2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carousel2" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carousel2" data-bs-slide-to="2" aria-label="Slide 3"></button>
                          </div>
                          <div class="carousel-inner">
                            <div class="carousel-item active">
                              <img src="chabakmap/gw/gw.jpg" class="d-block w-100" alt="Image 4">
                            </div>
                            <div class="carousel-item">
                              <img src="chabakmap/gw/1.jpeg" class="d-block w-100" alt="Image 5">
                            </div>
                            <div class="carousel-item">
                              <img src="chabakmap/gw/2.jpeg" class="d-block w-100" alt="Image 6">
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
                </li>
                
            </ul>
            <ul class="carsection_list1">
                <li>
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
                              <img src="chabakmap/cb/cb.jpg" class="d-block w-100" alt="Image 7">
                            </div>
                            <div class="carousel-item">
                              <img src="chabakmap/cb/ymv6to724ihsf0jua9kqcenxzg1rb38w.jpeg" class="d-block w-100" alt="Image 8">
                            </div>
                            <div class="carousel-item">
                              <img src="chabakmap/cb/feu5byq1p8ri93s7ng4ch6kvdtj0w2mo.jpeg" class="d-block w-100" alt="Image 9">
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
                </li>
                <li>
                    <div class="carsection_list_box">
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
                                  <img src="chabakmap/cn/cn.jpg" class="d-block w-100" alt="Image 10">
                                </div>
                                <div class="carousel-item">
                                  <img src="chabakmap/cn/02ovksbm1gw36nt9rxe8q4dcaufpi7zl.jpeg" class="d-block w-100" alt="Image 11">
                                </div>
                                <div class="carousel-item">
                                  <img src="chabakmap/cn/5hnrjgy63pite7d4mqlcw0vkz98afo1u.jpeg" class="d-block w-100" alt="Image 12">
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
                </li>
            </ul>
            <ul class="carsection_list2">
              <li>
                <div class="chabak_box1">
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
                              <img src="chabakmap/jn/jn1.jpg" class="d-block w-100" alt="Image 13">
                            </div>
                            <div class="carousel-item">
                              <img src="chabakmap/jn/jn-18.jpg" class="d-block w-100" alt="Image 14">
                            </div>
                            <div class="carousel-item">
                              <img src="chabakmap/jn/jn-20.jpg" class="d-block w-100" alt="Image 15">
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
              </li>
              <li>
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
                        <img src="chabakmap/jn/jn2.jpg" class="d-block w-100" alt="Image 16">
                      </div>
                      <div class="carousel-item">
                        <img src="chabakmap/jn/25dnc1ip3tjo9kb6mgqwuslafyh8v0e4-1920x1440.jpeg" class="d-block w-100" alt="Image 17">
                      </div>
                      <div class="carousel-item">
                        <img src="chabakmap/jn/rq04jeai6o1ndfkcbu3hvyp78ts5wgzm.jpg" class="d-block w-100" alt="Image 18">
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
              </li>
          </ul>

          <ul class="carsection_list1">
            <li>
              <div class="chabak_box1">
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
                            <img src="chabakmap/gb/gb.jpg" class="d-block w-100" alt="Image 19">
                          </div>
                          <div class="carousel-item">
                            <img src="chabakmap/gb/nsdgl7m9zxrcebo21fh0vk6yqpua8i34.jpeg" class="d-block w-100" alt="Image 20">
                          </div>
                          <div class="carousel-item">
                            <img src="chabakmap/gb/fzp95wu4h83qdj1aibckr2nvo067lxyg-1920x910.jpeg" class="d-block w-100" alt="Image 21">
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
            </li>
            <li>
                <div class="carsection_list_box">
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
                              <img src="chabakmap/gn/gn.jpg" class="d-block w-100" alt="Image 22">
                            </div>
                            <div class="carousel-item">
                              <img src="chabakmap/gn/ls9b8p3m24gvqy6rkxd70htficza5unj.jpeg" class="d-block w-100" alt="Image 23">
                            </div>
                            <div class="carousel-item">
                              <img src="chabakmap/gn/kb9mqgyus0wn4xa3i1p5fvredo786j2z.jpeg" class="d-block w-100" alt="Image 24">
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
            </li>
        </ul>
      
        </div>
    </form>
        <div class="carsection_map">
                  <div id="map" style="width: 1111px; height: 190vh;"></div>
              </div>
            </div>
    </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c99709bc79b60bfa6dba46aada2b4799&libraries=services"></script>
                  <script>
                      function initializeMap() {
                          var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
                          var mapOption = {
                              center: new kakao.maps.LatLng(34.1368, 127.6673), // 지도의 중심좌표
                              level: 12 // 지도의 확대 레벨
                          };  
              
                          // 지도를 생성합니다    
                          var map = new kakao.maps.Map(mapContainer, mapOption); 
              
                          // 주소-좌표 변환 객체를 생성합니다
                          var geocoder = new kakao.maps.services.Geocoder();
              
                          // 주소들 배열
                          addresses = [
    { address: '경기 연천군 장남면 술이홀로63번길 41-17 (원당리)', link: 'http://192.168.0.63:8080/semiProject/mapgg.jsp' },
    { address: '서면 모곡로 365-139 (마곡리 산124-2번지) 산으로캠핑장', link: 'http://192.168.0.63:8080/semiProject/mapgw.jsp' },
    { address: '충북 충주시 동량면 지등로 1276-4', link: 'http://192.168.0.63:8080/semiProject/mapcb.jsp' },
    { address: '전라남도 해남군 송지면 통호리', link: 'http://192.168.0.63:8080/semiProject/mapcn.jsp' },
    { address: '전라남도 곡성군 오곡면 섬진강로 1097', link: 'http://192.168.0.63:8080/semiProject/mapjb.jsp' },
    { address: '경상남도 창원시 마산합포구 구산면 옥계리', link: 'http://192.168.0.63:8080/semiProject/mapjn.jsp' },
    { address: '강원도 원주시 세계로 10 (반곡동 1914-6)', link: 'http://192.168.0.63:8080/semiProject/mapgb.jsp' },
    { address: '경주시 양남면 나아4길 17-1', link: 'http://192.168.0.63:8080/semiProject/mapgn.jsp' }
    
    ];
              
                          // 주소들에 대한 마커와 인포윈도우 추가
                          for (var i = 0; i < addresses.length; i++) {
                              geocodeAddress(addresses[i]);
                          }
              
                          var openInfoWindow = null;
              
                          function geocodeAddress(data) {
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

  // if (startDate <= endDate) {
  //   const options = { year: 'numeric', month: 'long', day: 'numeric' };
  //   selectedDatesDiv.innerText = `예약 날짜: ${startDate.toLocaleDateString('ko-KR', options)} - ${endDate.toLocaleDateString('ko-KR', options)}`;
  // } else {
  //   selectedDatesDiv.innerText = "날짜 범위가 올바르지 않습니다.";
  // }
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
