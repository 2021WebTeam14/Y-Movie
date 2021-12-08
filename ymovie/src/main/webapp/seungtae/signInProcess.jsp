<%@page import="javax.tools.DocumentationTool.Location"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="member.memberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="sessionServlet.*"%>

<html>
<head>
    <title>로그인 처리 JSP</title>
</head>
<script type="text/javascript">
	function onstart() {
	<%
        request.setCharacterEncoding("UTF-8"); 
        String targetId= request.getParameter("username");
        String targetPw = request.getParameter("password");
        request.removeAttribute("username");
        request.removeAttribute("password");
        memberDAO dao = new memberDAO();
        int check = dao.signInCheck(targetId, targetPw);
        String msg = "";
        
        if(check == 0) {
    		storeSession sesDao = new storeSession();
    		sesDao.insertSession(session, request.getParameter("username"));
            msg = "../initPage.jsp";
        }
        else
            msg = "signIn.jsp?msg=1";
    %>
	location.href="<%=msg%>";
	}
</script>

<body onload="onstart()">
    
</body>
</html>