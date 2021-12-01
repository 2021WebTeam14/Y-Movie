<%@page import="java.sql.Time"%>
<%@page import="defaultConn.getConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="director.*" %>
<%@ page import="actor.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<html>
<head>
<script type="text/javascript">
	function updateMovieRun() {
		<%
		session.removeAttribute("movieDown");
		session.removeAttribute("movieUP");
		session.removeAttribute("direcUP");
		session.removeAttribute("actorDown");
		session.removeAttribute("actorUP");
		session.setAttribute("movieDown", "대기");
		session.setAttribute("actorDown", "대기");
		session.setAttribute("movieUP", "대기");
		session.setAttribute("direcUP", "대기");
		session.setAttribute("actorUP", "대기");
		Pair result = new Pair();
		movieDAO movieDao = new movieDAO();
		apiDAO apiDao = new apiDAO();
		getConn getCon = new getConn();
		
		
		Connection con = getCon.getConnection();
		try {
			session.setAttribute("movieDown", "진행");
			result = apiDao.getAPIAboutMovie(con, session);
			session.setAttribute("movieDown", "성공");
			Thread.sleep(3000);
		} 
		catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("movieDown", "실패");
			%>alert("Movie API error...");<%
		}
		ArrayList<movieDTO> movieDto = result.getMovie();
		ArrayList<ArrayList<directorDTO>> directorDto = result.getDirector();
		ArrayList<ArrayList<actorDTO>> actors = new ArrayList<ArrayList<actorDTO>>();
		
		try {
			session.setAttribute("movieUP", "진행");
			if(movieDto != null){
				int size = movieDto.size() / 1000;
				for(int j =0; j < size; j++){
					movieDao.insertMovie(con, movieDto, j);
				}
				movieDao.insertMovieLast(con, movieDto);
			}
			session.setAttribute("movieUP", "성공");
			Thread.sleep(3000);
		} 
		catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("movieUP", "실패");
			%>alert("Movie DB error...");<%
		}
		try {
			session.setAttribute("direcUP", "진행");
			if(directorDto != null){
				directorDAO dircDAO = new directorDAO();
				for (int i = 0; i < directorDto.size(); i++) {
					System.out.printf("Director insertion ( %d / %d )\n", i, directorDto.size());		
					for (int j = 0; j < directorDto.get(i).size(); j++) {
						if (directorDto.get(i).get(j).getDir_director() != null) {
							dircDAO.insertDirector(con, directorDto.get(i).get(j));					
						}
					}		
				}	
				System.out.printf("Director insertion ( %d / %d )\n", directorDto.size(), directorDto.size());	
			}
			session.setAttribute("direcUP", "성공");
			Thread.sleep(3000);
		} 
		catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("direcUP", "실패");
			%>alert("Director DB error...");<%
		}
		try {
			session.setAttribute("actorDown", "진행");
			actors = apiDao.getAPIAboutActor(con);
			session.setAttribute("actorDown", "성공");
			Thread.sleep(3000);
		} 
		catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("actorDown", "실패");
			%>alert("Actor API error...");<%
		} 
		
		try {
			session.setAttribute("actorUP", "진행");
		    actorDAO AcDao = new actorDAO();
		    for(int j =0; j < actors.size()/100; j++){
		    	AcDao.insertActor(con, actors, j);
		    }
		    AcDao.insertActorLast(con, actors);
			session.setAttribute("actorUP", "성공");
			Thread.sleep(3000);
		} 
		catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("actorUP", "실패");
			%>alert("Actor DB error...");<%
		}
		finally {
			con.close();
		}
		%>
		alert("Update End");
		location.href='AdminPage.jsp';
	}
	
</script>
</head>
<body onload="updateMovieRun()"></body>
</html>