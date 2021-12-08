<%@page import="member.memberDAO"%>
<%@page import="sessionServlet.*"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in</title>
	 <link rel="stylesheet" type="text/css" href="signIn.css">
</head>
<body onload="onstart()">  
	<%
        storeSession sessionDAO = new storeSession();
		sessionDAO.deleteSession(session);
	%>
	<script type="text/javascript">
	function onstart() {
	    var date = new Date();
		alert("로그아웃 되었습니다.");
		window.top.location.replace("../initPage.jsp");
	}
		
	</script>
</body>   
</html>