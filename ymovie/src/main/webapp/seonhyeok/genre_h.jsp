<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>genre</title>
<link href="css/genre_h.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function getgenre(index) {
		var genre = window.parent.document.getElementById("asdf");
		genre.contentWindow.getRecommand(index);
	}
</script>
</head>
<body>
	<div>
		<ul class="genre_list">
			<li><a class="drama" onclick="getgenre('drama')">드라마</a></li>
			<li><a class="war" onclick="getgenre('war')">전쟁</a></li>
			<li><a class="western" onclick="getgenre('western')">서부극(웨스턴)</a></li>
			<li><a class="comedy" onclick="getgenre('comedy')">코미디</a></li>
			<li><a class="horror" onclick="getgenre('horror')">공포(호러)</a></li>
			<li><a class="dacu" onclick="getgenre('dacu')">다큐멘터리</a></li>
			<li><a class="historical_drama" onclick="getgenre('historical_drama')">사극</a></li>
			<li><a class="action" onclick="getgenre('action')">액션</a></li>
			<li><a class="fantasy" onclick="getgenre('fantasy')">판타지</a></li>
			<li><a class="romance" onclick="getgenre('romance')">멜로/로맨스</a></li>
			<li><a class="ani" onclick="getgenre('ani')">애니메이션</a></li>
			<li><a class="adventure" onclick="getgenre('adventure')">어드벤처</a></li>
			<li><a class="crime" onclick="getgenre('crime')">범죄</a></li>
			<li><a class="sf" onclick="getgenre('sf')">SF</a></li>
			<li><a class="mistery" onclick="getgenre('mistery')">미스터리</a></li>
			<li><a class="family" onclick="getgenre('family')">가족</a></li>
			<li><a class="musical" onclick="getgenre('musical')">뮤지컬</a></li>
			<li><a class="performance" onclick="getgenre('performance')">공연</a></li>
			<li><a class="etc" onclick="getgenre('etc')">기타</a></li>
		</ul>

	</div>

<iframe src="genre.jsp" id="asdf">
	
</iframe>


</body>
</html>