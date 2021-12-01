<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="sessionServlet.loginSession"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="member.memberDAO" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>로그인 처리 JSP</title>
</head>
<script type="text/javascript">

	function setCookie(key, value, expiredays) {
	    var todayDate = new Date();
	    todayDate.setDate(todayDate.getDate() + expiredays);
	    document.cookie = key + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	
	function getCookie(key) {
	    var result = null;
	    var cookie = document.cookie.split(';');
	    cookie.some(function (item) {
	        // 공백을 제거
	        item = item.replace(' ', '');
	 
	        var dic = item.split('=');
	 
	        if (key === dic[0]) {
	            result = dic[1];
	            return true;    // break;
	        }
	    });
	    return result;
	}
	function onstart() {
	<%
        request.setCharacterEncoding("UTF-8"); 
        memberDAO dao = new memberDAO();
        int check = dao.signInCheck(request.getParameter("username"), request.getParameter("password"));

        String msg = "";
        
        if(check == 0) {
        	if(request.getParameter("username").equals("god")){
                msg = "../jaeik/AdminPage.jsp";
        	}
        	else {
                msg = "../initPage.jsp";        		
        	}
        }
        else
            msg = "signIn.jsp?msg=1";
    %>
    setCookie("currID", "<%loginSession sessionHandler = new loginSession();%><%=sessionHandler.setSession(request, response, request.getParameter("username"))%>", 1);
	location.href="<%=msg%>";
	}
</script>

<body onload="onstart()">
    
</body>
</html>