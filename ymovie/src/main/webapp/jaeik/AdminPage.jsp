<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<style>	body{ margin: 10vh 15vw 10vh 15vw; }</style>
<script type="text/javascript">
	function updateMovieConfirm() {
		var c = confirm("영화리스트 업데이트를 진행합니다. \n10분 이상 소요될 수 있습니다.");
		if (c)
			location.href='updateMovie.jsp';
		else
			alert("취소되었습니다.");
	}
	function getPoster() {
		<%asdf test = new asdf();%>
		 document.getElementById("poster").src = "<%=test.getPoster("19158001")%>";
	}
	function erasePoster() {
		 document.getElementById("poster").src = "";
	}
	
</script>
<style>

.outer{
	margin: 10px; padding: 10px; border-radius: 10px;
}
.bordered{
	border: 2px solid black;
}
.flex{
	display: flex;
}
.centered{
	text-align: center;
}
input[type="button"]{
	background-color: white;
	border: 2px solid black;
	border-radius: 10px;
	width: 20%;
	margin: 5% 10%;
	font-size: 150%;
}
img{
	width: 192px; height: 280px; border: 1px solid black; margin: 0; padding: 0; white-space:pre
}
</style>
</head>
<body onload="getPoster()">
    <iframe src="../header.html" style="width: 100%; border: none; height: 10vw"></iframe>
    <div class="sTitle">
    <h1>관리자 전용 페이지</h1>
    <hr>
    </div>
    <div class="outer">
    	<div class="outer bordered flex">	
	    	<img id="poster" src="" alt="
로드해도 포스터가 
보이지 않는다면 
오류입니다.">
		    <input type="button" onclick="getPoster()" value="포스터 로드">
		    <input type="button" onclick="erasePoster()" value="포스터 지우기">
	    </div>
    	<div class="outer bordered centered">	    
	    	<input type="button" onclick="updateMovieConfirm()" value="영화리스트 업데이트">
	    </div>
    </div>
	    <iframe src="../footer.html" style="width: 100%; border: none;"></iframe>
