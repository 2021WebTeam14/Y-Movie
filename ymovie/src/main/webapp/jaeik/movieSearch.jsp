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
<link href="movieSearch.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function search() {
		const name = document.getElementById("inputString").value
		document.getElementById("result").src = "./searchResult.jsp?movName=" + name;
	}
</script>
</head>
<body>
	<%@include file="../header.jsp" %>
    <div id="genre" style="padding: 10vh 10vw 10vh 10vw; background-color: #f2f2f2">
	<div class="movieSearch">
        <h1 id="title">영화 검색</h1>
        <div class="searchBar">
            <input type="text" id="searchbar" name="searchMovie">
            <button type="submit" id="searchButton">&#128269;</button>
        </div>

    </div>
   
	<iframe id="result" src="about:blank" style="width: 100%; height: 80vh; border: 2px solid black;"></iframe>
	</div>
    <iframe src="../footer.html" style="width: 100%; border: none"></iframe>
</body>
</html>
