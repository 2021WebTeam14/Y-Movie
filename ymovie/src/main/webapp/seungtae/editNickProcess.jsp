<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="defaultConn.getConn" %>
<%@ page import="java.io.*"%>
<%@ page import="sessionServlet.*"%>
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
			request.setCharacterEncoding("UTF-8");
			String newNickname = request.getParameter("new_nick");
			String query = "update member set mem_nickname = ? where mem_id = ?";
			Connection con = null;
			PreparedStatement pstmt = null;
			getConn getCon = new getConn();
			getCon.getConnection();
			con = getCon.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, newNickname);
			pstmt.setString(2, sessionDAO.getSession(session));
			pstmt.execute();
			pstmt.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
	    } 	
		%>
		
		alert("닉네임이 변경되었습니다");
		location.replace('editUser.jsp');
	}
</script>
</html>