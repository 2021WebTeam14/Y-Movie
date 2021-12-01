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
	function checkDB() {
		<%movieDAO dao = new movieDAO();%>
		document.getElementById("DBchecker").innerText="<%=dao.isDBalive()%>";
	}

	function updateMovieConfirm() {
		var c = alert("영화리스트 업데이트를 진행합니다. \n10분 이상 소요될 수 있습니다. \n작업 취소는 불가능합니다.\n 1일 2회까지만 가능합니다.");
		location.href='updateMovie.jsp';
	}
	function getStart() {
		document.getElementById("poster<%=0%>");
		<%posterAPI posterAPI = new posterAPI();%>
		document.getElementById("poster").src = "<%=posterAPI.getPoster("20163069")%>";
	}
	function getPoster() {
		 document.getElementById("poster").src = "<%=posterAPI.getPoster("20163069")%>";
	}
	function erasePoster() {
		document.getElementById("poster").src = "";
	}
	function getRecommand() {
		<%ArrayList<CodeNameYearDTO> data = dao.getPersonalRecommands("asdf");%>
		 document.getElementById("poster").src = "<%=posterAPI.getPoster(data.get(0).getCode())%>";
		 document.getElementById("recomm").value = "<%=data.get(0).getName()%>";
	}
	function updateState() {
	    fetch("./test.jsp")
	    .then(
	    		function(res){
	        		return res.text();
	        	}
	    )
	    .then(
	    		function(res){
	    			var doc = new DOMParser().parseFromString(res, "text/xml");
	    			document.getElementById("state").innerHTML = doc.getElementById("data").innerHTML;
	        	}
	    )
	}
	setInterval(updateState, 500);
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
	align-content: center;
	align-items: center;
}
.right{
	text-align: right;
	align-content: right;
	align-items: right;
}

input[type="button"]{
	background-color: white;
	border: 2px solid black;
	border-radius: 10px;
	width: 20%;
	margin: 5% 10%;
}
img{
	width: 192px; height: 280px; border: 1px solid black; margin: 0; padding: 0; white-space:pre
}
li{
	list-style: none;
	padding-left: 0;
	text-align: left;
}
ul{
	text-align: left;
}
#DBchecker{
margin: 0 150px 0 150px;
}
</style>
</head>
<body onload="getStart()">
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
		    <input id="recomm" type="button" onclick="getRecommand()" value="추천 시스템 확인">
	    </div>
    	<div class="outer bordered centered flex">	    
	    	<input type="button" onclick="updateMovieConfirm()" value="영화 업데이트">
			<div id="state"></div>
	    </div>
    	<div class="outer bordered centered flex">
	    	<input type="button" onclick="checkDB()" value="DB연결 확인">
	    	<div id="DBchecker" class="right"> </div>
	    </div>
    </div>
	    <iframe src="../footer.html" style="width: 100%; border: none;"></iframe>
</body>
</html>