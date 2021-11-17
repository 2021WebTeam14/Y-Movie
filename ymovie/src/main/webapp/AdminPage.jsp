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
		var c = confirm("영화리스트 업데이트를 진행합니다. \n10분 이상 소요될 수 있습니다. \n*세부 진행사항은 콘솔을 참고하세요*");
		if (c) {
			location.href='updateMovie.jsp';			
		}
		else {
			alert("취소되었습니다.");
		}
	}
	
</script>
</head>
<body>
    <iframe src="header.html" style="width: 100%; border: none; height: 10vw"></iframe>
    <div class="sTitle">
    <h1>관리자 전용 페이지</h1>
    <hr>
    </div>
    
    <input type="button" onclick="updateMovieConfirm()" value="영화리스트 업데이트">
    <iframe src="footer.html" style="width: 100%; border: none"></iframe>
</body>