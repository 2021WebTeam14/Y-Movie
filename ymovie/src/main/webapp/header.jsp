<%@page import="sessionServlet.storeSession"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Y-Movie</title>
    <link href="css/header.css" rel="stylesheet" />
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
					out.print("<input class = \"signOut\" type=\"button\" value=\"SignOut\" onclick=\"window.top.location.replace('/ymovie//jaeik/signOut.jsp');\"/>");
				}
				else {
					out.print("<input class = \"signIn\" type=\"button\" value=\"Sign in\" onclick=\"window.top.location.replace('/ymovie/seungtae/signIn.jsp');\"/>");
					out.print("<input class = \"signUP\" type=\"button\" value=\"Sign up\" onclick=\"window.top.location.replace('/ymovie/seungtae/signUp.jsp');\"/>");
				}
			%>	    
		    </div>
		    <ul id="nav">
		    	<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천&nbsp;</a>
			    	<ul>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    	</ul>
		    	</li>
		    	<li><a href="/ymovie/seokwon/writingreview.jsp">&nbsp;영화 리뷰&nbsp;</a>
			    	<ul>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    	</ul>
		    	</li>
		    	<li><a href="/ymovie/seokwon/daily_rank.jsp">&nbsp;박스오피스&nbsp;</a>
			    	<ul>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    	</ul>
		    	</li>
		    	<li><a href="/ymovie/seonhyeok/map1.jsp">&nbsp;영화관 찾기&nbsp;</a>
			    	<ul>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    	</ul>
		    	</li>
		    	<li><a href="/ymovie/seungtae/myPage.jsp">&nbsp;마이페이지</a>
			    	<ul>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp">영화 추천</a></li>
			    	</ul>
		    	</li>
		    
		    </ul>
   		</div>
	</div>
</body>