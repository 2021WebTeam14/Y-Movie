<%@page import="sessionServlet.storeSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.*"%>
<%@ page import="api_DB.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter"%>

	
<!DOCTYPE html>
<html>
<head>
	<title>Y-Movie</title>
	 <link href="re_in.css" rel="stylesheet" type="text/css">
	 <script>
	 function getRecommand() {
		<%-- <%
		 storeSession sessionDAO = new storeSession();
		 if (sessionDAO.getSession(session) == ""){
			 response.setContentType("text/html; charset=UTF-8");
			 PrintWriter outA = response.getWriter();
			 outA.println("<script>alert('로그인이 필요합니다.'); location.href='../initPage.jsp';</script>");
			 outA.flush();
		 }
		 %> --%>
		 <% 
         request.setCharacterEncoding("UTF-8");
         String genre=request.getParameter("genre");

         if(genre!=null) 
         {         
     %>
		
		 <%movieDAO dao = new movieDAO();%>
		 <%posterAPI posterAPI = new posterAPI();%>
	        <%ArrayList<movieDTO> data = dao.selectByGenre(genre);%> 
	        <%for(int i=0;i<16;i++){%>
	        document.getElementById("img<%=i%>").src = '<%=posterAPI.getPoster(data.get(i).getMov_code())%>';
	        document.getElementById("Name<%=i%>").innerText = "<%=data.get(i).getMov_name()%>";
	        document.getElementById("Year<%=i%>").innerText = "<%=data.get(i).getMov_year()%>년";	       
	        <%}}%> 
	    } 
	 </script>
</head>
<body onload="getRecommand()">
<div class ="head_section">		
		</div>		
	<div class="box_boxoffice">
		<ol class="list_movieranking">
				<li>
                        <div class="item_poster" >
                            <div class="thumb_item">
                                <div class="poster_movie">
                                        <img id="img0" src="" class="img_thumb">
                                        
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
                                        <img id="img1" src="" class="img_thumb">
                                      
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
                                        <img id="img2" src="" class="img_thumb">
                                     
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
                                        <img id="img3" src="" class="img_thumb">
                                                             
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
                                        <img id="img4" src="" class="img_thumb">
                                        
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
                                        <img id="img5" src="" class="img_thumb">
                                           
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
                                        <img id="img6" src="" class="img_thumb">
                                       
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
                                        <img id="img7" src="" class="img_thumb">
                                       
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
                                        <img id="img8" src="" class="img_thumb">
                                        
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
                                        <img id="img9" src="" class="img_thumb">
                                       
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
                                        <img id="img10" src="" class="img_thumb">
                                      
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
                                        <img id="img11" src="" class="img_thumb">
                                       
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
                                        <img id="img12" src="" class="img_thumb">
                                       
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
                                        <img id="img13" src="" class="img_thumb">
                                     
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
                                        <img id="img14" src="" class="img_thumb">
                                      
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
                                        <img id="img15" src="" class="img_thumb">
                                        
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
	</div>
	
</body>
</html>