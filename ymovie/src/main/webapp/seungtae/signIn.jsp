<%@page import="member.memberDAO"%>
<%@page import="sessionServlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in</title>
	 <link rel="stylesheet" type="text/css" href="signIn.css">
</head>
<body> 
	<%
        storeSession sessionDAO = new storeSession();
		sessionDAO.deleteSession(session);
	%>
	<iframe id="head" src="../header.jsp" style="width: 100%; border: none;"></iframe>
	   <h1 style="text-align: center"> Login </h1> 
	   
	    <form style="padding-top: 50px; padding-bottom: 50px;" method="POST" action="signInProcess.jsp">
	        <div class="container"> 
		        <div class="inner1">
			        <div class="inner2">	
			        	<p id="warning" style="text-align: center; color: red; visibility: hidden;">asdf</p>	        
			        	<div class="loginbox">
				        	<label>아이디: </label> 
				            <input type="text" id="userID" placeholder="아이디" name="username" required>
				            <label>비빌번호: </label> 
				            <input type="password" id="userPW" placeholder="비밀번호" name="password" required>
			        	</div>
			        	
			        	<div class="buttons">
			        		<div class="innerButtons">
			        			<button type="submit">Sign in</button> 
			        			<button type="button" onclick="document.location='signUp.jsp'">Sign up</button> 
			        		</div>
			        	</div>
			        	<div class="innerBoxes">    							        	
				            <button type="button" onclick="document.location='findPassword.jsp'" style="width: auto;"> 비밀번호 찾기 </button> 
		        		</div>
		        	</div>				        			           
		        </div>	        	
	        </div>    
	    </form>
	    <% 
        	request.setCharacterEncoding("UTF-8");
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("1")) 
            {
                out.println("<br>");
                out.println("<font color='red' size='5'>아이디 혹은 비밀번호가 일치하지 않습니다</font>");
            }
        %>    
	    <iframe src="../footer.html" style="width: 100%; border: none"></iframe>
</body>   
</html>