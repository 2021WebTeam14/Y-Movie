<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<link href="css/movieinfo.css" rel="stylesheet" />

<style>	body{margin: 10vh 15vw 10vh 15vw;}</style>
</head>
<body>
    <iframe src="header.html" style="width: 69vw; border: none;"></iframe>
    <h2>영화 상세 정보</h2>
    <div class="movie-info">
	<div class="poster-box">
		<img class="poster-thumbnail" src="img/ironman.jpg" width="197px" height="273"><!-- src="DB 이미지 주소" -->
	</div>
	
	<div class="info-box">
		<ul>
		<li>제목: /*불러오기*/</li>
		<li>개봉일: /*불러오기*/</li>
		<li>감독: /*불러오기*/</li>
		<li>배우: /*불러오기*/</li>
		<li>장르: /*불러오기*/</li>
		<li>평균 별점: /*불러오기*/</li>
		</ul>
	</div>
</div>

<div><!-- 리뷰 페이징 부분 -->

</div>
	
    <iframe src="footer.html" style="width: 69vw; border: none"></iframe>
</body>
</html>