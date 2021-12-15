<%@page import="member.memberDTO"%>
<%@page import="member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sessionServlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Y-Movie</title>
<link href="review_rank.css" rel="stylesheet" type="text/css">

<style>	body{margin: 10vh 15vw 10vh 15vw;}</style>
<script> <%--리뷰어 랭킹  받아오는 함수 입력--%>
	 function getRank() {
		 <%memberDAO dao = new memberDAO();%>
		 <%posterAPI posterAPI = new posterAPI();%>
		 <%ArrayList<memberDTO> data = dao.memReviewRank();%> 
	        <%for(int i=0;i<data.size();i++){%>
	        document.getElementById("nick<%=i%>").innerText = "<%=data.get(i).getMem_nickname()%>";
	        document.getElementById("count<%=i%>").innerText = "<%=data.get(i).getMem_reviewCount()%>";
	        document.getElementById("genre<%=i%>").innerText = "<%=data.get(i).getMem_favGenre()%>";
	        document.getElementById("director<%=i%>").innerText = "<%=data.get(i).getMem_favDirector()%>";	         
	        <%}%>
	        <%storeSession sessionDAO = new storeSession();%>
	        <%if (sessionDAO.getSession(session) != "")
	        {%>
	            if (document.getElementById("loggedInUser") != null) {
	                document.getElementById("loggedInUser").value = "<%=sessionDAO.getSession(session)%>" + "님";
	    	        document.getElementById("loggedInUser").style.width = document.getElementById("loggedInUser").value.length + 1 + 'ch';
	                }
	        <%}%>
	    }
	 
	 </script>
</head>
<body onload="getRank()">
    <iframe src="../header.jsp" style="width: 69vw; border: none; height: 15vw"></iframe>
<div class="head">
    <h1 class="title">리뷰어 랭킹 TOP20</h1>
</div>
    <table>
    		<tr>
    			<td class="rank" width="50">순위</td>
    			<td class="nick" width="200">닉네임</td>  <%-- id = nickname --%>
    			<td class="count" width="150">리뷰 개수</td>  <%-- id = rev_cnt --%>
    			<td class="genre" width="150">선호 장르</td>  <%-- id = favGenre --%>
    			<td class="director" width="150">선호 감독</td>  <%-- id = favDirector --%>
    		</tr>
    		<tr>
    			<td><b>1</b></td>
    			<td><b id="nick0"></b></td>
    			<td><b id="count0"></b></td>
    			<td><b id="genre0"></b></td>
    			<td><b id="director0"></b></td>
    		</tr>
    		<tr>
    			<td><b>2</b></td>
    			<td><b id="nick1"></b></td>
    			<td><b id="count1"></b></td>
    			<td><b id="genre1"></b></td>
    			<td><b id="director1"></b></td>
    		</tr>
    		<tr>
    			<td><b>3</b></td>
    			<td><b id="nick2"></b></td>
    			<td><b id="count2"></b></td>
    			<td><b id="genre2"></b></td>
    			<td><b id="director2"></b></td>
    		</tr>
    		<tr>
    			<td><b>4</b></td>
    			<td><b id="nick3"></b></td>
    			<td><b id="count3"></b></td>
    			<td><b id="genre3"></b></td>
    			<td><b id="director3"></b></td>
    		</tr>
    		<tr>
    			<td><b>5</b></td>
    			<td><b id="nick4"></b></td>
    			<td><b id="count4"></b></td>
    			<td><b id="genre4"></b></td>
    			<td><b id="director4"></b></td>
    		</tr>
    		<tr>
    			<td><b>6</b></td>
    			<td><b id="nick5"></b></td>
    			<td><b id="count5"></b></td>
    			<td><b id="genre5"></b></td>
    			<td><b id="director5"></b></td>
    		</tr>
    		<tr>
    			<td><b>7</b></td>
    			<td><b id="nick6"></b></td>
    			<td><b id="count6"></b></td>
    			<td><b id="genre6"></b></td>
    			<td><b id="director6"></b></td>
    			
    		</tr>
    		<tr>
    			<td><b>8</b></td>
    			<td><b id="nick7"></b></td>
    			<td><b id="count7"></b></td>
    			<td><b id="genre7"></b></td>
    			<td><b id="director7"></b></td>
    		</tr>
    		<tr>
    			<td><b>9</b></td>
    			<td><b id="nick8"></b></td>
    			<td><b id="count8"></b></td>
    			<td><b id="genre8"></b></td>
    			<td><b id="director8"></b></td>
    		</tr>
    		<tr>
    			<td><b>10</b></td>
    			<td><b id="nick9"></b></td>
    			<td><b id="count9"></b></td>
    			<td><b id="genre9"></b></td>
    			<td><b id="director9"></b></td>
    		</tr>
    		
    </table>


	
    <iframe src="../footer.html" style="width: 69vw; border: none"></iframe>
</body>
</html>