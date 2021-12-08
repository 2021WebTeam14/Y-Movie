<%@page import="review.*"%>
<%@page import="sessionServlet.storeSession"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ page import="member.memberDAO" %>

<html>
<head>
    <title>리뷰 수정 중...</title>
</head>
<script type="text/javascript">
	
	function onstart() {
	<%
		storeSession sessionDAO = new storeSession();
		String id = sessionDAO.getSession(session);
		if (id == ""){
		 response.setContentType("text/html; charset=UTF-8");
		 PrintWriter outA = response.getWriter();
		 outA.println("<script>alert('로그인이 필요합니다.'); location.href='../initPage.jsp';</script>");
		 outA.flush();
		}
		request.setCharacterEncoding("UTF-8");
		System.out.println(id);
		System.out.println(request.getParameter("editReviewTitle"));
		System.out.println(Integer.parseInt(request.getParameter("rating")));
		System.out.println(request.getParameter("thumbs"));
		System.out.println(request.getParameter("editedReview"));
		reviewDAO dao = new reviewDAO();
		reviewDTO dto = new reviewDTO(id, request.getParameter("editReviewTitle"), Integer.parseInt(request.getParameter("rating")), Integer.parseInt(request.getParameter("thumbs")), request.getParameter("editedReview"));
		dao.updateReview(dto);
    %>
	history.back();
	}
</script>

<body onload="onstart()">
    
</body>
</html>