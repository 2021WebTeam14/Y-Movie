<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>genre</title>
<link href="genre_h.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function getgenre(index) {
		window.parent.document.getElementById("asdf").src = "genre.jsp?genre=" + index;		
	}
	
	function loginname() {
		<%storeSession sessionDAO = new storeSession();%>
	    <%if (sessionDAO.getSession(session) != "")
	    {%>
	        if (document.getElementById("loggedInUser") != null) {
	            document.getElementById("loggedInUser").value = "<%=sessionDAO.getSession(session)%>" + "님";
	            }
	    <%}%>
	    document.getElementById("loggedInUser").style.width = document.getElementById("loggedInUser").value.length + 1 + 'ch';
		
	}
</script>
</head>

<body onload="loginname()">
	<%@include file="../header.jsp" %>
    <div id="genre" style="padding: 10vh 10vw 209vh 10vw; background-color: #f2f2f2">
	<div>
		<ul class="genre_list">
			<li><a class="drama" onclick="getgenre('드라마')">드라마</a></li>
			<li><a class="war" onclick="getgenre('전쟁')">전쟁</a></li>
			<li><a class="western" onclick="getgenre('서부극(웨스턴)')">서부극(웨스턴)</a></li>
			<li><a class="comedy" onclick="getgenre('코미디')">코미디</a></li>
			<li><a class="horror" onclick="getgenre('공포(호러)')">공포(호러)</a></li>
			<li><a class="dacu" onclick="getgenre('다큐멘터리')">다큐멘터리</a></li>
			<li><a class="historical_drama" onclick="getgenre('사극')">사극</a></li>
			<li><a class="action" onclick="getgenre('액션')">액션</a></li>
			<li><a class="fantasy" onclick="getgenre('판타지')">판타지</a></li>
			<li><a class="romance" onclick="getgenre('멜로')">멜로/로맨스</a></li>
			<li><a class="ani" onclick="getgenre('애니메이션')">애니메이션</a></li>
			<li><a class="adventure" onclick="getgenre('어드벤처')">어드벤처</a></li>
			<li><a class="crime" onclick="getgenre('범죄')">범죄</a></li>
			<li><a class="sf" onclick="getgenre('SF')">SF</a></li>
			<li><a class="mistery" onclick="getgenre('미스터리')">미스터리</a></li>
			<li><a class="family" onclick="getgenre('가족')">가족</a></li>
			<li><a class="musical" onclick="getgenre('뮤지컬')">뮤지컬</a></li>
			<li><a class="performance" onclick="getgenre('공연')">공연</a></li>
			<li><a class="etc" onclick="getgenre('기타')">기타</a></li>
		</ul>

	</div>

	<iframe src="genre.jsp?genre=드라마" width="1800px" height="1800px" style="border: none; float:left; margin-left:-190px" id="asdf"></iframe>

</div>
<iframe src="../footer.html" style="width: 100%; border: none"></iframe>

</body>
</html>