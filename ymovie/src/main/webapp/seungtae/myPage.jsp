<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<style>	body{ margin: 10vh 15vw 10vh 15vw; }</style>
		<meta charset="UTF-8">
		<title>My page</title>
		
		<link rel="stylesheet" type="text/css" href="css/myPage.css">
	</head>
	
	<body>
		
		<iframe id="head" src="../header.jsp" style="width: 100%; border: none;"></iframe>
		<h1>내 정보</h1>
		<div class="container">
		
			<img id="userProfile" alt="avatar of this user" src="">
			<div id="userInfo">
				<p id="userID">This user's ID</p>
				<p id="userNick">This user's Nickname</p>
			</div>
			<button onclick="window.top.location.href='editUser.jsp';" style="height: 50px; cursor: pointer;">회원정보 수정</button>
		</div>
		
		<div class="review">
			<label>최근 작성한 리뷰</label>
			<p id="recentReview" style="overflow-wrap: break-word;">
				Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
				Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
				when an unknown printer took a galley of type and scrambled it to make a type specimen book.
			</p>
			
		</div>
		<div style="text-align: right; margin: auto; width: 75%;">
			<button>리뷰 수정</button><br><br>
			<button style="width: 100%;" onclick="document.location='reviewList.jsp';">내 리뷰 보기</button>
		</div>
		
		
		<iframe src="../footer.html" style="width: 100%; border: none"></iframe>
	</body>
</html>