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
<link href="star_rank.css" rel="stylesheet" type="text/css">
<script>
	 function getRecommand() {
		 <%movieDAO dao = new movieDAO();%>
		 <%posterAPI posterAPI = new posterAPI();%>
		 <%ArrayList<CodeNameYearDTO> data = dao.movStarRank();%> 
	        <%for(int i=0;i<10;i++){%>
	        document.getElementById("img<%=i%>").src = '<%=posterAPI.getPoster(data.get(i).getCode())%>';
	        document.getElementById("Name<%=i%>").innerText = "<%=data.get(i).getName()%>";
	        document.getElementById("Year<%=i%>").innerText = "<%=data.get(i).getYear()%>";	    
	        document.getElementById("img<%=i%>").setAttribute('onClick', "location.href='movieinfo.jsp?movcode=<%=data.get(i).getCode()%>'");
	        <%}%>
	    }
	 </script>
</head>
<body onload="getRecommand()">
<%@include file="../header.jsp" %>
    <div id="starRank" style="height:900px; padding: 10vh 10vw 10vh 10vw; background-color: #f2f2f2">
<h1 class="title">별점순위</h1>
    
<div class="box_boxoffice">
		<ol class="list_movieranking">
			<li>
				<div class="item_poster">
					<div class="thumb_item">
						<div class="poster_movie">
							<span class="rank_num">1</span>
							<img id="img0" src="" class="img_thumb" onclick="">

						</div>
					</div>
					<div class="thumb_cont">
						<strong class="tit_item" id="Name0"></strong> <span
							class="txt_info"> <span class="info_txt">개봉<span
								id="Year0" class="txt_num"></span></span>
						</span>
					</div>
				</div>
			</li>

			<li>
				<div class="item_poster">
					<div class="thumb_item">
						<div class="poster_movie">
						<span class="rank_num">2</span>
							<img id="img1" src="" class="img_thumb" onclick="">

						</div>
					</div>
					<div class="thumb_cont">
						<strong class="tit_item" id="Name1"></strong> <span
							class="txt_info"> <span class="info_txt">개봉<span
								id="Year1" class="txt_num"></span></span>
						</span>
					</div>
				</div>
			</li>
			<li>
				<div class="item_poster">
					<div class="thumb_item">
						<div class="poster_movie">
						<span class="rank_num">3</span>
							<img id="img2" src="" class="img_thumb" onclick="">

						</div>
					</div>
					<div class="thumb_cont">
						<strong class="tit_item" id="Name2"></strong> <span
							class="txt_info"> <span class="info_txt">개봉<span
								id="Year2" class="txt_num"></span></span>
						</span>
					</div>
				</div>
			</li>
			<li>
				<div class="item_poster">
					<div class="thumb_item">
						<div class="poster_movie">
						<span class="rank_num">4</span>
							<img id="img3" src="" class="img_thumb" onclick="">

						</div>
					</div>
					<div class="thumb_cont">
						<strong class="tit_item" id="Name3"></strong> <span
							class="txt_info"> <span class="info_txt">개봉<span
								id="Year3" class="txt_num"></span></span>
						</span>
					</div>
				</div>
			</li>
			<li>
				<div class="item_poster">
					<div class="thumb_item">
						<div class="poster_movie">
						<span class="rank_num">5</span>
							<img id="img4" src="" class="img_thumb" onclick="">

						</div>
					</div>
					<div class="thumb_cont">
						<strong class="tit_item" id="Name4"></strong> <span
							class="txt_info"> <span class="info_txt">개봉<span
								id="Year4" class="txt_num"></span></span>
						</span>
					</div>
				</div>
			</li>
			<li>
				<div class="item_poster">
					<div class="thumb_item">
						<div class="poster_movie">
						<span class="rank_num">6</span>
							<img id="img5" src="" class="img_thumb" onclick="">

						</div>
					</div>
					<div class="thumb_cont">
						<strong class="tit_item" id="Name5"></strong> <span
							class="txt_info"> <span class="info_txt">개봉<span
								id="Year5" class="txt_num"></span></span>
						</span>
					</div>
				</div>
			</li>
			<li>
				<div class="item_poster">
					<div class="thumb_item">
						<div class="poster_movie">
						<span class="rank_num">7</span>
							<img id="img6" src="" class="img_thumb" onclick="">

						</div>
					</div>
					<div class="thumb_cont">
						<strong class="tit_item" id="Name6"></strong> <span
							class="txt_info"> <span class="info_txt">개봉<span
								id="Year6" class="txt_num"></span></span>
						</span>
					</div>
				</div>
			</li>
			<li>
				<div class="item_poster">
					<div class="thumb_item">
						<div class="poster_movie">
						<span class="rank_num">8</span>
							<img id="img7" src="" class="img_thumb" onclick="">

						</div>
					</div>
					<div class="thumb_cont">
						<strong class="tit_item" id="Name7"></strong> <span
							class="txt_info"> <span class="info_txt">개봉<span
								id="Year7" class="txt_num"></span></span>
						</span>
					</div>
				</div>
			</li>
			<li>
				<div class="item_poster">
					<div class="thumb_item">
						<div class="poster_movie">
						<span class="rank_num">9</span>
							<img id="img8" src="" class="img_thumb" onclick="">

						</div>
					</div>
					<div class="thumb_cont">
						<strong class="tit_item" id="Name8"></strong> <span
							class="txt_info"> <span class="info_txt">개봉<span
								id="Year8" class="txt_num"></span></span>
						</span>
					</div>
				</div>
			</li>
			<li>
				<div class="item_poster">
					<div class="thumb_item">
						<div class="poster_movie">
						<span class="rank_num">10</span>
							<img id="img9" src="" class="img_thumb" onclick="">

						</div>
					</div>
					<div class="thumb_cont">
						<strong class="tit_item" id="Name9"></strong> <span
							class="txt_info"> <span class="info_txt">개봉<span
								id="Year9" class="txt_num"></span></span>
						</span>
					</div>
				</div>
			</li>


		</ol>
	</div>
</div>
	
    <iframe src="../footer.html" style="width: 100%; border: none"></iframe>
</body>
</html>