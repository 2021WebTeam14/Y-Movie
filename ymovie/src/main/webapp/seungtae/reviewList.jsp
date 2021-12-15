<%@page import="movie.movieDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="review.*"%>
<%@page import="sessionServlet.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="defaultConn.getConn" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>나의 리뷰</title>
		<link rel="stylesheet" type="text/css" href="reviewList.css">
	</head>
	
	<body onload="start()">
	<%@include file="../header.jsp" %>
    <div id="lst" style="padding: 10vh 10vw 10vh 10vw; background-color: #f2f2f2">
	<h1>나의 리뷰</h1>
	
	<div id="tableInfo">
		<label>페이지 당 표시할 리뷰 개수:</label><select name="itemsPerPage" id="itemsPerPage">
				<option value="3" selected>3</option>
				<option value="5">5</option>
				<option value="10">10</option>
				<option value="15">15</option>
				<option value="20">20</option>
		</select>
		<label id="totalReviews" style="float: right;"></label>
	</div>
	
		<table> 	
			<tbody id="onScreen">
			</tbody>
		</table>
		
		<table style="display: none;">	
			<tbody id="offScreen">
			</tbody>
		</table>


		
		<div id="editReview" class="editing">
			<form class="contents" onsubmit="return confirm('정말 리뷰를 수정하시겠습니까?');" method="post" action="../jaeik/reviewEditProcess.jsp">
			<h2 style="text-align: center;">리뷰 수정</h2>
			<div class="editingReview">
				<span onclick="resetEdit()" class="close" title="창 닫기">&times;</span>
				<div>
					<label id="editReviewTitle">lorem ipsum</label>
					<input type="radio" name="thumbs" id="thumbsUp" value="1"> &#128077;
					<input type="radio" name="thumbs" id="thumbsDown" value="0"> &#128078;
						 <div class="star-rating">			            
				            <input type="radio" id="5-stars" name="rating" value="5" />
				            <label for="5-stars" class="star pr-4">★</label>
				            <input type="radio" id="4-stars" name="rating" value="4" />
				            <label for="4-stars" class="star">★</label>
				            <input type="radio" id="3-stars" name="rating" value="3" />
				            <label for="3-stars" class="star">★</label>
				            <input type="radio" id="2-stars" name="rating" value="2" />
				            <label for="2-stars" class="star">★</label>
				            <input type="radio" id="1-star" name="rating" value="1"  />
				            <label for="1-star" class="star">★</label>
       					</div>
				</div>	
				<textarea rows="5" cols="60" id="reviewArea" name="editedReview" required>lorem ipsum is longer in textarea</textarea>		
				<input type="text" id="movieCode_hidden" name="movieCode" value="" style="display: none;">
			</div>
			
			<div class="editReviewBtn" style="text-align: center;">
				<button type="submit">수정하기</button>
				<button type="button" onclick="resetEdit()">취소</button> 
			</div>
			
			</form>
		</div>
				
		
		
		<ul class="pagination">
			<li class="prev"><a href="#" id="prev">&#139;</a></li>
			<li class="next"><a href="#" id="next">&#155;</a></li>
		</ul>
	</div>
	<iframe src="../footer.html" style="width: 100%; border: none"></iframe>
	</body>
	
	<script type="text/javascript">
		//DB에서 리뷰 로딩하기
		//putMovie와  createMovieDiv 이용 putMovie(createMovieDiv(title, reviewText, thumbs, starRating, reviewNum));
		let tbd = document.getElementById('onScreen');
		let tbd1 = document.getElementById('offScreen');
		let tr = tbd.getElementsByTagName('tr');
		let select = document.querySelector('select');
		let ul = document.querySelector('.pagination');		
		
		let arrayTr=[];
		
		function start() {
			<%
			storeSession sessionDAO = new storeSession();
			if (sessionDAO.getSession(session) == ""){
			 response.setContentType("text/html; charset=UTF-8");
			 PrintWriter outA = response.getWriter();
			 outA.println("<script>alert('로그인이 필요합니다.'); location.href='../initPage.jsp';</script>");
			 outA.flush();
			}
			%>
			
		    <%if (sessionDAO.getSession(session) != "")
		    {%>
		    	if (document.getElementById("loggedInUser") != null) {
		    		document.getElementById("loggedInUser").value = "<%=sessionDAO.getSession(session)%>" + "님";
					}                
		    <%}%>
		    document.getElementById("loggedInUser").style.width = document.getElementById("loggedInUser").value.length + 1 + 'ch';
			
			<%
			movieDAO movDao = new movieDAO();
			Connection con = null;
			getConn getCon = new getConn();
			con = getCon.getConnection();
			reviewDAO dao = new reviewDAO();
			ArrayList<reviewDTO> data = dao.selectById(sessionDAO.getSession(session));
			
			if (data.size() == 0){
				%>
				putReview(createMovieDiv("", "내가 작성한 리뷰가 없습니다...", 0, 1, 0));
				<%
			}
			else {
				for (int i = 0; i < data.size(); i++){
				%>
				putReview(createMovieDiv("<%=movDao.selectByCode(con, data.get(i).getMov_code()).get(0).getMov_name()%>", <%=data.get(i).getMov_code()%>,  "<%=data.get(i).getRev_context()%>", <%=data.get(i).getRev_thumbs()%>, <%=data.get(i).getRev_star()%>, <%=i%>));
				<%
				}
			}%>	
			
			document.getElementById('totalReviews').innerText = "내가 쓴 리뷰 개수: " + "<%=data.size()%>";			
			for(let i = 0; i < tr.length; i++)
			{
				arrayTr.push(tr[i]);		
			}
			
			var btns = tbd.getElementsByTagName('button');
			for(let k = 0; k < tr.length; k++)
			{
				btns[k].addEventListener("click", function() {extract(k+1)});
			}
			
			displayPage(3);
			
			
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
		
		function extract(index) 
		{
			var hiddenCode = document.getElementById("movieCode_hidden");
			var targetReviewRow = tbd1.childNodes[index];
			var targetReviewCell = targetReviewRow.firstChild;
			var targetReview = targetReviewCell.firstChild;
			
			
			document.getElementById("editReviewTitle").innerHTML = targetReview.childNodes[0].innerHTML; //제목
			setThumbs(targetReview.childNodes[1].id); //따봉
			var starNumber = targetReview.childNodes[2].innerHTML; 
			setStar(starNumber.length)//별점
			document.getElementById("reviewArea").innerText = ""; //평가
			hiddenCode.value = targetReview.childNodes[3].value; //코드
			
			document.getElementById('editReview').style.display="block";
		}
		
		function setThumbs(pid) 
		{
			var radio = document.getElementsByName('thumbs');
			
			if (pid == "userUp") 
			{
				radio[0].checked = true;
			}
			else if (pid == "userDown") 
			{
				radio[1].checked = true;
			}
		}
		
		function setStar(stars) 
		{
			var radio = document.getElementsByName('rating');
			radio[5 - stars].checked = true;
		}
		
		function putReview(movie)
		{
			var row = document.createElement("tr");
			var cell = document.createElement("td");
			cell.appendChild(movie);
			row.appendChild(cell);
			tbd1.appendChild(row);
			tbd.appendChild(row.cloneNode(true));			
		}
		
		function createMovieDiv(title, code, reviewText, thumbs, starRating, reviewNum) 
		{
			var hiddenCode = document.createElement("input");
			hiddenCode.type = "text";
			hiddenCode.style.display = "none";
			var review = document.createElement("div");
			var userThumb = document.createElement("label");
			var userStar = document.createElement("label");
			var movieTitle = document.createElement("label");
			var paragraph = document.createElement("p");
			var btn = document.createElement("button");			
			const star = "★";
			
			var newTitle = document.createTextNode(title);
			var newText = document.createTextNode(reviewText);
			var newStar = document.createTextNode(star.repeat(starRating));
			
			hiddenCode.value = code;
			
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
						
			review.className = "review";			
			
			btn.innerHTML = "리뷰 수정";
			btn.className = "edit";
			if (title != "") {
				btn.addEventListener("click", function() {extract(reviewNum)});				
			}
						
			movieTitle.appendChild(newTitle);
			paragraph.appendChild(newText);
			userStar.appendChild(newStar);
						
			review.appendChild(movieTitle);
			review.appendChild(userThumb);
			review.appendChild(userStar);
			review.appendChild(hiddenCode);
			review.appendChild(paragraph);
			review.appendChild(btn);
			
			return review;
		}
		
		function resetEdit() 
		{
			var radio1 = document.getElementsByName('thumbs');
			var radio2 = document.getElementsByName('rating');
			
			for(var i=0;i<radio1.length;i++)
			{
				radio1[i].checked = false;
			}
			
			for(var i=0;i<radio2.length;i++)
			{
				radio2[i].checked = false;
			}
			
			document.getElementById('reviewArea').value = "";
			document.getElementById('editReviewTitle').innerHTML = "dummy name";
			document.getElementById('editReview').style.display = "none";
		}
		</script>
</html>