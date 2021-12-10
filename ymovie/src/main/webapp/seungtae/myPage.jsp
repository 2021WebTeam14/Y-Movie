<%@page import="movie.movieDTO"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@page import="org.apache.el.util.ConcurrentCache"%>
<%@page import="member.memberDTO"%>
<%@page import="member.memberDAO"%>
<%@page import="movie.movieDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="review.*"%>
<%@page import="sessionServlet.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="defaultConn.getConn" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>My page</title>
		
		<link rel="stylesheet" type="text/css" href="myPage.css">
	</head>
	
	<body onload="start()">
		
		<iframe src="../header.jsp" style="width: 100%; border: none;"></iframe>
		<h1>내 정보</h1>
		<div class="container">
		
			<img id="userProfile" alt="avatar of this user" src="">
			<div class="userInfo">
				<label>아이디: </label>
				<p id="userID">This user's ID</p>
				<label>닉네임: </label>
				<p id="userNick">This user's Nickname</p>
			</div>
			
			<div class="userInfo">
				<label>선호 장르: </label>
				<p id="userGenre">This user's favGenre</p>
				<label>선호 감독: </label>
				<p id="userDirector">This user's favDirector</p>
				<label>선호 배우: </label>
				<p id="userActor">This user's favActor</p>
			</div>
			
			<div class="container1">
				<button onclick="window.top.location.href='editUser.jsp';" style="height: 50px; cursor: pointer;">회원정보 수정</button>
				<button onclick="window.top.location.href='seonhyeok/interest_movie.jsp';" style="height: 50px; cursor: pointer;">선호 설정 변경</button>
			</div>
			
		</div>
		
		<label style="display: inherit; margin-bottom: 5px;">최근 작성한 리뷰</label>
		<div class="lastReview">
				<label id="recentReviewTitle">리뷰 없음</label>
				<label id="recentReviewThumbs">&#128078;</label>
				<label id="recentReviewStars">★</label>
						
			<p id="recentReview" style="overflow-wrap: break-word;">
				Error!
			</p>
		</div>
		<div style="text-align: right; margin: auto; width: 75%;">
			<br><br>
			<button style="width: 100%;" onclick="document.location='reviewList.jsp';">내 리뷰 보기</button>
		</div>
		
		
		<iframe src="../footer.html" style="width: 100%; border: none"></iframe>
	</body>
	
	<script type="text/javascript">
		function start() 
		{
			var title = document.getElementById("recentReviewTitle");
			var thumb = document.getElementById("recentReviewThumbs");
			var stars = document.getElementById("recentReviewStars");
			const star = "★";
			var imgArray = new Array();
			var sources = ["img/triangle.png", "img/circle.png", "img/moon.jpg", "img/fire.jpg", "img/watch.jpg", "img/water.jpg"];
			for(let i = 0; i < 6; i++)
			{
				imgArray[i] = new Image();
				imgArray[i].src = sources[i];
			}
			
			<%
				storeSession sessionDAO = new storeSession();
				if (sessionDAO.getSession(session) == "")
				{
				 response.setContentType("text/html; charset=UTF-8");
				 PrintWriter outA = response.getWriter();
				 outA.println("<script>alert('로그인이 필요합니다.'); location.href='../initPage.jsp';</script>");
				 outA.flush();
				}
			%>
	         
	         <%
	         	memberDAO dao = new memberDAO();
	         	reviewDAO rev = new reviewDAO();
	         	movieDAO mov = new movieDAO();
	         	Connection con = null;
				getConn getCon = new getConn();
				con = getCon.getConnection();
	         	ArrayList<reviewDTO> reviews = rev.selectById(sessionDAO.getSession(session));
	         	memberDTO current = dao.selectMemberById(sessionDAO.getSession(session));
	         	
	         %>
	         
	         var id = document.getElementById("userID");
	         var nick = document.getElementById("userNick");
	         var profile = document.getElementById("userProfile");
	         var genre = document.getElementById("userGenre");
	         var director = document.getElementById("userDirector");
	         var actor = document.getElementById("userActor");
	         
	         id.innerText = "<%= current.getMem_id()%>";
	         nick.innerText = "<%= current.getMem_nickname()%>";	         
	         profile.src = imgArray[<%= current.getMem_icon() - 1%>].src;
	         genre.innerText = "<%= current.getMem_favGenre()%>";
	         director.innerText = "<%= current.getMem_favDirector()%>";
	         actor.innerText = "<%= current.getMem_favActor()%>";
	         
	         <%if(reviews.isEmpty())
	         	{%>
	         		document.getElementById("recentReview").innerText = "작성하신 리뷰가 없습니다.";
	         		document.getElementById("recentReview").style.textAlign = "center";
	         <%}
	         else
	           {%>   
	           		<%
	           			int size = reviews.size();
	           			ArrayList<movieDTO> name = mov.selectByCode(con, reviews.get(size - 1).getMov_code());
	           		%>
	           		var nameContent = <%=name.get(0).getMov_name()%>;
	           		
	           		document.getElementById("recentReviewTitle").innerText = nameContent;
	           		document.getElementById("recentReviewThumbs").innerHTML = <%=reviews.get(size - 1).getRev_thumbs()%> ? "&#128077;" : "&#128078;";
	           		document.getElementById("recentReviewStars").innerText = star.repeat(<%=reviews.get(size - 1).getRev_star()%>);
	           		document.getElementById("recentReview").innerText = <%=reviews.get(size - 1).getRev_context()%>;
	           		
	         <%}%>
		}
	</script>
</html>