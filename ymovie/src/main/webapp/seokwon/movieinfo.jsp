<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.*" %>
<%@ page import="member.*" %>
<%@ page import="actor.*" %>
<%@ page import="director.*" %>
<%@ page import="review.*" %>
<%@ page import="api_DB.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="defaultConn.getConn" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="sessionServlet.*"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<link href="movieinfo.css" rel="stylesheet" />
<script>
	function getAPIAboutMovie() {
		<%
		Connection con = null;
        getConn getCon = new getConn();
        con = getCon.getConnection();
		request.setCharacterEncoding("UTF-8");
        String movcode=request.getParameter("movcode");
		%>
		
	 	<%movieDAO dao = new movieDAO();%>
	 	<%actorDAO dao1 = new actorDAO();%>
	 	<%directorDAO dao2 = new directorDAO();%>
	 	<%posterAPI posterAPI = new posterAPI();%>
	 	<%ArrayList<movieDTO> data = dao.selectByCode(movcode);%> 
	 	<%ArrayList<actorDTO> data1 = dao1.selectByMovie(con, movcode);%>

       		document.getElementById("img").src = '<%=posterAPI.getPoster(movcode)%>';
       		document.getElementById("movie_name").innerText = '<%=data.get(0).getMov_name()%>';
       		document.getElementById("playdate").innerText = '<%=data.get(0).getMov_year()%>';
       		document.getElementById("director").innerText = '<%=dao2.selectByMovie(con, movcode).get(0).getDir_director()%>';
       		<%System.out.println(data1.size());
       		%>
       		<%for(int i=0; i<data1.size(); i++){%>
       		document.getElementById("actor<%=i%>").innerText = '<%=data1.get(i).getAct_actor()%>';
       		<%}%>
       		document.getElementById("genre").innerText = '<%=data.get(0).getMov_genre()%>';
       		document.getElementById("avg_star").innerText = '<%=data.get(0).getStarAvg()%>';
       		document.getElementById("writing_review").setAttribute('onClick', "location.href='writingreview.jsp?movcode=<%=movcode%>'");
       		insertReview();
   }

</script>
</head>
<body onload="getAPIAboutMovie()">
    <%@include file="../header.jsp" %>
    <div id="mi" style="padding: 10vh 10vw 10vh 10vw; background-color: #f2f2f2">
	
    <h1 class="title">영화상세정보</h1>
    <div class="movie-info">
	<div class="poster-box">
		<img class="poster-thumbnail" id="img" src="" width="197px" height="273"><!-- src="DB 이미지 주소" -->
	</div>
	
	<div class="info-box">
		<ul>
		<li>제목: <span id="movie_name" class="txt_num"></span></li>
		<li>개봉: <span id="playdate" class="txt_num"></span>년</li>
		<li>감독: <span id="director" class="txt_num"></span></li>
		<li>배우: <span id="actor0" class="txt_num"></span>, <span id="actor1" class="txt_num"></span>, <span id="actor2" class="txt_num"></span>, <span id="actor3" class="txt_num"></span>, <span id="actor4" class="txt_num"></span>, <span id="actor5" class="txt_num"></span>, <span id="actor6" class="txt_num"></span>, <span id="actor7" class="txt_num"></span>, <span id="actor8" class="txt_num"></span>, <span id="actor9" class="txt_num"></span></li>
		<li>장르: <span id="genre" class="txt_num"></span></li>
		<li>평균 별점: <span id="avg_star" class="txt_num"></span></li>
		</ul>
	</div>
</div>
<div class="item">
<div  class="rev_count">
	<label>페이지 당 리뷰 개수 선택:</label>
    <select name="itemsPerPage" id="itemsPerPage">
            <option value="5" selected>5</option>
            <option value="10">10</option>
            <option value="20">20</option>
            <option value="30">30</option>
        </select>
    </div>
    
<div class="button">
	<div class="effect"></div>
	<a id="writing_review" onclick="">리뷰 작성</a>
</div>
</div>

<div><!-- 리뷰 페이징 부분 -->
	
        
	<table class="review_table">
		<tbody class="review_table_real">
		</tbody>
	</table>

	<ul class="pagination">
            <li class="prev"><a href="#" id="prev">&#139;</a></li>
            <li class="next"><a href="#" id="next">&#155;</a></li>
        </ul>

</div>

</div>
	
    <iframe src="../footer.html" style="width: 69vw; border: none"></iframe>
</body>
<script type="text/javascript">
        let tbd = document.querySelector('tbody');
        let tr = tbd.getElementsByTagName('tr');
        let select = document.querySelector('select');
        let ul = document.querySelector('.pagination');     
        
        let arrayTr=[];
            
            for(let i = 0; i < tr.length; i++)
            {
                arrayTr.push(tr[i]);        
            }     
        
        select.onchange=rowCount;
        
        function rowCount(e) 
        {
          let neil= ul.querySelectorAll('.list');
          neil.forEach(n=>n.remove());
          let limit= parseInt(e.target.value);
          displayPage(limit);
        }
        function displayPage(limit) 
        {
          tbd.innerHTML='';
          for (let i = 0; i < limit; i++)
          {
            tbd.appendChild(arrayTr[i]);
          }
          buttonGenerator(limit);
        }
        
        displayPage(5);<%--리뷰 페이지 초기값--%>
        function buttonGenerator(limit) 
        {
          const nofTr=arrayTr.length;
          if (nofTr <= limit) 
          {
            ul.style.display='none';
          }
          else
          {
            ul.style.display='flex';
            const nofPage = Math.ceil(nofTr / limit);
            
            for (i = 1; i <= nofPage; i++) 
            {
              let li=document.createElement('li');
              li.className='list';
              let a=document.createElement('a');
              a.className='page-link';
              a.href='#';
              a.setAttribute('data-page',i);
              li.appendChild(a);
              a.innerText=i;
              ul.insertBefore(li,ul.querySelector('.next'));
              
              a.onclick=e=>
              {
                let x = e.target.getAttribute('data-page');
                tbd.innerHTML='';
                x--;
                let start = limit * x;
                let end = start+limit;
                let page = arrayTr.slice(start,end);
                for (let i = 0; i < page.length; i++) 
                {
                  let item= page[i];
                  tbd.appendChild(item);
                }
              }
            }
          }
          let z = 0;
          function nextElement() 
          {
            if (this.id=='next') 
            {
              z == arrayTr.length - limit ? (z=0) : (z+=limit);
            }
            if (this.id=='prev') 
            {
              z == arrayTr.length <!-- or 0 --> ? arrayTr.length - limit : (z-=limit);
            }
            tbd.innerHTML='';
            
            for (let c = z; c < z + limit; c++) 
            {
              tbd.appendChild(arrayTr[c]);
            }
          }
          document.getElementById('prev').onclick=nextElement;
          document.getElementById('next').onclick=nextElement;
        }
        
        function createMovieDiv(ID, reviewText, thumbs, starRating) 
        {
        	var userID = document.createElement("label");
            var review = document.createElement("div");
            var userThumb = document.createElement("label");
            var userStar = document.createElement("label");
            
            var paragraph = document.createElement("p");            
            const star = "★";
            
            var newID = document.createTextNode(ID);
            var newText = document.createTextNode(reviewText);  
            var newStar = document.createTextNode(star.repeat(starRating));
            
            userStar.className = "reviewStars";
            userStar.setAttribute('id', 'getStar');
            
            if(thumbs)
            {
                userThumb.innerHTML = "&#128077;";
                userThumb.setAttribute('id', 'userUp');
            }
            else
            {
                userThumb.innerHTML = "&#128078;";
                userThumb.setAttribute('id', 'userDown');
            }
                        
            review.className = "review1";
            
            userID.appendChild(newID);                    
            
            paragraph.appendChild(newText);
            userStar.appendChild(newStar);
                        
            review.appendChild(userID);
            review.appendChild(userThumb);
            review.appendChild(userStar);
            
            review.appendChild(paragraph);
            
            
            return review;
        }
        function putReview(movie)
        {
            var row = document.createElement("tr");
            var cell = document.createElement("td");
            cell.appendChild(movie);
            row.appendChild(cell);
            tbd.appendChild(row);
        }
       function insertReview() 
       {
    	   <%reviewDAO dao3 = new reviewDAO();%>
    	   <%
           con = getCon.getConnection();
           %>
    	   <%ArrayList<reviewDTO> list = dao3.selectByMovie(con, movcode);%>
    	   
    	   <%if(list.isEmpty()) {%>
    	   		alert("리뷰가 없습니다! 리뷰를 어서 작성해 주세요.><");
    	   <%}
    	  	else {%>
    	   <%for (int i = 0; i < list.size(); i++) {%>
    		   putReview(createMovieDiv("<%=list.get(i).getMem_id()%>", "<%=list.get(i).getRev_context()%>", <%=list.get(i).getRev_thumbs()%>, <%=list.get(i).getRev_star()%>));
    	   <%}%>
    	   <%}%>
    	   
    	   
      }
</script>
</html>