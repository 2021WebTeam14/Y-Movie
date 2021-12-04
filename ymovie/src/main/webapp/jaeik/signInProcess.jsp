<%@page import="sessionServlet.storeSession"%>
<%@page import="sessionServlet.loginSession"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ page import="member.memberDAO" %>

<html>
<head>
    <title>로그인 처리 JSP</title>
</head>
<script type="text/javascript">

	var setCookie = function(value, exp) {
		var date = new Date();
		date.setTime(date.getTime() + exp*24*60*60*1000);
		document.cookie = 'currID=' + value + ';expires=' + date.toUTCString() + ';path=/';
	};
	
	function onstart() {
	<%
        request.setCharacterEncoding("UTF-8"); 
        memberDAO dao = new memberDAO();
        int check = dao.signInCheck(request.getParameter("username"), request.getParameter("password"));

        String msg = "";
        
        if(check == 0) {
        	storeSession sessionDao = new storeSession();
        	loginSession sessionHandler = new loginSession();
        	if(sessionDao.insertSession(sessionHandler.setSession(request, response, request.getParameter("username")), request.getParameter("username"))){
            	if(request.getParameter("username").equals("god")){
                    msg = "../jaeik/AdminPage.jsp";
            	}
            	else {
                    msg = "../initPage.jsp";        		
            	}
        	}
        }
        else
            msg = "../seungtae/signIn.jsp?msg=1";
    %>
    setCookie("<%loginSession sessionHandler2 = new loginSession();%><%=sessionHandler2.setSession(request, response, request.getParameter("username"))%>", 1);
	location.href="<%=msg%>";
	}
</script>

<body onload="onstart()">
    
</body>
</html>