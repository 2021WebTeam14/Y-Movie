<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
	<title>Y-Movie</title>
    <link href="css/initPage.css" rel="stylesheet" />
</head>
<body>
	<div class="header">
		<img src="img/logo.png" alt="Y-Movie" width="297px" height="100px"/>
		<div class = "signNav">
			<div class = "sign">
				<input class = "signIn" type="button" value="Sign in" onclick="location.href='signIn.jsp';"/>
				<input class = "signOut" type="button" value="Sign up" onclick="location.href='signUp.jsp';"/>
			</div>
			<nav class="nav">
			    <a href="/html/intro">영화 추천</a> | 
			    <a href="/css/intro">영화 리뷰</a> | 
			    <a href="/javascript/intro">박스오피스 순위</a> | 
			    <a href="/javascript/intro">영화관 찾기</a> | 
			    <a href="/javascript/intro">마이페이지</a>
			</nav>
		</div>	
		</div>
	<div id = "center">
		center
	</div>
	<footer>
		<div>
			test
		</div>
	</footer>
</body>
</html>