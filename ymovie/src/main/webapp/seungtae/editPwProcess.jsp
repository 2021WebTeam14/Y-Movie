<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="defaultConn.getConn" %>
<%@ page import="java.io.*"%>
<%@ page import="sessionServlet.*"%>
<%@ page import="member.memberDTO"%>
<%@ page import="member.memberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="onstart()">

</body>

<script type="text/javascript">
	function onstart() 
	{
		<%
		try
		{
			storeSession sessionDAO = new storeSession();
			memberDAO dao = new memberDAO();
			request.setCharacterEncoding("UTF-8");
			String currPW = request.getParameter("curr_pwd");
			String newPW = request.getParameter("new_pwd");
			String query = "update member set mem_pw = sha1(?) where mem_id = ?";
			int flag = dao.signInCheck(sessionDAO.getSession(session), currPW);
			if(flag == 0)
			{
				Connection con = null;
				PreparedStatement pstmt = null;
				getConn getCon = new getConn();
				con = getCon.getConnection();
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, newPW);
				pstmt.setString(2, sessionDAO.getSession(session));
				pstmt.execute();
				pstmt.close();
			}
			else
			{
				request.setCharacterEncoding("UTF-8");
				PrintWriter outA = response.getWriter();
				outA.println("<script>alert('현재 비밀번호가 일치하지 않습니다.');location.replace('editUser.jsp');</script>");
				outA.flush();
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
	    } 
		
		%>	
		alert("비밀번호가 변경되었습니다");
		location.replace('editUser.jsp');
	}
</script>
</html>