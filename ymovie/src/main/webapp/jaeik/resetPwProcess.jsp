<%@page import="sessionServlet.loginSession"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ page import="member.memberDAO" %>

<html>
<head>
    <title>로그인 처리 JSP</title>
</head>
<script type="text/javascript">	
	function onstart() {
	<%
        request.setCharacterEncoding("UTF-8"); 
        memberDAO dao = new memberDAO();
        dao.resetPW(request.getParameter("username"), request.getParameter("password"));
        String msg = "../seungtae/signIn.jsp";
    %>
    alert("비밀번호가 재설정 되었습니다.");
	location.href="<%=msg%>";
	}
</script>

<body onload="onstart()">
    
</body>
</html>