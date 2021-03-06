<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Y-Movie</title>
<link href="map1.css" rel="stylesheet" />

</head>
<body onload="loginname()">
<%@include file="../header.jsp" %>
	<div id="map1" style="padding: 100vh 10vw 15vh 10vw; background-color: #f2f2f2">
	
	<label for="adress"></label>
	<div class=searchbar>
		<div class="container">		
			<h1>내 위치 기반 주변 영화관 검색</h1>
			<div id="map" style="width:1300px; height:1px; padding-top: 800px;"></div>
		</div>
	</div>
	<div class="map">
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22e4124c161041fc832c09fac32fb1b1&libraries=services"></script>
	<script>
	function loginname() {
		<%storeSession sessionDAO = new storeSession();%>
	    <%if (sessionDAO.getSession(session) != "")
	    {%>
	        if (document.getElementById("loggedInUser") != null) {
	            document.getElementById("loggedInUser").value = "<%=sessionDAO.getSession(session)%>" + "님";
	    	    document.getElementById("loggedInUser").style.width = document.getElementById("loggedInUser").value.length + 1 + 'ch';
	            }
	    <%}%>
		
	}
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 5
			
		// 지도의 확대 레벨 
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도
				


				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">내 위치!</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}
		var keyword = "";
		var geocoder = new kakao.maps.services.Geocoder();
		var ps = new kakao.maps.services.Places(); 
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		    	keyword = "";
		        for(var i = 0; i < result.length; i++) {
		            if (result[i].region_type === 'H') {
		            	for (var k = 0; result[i].address_name[k] != ' '; k++) {
		            	}
		            	k++;
		            	for (var h = k; result[i].address_name[h] != ' '; h++) {
							keyword += result[i].address_name[h];
						}
						keyword += " 영화관";		
		                break;
		            }
		        }
		    }    
		}
		kakao.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			ps.keywordSearch(keyword, placesSearchCB); 
		});
		
		
		function searchAddrFromCoords(coords, callback) {
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}
        
		


		//키워드로 장소를 검색합니다

		//키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		 if (status === kakao.maps.services.Status.OK) {

		     // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		     // LatLngBounds 객체에 좌표를 추가합니다
		     var bounds = new kakao.maps.LatLngBounds();

		     for (var i=0; i<data.length; i++) {
		         displayMarker2(data[i]);    
		     }       
		 } 
		}

		//지도에 마커를 표시하는 함수입니다
		function displayMarker2(place) {
		    var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		 // 마커를 생성하고 지도에 표시합니다
		 var marker = new kakao.maps.Marker({
		     map: map,
		     position: new kakao.maps.LatLng(place.y, place.x) 
		 });

		 // 마커에 클릭이벤트를 등록합니다
		 kakao.maps.event.addListener(marker, 'click', function() {
		     // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		     infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		     infowindow.open(map, marker);
		 });
		}
		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow
						.setContent('<div style="padding:5px;font-size:12px;">'
								+ place.place_name + '</div>');
				infowindow.open(map, marker);
			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}
		
		
	
	</script>
	</div>
	</div>
	<footer>
		<iframe src="../footer.html" style="width: 100vw; border: none; "></iframe>
	</footer>
	
</body>

</html>