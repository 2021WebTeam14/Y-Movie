<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head></head>
<body>
	<div id="data">
		<pre>
   		영화 정보 API 로드 ... <%=session.getAttribute("movieDown") != null ? session.getAttribute("movieDown") : "대기"%>
   		배우 정보 API 로드 ... <%=session.getAttribute("actorDown") != null ? session.getAttribute("actorDown") : "대기"%>
   		영화 정보 DB 입력  ... <%=session.getAttribute("movieUP") != null ? session.getAttribute("movieUP") : "대기"%>
   		감독 정보 DB 입력  ... <%=session.getAttribute("direcUP") != null ? session.getAttribute("direcUP") : "대기"%>
   		배우 정보 DB 입력  ... <%=session.getAttribute("actorUP") != null ? session.getAttribute("actorUP") : "대기"%>
   		</pre>
   	</div>
</body>
			