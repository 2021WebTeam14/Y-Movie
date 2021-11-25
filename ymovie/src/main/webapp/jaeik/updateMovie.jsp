<%@page import="defaultConn.getConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<script type="text/javascript">
	function updateMovieRun() {
		<%		
		movieDAO movieDao = new movieDAO();
		apiDAO apiDao = new apiDAO();
		ArrayList<movieDTO> dtos = new ArrayList<movieDTO>();
		getConn getCon = new getConn();
		Connection con = getCon.getConnection();
		try {
			dtos = apiDao.getAPIAboutMovie(con);		
			%>
			alert("<%=movieDao.insertMovieLast(con, dtos)%>");
			<%
			int size = dtos.size() / 1000;
			for(int j =0; j < size; j++){
				movieDao.insertMovie(con, dtos, j);
			}
			apiDao.getAPIAboutActor(con);
		} catch (Exception e) {
			e.printStackTrace();
			%>alert("API load error...");<%
		} finally {
			con.close();
		}
		%>
		alert("Update End!");
		location.href='AdminPage.jsp';
	}
	
</script>
<body onload="updateMovieRun()"></body>