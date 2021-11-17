<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>

<script type="text/javascript">
	function updateMovieRun() {
		<%
		movieDAO movieDao = new movieDAO();
		apiDAO apiDao = new apiDAO();
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		try {
			dtos = apiDao.getAPIAboutMovie();
		} catch (Exception e) {
			%>alert("API load error...");<%
		}

		int size = dtos.size() / 1000;
		int last = dtos.size() % 1000;
		
		for(int j =0; j < size; j++){
			movieDao.insertMovie(dtos, j);
		}
		%>
		alert("<%=movieDao.insertMovieLast(dtos)%>");
		location.href='AdminPage.jsp';
	}
	
</script>
<body onload="updateMovieRun()"></body>