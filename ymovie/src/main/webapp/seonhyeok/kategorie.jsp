<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.*"%>
<%@ page import="api_DB.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<title>Y-Movie</title>
<link href="kategorie.css" rel="stylesheet" type="text/css">
<script>
	 function getRecommand() {
		<%movieDAO dao = new movieDAO();%>
		<%posterAPI posterAPI = new posterAPI();%>
        <%ArrayList<ArrayList<CodeNameYearDTO>> data = dao.getRecommandsByCate("qwer");%> 
        <%for (int i = 0; i < 8; i++) {%>
	        document.getElementById("img<%=i%>").src = '<%=posterAPI.getPoster(data.get(0).get(i).getCode())%>';
	        document.getElementById("Name<%=i%>").innerText = "<%=data.get(0).get(i).getName()%>";
	        document.getElementById("Year<%=i%>").innerText = "<%=data.get(0).get(i).getYear()%>년";
		<%}%>
        <%for (int i = 0; i < 8; i++) {%>
		     document.getElementById("img<%=i+8%>").src = '<%=posterAPI.getPoster(data.get(1).get(i).getCode())%>';
		     document.getElementById("Name<%=i+8%>").innerText = "<%=data.get(1).get(i).getName()%>";
		     document.getElementById("Year<%=i+8%>").innerText = "<%=data.get(1).get(i).getYear()%>년";
		<%}%>
        <%for (int i = 0; i < 8; i++) {%>
			document.getElementById("img<%=i+16%>").src = '<%=posterAPI.getPoster(data.get(2).get(i).getCode())%>';
			document.getElementById("Name<%=i+16%>").innerText = "<%=data.get(2).get(i).getName()%>";
			document.getElementById("Year<%=i+16%>").innerText = "<%=data.get(2).get(i).getYear()%>년";
		<%}%>
		}
</script>
</head>
<body onload="getRecommand()">


	<div class="section_ranking">
		<div class="box_ranking" data-tiara-layer="list">
			<div class="detail_rankinginfo">
				<div class="head_section">
					<h3 class="tit_section">장르</h3>
				</div>
				<ol class="list_movieranking">


					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img0" src="" class="img_thumb">

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
									<img id="img1" src="" class="img_thumb">

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
									<img id="img2" src="" class="img_thumb">

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
									<img id="img3" src="" class="img_thumb">

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
									<img id="img4" src="" class="img_thumb">

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
									<img id="img5" src="" class="img_thumb">

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
									<img id="img6" src="" class="img_thumb">

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
									<img id="img7" src="" class="img_thumb">

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
				</ol>
			</div>
			<div class="detail_rankinginfo">
				<div class="head_section">
					<h3 class="tit_section">배우</h3>
				</div>
				<ol class="list_movieranking">
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img8" src="" class="img_thumb">

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
									<img id="img9" src="" class="img_thumb">

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
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img10" src="" class="img_thumb">

								</div>
							</div>
							<div class="thumb_cont">
								<strong class="tit_item" id="Name10"></strong> <span
									class="txt_info"> <span class="info_txt">개봉<span
										id="Year10" class="txt_num"></span></span>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img11" src="" class="img_thumb">

								</div>
							</div>
							<div class="thumb_cont">
								<strong class="tit_item" id="Name11"></strong> <span
									class="txt_info"> <span class="info_txt">개봉<span
										id="Year11" class="txt_num"></span></span>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img12" src="" class="img_thumb">

								</div>
							</div>
							<div class="thumb_cont">
								<strong class="tit_item" id="Name12"></strong> <span
									class="txt_info"> <span class="info_txt">개봉<span
										id="Year12" class="txt_num"></span></span>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img13" src="" class="img_thumb">

								</div>
							</div>
							<div class="thumb_cont">
								<strong class="tit_item" id="Name13"></strong> <span
									class="txt_info"> <span class="info_txt">개봉<span
										id="Year13" class="txt_num"></span></span>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img14" src="" class="img_thumb">

								</div>
							</div>
							<div class="thumb_cont">
								<strong class="tit_item" id="Name14"></strong> <span
									class="txt_info"> <span class="info_txt">개봉<span
										id="Year14" class="txt_num"></span></span>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img15" src="" class="img_thumb">

								</div>
							</div>
							<div class="thumb_cont">
								<strong class="tit_item" id="Name15"></strong> <span
									class="txt_info"> <span class="info_txt">개봉<span
										id="Year15" class="txt_num"></span></span>
								</span>
							</div>
						</div>
					</li>

				</ol>
			</div>
			<div class="detail_rankinginfo">
				<div class="head_section">
					<h3 class="tit_section">감독</h3>
				</div>
				<ol class="list_movieranking">
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img16" src="" class="img_thumb">
								</div>
							</div>
							<div class="thumb_cont">
								<strong class="tit_item" id="Name16"></strong> <span
									class="txt_info"> <span class="info_txt">개봉<span
										id="Year16" class="txt_num"></span></span>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img17" src="" class="img_thumb">

								</div>
							</div>
							<div class="thumb_cont">
								<strong class="tit_item" id="Name17"></strong> <span
									class="txt_info"> <span class="info_txt">개봉<span
										id="Year17" class="txt_num"></span></span>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img18" src="" class="img_thumb">

								</div>
							</div>
							<div class="thumb_cont">
								<strong class="tit_item" id="Name18"></strong> <span
									class="txt_info"> <span class="info_txt">개봉<span
										id="Year18" class="txt_num"></span></span>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img19" src="" class="img_thumb">

								</div>
							</div>
							<div class="thumb_cont">
								<strong class="tit_item" id="Name19"></strong> <span
									class="txt_info"> <span class="info_txt">개봉<span
										id="Year19" class="txt_num"></span></span>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img20" src="" class="img_thumb">

								</div>
							</div>
							<div class="thumb_cont">
								<strong class="tit_item" id="Name20"></strong> <span
									class="txt_info"> <span class="info_txt">개봉<span
										id="Year20" class="txt_num"></span></span>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img21" src="" class="img_thumb">

								</div>
							</div>
							<div class="thumb_cont">
								<strong class="tit_item" id="Name21"></strong> <span
									class="txt_info"> <span class="info_txt">개봉<span
										id="Year21" class="txt_num"></span></span>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img22" src="" class="img_thumb">

								</div>
							</div>
							<div class="thumb_cont">
								<strong class="tit_item" id="Name22"></strong> <span
									class="txt_info"> <span class="info_txt">개봉<span
										id="Year22" class="txt_num"></span></span>
								</span>
							</div>
						</div>
					</li>
					<li>
						<div class="item_poster">
							<div class="thumb_item">
								<div class="poster_movie">
									<img id="img23" src="" class="img_thumb">

								</div>
							</div>
							<div class="thumb_cont">
								<strong class="tit_item" id="Name23"></strong> <span
									class="txt_info"> <span class="info_txt">개봉<span
										id="Year23" class="txt_num"></span></span>
								</span>
							</div>
						</div>
					</li>

				</ol>
			</div>
		</div>
	</div>

</body>
</html>