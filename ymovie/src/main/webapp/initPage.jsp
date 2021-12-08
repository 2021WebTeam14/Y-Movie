<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/initPage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>	body{margin: 10vh 15vw 10vh 15vw;}</style>
</head>
<body onload="getData()">
    <iframe src="header.jsp" style="width: 100%; border: none; height: 10vw"></iframe>
    
    <div class="outer border centered">
    	<div class="centered noMP"><h1 id="heading">일간(주간) 박스오피스 순위 / 사이트 별점 순위</h1></div>
	    <div class="centered flex">
	    	<a onclick="chg_page(0)">&lt;</a>
	    	
		    	<table style="width: 100%;">
		    		<tbody id="mainTable">
				    	<tr>
				    		<td>
					    		<div class="rank">    	
									<div class="rankNum">1</div>
									<img id="dailyImg0" src="https://kobis.or.kr/common/mast/movie/2016/10/thumb_x192/thn_08b4cda6ba9b49bb8f31b79fd0f1af64.jpg" class="rankImg noMP">
									<h1 id="dailyName0">Daily Rank 1</h1>
						    	</div>	
				    		</td>
				    		
					    	<td>
					    		<div class="rank">    	
									<div class="rankNum">2</div>
									<img id="dailyImg1" src="https://kobis.or.kr/common/mast/movie/2016/10/thumb_x192/thn_08b4cda6ba9b49bb8f31b79fd0f1af64.jpg" class="rankImg noMP">
									<h1 id="dailyName1">Daily Rank 2</h1>
						    	</div>	
					    	</td>
					    		
					    	<td>
					    		<div class="rank">    	
									<div class="rankNum">3</div>
									<img id="dailyImg2" src="https://kobis.or.kr/common/mast/movie/2016/10/thumb_x192/thn_08b4cda6ba9b49bb8f31b79fd0f1af64.jpg" class="rankImg noMP">
									<h1 id="dailyName2">Daily Rank 3</h1>
						    	</div>
					    	</td>
				    	</tr>
			    	
			    		<tr>
				    		<td>
					    		<div class="rank">    	
									<div class="rankNum">1</div>
									<img id="weeklyImg0" src="https://kobis.or.kr/common/mast/movie/2016/10/thumb_x192/thn_08b4cda6ba9b49bb8f31b79fd0f1af64.jpg" class="rankImg noMP">
									<h1 id="weeklyName0">Weekly Rank 1</h1>
						    	</div>	
				    		</td>
				    		
					    	<td>
					    		<div class="rank">    	
									<div class="rankNum">2</div>
									<img id="weeklyImg1" src="https://kobis.or.kr/common/mast/movie/2016/10/thumb_x192/thn_08b4cda6ba9b49bb8f31b79fd0f1af64.jpg" class="rankImg noMP">
									<h1 id="weeklyName1">Weekly Rank 2</h1>
						    	</div>	
					    	</td>
					    		
					    	<td>
					    		<div class="rank">    	
									<div class="rankNum">3</div>
									<img id="weeklyImg2" src="https://kobis.or.kr/common/mast/movie/2016/10/thumb_x192/thn_08b4cda6ba9b49bb8f31b79fd0f1af64.jpg" class="rankImg noMP">
									<h1 id="weeklyName2">Weekly Rank 3</h1>
						    	</div>
					    	</td>
				    	</tr>
				    	
				    	<tr>
				    		<td>
					    		<div class="rank">    	
									<div class="rankNum">1</div>
									<img id="starImg0" src="https://kobis.or.kr/common/mast/movie/2016/10/thumb_x192/thn_08b4cda6ba9b49bb8f31b79fd0f1af64.jpg" class="rankImg noMP">
									<h1 id="starName0">Star Rank 1</h1>
						    	</div>	
				    		</td>
				    		
					    	<td>
					    		<div class="rank">    	
									<div class="rankNum">2</div>
									<img id="starImg1" src="https://kobis.or.kr/common/mast/movie/2016/10/thumb_x192/thn_08b4cda6ba9b49bb8f31b79fd0f1af64.jpg" class="rankImg noMP">
									<h1 id="starName1">Star Rank 2</h1>
						    	</div>	
					    	</td>
					    		
					    	<td>
					    		<div class="rank">    	
									<div class="rankNum">3</div>
									<img id="starImg2" src="https://kobis.or.kr/common/mast/movie/2016/10/thumb_x192/thn_08b4cda6ba9b49bb8f31b79fd0f1af64.jpg" class="rankImg noMP">
									<h1 id="starName2">Star Rank 3</h1>
						    	</div>
					    	</td>
				    	</tr>
		    		</tbody>
					
		    	</table>
	    	<a onclick="chg_page(1)">&gt;</a>
	    </div>
    </div>
	<div id="ad" class="outer border centered">
		<div id="adSizeName">(대충 회원가입하고 싶은 문구)</div>
		<input type="button" value="(대충 센스있는 버튼 내용)" onclick="location.href='seungtae/signUp.jsp'">
    </div>
    <div class="outer border flex">
	    <img id="poster" src="https://kobis.or.kr/common/mast/movie/2016/10/thumb_x192/thn_08b4cda6ba9b49bb8f31b79fd0f1af64.jpg" alt="poster">
 		<div class="leftNoMargin centered">
 			<div class="">
 				<div class="outer flex left noMP">	
			    	<div id="reviewName0" class="noMP">Nick&nbsp;</div>
			    	<div id="reviewThumb0" class="noMP">Thumb&nbsp;</div>
			    	<div id="reviewStar0" class="noMP">Star</div>
			   	</div>
		    	<div id="reviewText00" class="border review">TextTextTextTextTextTextTextTextTextText</div>
		    </div>
 			<div class="">
 				<div class="outer flex left noMP">	
			    	<div id="reviewName1" class="noMP">Nick&nbsp;</div>
			    	<div id="reviewThumb1" class="noMP">Thumb&nbsp;</div>
			    	<div id="reviewStar1" class="noMP">Star</div>
			   	</div>
		    	<div id="reviewText1" class="border review">TextTextTextTextTextTextTextTextTextText</div>
		    </div>
 			<div class="">
 				<div class="outer flex left noMP">
			    	<div id="reviewName2" class="noMP">Nick&nbsp;</div>
			    	<div id="reviewThumb2" class="noMP">Thumb&nbsp;</div>
			    	<div id="reviewStar2" class="noMP">Star</div>
			   	</div>
		    	<div id="reviewText2" class="border review">TextTextTextTextTextTextTextTextTextText</div>
		    </div>
		</div>
	</div>
	    <div class="outer border flex">
    	<img id="poster" src="https://kobis.or.kr/common/mast/movie/2016/10/thumb_x192/thn_08b4cda6ba9b49bb8f31b79fd0f1af64.jpg" alt="poster">
 		<div class="leftNoMargin centered">
 			<div class="">
 				<div class="outer flex left noMP">	
			    	<div id="reviewName00" class="noMP">Nick&nbsp;</div>
			    	<div id="reviewThumb00" class="noMP">Thumb&nbsp;</div>
			    	<div id="reviewStar00" class="noMP">Star</div>
			   	</div>
		    	<div id="reviewText00" class="border review">TextTextTextTextTextTextTextTextTextText</div>
		    </div>
 			<div class="">
 				<div class="outer flex left noMP">	
			    	<div id="reviewName00" class="noMP">Nick&nbsp;</div>
			    	<div id="reviewThumb00" class="noMP">Thumb&nbsp;</div>
			    	<div id="reviewStar00" class="noMP">Star</div>
			   	</div>
		    	<div id="reviewText00" class="border review">TextTextTextTextTextTextTextTextTextText</div>
		    </div>
 			<div class="">
 				<div class="outer flex left noMP">
			    	<div id="reviewName00" class="noMP">Nick&nbsp;</div>
			    	<div id="reviewThumb00" class="noMP">Thumb&nbsp;</div>
			    	<div id="reviewStar00" class="noMP">Star</div>
			   	</div>
		    	<div id="reviewText00" class="border review">TextTextTextTextTextTextTextTextTextText</div>
		    </div>
		</div>
	</div>
	    <div class="outer border flex">
    	<img id="poster" src="https://kobis.or.kr/common/mast/movie/2016/10/thumb_x192/thn_08b4cda6ba9b49bb8f31b79fd0f1af64.jpg" alt="poster">
 		<div class="leftNoMargin centered">
 			<div class="">
 				<div class="outer flex left noMP">	
			    	<div id="reviewName00" class="noMP">Nick&nbsp;</div>
			    	<div id="reviewThumb00" class="noMP">Thumb&nbsp;</div>
			    	<div id="reviewStar00" class="noMP">Star</div>
			   	</div>
		    	<div id="reviewText00" class="border review">TextTextTextTextTextTextTextTextTextText</div>
		    </div>
 			<div class="">
 				<div class="outer flex left noMP">	
			    	<div id="reviewName00" class="noMP">Nick&nbsp;</div>
			    	<div id="reviewThumb00" class="noMP">Thumb&nbsp;</div>
			    	<div id="reviewStar00" class="noMP">Star</div>
			   	</div>
		    	<div id="reviewText00" class="border review">TextTextTextTextTextTextTextTextTextText</div>
		    </div>
 			<div class="">
 				<div class="outer flex left noMP">
			    	<div id="reviewName00" class="noMP">Nick&nbsp;</div>
			    	<div id="reviewThumb00" class="noMP">Thumb&nbsp;</div>
			    	<div id="reviewStar00" class="noMP">Star</div>
			   	</div>
		    	<div id="reviewText00" class="border review">TextTextTextTextTextTextTextTextTextText</div>
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
				break;
				
				case 1:
					pageHeading.innerHTML = "주간 박스오피스 순위";
				break;
					
				case 2:
					pageHeading.innerHTML = "사이트 별점 순위";
				break;
	
			    default:
			    	pageHeading.innerHTML = "일간 박스오피스 순위";
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