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
	 <script type="text/javascript">
	 function init() 
     {        
		 <%storeSession sessionDAO = new storeSession();%>
         <%if (sessionDAO.getSession(session) != "")
         {%>
         	if (document.getElementById("loggedInUser") != null) {
         		document.getElementById("loggedInUser").value = "<%=sessionDAO.getSession(session)%>" + "님";
				}                
         <%}%>
         document.getElementById("loggedInUser").style.width = document.getElementById("loggedInUser").value.length + 1 + 'ch';
     }
	 </script>
</head>
<body onload="init()"> 
	
	<%@include file="../header.jsp" %>
    <div id="lst" style="padding: 10vh 10vw 10vh 10vw; background-color: #f2f2f2">
	   <h1 style="text-align: center"> Login </h1> 
	   
	    <form style="padding-top: 7px; padding-bottom: 50px;" method="POST" action="../jaeik/signInProcess.jsp">
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
				            <button type="button" onclick="document.location='../jaeik/findPassword.jsp'" style="width: auto;"> 비밀번호 찾기 </button> 
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
        
       
       </div>
	    <iframe src="../footer.html" style="width: 100%; border: none"></iframe>
</body>   
</html>