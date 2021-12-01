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
        String targetId= request.getParameter("username");
        String targetPw = request.getParameter("password");
        System.out.println(targetId);
        System.out.println(targetPw);
        request.removeAttribute("username");
        request.removeAttribute("password");
        memberDAO dao = new memberDAO();
        int check = dao.signInCheck(targetId, targetPw);

        String msg = "";
        
        if(check == 0) {
            msg = "../initPage.jsp";
        }
        else
            msg = "signIn.jsp?msg=1";
    %>
    setCookie("currID", "<%loginSession sessionHandler = new loginSession();%><%=sessionHandler.setSession(request, response, targetId)%>", 1);
	location.href="<%=msg%>";
	}
</script>

<body onload="onstart()">
    
</body>
</html>