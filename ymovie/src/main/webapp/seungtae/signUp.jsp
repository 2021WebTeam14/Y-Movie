<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Sign Up</title>
	<link rel="stylesheet" type="text/css" href="css/signUp.css">
</head>
<body>
	<iframe src="header.html" style="width: 100%; border: none;"></iframe>
	<h1 style="text-align: center"> Sign up for Y-Movie </h1> 
	<form>
	<div>
		<div class="container">
			<div class="inner">
				<label>아이디: </label> 
				<input type="text" placeholder="아이디" name="username" required>
				<label>비빌번호: </label> 
				<input type="password" placeholder="비밀번호" name="password" required>
				<label>비빌번호 확인: </label> 
				<input type="password" placeholder="비밀번호 확인" name="password_check" required>
			</div>
			
			<div class="inner">
				<label>Name: </label> 
				<input type="text" placeholder="이름" name="name" required>
				<label>Nickname: </label> 
				<input type="text" placeholder="닉네임" name="nickname" required>
					
			</div>	
		</div>
		
		<div id="avatar">
			<label id="avatarID">Profile picture:</label>
				<ul id="avatarList">
					<li>
						<img alt="avatar1" src="">
					</li>
					<li>
						<img alt="avatar2" src="">
					</li>
					<li>
						<img alt="avatar3" src="">
					</li>
					<li>
						<img alt="avatar4" src="">
					</li>
					<li>
						<img alt="avatar5" src="">
					</li>
					<li>
						<img alt="avatar6" src="">
					</li>
				</ul>
		</div>
		<div id="join">
			<button type="submit">회원가입</button>
		</div>		
	</div>
	</form>
	<iframe src="footer.html" style="width: 100%; border: none"></iframe>
</body>
</html>