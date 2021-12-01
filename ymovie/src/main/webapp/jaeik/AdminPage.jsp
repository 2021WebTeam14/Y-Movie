<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="defaultConn.getConn" %>
<%@ page import="java.sql.Connection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<style>	body{ margin: 10vh 15vw 10vh 15vw; }</style>
<script type="text/javascript">
	function checkDB() {
		<%
		movieDAO dao = new movieDAO();
		Connection con = null;
		getConn getCon = new getConn();
		con = getCon.getConnection();
		ArrayList<Integer> counts = dao.getAmount(con);
		for(int i =0; i<5; i++){
			%>document.getElementById("count" + <%=i%>).innerText="<%=counts.get(i)%>";<%
		}
		%>
	}
	function checkDBCon() {
		document.getElementById("DBConchecker").innerText="<%=dao.isDBalive(con)%>";
	}

	function updateMovieConfirm() {
		var c = alert("영화리스트 업데이트를 진행합니다. \n10분 이상 소요될 수 있습니다. \n작업 취소는 불가능합니다.\n 1일 2회까지만 가능합니다.");
		location.href='updateMovie.jsp';
	}
	function getStart() {
		checkDB();
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
.autoMargin {
	margin: auto;
}
.noMargin {
	margin: 0;
}
.noPadding{
	padding: 0;
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
#DBConchecker{
margin: 0 150px 0 150px;
}
#DBchecker{
margin-bottom: 20px;
}
</style>
</head>
<body onload="getStart()">
    <iframe src="../header.jsp" style="width: 100%; border: none; height: 10vw"></iframe>
    <div class="sTitle">
    <h1>관리자 전용 페이지</h1>
    <hr>
    </div>
    <div class="outer">
    	<div class="outer bordered centered flex">
    		<div class="centered autoMargin">
		    	<div class="centered noMargin noPadding"><h2>DB 현황</h2></div>
		    	<div id="DBchecker" class="outer bordered centered">
		    		<div class="flex">
			    		<div>영화 정보 : &nbsp;</div>
			    		<div id="count0" class="right"></div>
		    		</div>
		    		<div class="flex">
			    		<div>배우 정보 : &nbsp;</div>
			    		<div id="count1" class="right"></div>
		    		</div>
		    		<div class="flex">
			    		<div>감독 정보 : &nbsp;</div>
			    		<div id="count2" class="right"></div>
		    		</div>
		    		<div class="flex">
			    		<div>전체 회원 : &nbsp;</div>
			    		<div id="count3" class="right"></div>
		    		</div>
		    		<div class="flex">
			    		<div>전체 리뷰 : &nbsp;</div>
			    		<div id="count4" class="right"></div>
		    		</div>
		    	</div>
	    	</div>
	    </div>
    	<div class="outer bordered flex">	
	    	<img id="poster" src="" alt="
로드해도 포스터가 
보이지 않는다면 
오류입니다.">
		    <input type="button" onclick="getPoster()" value="포스터 로드">
		    <input type="button" onclick="erasePoster()" value="포스터 지우기">
	    </div>
    	<div class="outer bordered centered flex">	    
	    	<input type="button" onclick="updateMovieConfirm()" value="영화 업데이트">
			<div id="state"></div>
	    </div>
    	<div class="outer bordered centered flex">
	    	<input type="button" onclick="checkDBCon()" value="DB연결 확인">
	    	<div id="DBConchecker" class="right"> </div>
	    </div>
    </div>
	    <iframe src="../footer.html" style="width: 100%; border: none;"></iframe>
</body>
</html>