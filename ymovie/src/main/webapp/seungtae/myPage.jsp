<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>My page</title>
		
		<link rel="stylesheet" type="text/css" href="css/myPage.css">
	</head>
	
	<body>
		<iframe src="header.html" style="width: 100%; border: none;"></iframe>
		<div class="container">
			<img alt="avatar of this user" src="">
			<div id="userInfo">
				<p>This user's ID</p>
				<p>This user's Nickname</p>
			</div>
			<button onclick="window.top.location.href='editUser.jsp';" style="height: 50px; cursor: pointer;">회원정보 수정</button>
		</div>
		
		<div class="review">
			<label>최근 작성한 리뷰</label>
			<p>
				Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
				Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
				when an unknown printer took a galley of type and scrambled it to make a type specimen book.
			</p>
			
		</div>
		<div style="text-align: right; margin: auto; width: 75%;">
			<button>리뷰 수정</button><br><br>
			<button style="width: 100%;">내 리뷰 보기</button>
		</div>
		
		
		<iframe src="footer.html" style="width: 100%; border: none"></iframe>
	</body>
</html>