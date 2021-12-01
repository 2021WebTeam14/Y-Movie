<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰 작성</title>
<link href="css/writingreview2.css" rel="stylesheet" />
<style>    body{margin: 10vh 15vw 10vh 15vw;}</style>
</head>
<body>
<h2>리뷰작성</h2>
<div class="movie-info">
  	<div class="info-star">
    <div class="poster-box">
        <img class="poster-thumbnail" src="img/ironman.jpg" width="197px" height="273"><!-- src="DB 이미지 주소" -->
    </div>
  
        <div class="info-box">
            <ul>
            <li>제목: /불러오기/</li>
            <li>개봉일: /불러오기/</li>
            <li>감독: /불러오기/</li>
            <li>배우: /불러오기/</li>
            <li>장르: /불러오기/</li>
            <li>누적 관객수: /불러오기/명</li>
            <li>누적 매출액: /불러오기/원</li>
            <li>평균 별점: /불러오기/</li>
            </ul>
        </div>
        </div>

        <div class="star-rating space-x-4 mx-auto">
            <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
            <label for="5-stars" class="star pr-4">★</label>
            <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
            <label for="4-stars" class="star">★</label>
            <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
            <label for="3-stars" class="star">★</label>
            <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
            <label for="2-stars" class="star">★</label>
            <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
            <label for="1-star" class="star">★</label>
        </div>
    </div>
    <div class="writing-review">
    <form action="" method="">
        <input id="review" type="text" placeholder="리뷰를 작성해 주세요." />
        <input id="submit" type="submit" value="저장"/>
    </form>
</div>
</body>
</html>