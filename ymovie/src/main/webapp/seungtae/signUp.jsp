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
        var radio = document.getElementsByName("avatar");
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
			radio[index - 1].checked = true;
			profile = document.getElementById("avatar" + index);			
		}
		
    </script>
    
    
</head>
<body>
    <iframe src="../header.jsp" style="width: 100%; border: none;"></iframe>
    <h1 style="text-align: center"> Sign up for Y-Movie </h1> 
    <form onsubmit="return checkForm()" action="../jaeik/signUpProcess.jsp" method="post">
    <div>
        <div class="container">
            <div class="inner">
                <label>아이디: </label> 
                <input type="text" placeholder="아이디" name="username" id="account" required>
                <label>Nickname: </label> 
                <input type="text" placeholder="닉네임" name="nickname" id="userNick" required>
                <label>비빌번호: </label> 
                <input type="password" placeholder="비밀번호" name="password" id="pwd" required>
                <label>비빌번호 확인: </label> 
                <input type="password" placeholder="비밀번호 확인" name="password_check" id="pwd1" required>
            </div>
        </div>
        
        
            <p id="avatarID">Profile picture:</p>
                <ul id="avatarList" style="text-align: center;">
                    <li>
                        <img alt="avatar1" id="avatar1" class="normal" onclick="chg_img(1)" src="img/triangle.png">
                        <input type="radio" name="avatar" value="1"> 
                    </li>
                    <li>
                        <img alt="avatar2" id="avatar2" class="normal" onclick="chg_img(2)" src="img/circle.png">
                        <input type="radio" name="avatar" value="2">
                    </li>
                    <li>
                        <img alt="avatar3" id="avatar3" class="normal" onclick="chg_img(3)" src="img/moon.jpg">
                        <input type="radio" name="avatar" value="3">
                    </li>
                    <li>
                        <img alt="avatar4" id="avatar4" class="normal" onclick="chg_img(4)" src="img/fire.jpg">
                        <input type="radio" name="avatar" value="4">
                    </li>
                    <li>
                        <img alt="avatar5" id="avatar5" class="normal" onclick="chg_img(5)" src="img/watch.jpg">
                        <input type="radio" name="avatar" value="5">
                    </li>
                    <li>
                        <img alt="avatar6" id="avatar6" class="normal" onclick="chg_img(6)" src="img/water.jpg">
                        <input type="radio" name="avatar" value="6">
                    </li>
                </ul>
        
        <div id="join">
            <button type="submit">회원가입</button>
        </div>        
    </div>
    </form>
        <% 
            request.setCharacterEncoding("UTF-8");
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("1")) 
            {
                out.println("<br>");
                out.println("<font color='red' size='5'>아이디 혹은 닉네임이 중복입니다.</font>");
            }
        %>    
    
    <iframe src="../footer.html" style="width: 100%; border: none"></iframe>
</body>
</html>