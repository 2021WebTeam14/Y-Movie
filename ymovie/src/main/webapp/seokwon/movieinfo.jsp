<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="member.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="defaultConn.getConn" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<link href="../movieinfo.css" rel="stylesheet" />

<style>	body{margin: 10vh 15vw 10vh 15vw;}</style>
<script><%-- 영화 정보 받아오는 함수 입력 --%>
	function getAPIAboutMovie() {
		<%
		Connection con = null;
        getConn getCon = new getConn();
        con = getCon.getConnection();
		request.setCharacterEncoding("UTF-8");
        String movcode=request.getParameter("movcode");
		%>
		
	 	<%movieDAO dao = new movieDAO();%>
	 	<%posterAPI posterAPI = new posterAPI();%>
	 	<%ArrayList<movieDTO> data = dao.selectByCode(con, movcode);%> 

       		document.getElementById("img<%=i%>").src = '<%=posterAPI.getPoster(data.get(i).getCode())%>';
       		document.getElementById("movie_name<%=i%>").innerText = "<%=data.get(i).getMov_name()%>";
       		document.getElementById("playdate<%=i%>").innerText = "<%=data.get(i).getMov_year()%>";
       		document.getElementById("director<%=i%>").innerText = "<%=data.get(i).getMem_reviewCount()%>";
       		document.getElementById("actor<%=i%>").innerText = "<%=data.get(i).getMem_favGenre()%>";
       		document.getElementById("genre<%=i%>").innerText = "<%=data.get(i).getmov_genre()%>";
       		document.getElementById("avg_star<%=i%>").innerText = "<%=data.get(i).getStarAvg()%>";
   }

</script>
</head>
<body onload="getAPIAboutMovie()">
    <iframe src="../header.jsp" style="width: 69vw; border: none;"></iframe>
    <h2>영화 상세 정보</h2>
    <div class="movie-info">
	<div class="poster-box">
		<img class="poster-thumbnail" id="img" src="" width="197px" height="273"><!-- src="DB 이미지 주소" -->
	</div>
	
	<div class="info-box">
		<ul>
		<li>제목: <span id="movie_name" class="txt_num"></span></li>
		<li>개봉일: <span id="playdate" class="txt_num"></span></li>
		<li>감독: <span id="director" class="txt_num"></span></li>
		<li>배우: <span id="actor" class="txt_num"></span></li>
		<li>장르: <span id="genre" class="txt_num"></span></li>
		<li>평균 별점: <span id="avg_star" class="txt_num"></span></li> 
		</ul>
	</div>
</div>

<div><!-- 리뷰 페이징 부분 -->

</div>
	
    <iframe src="../footer.html" style="width: 69vw; border: none"></iframe>
</body>
</html>