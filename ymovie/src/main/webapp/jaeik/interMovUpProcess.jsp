<%@page import="javax.tools.DocumentationTool.Location"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
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
		StringBuilder favActor = new StringBuilder();
		StringBuilder favDirec = new StringBuilder();
		StringBuilder favGenre = new StringBuilder();
		System.out.println("-------------------------------");	
        memberDAO dao = new memberDAO();
		for (int i = 0; i < 18; i++) {
			if (i != 0) {
				request.setCharacterEncoding("utf-8");
				if (request.getParameter("checked" + Integer.toString(i)).toString() != ""){
					favActor.append(", " + request.getParameter("actor" + Integer.toString(i)));
					favDirec.append(", " + request.getParameter("director" + Integer.toString(i)));
					favGenre.append(", " + request.getParameter("genre" + Integer.toString(i)));
				}
			}
			else {
				request.setCharacterEncoding("utf-8");
				if (request.getParameter("checked" + Integer.toString(i)).toString() != ""){
					favActor.append(request.getParameter("actor" + Integer.toString(i)));
					favDirec.append(request.getParameter("director" + Integer.toString(i)));
					favGenre.append(request.getParameter("genre" + Integer.toString(i)));
				}
			}
		}
		System.out.println(favActor.toString());
		System.out.println(favDirec.toString());
		System.out.println(favGenre.toString());
    	//storeSession sesDao = new storeSession();
    	//sesDao.insertSession(session, request.getParameter("username"));
    %>
	history.back();
	}
</script>

<body onload="onstart()">
    
</body>
</html>