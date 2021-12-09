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
</head>
<body>  
	<%
	    storeSession sessionDAO = new storeSession();
		sessionDAO.deleteSession(session);
	%>
	<iframe id="head" src="../header.jsp" style="width: 100%; border: none;"></iframe>
	   <h1 style="text-align: center"> 비밀번호 찾기 </h1> 
	   
	    <form style="padding-top: 50px; padding-bottom: 50px;" method="POST" action="../jaeik/matchNickProcess.jsp">
	        <div class="container"> 
		        <div class="inner1">
			        <div class="inner2">        
			        	<div class="loginbox">
				        	<label>아이디: </label> 
				            <input type="text" id="userID" placeholder="아이디" name="username" value="<%=request.getParameter("username")%>" readonly>
				        	<label>닉네임: </label> 
				            <input type="text" id="userPW" placeholder="닉네임" name="nickname" required>
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