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

<style>	body{margin: 10vh 15vw 10vh 15vw;}</style>
<script type="text/javascript">
	function search() {
		const name = document.getElementById("inputString").value
		document.getElementById("result").src = "./searchResult.jsp?movName=" + name;
	}
</script>
</head>
<body>
    <iframe src="../header.jsp" style="width: 69vw; border: none; height: 15vw"></iframe>
	<div class="movieSearch">
        <h1 id="title">영화 검색</h1>
        <div class="searchBar">
            <input type="text" id="searchbar" name="searchMovie">
            <button type="submit" id="searchButton">&#128269;</button>
        </div>

    </div>
   
	<iframe id="result" src="about:blank" style="width: 100%; height: 80vh; border: 2px solid black;"></iframe>
    <iframe src="../footer.html" style="width: 69vw; border: none"></iframe>
</body>
</html>
