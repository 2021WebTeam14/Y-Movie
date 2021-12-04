<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>
	
<!DOCTYPE html>
<html>
<head>
	<title>Y-Movie</title>
	 <link href="css/interest_movie.css" rel="stylesheet" type="text/css">
	 <script>
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
                              		  <input type ="checkbox" class="checkbox" id ="check0"/>
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
                                 		<input type ="checkbox" class="checkbox" id ="check1"/>
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
                                		<input type ="checkbox" class="checkbox" id ="check2"/>
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
                     							
		</ol>
		<input type="submit"/>
	</div>
	
</body>
</html>