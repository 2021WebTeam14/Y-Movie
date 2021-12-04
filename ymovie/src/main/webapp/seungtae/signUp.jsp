<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Sign Up</title>
	<link rel="stylesheet" type="text/css" href="signUp.css">
	<script type="text/javascript">
		var profile = null;
		
		
		
		function checkForm() 
		{
			var userID = document.getElementById("account").value;
			var userName = document.getElementById("registerName").value;
			var userNickname = document.getElementById("userNick").value;
			var pw1 = document.getElementById("pwd").value;
			var pw2 = document.getElementById("pwd1").value;
			
			
			if (pw1 != pw2) 
			{
				alert("입력하신 비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			if (pw1.length < 8) 
			{
				alert("비밀번호는 8자리 이상 입력해주세요.");
				return false;
			}
			
			if (userID == "" || userID == null) 
			{
				alert("아이디를 입력해주세요.");
				return false;
			}
			
			if (userNickname == "" || userNickname == null) 
			{
				alert("닉네임을 입력해주세요.");
				return false;
			}
			
			if (userName == "" || userName == null) 
			{
				alert("이름을 입력해주세요.");
				return false;
			}
			
			if(profile == null)
			{
				alert("프로필 사진을 선택해주세요");
				return false;
			}
			
			
			return true;
		}
		
		function chg_img(index) {
			var list = document.getElementById("avatarList");
			var img;
			var img_list = list.getElementsByTagName("img");
			for(var i = 0, len = img_list.length; i < len; i++) 
			{
				 img = img_list[i];
	             img.className = "normal";
			}
               
			document.getElementById("avatar" + index).className = "highlighted";
			profile = document.getElementById("avatar" + index);
		}	
		
		function chg() 
		{			
			var el = document.getElementById("dos");
			el.textContent = "Processing...";			
		}
	</script>
	
	
</head>
<body>
	<iframe src="../header.jsp" style="width: 100%; border: none;"></iframe>
	<h1 style="text-align: center"> Sign up for Y-Movie </h1> 
	<form onsubmit="return checkForm()">
	<div>
		<div class="container">
			<div class="inner">
				<label>아이디: </label> 
				<input type="text" placeholder="아이디" name="username" id="account" required>
				<button type="button" class="duplicate" id="dos" onclick="chg()">아이디 중복확인</button>
				<label>비빌번호: </label> 
				<input type="password" placeholder="비밀번호" name="password" id="pwd" required>
				<label>비빌번호 확인: </label> 
				<input type="password" placeholder="비밀번호 확인" name="password_check" id="pwd1" required>
			</div>
			
			<div class="inner">				
				<label>Name: </label> 
				<input type="text" placeholder="이름" name="name" id="registerName" required>
				<label>Nickname: </label> 
				<input type="text" placeholder="닉네임" name="nickname" id="userNick" required>
				<button type="button" class="duplicate">닉네임 중복확인</button>
			</div>	
		</div>
		
		
			<p id="avatarID">Profile picture:</p>
				<ul id="avatarList" style="text-align: center;">
					<li>
						<img alt="avatar1" id="avatar1" class="normal" onclick="chg_img(1)" src="img/triangle.png">
					</li>
					<li>
						<img alt="avatar2" id="avatar2" class="normal" onclick="chg_img(2)" src="img/circle.png">
					</li>
					<li>
						<img alt="avatar3" id="avatar3" class="normal" onclick="chg_img(3)" src="img/moon.jpg">
					</li>
					<li>
						<img alt="avatar4" id="avatar4" class="normal" onclick="chg_img(4)" src="img/fire.jpg">
					</li>
					<li>
						<img alt="avatar5" id="avatar5" class="normal" onclick="chg_img(5)" src="img/watch.jpg">
					</li>
					<li>
						<img alt="avatar6" id="avatar6" class="normal" onclick="chg_img(6)" src="img/water.jpg">
					</li>
				</ul>
		
		<div id="join">
			<button type="submit">회원가입</button>
		</div>		
	</div>
	</form>
	
	<iframe src="../footer.html" style="width: 100%; border: none"></iframe>
</body>
</html>