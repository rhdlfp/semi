<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text-html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
  <title>개시글 목록</title>
  <style>
    /* 여기에 스타일을 정의합니다. */
  </style>
</head>
<body>
 <nav class="navbar navbar-default">
    <div class="navbar-header">
     <button type="button" class="navbar-toggle collapsed"
        data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
        aria-expanded="false">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
       
     </button>
     <a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
    </div>
   <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
   <ul class="nav navbar-nav">
         <li><a href="main.jsp">메인</a></li>
         <li><a href="bbs.jsp">게시판</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-rigth">
    <li class="dropdown">
     <a href="#" class="dropdown-toggle"
       data-toggle="dropdown" role="button" aria-haspopup="true"
       aria-expanded="false">접속하기<span class="caret"></span></a>
       <ul class="dropdown-menu">
          <li><a href="login.jsp">로그인</a></li>
          <li class="active"><a href="join.jsp">회원가입</a></li>
   </ul>
   </li>
   </ul>
   </div>
   
   
   </nav>
  <ul id="post-list">
    <li class="post">
      <span class="post-text">첫 번째 개시글</span>
      <button class="like-button">좋아요</button>
      <span class="like-count">0</span>
    </li>
    <!-- 다른 개시글들도 유사한 형태로 나열합니다. -->
  </ul>
  <script src="script.js"></script>
</body>
</html>
