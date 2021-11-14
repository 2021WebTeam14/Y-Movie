<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>	body{margin: 10vh 15vw 10vh 15vw;}</style>
</head>
<body>
    <iframe src="header.html" style="width: 69vw; border: none;"></iframe>
    프레임셋(frameset)을 이용하면 하나의 브라우저 창에 둘 이상의 페이지를 표시할 수 있습니다.<br><br><br>
<br><br><br>
이러한 프레임셋은 iframe 요소와는 달리 하나 이상의 페이지를 동시에 가질 수 있습니다.<br><br><br>
<br><br><br>
또한, noresize 속성을 명시하지 않으면, 사용자가 마음대로 페이지의 크기를 조절할 수 있습니다.<br><br><br>

 <br><br><br>

프레임셋에서 각각의 페이지는 frame 요소로 표현됩니다.<br><br><br>
<br><br><br>
frame 요소는 iframe 요소와는 달리 종료 태그를 가지지 않습니다.<br><br><br>
<br><br><br>
noframes 요소는 해당 브라우저가 frame 요소를 지원하지 않을 때 보여지는 문자열을 저장합니다.<br><br><br><br><br><br>
    <iframe src="footer.html" style="width: 69vw; border: none"></iframe>
</body>