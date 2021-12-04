<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
<link href="../writingreview.css" rel="stylesheet" type="text/css">

<style>	body{margin: 10vh 15vw 10vh 15vw;}</style>
</head>
<body>
    <iframe src="../header.html" style="width: 69vw; border: none;"></iframe>

<div class="head">
    <h2 class="title">리뷰작성</h2>
</div>
<div class="search">
	<form>
		<input type="text" name="moviename" class="text-field" placeholder="영화제목">
		<input type="submit" value="검색" class="submit-btn">
	</form>
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

	
    <iframe src="../footer.html" style="width: 69vw; border: none"></iframe>
</body>
</html>