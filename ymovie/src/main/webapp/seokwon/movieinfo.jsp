<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="member.*" %>
<%@ page import="actor.*" %>
<%@ page import="director.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="defaultConn.getConn" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<link href="movieinfo.css" rel="stylesheet" />

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
	 	<%actorDAO dao1 = new actorDAO();%>
	 	<%directorDAO dao2 = new directorDAO();%>
	 	<%posterAPI posterAPI = new posterAPI();%>
	 	<%ArrayList<movieDTO> data = dao.selectByCode(movcode);%> 
	 	<%ArrayList<actorDTO> data1 = dao1.selectByCode(con, movcode);%>

       		document.getElementById("img").src = '<%=posterAPI.getPoster(movcode)%>';
       		document.getElementById("movie_name").innerText = '<%=data.get(0).getMov_name()%>';
       		document.getElementById("playdate").innerText = '<%=data.get(0).getMov_year()%>';
       		document.getElementById("director").innerText = '<%=dao2.selectByMovie(con, movcode).get(0).getDir_director()%>';
       		<%System.out.println(data1.size());
       		%>
       		<%for(int i=0; i<data1.size(); i++){%>
       		document.getElementById("actor<%=i%>").innerText = '<%=data1.get(i).getAct_actor()%>';
       		<%}%>
       		document.getElementById("genre").innerText = '<%=data.get(0).getMov_genre()%>';
       		document.getElementById("avg_star").innerText = '<%=data.get(0).getStarAvg()%>';
       		document.getElementById("writing_review").setAttribute('onClick', "location.href='writingreview.jsp?movcode=<%=movcode%>'");
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
		<li>개봉: <span id="playdate" class="txt_num"></span>년</li>
		<li>감독: <span id="director" class="txt_num"></span></li>
		<li>배우: <span id="actor0" class="txt_num"></span>, <span id="actor1" class="txt_num"></span>, <span id="actor2" class="txt_num"></span>, <span id="actor3" class="txt_num"></span>, <span id="actor4" class="txt_num"></span>, <span id="actor5" class="txt_num"></span>, <span id="actor6" class="txt_num"></span>, <span id="actor7" class="txt_num"></span>, <span id="actor8" class="txt_num"></span>, <span id="actor9" class="txt_num"></span></li>
		<li>장르: <span id="genre" class="txt_num"></span></li>
		<li>평균 별점: <span id="avg_star" class="txt_num"></span></li>
		</ul>
	</div>
</div>

<div><!-- 리뷰 페이징 부분 -->

</div>

<div class="button">
	<div class="effect"></div>
	<a id="writing_review" onclick="">리뷰 작성</a>
</div>
	
    <iframe src="../footer.html" style="width: 69vw; border: none"></iframe>
</body>
</html>