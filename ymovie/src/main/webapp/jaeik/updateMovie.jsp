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
			apiDao.getAPIAboutActor();
		} catch (Exception e) {
			e.printStackTrace();
			%>alert("API load error...");<%
		}
		%>
		alert("Update Success!");
		location.href='AdminPage.jsp';
	}
	
</script>
<body onload="updateMovieRun()"></body>