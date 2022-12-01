<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f74af817be66222985c3a1eadae6b460&libraries=services"></script>
    <title>Document</title>
    <style>
        #mapwrap{position:relative;overflow:hidden;}
        .category, .category *{margin:0;padding:0;color:#000;}   
        .category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
        .category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
        .category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
        .category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;} 
        .category .ico_coffee {background-position:-10px 0;}  
        .category .ico_store {background-position:-10px -36px;}   
        .category .ico_carpark {background-position:-10px -72px;}
    </style>
</head>
<body>
        <!-- 지도가 표시될 div -->
        <div id="map" style="width:100%;height:350px;"></div>

    <script>
        //마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀 오버레이
        let placeOverlay = new kakao.maps.CustomOverlay({zIndex:1})
        contentNode = document.createElement('div'),    //커스텀 오버레이의 컨텐츠 엘리먼트
        markers =[],    //마커를 담을 배열
        currCategory = '';  //현재 선택된 카테고리를 가지고 있을 변수

        let mapContainer = document.getElementById('map'),  //지도를 표시할 div
            mapOption = {
                center : new kakao.maps.LatLng(37.4787931,126.8807551), //지도의 중심좌표
                level : 3   //지도의 확대 레벨
            }
        
        //지도를 생성
        let map = new kakao.maps.Map(mapContainer,mapOption);

        //장소 검색 객체를 생성
        let ps = new kakao.maps.services.Places(map);
        
        //지도에 idle이벤트를 등록
        kakao.maps.event.addListener(map,'idle',searchPlaces);

        //커스텀 오버레이의 컨텐츠 노드에 css class 추가
        contentNode.className= 'placeinfo_wrap'

        //커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
        //지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap메소드를 등록
        
        
    </script>
</body>
</html>