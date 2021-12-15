/ymovie<%@page import="director.directorDTO"%>
<%@page import="director.directorDAO"%>
<%@page import="actor.actorDAO"%>
<%@page
	import="org.apache.tomcat.jdbc.naming.GenericNamingResourcesFactory"%>
<%@page import="sessionServlet.storeSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.*"%>
<%@ page import="actor.*"%>
<%@ page import="api_DB.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="defaultConn.getConn"%>
<%@ page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<title>Y-Movie</title>
<link href="interest_movie.css" rel="stylesheet" type="text/css">

<script>
	 function getRecommand() {
		 
		 <%storeSession sessionDAO = new storeSession();
		 if (sessionDAO.getSession(session) == "") {
		 	response.setContentType("text/html; charset=UTF-8");
		 	PrintWriter outA = response.getWriter();
		 	outA.println("<script>alert('로그인이 필요합니다.'); location.href='../initPage.jsp';</script>");
		 	outA.flush();
		 }%>
		    <%if (sessionDAO.getSession(session) != "")
		    {%>
		        if (document.getElementById("loggedInUser") != null) {
		            document.getElementById("loggedInUser").value = "<%=sessionDAO.getSession(session)%>" + "님";
		            }
		    <%}%>
		    document.getElementById("loggedInUser").style.width = document.getElementById("loggedInUser").value.length + 1 + 'ch';

		 
		<%movieDAO dao = new movieDAO();%>
		<%actorDAO Adao = new actorDAO();%>
		<%directorDAO Ddao = new directorDAO();%>
		<%posterAPI posterAPI = new posterAPI();
Connection con = null;
getConn getCon = new getConn();
con = getCon.getConnection();
request.setCharacterEncoding("EUC-KR");%>
        <%ArrayList<movieDTO> data0 = dao.selectByGenre(con, "드라마");%> 
        <%ArrayList<actorDTO> tmpActor = Adao.selectByMovie(con, data0.get(0).getMov_code());%>
        <%ArrayList<directorDTO> tmpDirec = Ddao.selectByMovie(con, data0.get(0).getMov_code());%>
        document.getElementById("img0").src = '<%=posterAPI.getPoster(data0.get(0).getMov_code())%>';
        document.getElementById("Name0").innerText = "<%=data0.get(0).getMov_name()%>";
        document.getElementById("Year0").innerText = "<%=data0.get(0).getMov_year()%>년";
        document.getElementById("director0").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
															out.write(tmpDirec.get(i).getDir_director() + ", ");
														if (tmpDirec.size() != 0)
															out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";	
        document.getElementById("actor0").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
															out.write(tmpActor.get(i).getAct_actor() + ", ");
														if (tmpActor.size() != 0)
															out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data1 = dao.selectByGenre(con, "전쟁");%> 
        <%tmpActor = Adao.selectByMovie(con, data1.get(1).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data1.get(1).getMov_code());%>
        document.getElementById("img1").src = '<%=posterAPI.getPoster(data1.get(1).getMov_code())%>';
        document.getElementById("Name1").innerText = "<%=data1.get(1).getMov_name()%>";
        document.getElementById("Year1").innerText = "<%=data1.get(1).getMov_year()%>년";	
        document.getElementById("director1").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
															out.write(tmpDirec.get(i).getDir_director() + ", ");
														if (tmpDirec.size() != 0)
															out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";		
        document.getElementById("actor1").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
															out.write(tmpActor.get(i).getAct_actor() + ", ");
														if (tmpActor.size() != 0)
															out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data2 = dao.selectByGenre(con, "서부극");%> 
        <%tmpActor = Adao.selectByMovie(con, data2.get(2).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data2.get(2).getMov_code());%>
        document.getElementById("img2").src = '<%=posterAPI.getPoster(data2.get(2).getMov_code())%>';
        document.getElementById("Name2").innerText = "<%=data2.get(2).getMov_name()%>";
        document.getElementById("Year2").innerText = "<%=data2.get(2).getMov_year()%>년";
        document.getElementById("director2").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";	
        document.getElementById("actor2").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";	
        
        <%ArrayList<movieDTO> data3 = dao.selectByGenre(con, "코미디");%> 
        <%tmpActor = Adao.selectByMovie(con, data3.get(3).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data3.get(3).getMov_code());%>
        document.getElementById("img3").src = '<%=posterAPI.getPoster(data3.get(3).getMov_code())%>';
        document.getElementById("Name3").innerText = "<%=data3.get(3).getMov_name()%>";
        document.getElementById("Year3").innerText = "<%=data3.get(3).getMov_year()%>년";
        document.getElementById("director3").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";		
        document.getElementById("actor3").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data4 = dao.selectByGenre(con, "공포(호러)");%> 
        <%tmpActor = Adao.selectByMovie(con, data4.get(4).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data4.get(4).getMov_code());%>
        document.getElementById("img4").src = '<%=posterAPI.getPoster(data4.get(4).getMov_code())%>';
        document.getElementById("Name4").innerText = "<%=data4.get(4).getMov_name()%>";
        document.getElementById("Year4").innerText = "<%=data4.get(4).getMov_year()%>년";
        document.getElementById("director4").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";	
        document.getElementById("actor4").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data5 = dao.selectByGenre(con, "다큐멘터리");%> 
        <%tmpActor = Adao.selectByMovie(con, data5.get(5).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data5.get(5).getMov_code());%>
        document.getElementById("img5").src = '<%=posterAPI.getPoster(data5.get(5).getMov_code())%>';
        document.getElementById("Name5").innerText = "<%=data5.get(5).getMov_name()%>";
        document.getElementById("Year5").innerText = "<%=data5.get(5).getMov_year()%>년";
        document.getElementById("director5").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";		
        document.getElementById("actor5").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data6 = dao.selectByGenre(con, "사극");%> 
        <%tmpActor = Adao.selectByMovie(con, data6.get(6).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data6.get(6).getMov_code());%>
        document.getElementById("img6").src = '<%=posterAPI.getPoster(data6.get(6).getMov_code())%>';
        document.getElementById("Name6").innerText = "<%=data6.get(6).getMov_name()%>";
        document.getElementById("Year6").innerText = "<%=data6.get(6).getMov_year()%>년";
        document.getElementById("director6").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";		
        document.getElementById("actor6").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data7 = dao.selectByGenre(con, "액션");%> 
        <%tmpActor = Adao.selectByMovie(con, data7.get(7).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data7.get(7).getMov_code());%>
        document.getElementById("img7").src = '<%=posterAPI.getPoster(data7.get(7).getMov_code())%>';
        document.getElementById("Name7").innerText = "<%=data7.get(7).getMov_name()%>";
        document.getElementById("Year7").innerText = "<%=data7.get(7).getMov_year()%>년";
        document.getElementById("director7").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";		
        document.getElementById("actor7").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";

        <%ArrayList<movieDTO> data8 = dao.selectByGenre(con, "판타지");%> 
        <%tmpActor = Adao.selectByMovie(con, data8.get(8).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data8.get(8).getMov_code());%>
        document.getElementById("img8").src = '<%=posterAPI.getPoster(data8.get(8).getMov_code())%>';
        document.getElementById("Name8").innerText = "<%=data8.get(8).getMov_name()%>";
        document.getElementById("Year8").innerText = "<%=data8.get(8).getMov_year()%>년";
        document.getElementById("director8").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";		
        document.getElementById("actor8").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data9 = dao.selectByGenre(con, "멜로/로맨스");%> 
        <%tmpActor = Adao.selectByMovie(con, data9.get(9).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data9.get(9).getMov_code());%>
        document.getElementById("img9").src = '<%=posterAPI.getPoster(data9.get(9).getMov_code())%>';
        document.getElementById("Name9").innerText = "<%=data9.get(9).getMov_name()%>";
        document.getElementById("Year9").innerText = "<%=data9.get(9).getMov_year()%>년";
        document.getElementById("director9").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";		
        document.getElementById("actor9").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data10 = dao.selectByGenre(con, "애니메이션");%> 
        <%tmpActor = Adao.selectByMovie(con, data10.get(10).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data10.get(10).getMov_code());%>
        document.getElementById("img10").src = '<%=posterAPI.getPoster(data10.get(10).getMov_code())%>';
        document.getElementById("Name10").innerText = "<%=data10.get(10).getMov_name()%>";
        document.getElementById("Year10").innerText = "<%=data10.get(10).getMov_year()%>년";
        document.getElementById("director10").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";	
        document.getElementById("actor10").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data11 = dao.selectByGenre(con, "어드벤처");%> 
        <%tmpActor = Adao.selectByMovie(con, data11.get(11).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data11.get(11).getMov_code());%>
        document.getElementById("img11").src = '<%=posterAPI.getPoster(data11.get(11).getMov_code())%>';
        document.getElementById("Name11").innerText = "<%=data11.get(11).getMov_name()%>";
        document.getElementById("Year11").innerText = "<%=data11.get(11).getMov_year()%>년";
        document.getElementById("director11").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";	
        document.getElementById("actor11").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data12 = dao.selectByGenre(con, "범죄");%> 
        <%tmpActor = Adao.selectByMovie(con, data12.get(12).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data12.get(12).getMov_code());%>
        document.getElementById("img12").src = '<%=posterAPI.getPoster(data12.get(12).getMov_code())%>';
        document.getElementById("Name12").innerText = "<%=data12.get(12).getMov_name()%>";
        document.getElementById("Year12").innerText = "<%=data12.get(12).getMov_year()%>년";
        document.getElementById("director12").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";	
        document.getElementById("actor12").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data13 = dao.selectByGenre(con, "SF");%> 
        <%tmpActor = Adao.selectByMovie(con, data13.get(13).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data13.get(13).getMov_code());%>
        document.getElementById("img13").src = '<%=posterAPI.getPoster(data13.get(13).getMov_code())%>';
        document.getElementById("Name13").innerText = "<%=data13.get(13).getMov_name()%>";
        document.getElementById("Year13").innerText = "<%=data13.get(13).getMov_year()%>년";
        document.getElementById("director13").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";		
        document.getElementById("actor13").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data14 = dao.selectByGenre(con, "미스터리");%> 
        <%tmpActor = Adao.selectByMovie(con, data14.get(14).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data14.get(14).getMov_code());%>
        document.getElementById("img14").src = '<%=posterAPI.getPoster(data14.get(14).getMov_code())%>';
        document.getElementById("Name14").innerText = "<%=data14.get(14).getMov_name()%>";
        document.getElementById("Year14").innerText = "<%=data14.get(14).getMov_year()%>년";
        document.getElementById("director14").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";	
        document.getElementById("actor14").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data15 = dao.selectByGenre(con, "가족");%> 
        <%tmpActor = Adao.selectByMovie(con, data15.get(15).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data15.get(15).getMov_code());%>
        document.getElementById("img15").src = '<%=posterAPI.getPoster(data15.get(15).getMov_code())%>';
        document.getElementById("Name15").innerText = "<%=data15.get(15).getMov_name()%>";
        document.getElementById("Year15").innerText = "<%=data15.get(15).getMov_year()%>년";
        document.getElementById("director15").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";	
        document.getElementById("actor15").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data16 = dao.selectByGenre(con, "뮤지컬");%> 
        <%tmpActor = Adao.selectByMovie(con, data16.get(0).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data16.get(0).getMov_code());%>
        document.getElementById("img16").src = '<%=posterAPI.getPoster(data16.get(0).getMov_code())%>';
        document.getElementById("Name16").innerText = "<%=data16.get(0).getMov_name()%>";
        document.getElementById("Year16").innerText = "<%=data16.get(0).getMov_year()%>년";
        document.getElementById("director16").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";	
        document.getElementById("actor16").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";
        
        <%ArrayList<movieDTO> data17 = dao.selectByGenre(con, "공연");%> 
        <%tmpActor = Adao.selectByMovie(con, data17.get(0).getMov_code());%>
        <%tmpDirec = Ddao.selectByMovie(con, data17.get(0).getMov_code());%>
        document.getElementById("img17").src = '<%=posterAPI.getPoster(data17.get(0).getMov_code())%>';
        document.getElementById("Name17").innerText = "<%=data17.get(0).getMov_name()%>";
        document.getElementById("Year17").innerText = "<%=data17.get(0).getMov_year()%>년";
        document.getElementById("director17").value = "<%for (int i = 0; i < tmpDirec.size() - 1; i++)
	out.write(tmpDirec.get(i).getDir_director() + ", ");
if (tmpDirec.size() != 0)
	out.write(tmpDirec.get(tmpDirec.size() - 1).getDir_director());%>";	
        document.getElementById("actor17").value = "<%for (int i = 0; i < tmpActor.size() - 1; i++)
	out.write(tmpActor.get(i).getAct_actor() + ", ");
if (tmpActor.size() != 0)
	out.write(tmpActor.get(tmpActor.size() - 1).getAct_actor());%>";

	}
	function getChecked(index) {
		if (document.getElementById("checked" + index).value != "1") {
			document.getElementById("checked" + index).value = "1";
		} else {
			document.getElementById("checked" + index).value = "";
		}
	}
</script>
</head>
<body onload="getRecommand()">
	<%@include file="../header.jsp" %>
    <div id="inter" style="padding: 10vh 10vw 12vh 10vw; background-color: #f2f2f2">

	<div class="head_section">
		<h1 class=tit_section>관심 영화 설정</h1>
	</div>
	<form action="../jaeik/interMovUpProcess.jsp" method="post">
		<div class="box_boxoffice">
			<ol class="list_movieranking">
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked0" name="checked0" value="" />
								<input type="hidden" id="actor0" name="actor0" value="" /> <input
									type="hidden" id="director0" name="director0" value="" /> <input
									type="hidden" id="genre0" name="genre0" value="드라마" /> <input
									type="checkbox" class="checkbox" id="check0"
									onchange="getChecked(0)" /> <label for="check0"><img
									id="img0" src="" class="img_thumb"></label>
							</div>

						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name0"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year0" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>

				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked1" name="checked1" value="" />
								<input type="hidden" id="actor1" name="actor1" value="" /> <input
									type="hidden" id="director1" name="director1" value="" /> <input
									type="hidden" id="genre1" name="genre1" value="전쟁" /> <input
									type="checkbox" class="checkbox" id="check1"
									onchange="getChecked(1)" /> <label for="check1"><img
									id="img1" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name1"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year1" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked2" name="checked2" value="" />
								<input type="hidden" id="actor2" name="actor2" value="" /> <input
									type="hidden" id="director2" name="director2" value="" /> <input
									type="hidden" id="genre2" name="genre2" value="서부극" /> <input
									type="checkbox" class="checkbox" id="check2"
									onchange="getChecked(2)" /> <label for="check2"><img
									id="img2" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name2"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year2" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked3" name="checked3" value="" />
								<input type="hidden" id="actor3" name="actor3" value="" /> <input
									type="hidden" id="director3" name="director3" value="" /> <input
									type="hidden" id="genre3" name="genre3" value="공포" /> <input
									type="checkbox" class="checkbox" id="check3"
									onchange="getChecked(3)" /> <label for="check3"> <img
									id="img3" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name3"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year3" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked4" name="checked4" value="" />
								<input type="hidden" id="actor4" name="actor4" value="" /> <input
									type="hidden" id="director4" name="director4" value="" /> <input
									type="hidden" id="genre4" name="genre4" value="다큐멘터리" /> <input
									type="checkbox" class="checkbox" id="check4"
									onchange="getChecked(4)" /> <label for="check4"> <img
									id="img4" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name4"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year4" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked5" name="checked5" value="" />
								<input type="hidden" id="actor5" name="actor5" value="" /> <input
									type="hidden" id="director5" name="director5" value="" /> <input
									type="hidden" id="genre5" name="genre5" value="코미디" /> <input
									type="checkbox" class="checkbox" id="check5"
									onchange="getChecked(5)" /> <label for="check5"><img
									id="img5" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name5"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year5" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked6" name="checked6" value="" />
								<input type="hidden" id="actor6" name="actor6" value="" /> <input
									type="hidden" id="director6" name="director6" value="" /> <input
									type="hidden" id="genre6" name="genre6" value="사극" /> <input
									type="checkbox" class="checkbox" id="check6"
									onchange="getChecked(6)" /> <label for="check6"><img
									id="img6" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name6"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year6" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked7" name="checked7" value="" />
								<input type="hidden" id="actor7" name="actor7" value="" /> <input
									type="hidden" id="director7" name="director7" value="" /> <input
									type="hidden" id="genre7" name="genre7" value="액션" /> <input
									type="checkbox" class="checkbox" id="check7"
									onchange="getChecked(7)" /> <label for="check7"> <img
									id="img7" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name7"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year7" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked8" name="checked8" value="" />
								<input type="hidden" id="actor8" name="actor8" value="" /> <input
									type="hidden" id="director8" name="director8" value="" /> <input
									type="hidden" id="genre8" name="genre8" value="판타지" /> <input
									type="checkbox" class="checkbox" id="check8"
									onchange="getChecked(8)" /> <label for="check8"><img
									id="img8" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name8"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year8" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked9" name="checked9" value="" />
								<input type="hidden" id="actor9" name="actor9" value="" /> <input
									type="hidden" id="director9" name="director9" value="" /> <input
									type="hidden" id="genre9" name="genre9" value="멜로" /> <input
									type="checkbox" class="checkbox" id="check9"
									onchange="getChecked(9)" /> <label for="check9"><img
									id="img9" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name9"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year9" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked10" name="checked10" value="" />
								<input type="hidden" id="actor10" name="actor10" value="" /> <input
									type="hidden" id="director10" name="director10" value="" /> <input
									type="hidden" id="genre10" name="genre10" value="애니메이션" /> <input
									type="checkbox" class="checkbox" id="check10"
									onchange="getChecked(10)" /> <label for="check10"> <img
									id="img10" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name10"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year10" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked11" name="checked11" value="" />
								<input type="hidden" id="actor11" name="actor11" value="" /> <input
									type="hidden" id="director11" name="director11" value="" /> <input
									type="hidden" id="genre11" name="genre11" value="어드벤쳐" /> <input
									type="checkbox" class="checkbox" id="check11"
									onchange="getChecked(11)" /> <label for="check11"> <img
									id="img11" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name11"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year11" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked12" name="checked12" value="" />
								<input type="hidden" id="actor12" name="actor12" value="" /> <input
									type="hidden" id="director12" name="director12" value="" /> <input
									type="hidden" id="genre12" name="genre12" value="범죄" /> <input
									type="checkbox" class="checkbox" id="check12"
									onchange="getChecked(12)" /> <label for="check12"><img
									id="img12" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name12"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year12" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked13" name="checked13" value="" />
								<input type="hidden" id="actor13" name="actor13" value="" /> <input
									type="hidden" id="director13" name="director13" value="" /> <input
									type="hidden" id="genre13" name="genre13" value="SF" /> <input
									type="checkbox" class="checkbox" id="check13"
									onchange="getChecked(13)" /> <label for="check13"><img
									id="img13" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name13"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year13" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked14" name="checked14" value="" />
								<input type="hidden" id="actor14" name="actor14" value="" /> <input
									type="hidden" id="director14" name="director14" value="" /> <input
									type="hidden" id="genre14" name="genre14" value="미스터리" /> <input
									type="checkbox" class="checkbox" id="check14"
									onchange="getChecked(14)" /> <label for="check14"><img
									id="img14" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name14"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year14" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked15" name="checked15" value="" />
								<input type="hidden" id="actor15" name="actor15" value="" /> <input
									type="hidden" id="director15" name="director15" value="" /> <input
									type="hidden" id="genre15" name="genre15" value="가족" /> <input
									type="checkbox" class="checkbox" id="check15"
									onchange="getChecked(15)" /> <label for="check15"> <img
									id="img15" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name15"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year15" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked16" name="checked16" value="" />
								<input type="hidden" id="actor16" name="actor16" value="" /> <input
									type="hidden" id="director16" name="director16" value="" /> <input
									type="hidden" id="genre16" name="genre16" value="뮤지컬" /> <input
									type="checkbox" class="checkbox" id="check16"
									onchange="getChecked(16)" /> <label for="check16"> <img
									id="img16" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name16"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year16" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
				<li>
					<div class="item_poster">
						<div class="thumb_item">
							<div class="poster_movie">
								<input type="hidden" id="checked17" name="checked17" value="" />
								<input type="hidden" id="actor17" name="actor17" value="" /> <input
									type="hidden" id="director17" name="director17" value="" /> <input
									type="hidden" id="genre17" name="genre17" value="공연" /> <input
									type="checkbox" class="checkbox" id="check17"
									onchange="getChecked(17)" /> <label for="check17"> <img
									id="img17" src="" class="img_thumb"></label>

							</div>
						</div>
						<div class="thumb_cont">
							<strong class="tit_item" id="Name17"></strong> <span
								class="txt_info"> <span class="info_txt">개봉<span
									id="Year17" class="txt_num"></span></span>
							</span>
						</div>
					</div>
				</li>
			</ol>
			<button type="submit" class="submit">관심 영화 설정</button>
		</div>
	</form>
	</div>
	    <iframe src="../footer.html" style="width: 100%; border: none;"></iframe>
</body>
</html>