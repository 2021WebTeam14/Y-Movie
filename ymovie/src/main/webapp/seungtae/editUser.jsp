<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Edit user info</title>
		<link rel="stylesheet" type="text/css" href="editUser.css">
		<script type="text/javascript">
			var profile = null;
			
			function chg_img(index) 
			{
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
			
			function resetImg() 
			{
				var list = document.getElementById("avatarList");
				var img;
				var img_list = list.getElementsByTagName("img");
				for(var i = 0, len = img_list.length; i < len; i++) 
				{
					 img = img_list[i];
		             img.className = "normal";
				}
				
				profile = null;
				
				document.getElementById('chg_profile').style.display='none';
			}
			
			function checkProfile() 
			{
				if (profile == null) 
				{
					return false;	
				}
				
				return true;
			}
			
			function checkPW() 
			{
				var pw1 = document.getElementById('new_pwd').value;
				var pw2 = document.getElementById('pwd_chk').value;				
				
				if(pw1.length < 8)
				{
					alert("비밀번호는 8자리 이상 입력해주세요.");
					return false;
				}
				
				if (pw1 != pw2) 
				{
					alert("입력하신 비밀번호가 일치하지 않습니다.");	
					return false;
				}
				
				return true;
			}
		</script>
	</head>
	<body>
		<iframe src="../header.jsp" style="width: 100%; border: none;"></iframe>
		<h1 style="text-align: center;">Change user info</h1>
		<div class="buttons">
			<button onclick="document.getElementById('chg_pwd').style.display='block'" class="btn">change password</button>
			<button onclick="document.getElementById('chg_nick').style.display='block'" class="btn">change nickname</button>
			<button onclick="document.getElementById('chg_profile').style.display='block'" class="btn">change profile</button>
		</div>
		
		
		<div id="chg_pwd" class="top_container">	
			<form class="contents">		
			<h2 style="text-align: center;">비밀번호 변경</h2>
			<div class="container">			
				<span onclick="document.getElementById('chg_pwd').style.display='none'" class="close" title="창 닫기">&times;</span>
					
					<div class="pwd_box">
						<label for="curr_pwd">현재 비밀번호: </label>
						<input type="password" placeholder="현재 비밀번호" name="curr_pwd" required>
						<label for="new_pwd">새 비밀번호: </label>
						<input type="password" placeholder="새 비밀번호" name="new_pwd" required>
						<label for="pwd_chk">새 비밀번호 확인: </label>
						<input type="password" placeholder="비밀번호 확인" name="pwd_chk" required>
					</div>
					
			</div>
			
			<div class="container_button" style="text-align: center;">
				<button type="submit">바꾸기</button>
				<button onclick="document.getElementById('chg_pwd').style.display='none'">취소</button> 
			</div>
			</form>
		</div>
		
		<div id="chg_nick" class="top_container">
			<form class="contents">		
			<h2 style="text-align: center;">닉네임 변경</h2>
			<div class="container">
				<span onclick="document.getElementById('chg_nick').style.display='none'" class="close" title="창 닫기">&times;</span>
					<label>현재 닉네임: </label>
					<p>current nickname </p>
					<label for="new_nick">새 닉네임: </label>
					<input type="text" placeholder="새 닉네임" name="new_nick" required>
			</div>
			
			<div class="container_button" style="text-align: center;">
				<button type="submit">바꾸기</button>
				<button onclick="document.getElementById('chg_nick').style.display='none'">취소</button> 
			</div>
			</form>
		</div>	
			
		<div id="chg_profile" class="top_container">	
			<form class="contents" onsubmit="return checkProfile()">		
			<h2 style="text-align: center;">프로필 사진 변경</h2>
			<div class="container">
				<span onclick="resetImg()" class="close" title="창 닫기">&times;</span>
					<label>현재 프로필 사진: </label>
					<img alt="current avatar" src="">
					<label>바꾸고 싶은 프로필 사진: </label>
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
			</div>			
			
			<div class="container_button" style="text-align: center;">
				<button type="submit">바꾸기</button>
				<button onclick="resetImg()">취소</button> 
			</div>
			</form>
		</div>
		<iframe src="../footer.html" style="width: 100%; border: none"></iframe>
	</body>
</html>