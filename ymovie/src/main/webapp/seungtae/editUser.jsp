<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Edit user info</title>
	</head>
	<body>
		<div class="container">
			<label>ID</label>
			<p>
				This user's ID
			</p>
			<label for="curr_password">현재 비빌번호: </label> 
			<input type="password" placeholder="현재 비밀번호" name="curr_password" required>
			
			<label for="new_password">새 비빌번호: </label> 
			<input type="password" placeholder="새 비밀번호" name="new_password" required>
			
			<label for="new_password1">새 비빌번호 확인: </label> 
			<input type="password" placeholder="새 비밀번호 확인" name="new_password1" required>
			
		</div>
	</body>
</html>