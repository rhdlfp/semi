<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="map.css">
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
        .carimage2_img5 button{
            position: absolute;
            top:63%;
            right: 19.6%;
        }

    </style>

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
<div class="carimage">
    <div class="carimage_img1">
        <img style="width: 100%; height: 100%;" src="chabakmap/gg/gg.jpg" alt="">
    </div>
    <div class="carimage_img2">
        <img style="width: 100%; height: 100%;" src="chabakmap/gg/1.jpeg" alt="">
    </div>
    <div  class="carimage_img3">
        <img style="width: 100%; height: 100%;" src="chabakmap/gg/2.jpeg" alt="">
    </div>
</div>
<div class="carimage2">
    <div class="carimage2_img4">
    </div>
    <div class="carimage2_img5">
        <img style="width: 100%; height: 100%;" src="chabakmap/gg/3.jpeg" alt="">
        <button style="background: white; color:black; border: none;"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#imageModal"><i class="fa-regular fa-images"></i> 이미지 더 보기</button>
    </div>
        
    </div>
    <div class="cartext">
        <div class="carimage_text">
            <h2 style="margin-top: 20px; color: #000000; font-family: 'KOTRA_BOLD-Bold';">캠핑브릿지 캠핑장</h2>
        </div>
        <div class="carimage_tag"></div> 
        <div class="carborrow">
            
        </div>  
    </div>
    <div class="carsection">
        <div class="carsection_text">
            <h2><i class="fa-solid fa-toilet"></i> 근처 화장실 있음 <i class="fa-solid fa-store"></i> 근처 편의점/마트 있음</h2>
            <h2 style="margin-top: 5%;">요약설명</h2>
            <p>인접한 곳에 임진강이 있어 낚시도 가능한 곳입니다. 경기권에 위치해 있어 가볍게 다녀오기 좋은 곳입니다.</p>
            
    <h2 style="margin-top: 5%;">위치</h2>
    <div class="carlocate">
            <div class="carlocatemap">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25154.865736888445!2d126.8783589!3d37.99210425!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ce6ae3a297f05%3A0xbafa976d16d7be19!2z6rK96riw64-EIOyXsOyynOq1sCDsnqXrgqjrqbQg7JuQ64u566as!5e0!3m2!1sko!2skr!4v1692759113579!5m2!1sko!2skr" width="1200" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                <p><i class="fa-solid fa-location-dot fa-lg" style="color: #000000;"></i> 대한민국 경기도 연천군 장남면 원당리</p>
        </div>
    </div>
    <h2 style=" margin-top: 5%; margin-bottom: 20px;">전화번호</h2>
    <p>010-0123-0123</p>
    <h2 style=" margin-top: 5%; margin-bottom: 20px;">후기</h2>
    <div class="review">
        <span>후기 0개</span><button>후기 등록하기</button>
    </div>
    <h2 style=" margin-top: 5%; margin-bottom: 20px;">출처</h2>
    <p>https://url.kr/byvkum</p>
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
                                    <img src="chabakmap/gg/gg.jpg" class="d-block w-100" alt="Image 1">
                                </div>
                                <div class="carousel-item">
                                    <img src="chabakmap/gg/1.jpeg" class="d-block w-100" alt="Image 2">
                                </div>
                                <div class="carousel-item">
                                    <img src="chabakmap/gg/2.jpeg" class="d-block w-100" alt="Image 3">
                                </div>
                                <div class="carousel-item">
                                    <img src="chabakmap/gg/3.jpeg" class="d-block w-100" alt="Image 3">
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
        <script>
            // 모달 및 캐러셀 스크립트
            var modal = document.getElementById("myModal");
            var images = document.querySelectorAll(".carimage2_img6 img"); // 이미지 선택 수정
            var closeBtn = document.getElementsByClassName("close")[0];
        
            // 이미지 클릭 시 모달 표시
            for (var i = 0; i < images.length; i++) {
                images[i].addEventListener("click", function() {
                    modal.style.display = "block";
                });
            }
        
            // 모달 닫기 버튼 클릭 시 모달 닫기
            closeBtn.addEventListener("click", function() {
                modal.style.display = "none";
            });
        
            // 모달 바깥 영역 클릭 시 모달 닫기
            window.addEventListener("click", function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            });
        </script>
    
</body>
</html>