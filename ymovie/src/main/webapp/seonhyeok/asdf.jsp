<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.*"%>
<%@ page import="actor.*"%>
<%@ page import="director.*"%>
<%@ page import="movie.*"%>
<%@ page import="review.*"%>
<%@ page import="config.apiToDb"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%-- 
	todo 
1. api to db
2. tomcat on server
--%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body> 
		<%
		apiToDb ATD = new apiToDb();
		ATD.getApiData();
		%>

</body>
</html>