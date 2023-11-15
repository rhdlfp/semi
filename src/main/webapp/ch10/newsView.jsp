<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelvr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
rel="stylesheet" integrity="sha.384-EVSTQN3/azpgG1Anm3!DgpJLIm9Nao0Yz1ztc!TwFspd3yD65VohhpuuCOmLASjC"
crossorigin="anonymous">
<script src="https://cdn.jsdelvr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>뉴스 관리 앱</title>
</head>
<body>
	<div class="container w-75 mt-5 mx-auto">
	<h2>${news.title}</h2>
	<hr>
	<div class="card w-75 mx-auto">
		<img class="card-img-top" src="/p0727/image?name=${news.aid}_${news.img}">
		<div class="card-body">
		 <h4 class="card-title">Date: ${news.date}</h4>
		 <p class="card-text">Content: ${news.content}</p>
		</div>
	</div>
	<hr>
	<a href="javascript:history.back()" class="btn btn-primary"> << Back </a>
	</div>
</body>
</html>