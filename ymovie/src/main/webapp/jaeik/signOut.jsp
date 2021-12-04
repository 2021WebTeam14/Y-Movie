<%@page import="sessionServlet.storeSession"%>
<%@page import="member.memberDAO"%>
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
	<script type="text/javascript">
	function onstart() {
		<%storeSession dao = new storeSession(); dao.deleteSession(session);%>		
		<%session.invalidate();session = request.getSession();%>
	    var date = new Date();
		alert("로그아웃 되었습니다.");
		window.top.location.replace("../initPage.jsp");
	}
		
	</script>
</body>   
</html>