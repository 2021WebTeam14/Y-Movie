<%@page import="sessionServlet.storeSession"%>
<%@page import="member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in</title>
<link rel="stylesheet" type="text/css" href="../seungtae/signIn.css">
<script>
	function jbSubmit() {
		var pw1 = document.getElementById("userPW");
		var pw2 = document.getElementById("userPW2");
		if (pw1.value != pw2.value) {
			pw1.value = null;
			pw2.value = null;
			alert("Confirm Password!");
			return false;
		}
	}
</script>
</head>
<body>
	<%
	storeSession sessionDAO = new storeSession();
	sessionDAO.deleteSession(session);
	request.setCharacterEncoding("UTF-8");
	%>
	<iframe id="head" src="../header.jsp"
		style="width: 100%; border: none;"></iframe>
	<h1 style="text-align: center">비밀번호 재설정</h1>

	<form style="padding-top: 50px; padding-bottom: 50px;" method="POST"
		action="../jaeik/resetPwProcess.jsp" onsubmit="return jbSubmit()">
		<div class="container">
			<div class="inner1">
				<div class="inner2">
					<div class="loginbox">
						<label>아이디: </label>
						<%
						Object name = new Object();
						try {
							name = session.getAttribute("username");
						} catch (Exception e) {
							response.sendRedirect("../seungtae/signIn.jsp");
						}
						%>
						<input type="text" id="userID" placeholder="아이디" name="username"
							value="<%=name%>" readonly> <label>새로운 비밀번호: </label> <input
							type="password" id="userPW" placeholder="비밀번호" name="password"
							required> <label>새로운 비밀번호 확인: </label> <input
							type="password" id="userPW2" placeholder="비밀번호 확인"
							name="passwordAgain" required>
					</div>

					<div class="buttons">
						<div class="innerButtons">
							<button type="submit">next</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<iframe src="../footer.html" style="width: 100%; border: none"></iframe>
</body>
</html>