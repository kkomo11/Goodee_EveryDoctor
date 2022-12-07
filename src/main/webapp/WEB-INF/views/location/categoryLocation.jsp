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
        .map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
        .map_wrap {position:relative;width:100%;height:350px;}
        #category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
        #category li {float:left;list-style: none;width:50px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
        #category li.on {background: #eee;}
        #category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
        #category li:last-child{margin-right:0;border-right:0;}
        #category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
        #category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
        #category li .bank {background-position: -10px 0;}
        #category li .mart {background-position: -10px -36px;}
        #category li .pharmacy {background-position: -10px -72px;}
        #category li .oil {background-position: -10px -108px;}
        #category li .cafe {background-position: -10px -144px;}
        #category li .store {background-position: -10px -180px;}
        #category li.on .category_bg {background-position-x:-46px;}
        .placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
        .placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
        .placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
        .placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
        .placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
        .placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
        .placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
        .placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
        .placeinfo .tel {color:#0f7833;}
        .placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
    </style>
</head>
<body>
        <!-- 지도가 표시될 div -->
        <!-- <div id="map" style="width:100%;height:350px;"></div> -->
  
        <div class="map_wrap">
            <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
            <ul id="category">
                <li id="BK9" data-order="0"> 
                    <span class="category_bg bank"></span>
                    동물병원
                </li>       
                <li id="MT1" data-order="1"> 
                    <span class="category_bg mart"></span>
                    약국
                </li>  
                <li id="PM9" data-order="2"> 
                    <span class="category_bg pharmacy"></span>
                    약국
                </li>    
            </ul>
        </div>

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
            // 중심 좌표나 확대 수준이 변경되면 발생한다.
            // 단, 애니메이션 도중에는 발생하지 않는다.
            kakao.maps.event.addListener(map,'idle',searchPlaces);
    
            //커스텀 오버레이의 컨텐츠 노드에 css class 추가
            contentNode.className= 'placeinfo_wrap'
    
            //커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
            //지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap메소드를 등록
            //Map 객체의 이벤트를 막는다.
            //보통 CustomOverlay의 content 혹은 외부 Element의 이벤트 핸들러에서 지도의 이벤트를 막고 싶을 경우 사용한다.
            //이벤트의 핸들러 내부에서 이 함수를 사용하며, 이벤트의 핸들링이 끝나면 Map 객체의 이벤트는 다시 정상 동작하게 된다.
            addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
            addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
    
            //커스텀 오버레이 컨텐츠를 설정
            placeOverlay.setContent(contentNode);
    
            //각 카테고리에 클릭 이벤트를 등록
            addCategoryClickEvent();
    
    
            //엘리먼트에 이벤트 핸들러를 등록하는 함수
            function addEventHandle(target,type,callback){
                if(target.addEventListener){
                    target.addEventListener(type,callback);
                }else{
                    target.attachEvent('on' + type, callback);
                }
            }
    
            //카테고리 검색을 요청하는 함수
            function searchPlaces(){
                if(!currCategory){
                    return;
                }
    
                //커스텀 오버레이 숨김
                placeOverlay.setMap(null);
    
                //지도에 표시되고 있는 마커를 제거
                removeMarker();
    
                ps.categorySearch(currCategry,placesSearchCB,{useMapBounds:true})
            }
    
            //장소검색이 완료됐을 때 호출되는 콜백함수 
            function placesSearchCB(data,status,pagination){
                if(status === kakao.maps.servcies.Status.OK){
                    //정상적으로 검색이 완료됐으면 지도에 마커를 표출    
                    displayPlaces(data);

                }else if(status === kakao.maps.servcies.Status.ZERO_RESULT){
                    //검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성
    
                }else if(status === kakao.maps.services.Status.ERROR){
                    //에러로 인해 검색결과가 나오지 않는 경우 해야할 처리가 있다면 이곳에 작성
                }
            }
    
            //지도에 마커를 표출하는 함수
            function displayPlaces(places){
                //몇번째 카테고리가 선택되어 있는지 얻어옵니다
                //이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용
                let order = document.getElementById(currCategory).getAttribute('data-order');
    
                for(let i=0; i<places.length; i++){
    
                    //마커를 생성하고 지도에 표시
                    let marker = addMarker(new kakao.maps.LagLng(places[i].y, places[i].x),order);
    
                    //마커와 검색결과 항목을 클릭 했을 때
                    (function(marker,place){
                        kakao.maps.event.addEventListener(marker,'click' ,function(){
                            displayPlaceInfo(place);
                        })
                    });(marker,places[i]);
    
                }
            }
    
            //마커를 생성하고 지도위에 마커를 표시하는 함수
            function addMarker(position,order){
                let imageSrc ='',   // 마커이미지, 스프라이트 이미지를 사용하기
                    imageSize = new kakao.maps.Size(27,28), //마커 이미지의 크기
                    imgOptions = {
                        spriteSize : new kakao.maps.Size(72,208),    //스프라이트 이미지의 크기
                        spriteOrigin : new kakao.maps.Point(46,(order*36)),  //스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                        offset : new kakao.maps.Point(11,28)    //마커 좌표에 일치시킬 이미지 내에서의 좌표
                    },
                    markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize,imgOption),
                    marker = new kakao.maps.Marker({
                        position: position, //마커의 위치
                        image : markerImage
                    });
                marker.setMap(map); //지도 위에 마커를 표출
                markers.push(marker);   //배열에 생성된 마커를 추가
                
                return marker;
            }
    
            //지도 위에 표시되고 있는 마커를 모두 제거합니다.
            function removeMarker(){
                for(let i=0; i< markers.length; i++){
                    markers[i].setMap(null);
                }
                markers =[];
            }
    
            //클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수
            function displayPlaceInfo(place){
                let content = '<div class="placeinfo">'
                            +   '<a class="title" href="'+ place.place_url +'" target="_blank" title="'+place.place_name+'" >'+place.place_name+'</a>';
    
                if (place.road_address_name) {
                        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
                    }  else {
                        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
                    }                
                
                    content += '    <span class="tel">' + place.phone + '</span>' + 
                                '</div>' + 
                                '<div class="after"></div>';
    
                contentNode.innerHTML = content;
                placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
                placeOverlay.setMap(map);             
            }
    
            //각 카테고리에 클릭 이벤트를 등록
            function addCategoryClickEvent(){
                let category = document.getElementById('category'),
                    children = category.children;
    
                for(let i=0; i<children.length; i++){
                    children[i].onclick = onClickCategory;
                }    
            }
    
            //카테고리를 클릭했을 때 호출되는 함수 입니다.
            function onClickCatgory(){
                let id = this.id,
                    className = this.className;
    
                placeOverlay.setMap(null);
                
                if(className === 'on'){
                    currCategory ='';
                    changeCategryClass();
                    removeMarker();
                }else{
                    currCategory =id;
                    changeCategoryClass(this);
                    searchPlaces();
                }
            }
    
            //클릭된 카테고리에만 클릭된 스타일을 적용하는 함수
            function changeCategoryClass(el){
                let category = document.getElementById('category'),
                    children = category.children,
                    i;
    
                for(i=0; i<children.length; i++){
                    children[i].className ='';
                }
                if(el){
                    el.clasName ='on';
                }    
            }
    
        </script>
</body>
</html>