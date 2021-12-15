<%@page import="sessionServlet.storeSession"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Y-Movie</title>
    <link href="/ymovie/css/header.css" rel="stylesheet" />
</head>
<body onload="init()">
	<div class="header">
		<div class = "signNav">
		<div class="imgWrapper">
		<img src="/ymovie/img/logo.png" alt="Y-Movie" width="30%" height="100%" onclick="window.top.location.replace('/ymovie/initPage.jsp')"/>
		</div>
		    <div class="sign">
			<%
				storeSession sessionsDAO = new storeSession();
				if (sessionsDAO.getSession(session) != ""){
                    out.print("<input type=\"button\" id=\"loggedInUser\" disabled= \"disabled\" value=\"\"/>");
					out.print("<input class = \"signOut\" type=\"button\" value=\"SignOut\" onclick=\"window.top.location.replace('/ymovie//jaeik/signOut.jsp');\"/>");
				}
				else {
					out.print("<input class = \"signIn\" type=\"button\" value=\"Sign in\" onclick=\"window.top.location.replace('/ymovie/seungtae/signIn.jsp');\"/>");
					out.print("<input class = \"signUP\" type=\"button\" value=\"Sign up\" onclick=\"window.top.location.replace('/ymovie/seungtae/signUp.jsp');\"/>");
				}
			%>	    
		    </div>
		 </div>
		    <ul id="nav">
		    	<li><a href="/ymovie/seonhyeok/re_in.jsp" target="_top">영화 추천&nbsp;</a>
			    	<ul>
			    		<li><a href="/ymovie/seonhyeok/re_in.jsp" target="_top">통합</a></li>
			    		<li><a href="/ymovie/seonhyeok/kategorie.jsp" target="_top">장르/배우/감독</a></li>
			    		<li><a href="/ymovie/seonhyeok/genre_h.jsp" target="_top">카테고리</a></li>
			    	</ul>
		    	</li>
		    	<li><a href="/ymovie/jaeik/movieSearch.jsp" target="_top">&nbsp;영화 리뷰&nbsp;</a>
			    	<ul>
			    		<li><a href="/ymovie/jaeik/movieSearch.jsp" target="_top">영화 검색</a></li>
			    		<li><a href="/ymovie/seokwon/review_rank.jsp" target="_top">리뷰 랭킹</a></li>
			    	</ul>
		    	</li>
		    	<li><a href="/ymovie/seokwon/daily_rank.jsp" target="_top">&nbsp;박스오피스&nbsp;</a>
			    	<ul>
			    		<li><a href="/ymovie/seokwon/weekly_rank.jsp" target="_top">주간</a></li>
			    		<li><a href="/ymovie/seokwon/daily_rank.jsp" target="_top">일간</a></li>
			    		<li><a href="/ymovie/seokwon/star_rank.jsp" target="_top">별점</a></li>
			    	</ul>
		    	</li>
		    	<li><a href="/ymovie/seonhyeok/map1.jsp" target="_top">&nbsp;영화관 찾기&nbsp;</a>
			    	<ul>
			    		<li><a href="/ymovie/seonhyeok/map1.jsp" target="_top">내 주변</a></li>
			    		<li><a href="/ymovie/seonhyeok/map2.jsp" target="_top">지역별</a></li>
			    		<li><a href="/ymovie/seonhyeok/map3.jsp" target="_top">영화관별</a></li>
			    	</ul>
		    	</li>
		    	<li><a href="/ymovie/seungtae/myPage.jsp" target="_top">&nbsp;마이페이지</a>
			    	<ul>
			    		<li><a href="/ymovie/seungtae/editUser.jsp" target="_top">회원 정보 수정</a></li>
			    		<li><a href="/ymovie/seungtae/reviewList.jsp" target="_top">나의 리뷰</a></li>
			    		<li><a href="/ymovie/seonhyeok/interest_movie.jsp" target="_top">관심 영화 설정</a></li>
			    	</ul>
		    	</li>
		    </ul>
   		</div>
	<script type="text/javascript">
        function init() 
        {        
            <%if (sessionsDAO.getSession(session) != "")
            {%>
            	if (document.getElementById("loggedInUser") != null) {
            		document.getElementById("loggedInUser").value = "<%=sessionsDAO.getSession(session)%>" + "님";
				}                
            <%}%>
            document.getElementById("loggedInUser").style.width = document.getElementById("loggedInUser").value.length + 1 + 'ch';
        }
    </script>
</body>