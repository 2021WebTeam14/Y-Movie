<%@page import="org.apache.tomcat.jdbc.naming.GenericNamingResourcesFactory"%>
<%@page import="sessionServlet.storeSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter"%>
	
<!DOCTYPE html>
<html>
<head>
	<title>Y-Movie</title>
	 <link href="interest_movie.css" rel="stylesheet" type="text/css">
	 <script>
	 function getRecommand() {
		 <%movieDAO dao = new movieDAO();%>
		 <%posterAPI posterAPI = new posterAPI();%>
		
	        <%ArrayList<movieDTO> data0 = dao.selectByGenre("드라마");%> 
	        document.getElementById("img0").src = '<%=posterAPI.getPoster(data0.get(0).getMov_code())%>';
	        document.getElementById("Name0").innerText = "<%=data0.get(0).getMov_name()%>";
	        document.getElementById("Year0").innerText = "<%=data0.get(0).getMov_year()%>년";	 
	        
	        <%ArrayList<movieDTO> data1 = dao.selectByGenre("전쟁");%> 
	        document.getElementById("img1").src = '<%=posterAPI.getPoster(data1.get(1).getMov_code())%>';
	        document.getElementById("Name1").innerText = "<%=data1.get(1).getMov_name()%>";
	        document.getElementById("Year1").innerText = "<%=data1.get(1).getMov_year()%>년";	
	        
	        <%ArrayList<movieDTO> data2 = dao.selectByGenre("서부극");%> 
	        document.getElementById("img2").src = '<%=posterAPI.getPoster(data2.get(2).getMov_code())%>';
	        document.getElementById("Name2").innerText = "<%=data2.get(2).getMov_name()%>";
	        document.getElementById("Year2").innerText = "<%=data2.get(2).getMov_year()%>년";	
	        
	        <%ArrayList<movieDTO> data3 = dao.selectByGenre("코미디");%> 
	        document.getElementById("img3").src = '<%=posterAPI.getPoster(data3.get(3).getMov_code())%>';
	        document.getElementById("Name3").innerText = "<%=data3.get(3).getMov_name()%>";
	        document.getElementById("Year3").innerText = "<%=data3.get(3).getMov_year()%>년";	
	        
	        <%ArrayList<movieDTO> data4 = dao.selectByGenre("공포(호러)");%> 
	        document.getElementById("img4").src = '<%=posterAPI.getPoster(data4.get(4).getMov_code())%>';
	        document.getElementById("Name4").innerText = "<%=data4.get(4).getMov_name()%>";
	        document.getElementById("Year4").innerText = "<%=data4.get(4).getMov_year()%>년";	
	        
	        <%ArrayList<movieDTO> data5 = dao.selectByGenre("다큐멘터리");%> 
	        document.getElementById("img5").src = '<%=posterAPI.getPoster(data5.get(5).getMov_code())%>';
	        document.getElementById("Name5").innerText = "<%=data5.get(5).getMov_name()%>";
	        document.getElementById("Year5").innerText = "<%=data5.get(5).getMov_year()%>년";
	        
	        <%ArrayList<movieDTO> data6 = dao.selectByGenre("사극");%> 
	        document.getElementById("img6").src = '<%=posterAPI.getPoster(data6.get(6).getMov_code())%>';
	        document.getElementById("Name6").innerText = "<%=data6.get(6).getMov_name()%>";
	        document.getElementById("Year6").innerText = "<%=data6.get(6).getMov_year()%>년";
	        
	        <%ArrayList<movieDTO> data7 = dao.selectByGenre("액션");%> 
	        document.getElementById("img7").src = '<%=posterAPI.getPoster(data7.get(7).getMov_code())%>';
	        document.getElementById("Name7").innerText = "<%=data7.get(7).getMov_name()%>";
	        document.getElementById("Year7").innerText = "<%=data7.get(7).getMov_year()%>년";

	        <%ArrayList<movieDTO> data8 = dao.selectByGenre("판타지");%> 
	        document.getElementById("img8").src = '<%=posterAPI.getPoster(data8.get(8).getMov_code())%>';
	        document.getElementById("Name8").innerText = "<%=data8.get(8).getMov_name()%>";
	        document.getElementById("Year8").innerText = "<%=data8.get(8).getMov_year()%>년";
	        
	        <%ArrayList<movieDTO> data9 = dao.selectByGenre("멜로/로맨스");%> 
	        document.getElementById("img9").src = '<%=posterAPI.getPoster(data9.get(9).getMov_code())%>';
	        document.getElementById("Name9").innerText = "<%=data9.get(9).getMov_name()%>";
	        document.getElementById("Year9").innerText = "<%=data9.get(9).getMov_year()%>년";
	        
	        <%ArrayList<movieDTO> data10 = dao.selectByGenre("애니메이션");%> 
	        document.getElementById("img10").src = '<%=posterAPI.getPoster(data10.get(10).getMov_code())%>';
	        document.getElementById("Name10").innerText = "<%=data10.get(10).getMov_name()%>";
	        document.getElementById("Year10").innerText = "<%=data10.get(10).getMov_year()%>년";
	        
	        <%ArrayList<movieDTO> data11 = dao.selectByGenre("어드벤처");%> 
	        document.getElementById("img11").src = '<%=posterAPI.getPoster(data11.get(11).getMov_code())%>';
	        document.getElementById("Name11").innerText = "<%=data11.get(11).getMov_name()%>";
	        document.getElementById("Year11").innerText = "<%=data11.get(11).getMov_year()%>년";
	        
	        <%ArrayList<movieDTO> data12 = dao.selectByGenre("범죄");%> 
	        document.getElementById("img12").src = '<%=posterAPI.getPoster(data12.get(12).getMov_code())%>';
	        document.getElementById("Name12").innerText = "<%=data12.get(12).getMov_name()%>";
	        document.getElementById("Year12").innerText = "<%=data12.get(12).getMov_year()%>년";
	        
	        <%ArrayList<movieDTO> data13 = dao.selectByGenre("SF");%> 
	        document.getElementById("img13").src = '<%=posterAPI.getPoster(data13.get(13).getMov_code())%>';
	        document.getElementById("Name13").innerText = "<%=data13.get(13).getMov_name()%>";
	        document.getElementById("Year13").innerText = "<%=data13.get(13).getMov_year()%>년";
	        
	        <%ArrayList<movieDTO> data14 = dao.selectByGenre("미스터리");%> 
	        document.getElementById("img14").src = '<%=posterAPI.getPoster(data14.get(14).getMov_code())%>';
	        document.getElementById("Name14").innerText = "<%=data14.get(14).getMov_name()%>";
	        document.getElementById("Year14").innerText = "<%=data14.get(14).getMov_year()%>년";
	        
	        <%ArrayList<movieDTO> data15 = dao.selectByGenre("가족");%> 
	        document.getElementById("img15").src = '<%=posterAPI.getPoster(data15.get(15).getMov_code())%>';
	        document.getElementById("Name15").innerText = "<%=data15.get(15).getMov_name()%>";
	        document.getElementById("Year15").innerText = "<%=data15.get(15).getMov_year()%>년";
	        
	        <%ArrayList<movieDTO> data16 = dao.selectByGenre("뮤지컬");%> 
	        document.getElementById("img16").src = '<%=posterAPI.getPoster(data16.get(0).getMov_code())%>';
	        document.getElementById("Name16").innerText = "<%=data16.get(0).getMov_name()%>";
	        document.getElementById("Year16").innerText = "<%=data16.get(0).getMov_year()%>년";
	        
	        <%ArrayList<movieDTO> data17 = dao.selectByGenre("공연");%> 
	        document.getElementById("img17").src = '<%=posterAPI.getPoster(data17.get(0).getMov_code())%>';
	        document.getElementById("Name17").innerText = "<%=data17.get(0).getMov_name()%>";
	        document.getElementById("Year17").innerText = "<%=data17.get(0).getMov_year()%>년";
	        
	        <%ArrayList<movieDTO> data18 = dao.selectByGenre("기타");%> 
	        document.getElementById("img18").src = '<%=posterAPI.getPoster(data18.get(0).getMov_code())%>';
	        document.getElementById("Name18").innerText = "<%=data18.get(0).getMov_name()%>";
	        document.getElementById("Year18").innerText = "<%=data18.get(0).getMov_year()%>년";
	        
	    }
	 function getCheckboxValue() {
		 const query = 'input[name="check"]:checked';
		 const selectedEls = 
			 document.querySelectorAll(query);
		 
		 let result = '';
		  selectedEls.forEach((el) => {
		    result += el.value + ' ';
		  });
	 }
	 </script>
</head>
<body onload="getRecommand()">

<div class ="head_section">
		<h1 class=tit_section>관심 영화 설정</h1>
		</div>		
	<div class="box_boxoffice">
		<ol class="list_movieranking">
				<li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                              		  <input type ="checkbox" class="checkbox" id ="check0" name="check" value="드라마"/>
                                      <label for="check0"><img id="img0" src="" class="img_thumb"></label>
                                </div>
                                                            
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name0"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year0" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
			
			<li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                 		<input type ="checkbox" class="checkbox" id ="check1" name="check"/>
                                        <label for="check1"><img id="img1" src="" class="img_thumb"></label>  
                                      
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name1"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year1" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
			<li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                		<input type ="checkbox" class="checkbox" id ="check2" name="check"/>
                                        <label for="check2"><img id="img2" src="" class="img_thumb"></label>
                                     
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name2"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year2" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
                   <li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                            		    <input type ="checkbox" class="checkbox" id ="check3"/>
                                        <label for="check3"> <img id="img3" src="" class="img_thumb"></label>
                                                             
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name3"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year3" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
			<li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check4"/>
                                       <label for="check4">  <img id="img4" src="" class="img_thumb"></label>
                                        
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name4"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year4" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
                   <li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check5"/>
                                        <label for="check5"><img id="img5" src="" class="img_thumb"></label>
                                           
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name5"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year5" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
			<li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check6"/>
                                        <label for="check6"> <img id="img6" src="" class="img_thumb"></label>
                                       
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name6"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year6" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check7"/>
                                        <label for="check7"><img id="img7" src="" class="img_thumb"></label>
                                       
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name7"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year7" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
			<li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check8"/>
                                        <label for="check8"><img id="img8" src="" class="img_thumb"></label>
                                        
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name8"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year8" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
                   <li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check9"/>
                                       <label for="check9"> <img id="img9" src="" class="img_thumb"></label>
                                       
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name9"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year9" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
			 <li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check10"/>
                                       <label for="check10"> <img id="img10" src="" class="img_thumb"></label>
                                      
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name10"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year10" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
		 <li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check11"/>
                                        <label for="check11"><img id="img11" src="" class="img_thumb"></label>
                                       
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name11"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year11" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
			 <li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check12"/>
                                      <label for="check12"><img id="img12" src="" class="img_thumb"></label>
                                       
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name12"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year12" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check13"/>
                                        <label for="check13"><img id="img13" src="" class="img_thumb"></label>
                                     
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name13"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year13" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
                     <li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check14"/>
                                       <label for="check14">  <img id="img14" src="" class="img_thumb"></label>
                                      
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name14"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year14" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
                     <li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check15"/>
                                        <label for="check15"> <img id="img15" src="" class="img_thumb"></label>
                                        
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name15"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year15" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>	
                    <li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check116"/>
                                        <label for="check16"> <img id="img16" src="" class="img_thumb"></label>
                                        
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name16"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year16" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check17"/>
                                        <label for="check17"> <img id="img17" src="" class="img_thumb"></label>
                                        
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name17"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year17" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                <input type ="checkbox" class="checkbox" id ="check18"/>
                                        <label for="check18"> <img id="img18" src="" class="img_thumb"></label>
                                        
                                </div>                             
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item" id="Name18"></strong>
                                <span class="txt_info">
                                        <span class="info_txt">개봉<span id="Year18" class="txt_num"></span></span>                                   
                                </span>
                            </div>
                        </div>
                    </li>
                    <li><input type="submit" class="submit" value="관심 영화 설정"/></li>
                     							
		</ol>
		
	</div>
	
</body>
</html>