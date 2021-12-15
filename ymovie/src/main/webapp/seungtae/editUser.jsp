<%@page import="movie.movieDTO"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@page import="org.apache.el.util.ConcurrentCache"%>
<%@page import="member.memberDTO"%>
<%@page import="member.memberDAO"%>
<%@page import="movie.movieDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="review.*"%>
<%@page import="sessionServlet.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="defaultConn.getConn" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Edit user info</title>
		<link rel="stylesheet" type="text/css" href="editUser.css">
		
	</head>
	<body onload="init()">
		<%@include file="../header.jsp" %>
   		<div id="lst" style="padding: 10vh 10vw 10vh 10vw; background-color: #f2f2f2">	
		<h1>Change user info</h1>
		<div class="buttons">
			<button onclick="document.getElementById('chg_pwd').style.display='block'" class="btn">비밀번호 변경</button>
			<button onclick="document.getElementById('chg_nick').style.display='block'" class="btn">닉네임 변경</button>
			<button onclick="document.getElementById('chg_profile').style.display='block'" class="btn">프로필 사진 변경</button>
		</div>
		
		
		<div id="chg_pwd" class="top_container">	
			<form class="contents" onsubmit="return checkPW()" method="post" action="editPwProcess.jsp">		
			<h2>비밀번호 변경</h2>
			<div class="container">			
				<span onclick="document.getElementById('chg_pwd').style.display='none'" class="close" title="창 닫기">&times;</span>
					
					<div class="pwd_box">
						<label for="curr_pwd">현재 비밀번호: </label>
						<input type="password" placeholder="현재 비밀번호" id="currPWD" name="curr_pwd" required>
						<label for="new_pwd">새 비밀번호: </label>
						<input type="password" placeholder="새 비밀번호" id="newPWD" name="new_pwd" required>
						<label for="pwd_chk">새 비밀번호 확인: </label>
						<input type="password" placeholder="비밀번호 확인" id="newPWD1" name="pwd_chk" required>
					</div>
			</div>
			
			<div class="container_button" style="text-align: center;">
				<button type="submit">바꾸기</button>
				<button onclick="document.getElementById('chg_pwd').style.display='none'">취소</button> 
			</div>
			</form>
		</div>
		
		<div id="chg_nick" class="top_container">
			<form class="contents" method="post" action="editNickProcess.jsp">		
			<h2>닉네임 변경</h2>
			<div class="container">
				<span onclick="document.getElementById('chg_nick').style.display='none'" class="close" title="창 닫기">&times;</span>
					<label>현재 닉네임: </label>
					<p id="curr_nick">current nickname </p>
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
			<form class="contents" onsubmit="return checkProfile()" method="post" action="editProfileProcess.jsp">		
			<h2>프로필 사진 변경</h2>
			<div class="container">
				<span onclick="resetImg()" class="close" title="창 닫기">&times;</span>
					<label>현재 프로필 사진: </label>
					<img id="curr_avatar" alt="current avatar" src="">
					<label>바꾸고 싶은 프로필 사진: 선택 기본값은 첫번째</label>
					<ul id="avatarList" style="text-align: center;">
						<li>
							<img alt="avatar1" id="avatar1" class="normal" onclick="chg_img(1)" src="img/triangle.png">
							<input type="radio" name="avatar" value="1" checked> 
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
					
			</div>			
			
			<div class="container_button" style="text-align: center;">
				<button type="submit">바꾸기</button>
				<button onclick="resetImg()">취소</button> 
			</div>
			</form>
		</div>
		</div>
		<iframe src="../footer.html" style="width: 100%; border: none"></iframe>
	</body>
	
	<script type="text/javascript">
			var profile = null;
			var selProfile = 0;
			<%String currentMemID = "";%>
			var imgArray = new Array();
			var sources = ["img/triangle.png", "img/circle.png", "img/moon.jpg", "img/fire.jpg", "img/watch.jpg", "img/water.jpg"];
			for(let i = 0; i < 6; i++)
			{
				imgArray[i] = new Image();
				imgArray[i].src = sources[i];
			}
			
			
			function init()
			{
				<%
				storeSession sessionDAO = new storeSession();
				if (sessionDAO.getSession(session) == "")
				{
				 response.setContentType("text/html; charset=UTF-8");
				 PrintWriter outA = response.getWriter();
				 outA.println("<script>alert('로그인이 필요합니다.'); location.href='../initPage.jsp';</script>");
				 outA.flush();
				}
				%>
				
			    <%if (sessionDAO.getSession(session) != "")
			    {%>
			    	if (document.getElementById("loggedInUser") != null) {
			    		document.getElementById("loggedInUser").value = "<%=sessionDAO.getSession(session)%>" + "님";
						}                
				    document.getElementById("loggedInUser").style.width = document.getElementById("loggedInUser").value.length + 1 + 'ch';
			    <%}%>
				
				<%
				currentMemID = sessionDAO.getSession(session);
				memberDAO dao = new memberDAO();
				%>
				document.getElementById("curr_nick").innerText = "<%= dao.selectMemberById(currentMemID).getMem_nickname()%>";
				document.getElementById("curr_avatar").src = imgArray[<%=dao.selectMemberById(currentMemID).getMem_icon() - 1%>].src;
			}
			
			function chg_img(index) 
			{
				var list = document.getElementById("avatarList");
				var radio = document.getElementsByName("avatar");
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
				selProfile = 0;
				
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
				var pw1 = document.getElementById('newPWD').value;
				var pw2 = document.getElementById('newPWD1').value;				
				
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
</html>