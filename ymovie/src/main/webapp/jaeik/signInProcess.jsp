<%@page import="sessionServlet.storeSession"%>
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
        int check = dao.signInCheck(request.getParameter("username"), request.getParameter("password"));

        String msg = "";
        
        if(check == 0) {
        	storeSession sessionDao = new storeSession();
        	if(sessionDao.insertSession(session, request.getParameter("username"))){
        		msg = "../initPage.jsp";
        	}
        }
        else
            msg = "../seungtae/signIn.jsp?msg=1";
    %>
	location.href="<%=msg%>";
	}
</script>

<body onload="onstart()">
    
</body>
</html>