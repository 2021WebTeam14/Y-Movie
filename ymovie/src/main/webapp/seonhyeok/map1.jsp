<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Y-Movie</title>
    <link href="css/map1.css" rel="stylesheet" />
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22e4124c161041fc832c09fac32fb1b1"></script>
    <script type="text/javascript" src="map1.js"></script>
</head>
<body>
<div class="header">
        <img src="img/logo.png" alt="Y-Movie" width="297px" height="100px" />
        <div class="signNav">
            <div class="sign">
                <input class="signIn" type="button" value="Sign in" onclick="location.href='signIn.jsp';" />
                <input class="signOut" type="button" value="Sign up" onclick="location.href='signUp.jsp';" />
            </div>
            <nav class="nav">
                <a href="/html/intro">영화 추천</a> |
                <a href="/css/intro">영화 리뷰</a> |
                <a href="/javascript/intro">박스오피스 순위</a> |
                <a href="/javascript/intro">영화관 찾기</a> |
                <a href="/javascript/intro">마이페이지</a>
            </nav>
        </div>
    </div>
    <label for="adress"></label>
    <div class=searchbar>
        <input type="text" name="adress">
        <button type="button" onclick="getValue()">
            검색
        </button>

        <div class="container">
            <div id="map" style="width:500px;height:350px;"></div>       
        </div>
        <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  

    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    var temp;

    function input(){
        var input = document.getElementById("input").value;
        temp = input;
        }

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(function address(){
        document.getElementById("address").value = temp;
    }, function(result, status) {

        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
    });    
        
        </script>

    </div>
</body>
</html>