<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.*"%>
<%@ page import="actor.*"%>
<%@ page import="director.*"%>
<%@ page import="movie.*"%>
<%@ page import="review.*"%>
<%@ page import="api_DB.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body> 
		<%

			//memberDAO dao = new memberDAO();
			//memberDTO dto = new memberDTO("asdf", "asdf1234", "jaeik");
			
			//dao.insertMember(dto);
			
			apiDAO a = new apiDAO();
			%>
			<script> alert("<%=a.updateDB()%>"); </script>
			<%
 		%>

</body>