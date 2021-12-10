<%@page import="defaultConn.getConn"%>
<%@page import="review.reviewDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="review.reviewDAO"%>
<%@page import="member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="sessionServlet.storeSession"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/initPage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Y-Movie</title>
<style>	body{margin: 10vh 15vw 10vh 15vw;}</style>
<script type="text/javascript">
	function getData() {
	<%
	 	storeSession sessionDAO = new storeSession();
		movieDAO dao = new movieDAO();
		memberDAO memDao = new memberDAO();
		posterAPI posterAPI = new posterAPI();
		apiDAO api = new apiDAO();
	%>
	<%
		Connection con = null;
		getConn getCon = new getConn();
		con = getCon.getConnection();
		ArrayList<CodeNameYearDTO> dataWeek = api.getAPIBoxOfficeWeekly();
		ArrayList<CodeNameYearDTO> dataDay = api.getAPIBoxOfficeDaily();
		ArrayList<movieDTO> dataStar = dao.getStarRank(3);
		
		ArrayList<reviewDTO> dataRev = new ArrayList<reviewDTO>();
		reviewDAO revDao = new reviewDAO();
		String star = "★";
		
		%>
		document.getElementById("poster0").src =  "<%=posterAPI.getPoster(dataWeek.get(0).getCode())%>";
		document.getElementById("poster1").src =  "<%=posterAPI.getPoster(dataDay.get(0).getCode())%>";
		document.getElementById("poster2").src =  "<%=posterAPI.getPoster(dataStar.get(0).getMov_code())%>";
		<%
		dataRev = revDao.selectByMovie(con, dataWeek.get(0).getCode());
		if(dataRev.size() != 0){
			for(int j=1; j<dataRev.size() && j<4; j++){
				%>
					document.getElementById("reviewName0<%=j%>").innerText =  "<%=memDao.findNick(dataRev.get(j).getMem_id())%>";
					document.getElementById("reviewThumb0<%=j%>").innerHtml = "<%if (dataRev.get(j).getRev_thumbs()==1) out.print("&#128077;"); else out.print("&#128078;");%>";
					document.getElementById("reviewStar0<%=j%>").innerText = "<%=star.repeat(dataRev.get(j).getRev_star())%>";
				<%
			}
		}
		
		dataRev = revDao.selectByMovie(con, dataDay.get(0).getCode());
		if(dataRev.size() != 0){
			for(int j=1; j<dataRev.size() && j<4; j++){
				%>
					document.getElementById("reviewName1<%=j%>").innerText =  "<%=memDao.findNick(dataRev.get(j).getMem_id())%>";
					document.getElementById("reviewThumb1<%=j%>").innerHtml = "<%if (dataRev.get(j).getRev_thumbs()==1) out.print("&#128077;"); else out.print("&#128078;");%>";
					document.getElementById("reviewStar1<%=j%>").innerText = "<%=star.repeat(dataRev.get(j).getRev_star())%>";
				<%
			}
		}
		
		dataRev = revDao.selectByMovie(con, dataStar.get(0).getMov_code());
		if(dataRev.size() != 0){
			for(int j=1; j<dataRev.size() && j<4; j++){
				%>
					document.getElementById("reviewName2<%=j%>").innerText =  "<%=memDao.findNick(dataRev.get(j).getMem_id())%>";
					document.getElementById("reviewThumb2<%=j%>").innerHtml = "<%if (dataRev.get(j).getRev_thumbs()==1) out.print("&#128077;"); else out.print("&#128078;");%>";
					document.getElementById("reviewStar2<%=j%>").innerText = "<%=star.repeat(dataRev.get(j).getRev_star())%>";
				<%
			}
		}
	%>
		
	}
</script>
</head>
<body onload="getData()">
    <iframe src="header.jsp" style="width: 100%; border: none; height: 15vw"></iframe>
    
    <div class="outer border centered">
    	<div class="centered noMP"><h1 id="heading"></h1></div>
	    <div class="centered flex">
	    	<a onclick="chg_page(0)">&lt;</a>
	    	
		    	<table style="width: 100%;">
		    		<tbody id="mainTable">
				    	<tr>
				    		<td>
					    		<div class="rank">    	
									<div class="rankNum">1</div>
									<img id="dailyImg0" src="" class="rankImg noMP">
									<h3 id="dailyName0"></h3>
						    	</div>	
				    		</td>
				    		
					    	<td>
					    		<div class="rank">    	
									<div class="rankNum">2</div>
									<img id="dailyImg1" src="" class="rankImg noMP">
									<h3 id="dailyName1"></h3>
						    	</div>	
					    	</td>
					    		
					    	<td>
					    		<div class="rank">    	
									<div class="rankNum">3</div>
									<img id="dailyImg2" src="" class="rankImg noMP">
									<h3 id="dailyName2"></h3>
						    	</div>
					    	</td>
				    	</tr>
			    	
			    		<tr>
				    		<td>
					    		<div class="rank">    	
									<div class="rankNum">1</div>
									<img id="weeklyImg0" src="" class="rankImg noMP">
									<h3 id="weeklyName0"></h3>
						    	</div>	
				    		</td>
				    		
					    	<td>
					    		<div class="rank">    	
									<div class="rankNum">2</div>
									<img id="weeklyImg1" src="" class="rankImg noMP">
									<h3 id="weeklyName1"></h3>
						    	</div>	
					    	</td>
					    		
					    	<td>
					    		<div class="rank">    	
									<div class="rankNum">3</div>
									<img id="weeklyImg2" src="" class="rankImg noMP">
									<h3 id="weeklyName2"></h3>
						    	</div>
					    	</td>
				    	</tr>
				    	
				    	<tr>
				    		<td>
					    		<div class="rank">    	
									<div class="rankNum">1</div>
									<img id="starImg0" src="" class="rankImg noMP">
									<h3 id="starName0"></h3>
						    	</div>	
				    		</td>
				    		
					    	<td>
					    		<div class="rank">    	
									<div class="rankNum">2</div>
									<img id="starImg1" src="" class="rankImg noMP">
									<h3 id="starName1"></h3>
						    	</div>	
					    	</td>
					    		
					    	<td>
					    		<div class="rank">    	
									<div class="rankNum">3</div>
									<img id="starImg2" src="" class="rankImg noMP">
									<h3 id="starName2"></h3>
						    	</div>
					    	</td>
				    	</tr>
		    		</tbody>
					
		    	</table>
	    	<a onclick="chg_page(1)">&gt;</a>
	    </div>
    </div>
	<div id="ad" class="outer border centered">
		<div id="adSizeName">Y-Movie</div>
		<input type="button" value="가입하기" onclick="location.href='seungtae/signUp.jsp'">
    </div>
    <div class="outer border flex">
	    <img id="poster0" src="" alt="poster">
 		<div class="leftNoMargin centered">
 			<div class="">
 				<div class="outer flex left noMP">	
			    	<div id="reviewName01" class="noMP"></div>
			    	<div id="reviewThumb01" class="noMP"></div>
			    	<div id="reviewStar01" class="noMP"></div>
			   	</div>
		    	<div id="reviewText00" class="border review"></div>
		    </div>
 			<div class="">
 				<div class="outer flex left noMP">	
			    	<div id="reviewName01" class="noMP"></div>
			    	<div id="reviewThumb01" class="noMP"></div>
			    	<div id="reviewStar01" class="noMP"></div>
			   	</div>
		    	<div id="reviewText1" class="border review"></div>
		    </div>
 			<div class="">
 				<div class="outer flex left noMP">
			    	<div id="reviewName02" class="noMP"></div>
			    	<div id="reviewThumb02" class="noMP"></div>
			    	<div id="reviewStar02" class="noMP"></div>
			   	</div>
		    	<div id="reviewText2" class="border review"></div>
		    </div>
		</div>
	</div>
	    <div class="outer border flex">
    	<img id="poster1" src="" alt="poster">
 		<div class="leftNoMargin centered">
 			<div class="">
 				<div class="outer flex left noMP">	
			    	<div id="reviewName11" class="noMP"></div>
			    	<div id="reviewThumb11" class="noMP"></div>
			    	<div id="reviewStar11" class="noMP"></div>
			   	</div>
		    	<div id="reviewText00" class="border review"></div>
		    </div>
 			<div class="">
 				<div class="outer flex left noMP">	
			    	<div id="reviewName12" class="noMP"></div>
			    	<div id="reviewThumb12" class="noMP"></div>
			    	<div id="reviewStar12" class="noMP"></div>
			   	</div>
		    	<div id="reviewText00" class="border review"></div>
		    </div>
 			<div class="">
 				<div class="outer flex left noMP">
			    	<div id="reviewName13" class="noMP"></div>
			    	<div id="reviewThumb13" class="noMP"></div>
			    	<div id="reviewStar13" class="noMP"></div>
			   	</div>
		    	<div id="reviewText00" class="border review"></div>
		    </div>
		</div>
	</div>
	    <div class="outer border flex">
    	<img id="poster2" src="" alt="poster">
 		<div class="leftNoMargin centered">
 			<div class="">
 				<div class="outer flex left noMP">	
			    	<div id="reviewName21" class="noMP"></div>
			    	<div id="reviewThumb21" class="noMP"></div>
			    	<div id="reviewStar21" class="noMP"></div>
			   	</div>
		    	<div id="reviewText00" class="border review"></div>
		    </div>
 			<div class="">
 				<div class="outer flex left noMP">	
			    	<div id="reviewName22" class="noMP"></div>
			    	<div id="reviewThumb22" class="noMP"></div>
			    	<div id="reviewStar22" class="noMP"></div>
			   	</div>
		    	<div id="reviewText00" class="border review"></div>
		    </div>
 			<div class="">
 				<div class="outer flex left noMP">
			    	<div id="reviewName23" class="noMP"></div>
			    	<div id="reviewThumb23" class="noMP"></div>
			    	<div id="reviewStar23" class="noMP"></div>
			   	</div>
		    	<div id="reviewText00" class="border review"></div>
		    </div>
		</div>
	</div>
	
	<script type="text/javascript">
		let tbd = document.getElementById("mainTable");
		let tr = tbd.getElementsByTagName('tr');
		
		let arrayTr = [];
		let curr = 0;
		let pageHeading = document.getElementById("heading");
		
		for (let i = 0; i < tr.length; i++) 
		{
		  arrayTr.push(tr[i]);
		}
		
		function displayPage(page) 
		{
		  tbd.innerHTML='';
		  tbd.appendChild(arrayTr[page]); 

		  	switch (page) 
		  	{
				case 0:
					pageHeading.innerHTML = "일간 박스오피스 순위";	
			    	<%for (int i = 0; i < 3; i++) {%>
						document.getElementById("dailyImg<%=i%>").src = '<%=posterAPI.getPoster(dataDay.get(i).getCode())%>';
						document.getElementById("dailyName<%=i%>").innerText = "<%=dataDay.get(i).getName()%>";
					<%}%>
				break;
				
				case 1:
					pageHeading.innerHTML = "주간 박스오피스 순위";
					<%for (int i = 0; i < 3; i++) {%>
						document.getElementById("weeklyImg<%=i%>").src = '<%=posterAPI.getPoster(dataWeek.get(i).getCode())%>';
						document.getElementById("weeklyName<%=i%>").innerText = "<%=dataWeek.get(i).getName()%>";
					<%}%>
				break;
					
				case 2:
					pageHeading.innerHTML = "사이트 별점 순위";
					<%for (int i = 0; i < 3; i++) {%>
						document.getElementById("starImg<%=i%>").src = '<%=posterAPI.getPoster(dataStar.get(i).getMov_code())%>';
						document.getElementById("starName<%=i%>").innerText = "<%=dataStar.get(i).getMov_name()%>";
					<%}%>
				break;
	
			    default:
			    	pageHeading.innerHTML = "일간 박스오피스 순위";		
			    	<%for (int i = 0; i < 3; i++) {%>
						document.getElementById("dailyImg<%=i%>").src = '<%=posterAPI.getPoster(dataDay.get(i).getCode())%>';
						document.getElementById("dailyName<%=i%>").innerText = "<%=dataDay.get(i).getName()%>";
					<%}%>
			    	curr = 0;
			    	chg_page(0);
				break;
			}
		}
		
		displayPage(curr); //default
		
		function chg_page(flag) 
		{
			if(flag)
			{
				curr = curr + 1;
				if(curr == 3)
				{
					curr = 0;					
				}
			}
			else
			{
				curr = curr - 1;
				if(curr == -1)
				{
					curr = 2;					
				}
			}
			displayPage(curr);
		}
		
	</script>
    
    <iframe src="footer.html" style="width: 69vw; border: none"></iframe>
</body>
</html>