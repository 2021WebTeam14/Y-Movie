<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공통순위</title>
<link href="css/commonranking.css" rel="stylesheet" />

<style>	body{margin: 10vh 15vw 10vh 15vw;}</style>
<script>
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
<body onload="getRecommand()">
    <iframe src="../header.html" style="width: 69vw; border: none;"></iframe>
    <h2>공통 순위</h2>
    
<div class="table">
  <div class="table-row">
    <div class="table-cell">
      <img id="img0" src="" class="img_thumb">
    </div>
    <div class="table-cell">
      <p>2</p>
    </div>
    <div class="table-cell">
      <p>3</p>
    </div>
    <div class="table-cell">
      <p>4</p>
    </div>
  </div>
  <div class="table-row">
    <div class="table-cell">
      <p>5</p>
    </div>
    <div class="table-cell">
      <p>6</p>
    </div>
    <div class="table-cell">
      <p>7</p>
    </div>
    <div class="table-cell">
      <p>8</p>
    </div>
  </div>
 <div class="table-row">
    <div class="table-cell">
      <p>9</p>
    </div>
    <div class="table-cell">
      <p>10</p>
    </div>
    <div class="table-cell">
      <p>11</p>
    </div>
    <div class="table-cell">
      <p>12</p>
    </div>
  </div>
</div>

	
    <iframe src="../footer.html" style="width: 69vw; border: none"></iframe>
</body>
</html>