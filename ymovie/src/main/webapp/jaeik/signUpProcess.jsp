<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="sessionServlet.loginSession"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>로그인 처리 JSP</title>
</head>
<script type="text/javascript">

	function onstart() {
	<%
		int ava = 1;
		if (request.getParameter("avatar") != null){
			ava = Integer.parseInt(request.getParameter("avatar"));
		}
        request.setCharacterEncoding("UTF-8"); 
        memberDAO dao = new memberDAO();
        int check = dao.signUpCheck(request.getParameter("username"), request.getParameter("password"));

        String msg = "";
        
        if(check == 1) {
            memberDTO dto = new memberDTO(request.getParameter("username"), request.getParameter("password"), request.getParameter("nickname"),  ava);
        	dao.insertMember(dto);
        	msg = "../seungtae/signIn.jsp";    
        }
        else
        	msg = "../seungtae/signUp.jsp?msg=1";
    %>
    alert("회원가입을 환영합니다!");
	location.href="<%=msg%>";
	<%
	request.removeAttribute("username");
	request.removeAttribute("password");
	request.removeAttribute("nickname");
	request.removeAttribute("avatar");
	%>
	}
</script>

<body onload="onstart()">
    
</body>
</html>