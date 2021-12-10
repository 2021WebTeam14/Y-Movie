<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.*" %>
<%@ page import="review.*" %>
<%@ page import="defaultConn.getConn" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="sessionServlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function insertRev() {
		
		<%
		Connection con = null;
        getConn getCon = new getConn();
        con = getCon.getConnection();
        request.setCharacterEncoding("UTF-8");
		%>
		<%String movcode = request.getParameter("moviecode");%>
		<%String star_rate = request.getParameter("rating");%>
		<%String review = request.getParameter("reviewContents");%>
		<%int star_rate1 = Integer.parseInt(star_rate);%>
		<%String thumbs = request.getParameter("thumbs1");%>
		<%int thumbs2 = Integer.parseInt(thumbs);%>
		
		<%reviewDAO dao = new reviewDAO();%>
		<%storeSession sessionDAO = new storeSession();%>
		<%reviewDTO dto = new reviewDTO(movcode, sessionDAO.getSession(session), star_rate1, thumbs2, review);%>
		<%dao.insertReview(con, dto);%>
		alert("리뷰가 작성되었어요! >.<");
		location.replace("./movieinfo.jsp?movcode=<%=movcode%>");
		
	}
	
</script>
</head>
<body onload="insertRev()">

</body>
</html>