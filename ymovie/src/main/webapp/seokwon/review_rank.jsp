<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Y-Movie</title>
<link href="review_rank.css" rel="stylesheet" type="text/css">

<style>	body{margin: 10vh 15vw 10vh 15vw;}</style>
<script> <%--리뷰어 랭킹  받아오는 함수 입력--%>
	 function getRecommand() {
		 <%movieDAO dao = new movieDAO();%>
		 <%posterAPI posterAPI = new posterAPI();%>
		 <%ArrayList<CodeNameYearDTO> data = dao.getPersonalRecommands("asdf");%> 
	        <%for(int i=0;i<16;i++){%>
	        document.getElementById("img<%=i%>").src = '<%=posterAPI.getPoster(data.get(i).getCode())%>';
	        document.getElementById("Name<%=i%>").innerText = "<%=data.get(i).getName()%>";
	        document.getElementById("Year<%=i%>").innerText = "<%=data.get(i).getYear()%>년";	       
	        <%}%>
	    }
	 </script>
</head>
<body>
    <iframe src="../header.html" style="width: 69vw; border: none;"></iframe>
<div class="head">
    <h2>리뷰어 랭킹 TOP20</h2>
</div>
    <table>
    		<tr>
    			<td class="rank" width="50">순위</th>
    			<td class="nick" width="200">닉네임</th>  <%-- id = nickname --%>
    			<td class="count" width="150">리뷰 개수</th>  <%-- id = rev_cnt --%>
    			<td class="genre" width="150">선호 장르</th>  <%-- id = favGenre --%>
    			<td class="director" width="150">선호 감독</th>  <%-- id = favDirector --%>
    		</tr>
    		<tr>
    			<td><b>1</b></td>
    			<td><b id="nick0"></b><td>
    			<td><b id="count0"></b></td>
    			<td><b id="genre0"></b></td>
    			<td><b id="director0"></b></td>
    		</tr>
    		<tr>
    			<td><b>2</b></td>
    			<td><b id="nick1"></b><td>
    			<td><b id="count1"></b></td>
    			<td><b id="genre1"></b></td>
    			<td><b id="director1"></b></td>
    		</tr>
    		<tr>
    			<td><b>3</b></td>
    			<td><b id="nick2"></b><td>
    			<td><b id="count2"></b></td>
    			<td><b id="genre2"></b></td>
    			<td><b id="director2"></b></td>
    		</tr>
    		<tr>
    			<td><b>4</b></td>
    			<td><b id="nick3"></b><td>
    			<td><b id="count3"></b></td>
    			<td><b id="genre3"></b></td>
    			<td><b id="director3"></b></td>
    		</tr>
    		<tr>
    			<td><b>5</b></td>
    			<td><b id="nick4"></b><td>
    			<td><b id="count4"></b></td>
    			<td><b id="genre4"></b></td>
    			<td><b id="director4"></b></td>
    		</tr>
    		<tr>
    			<td><b>6</b></td>
    			<td><b id="nick5"></b><td>
    			<td><b id="count5"></b></td>
    			<td><b id="genre5"></b></td>
    			<td><b id="director5"></b></td>
    		</tr>
    		<tr>
    			<td><b>7</b></td>
    			<td><b id="nick6"></b><td>
    			<td><b id="count6"></b></td>
    			<td><b id="genre6"></b></td>
    			<td><b id="director6"></b></td>
    			
    		</tr>
    		<tr>
    			<td><b>8</b></td>
    			<td><b id="nick7"></b><td>
    			<td><b id="count7"></b></td>
    			<td><b id="genre7"></b></td>
    			<td><b id="director7"></b></td>
    		</tr>
    		<tr>
    			<td><b>9</b></td>
    			<td><b id="nick8"></b><td>
    			<td><b id="count8"></b></td>
    			<td><b id="genre8"></b></td>
    			<td><b id="director8"></b></td>
    		</tr>
    		<tr>
    			<td><b>10</b></td>
    			<td><b id="nick9"></b><td>
    			<td><b id="count9"></b></td>
    			<td><b id="genre9"></b></td>
    			<td><b id="director9"></b></td>
    		</tr>
    		
    </table>


	
    <iframe src="../footer.html" style="width: 69vw; border: none"></iframe>
</body>
</html>