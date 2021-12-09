<%@page import="sessionServlet.storeSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Y-Movie</title>
    <link href="header.css" rel="stylesheet" />
</head>
<body>
	<div class="header">
		<div class="imgWrapper">
		<img src="img/logo.png" alt="Y-Movie" width="100%" height="100%" onclick="window.top.location.replace('/ymovie/initPage.jsp')"/>
		</div>
		<div class = "signNav">
		    <div class="sign">
			<%
				storeSession sessionDAO = new storeSession();
				if (sessionDAO.getSession(session) != ""){
					out.print("<input class = \"signOut\" type=\"button\" value=\"SignOut\" onclick=\"window.top.location.replace('./jaeik/signOut.jsp');\"/>");
				}
				else {
					out.print("<input class = \"signIn\" type=\"button\" value=\"Sign in\" onclick=\"window.top.location.replace('./seungtae/signIn.jsp');\"/>");
					out.print("<input class = \"signUP\" type=\"button\" value=\"Sign up\" onclick=\"window.top.location.replace('./seungtae/signUp.jsp');\"/>");
				}
			%>	    
		    </div>
			<nav class="nav">
			    <a href="/html/intro">영화 추천 | </a>
			    <a href="/css/intro">영화 리뷰 | </a>
			    <a href="/javascript/intro">박스오피스 순위 | </a>
			    <a href="/javascript/intro">영화관 찾기 | </a>
			    <a href="/javascript/intro">마이페이지</a>
			</nav>
   		</div>
	</div>
</body>