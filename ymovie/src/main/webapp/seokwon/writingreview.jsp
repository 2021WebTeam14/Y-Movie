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
<%@ page import="sessionServlet.*"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰 작성</title>
<link href="writingreview.css" rel="stylesheet" type="text/css">
<script>
function getAPIAboutMovie() {
	
	
	<%
	Connection con = null;
    getConn getCon = new getConn();
    con = getCon.getConnection();
	request.setCharacterEncoding("UTF-8");
    String movcode=request.getParameter("movcode");
	%>
	document.getElementById("code").value = "<%=movcode%>";
	
	<%
	storeSession sessionDAO = new storeSession();
    if (sessionDAO.getSession(session) == ""){
     response.setContentType("text/html; charset=UTF-8");
     %>
     alert('로그인이 필요합니다.');
     location.href="movieinfo.jsp?movcode="+'<%=movcode%>';
    <%}%>
	
 	<%movieDAO dao = new movieDAO();%>
 	<%actorDAO dao1 = new actorDAO();%>
 	<%directorDAO dao2 = new directorDAO();%>
 	<%posterAPI posterAPI = new posterAPI();%>
 	<%ArrayList<movieDTO> data = dao.selectByCode(movcode);%> 
 	<%ArrayList<actorDTO> data1 = dao1.selectByMovie(con, movcode);%>

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
   		<%storeSession sessionDAO = new storeSession();%>
   	    <%if (sessionDAO.getSession(session) != "")
   	    {%>
   	        if (document.getElementById("loggedInUser") != null) {
   	            document.getElementById("loggedInUser").value = "<%=sessionDAO.getSession(session)%>" + "님";
   	            }
   	    <%}%>
   	    document.getElementById("loggedInUser").style.width = document.getElementById("loggedInUser").value.length + 1 + 'ch';
}

    

</script>
</head>
<body onload="getAPIAboutMovie()">
<%@include file="../header.jsp" %>
    <div id="wr" style="padding: 10vh 10vw 10vh 10vw; background-color: #f2f2f2">
<h1 class="title">리뷰작성</h1>
<form action="insertReviewProcess.jsp" method="post">
<div class="movie-info">
  	<div class="info-star">
    <div class="poster-box">
        <img class="poster-thumbnail" id="img" src=""><!-- src="DB 이미지 주소" -->
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

        <div class="star-rating space-x-4 mx-auto">
            <input type="radio" id="5-stars" name="rating" value="5" checked/>
            <label for="5-stars" class="star pr-4">★</label>
            <input type="radio" id="4-stars" name="rating" value="4" />
            <label for="4-stars" class="star">★</label>
            <input type="radio" id="3-stars" name="rating" value="3" />
            <label for="3-stars" class="star">★</label>
            <input type="radio" id="2-stars" name="rating" value="2" />
            <label for="2-stars" class="star">★</label>
            <input type="radio" id="1-star" name="rating" value="1" />
            <label for="1-star" class="star">★</label>
        </div>
		<div class="thumbs">
		<input type="radio" name="thumbs1" id="thumbsUp" value="1" checked> &#128077;
                    <input type="radio" name="thumbs1" id="thumbsDown" value="0"> &#128078;
		</div>
    </div>
    <div class="writing-review">
     	
     	<input type="text" name="moviecode" style="display: none;" id="code">
        <input id="review" type="text" placeholder="리뷰를 작성해 주세요." name="reviewContents"/>
        <input id="submit" type="submit" value="저장"/>
      
    
</div>
</form>
</div>
	<iframe src="../footer.html" style="width: 100%; border: none"></iframe>
</body>
</html>