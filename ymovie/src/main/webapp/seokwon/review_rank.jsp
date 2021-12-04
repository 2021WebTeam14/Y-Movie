<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Y-Movie</title>
<link href="review_rank.css" rel="stylesheet" type="text/css">

<style>	body{margin: 10vh 15vw 10vh 15vw;}</style>
<script> <%--리뷰어 랭킹  받아오는 함수 입력--%>
	 function getRecommand() {
		 <%movieDAO dao = new movieDAO();%>
		 <%posterAPI posterAPI = new posterAPI();%>
		 <%ArrayList<CodeNameYearDTO> data = dao.getPersonalRecommands("asdf");%> 
	        <%for(int i=0;i<16;i++){%>
	        document.getElementById("img<%=i%>").src = '<%=posterAPI.getPoster(data.get(i).getCode())%>';
	        document.getElementById("Name<%=i%>").innerText = "<%=data.get(i).getName()%>";
	        document.getElementById("Year<%=i%>").innerText = "<%=data.get(i).getYear()%>년";	       
	        <%}%>
	    }
	 </script>
</head>
<body>
    <iframe src="../header.html" style="width: 69vw; border: none;"></iframe>
<div class="head">
    <h2>리뷰어 랭킹 TOP20</h2>
</div>
    <table>
    		<tr>
    			<td class="rank" width="50">순위</th>
    			<td class="nick" width="200">닉네임</th>  <%-- id = nickname --%>
    			<td class="count" width="150">리뷰 개수</th>  <%-- id = rev_cnt --%>
    			<td class="genre" width="150">선호 장르</th>  <%-- id = favGenre --%>
    			<td class="director" width="150">선호 감독</th>  <%-- id = favDirector --%>
    		</tr>
    		<tr>
    			<td><b>1</b></td>
    			<td><b id="Name0"></b><td>
    			<td><b id="rev_cnt0"></b></td>
    			<td><b id="avg_star0"></b></td>
    		</tr>
    		<tr>
    			<td><b>2</b></td>
    			<td><b id="Name1"></b><td>
    			<td><b id="rev_cnt1"></b></td>
    			<td><b id="avg_star1"></b></td>
    		</tr>
    		<tr>
    			<td><b>3</b></td>
    			<td><b id="Name2"></b><td>
    			<td><b id="rev_cnt2"></b></td>
    			<td><b id="avg_star2"></b></td>
    		</tr>
    		<tr>
    			<td><b>4</b></td>
    			<td><b id="Name3"></b><td>
    			<td><b id="rev_cnt3"></b></td>
    			<td><b id="avg_star3"></b></td>
    		</tr>
    		<tr>
    			<td><b>5</b></td>
    			<td><b id="Name4"></b><td>
    			<td><b id="rev_cnt4"></b></td>
    			<td><b id="avg_star4"></b></td>
    		</tr>
    		<tr>
    			<td><b>6</b></td>
    			<td><b id="Name5"></b><td>
    			<td><b id="rev_cnt5"></b></td>
    			<td><b id="avg_star5"></b></td>
    		</tr>
    		<tr>
    			<td><b>7</b></td>
    			<td><b id="Name6"></b><td>
    			<td><b id="rev_cnt6"></b></td>
    			<td><b id="avg_star6"></b></td>
    		</tr>
    		<tr>
    			<td><b>8</b></td>
    			<td><b id="Name7"></b><td>
    			<td><b id="rev_cnt7"></b></td>
    			<td><b id="avg_star7"></b></td>
    		</tr>
    		<tr>
    			<td><b>9</b></td>
    			<td><b id="Name8"></b><td>
    			<td><b id="rev_cnt8"></b></td>
    			<td><b id="avg_star8"></b></td>
    		</tr>
    		<tr>
    			<td><b>10</b></td>
    			<td><b id="Name9"></b><td>
    			<td><b id="rev_cnt9"></b></td>
    			<td><b id="avg_star9"></b></td>
    		</tr>
    		<tr>
    			<td><b>11</b></td>
    			<td><b id="Name10"></b><td>
    			<td><b id="rev_cnt10"></b></td>
    			<td><b id="avg_star10"></b></td>
    		</tr>
    		<tr>
    			<td><b>12</b></td>
    			<td><b id="Name11"></b><td>
    			<td><b id="rev_cnt11"></b></td>
    			<td><b id="avg_star11"></b></td>
    		</tr>
    		<tr>
    			<td><b>13</b></td>
    			<td><b id="Name12"></b><td>
    			<td><b id="rev_cnt12"></b></td>
    			<td><b id="avg_star12"></b></td>
    		</tr>
    		<tr>
    			<td><b>14</b></td>
    			<td><b id="Name13"></b><td>
    			<td><b id="rev_cnt13"></b></td>
    			<td><b id="avg_star13"></b></td>
    		</tr>
    		<tr>
    			<td><b>15</b></td>
    			<td><b id="Name14"></b><td>
    			<td><b id="rev_cnt14"></b></td>
    			<td><b id="avg_star14"></b></td>
    		</tr>
    		<tr>
    			<td><b>16</b></td>
    			<td><b id="Name15"></b><td>
    			<td><b id="rev_cnt15"></b></td>
    			<td><b id="avg_star15"></b></td>
    		</tr>
    		<tr>
    			<td><b>17</b></td>
    			<td><b id="Name16"></b><td>
    			<td><b id="rev_cnt16"></b></td>
    			<td><b id="avg_star16"></b></td>
    		</tr>
    		<tr>
    			<td><b>18</b></td>
    			<td><b id="Name17"></b><td>
    			<td><b id="rev_cnt17"></b></td>
    			<td><b id="avg_star17"></b></td>
    		</tr>
    		<tr>
    			<td><b>19</b></td>
    			<td><b id="Name18"></b><td>
    			<td><b id="rev_cnt18"></b></td>
    			<td><b id="avg_star18"></b></td>
    		</tr>
    		<tr>
    			<td><b>20</b></td>
    			<td><b id="Name19"></b><td>
    			<td><b id="rev_cnt19"></b></td>
    			<td><b id="avg_star19"></b></td>
    		</tr>
    		
    </table>


	
    <iframe src="../footer.html" style="width: 69vw; border: none"></iframe>
</body>
</html>