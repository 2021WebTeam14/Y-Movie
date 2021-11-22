<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in</title>
	 <link rel="stylesheet" type="text/css" href="css/signIn.css">
</head>  
<body>  
	<iframe src="header.html" style="width: 100%; border: none;"></iframe>
	   <h1 style="text-align: center"> Login </h1> 
	    <form>
	        <div class="container"> 
		        <div class="inner1">
			        <div class="inner2">
			        	<div class="loginbox">
				        	<label>아이디: </label> 
				            <input type="text" placeholder="아이디" name="username" required>
				            <label>비빌번호: </label> 
				            <input type="password" placeholder="비밀번호" name="password" required>
			        	</div>
			        	
			        	<div class="buttons">
			        		<div class="innerButtons">
			        			<button type="submit">Sign in</button> 
			        			<button type="button">Sign up</button> 
			        		</div>
				        	
				        	<div class="innerBoxes">
				        		<div><input type="checkbox" checked="checked"> 로그인 상태 유지 </div>					        	
					            <a href="#" style="text-decoration: none;"> 비밀번호 찾기 </a> 
				        	</div>
			        	</div>				        			           
			        </div>	        	
		        </div>    
	        </div> 
	    </form>   
	    <iframe src="footer.html" style="width: 100%; border: none"></iframe>
</body>   
</html>