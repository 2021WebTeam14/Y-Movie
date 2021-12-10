<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="movie.*"%>
<%@ page import="api_DB.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Y-Movie</title>
<link href="./searchResult.css" rel="stylesheet" type="text/css">

<style>
body {
	margin: 10vh 15vw 10vh 15vw;
}
</style>
</head>
<body>
	
	<ol class="list_movieranking">
		<%String movName=request.getParameter("movName");%>
	    <%if(movName == null) response.sendRedirect("./movieSearch.jsp"); %>
		<%movieDAO dao = new movieDAO();%>
		<%posterAPI posterAPI = new posterAPI();%>
		<%request.setCharacterEncoding("UTF-8");%>
		<%ArrayList<movieDTO> data = dao.selectByName(movName);%>
		<%
		for (int i = 0; i < data.size(); i++) {
			%>
			<li>
				<div class="item_poster">
					<div class="thumb_item">
						<div class="poster_movie">
							<img id="img<%=i%>" src="<%=posterAPI.getPoster(data.get(i).getMov_code())%>" class="img_thumb" onclick="location.href='movieinfo.jsp?movcode=<%=data.get(i).getMov_code()%>">
						</div>
					</div>
					<div class="thumb_cont">
						<strong class="tit_item" id="Name<%=i%>"><%=data.get(i).getMov_name()%></strong> 
						<span class="txt_info"> 
							<span class="info_txt">개봉<span id="Year<%=i%>" class="txt_num"><%=data.get(i).getMov_year()%></span></span>
						</span>
					</div>
				</div>
			</li>
		<%}%>
	</ol>
</body>
</html>
