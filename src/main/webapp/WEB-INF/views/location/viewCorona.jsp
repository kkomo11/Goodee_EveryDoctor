<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>코로나 선별검사소</title>
    <c:import url="../temp/boot.jsp"></c:import>
    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 185px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 165px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .tel {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    #map{
        width:1700px;
        height:900px;
        /* margin-bottom: 300px; */
        /* margin-left: 150px; */

    }
    </style>
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
</head>
<body>
    
    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->

    <!-- Start Header Area -->
    <c:import url="../temp/header.jsp"></c:import>
    <!-- End Header Area -->

    <div id="map"></div>

    <!-- Start Footer Area -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f74af817be66222985c3a1eadae6b460&libraries=services"></script>
    <script>
        let mapContainer = document.getElementById("map"),  //지도에 표시할 div
            mapOption = {
                center : new kakao.maps.LatLng(37.4787931,126.8807551), //지도 중심좌표
                level : 6 //지도 확대레벨 
            };
        
        let map = new kakao.maps.Map(mapContainer,mapOption);   //지도 생성

        // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
        if (navigator.geolocation) {
            
            // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {
                
                var lat = position.coords.latitude, // 위도
                    lon = position.coords.longitude; // 경도

                let imageSrc="/images/location/person2.png",
                imageSize= new kakao.maps.Size(60, 59),  //마커이미지의 크기
                imageOption ={offset: new kakao.maps.Point(27, 69)}   //마커이미지의 옵션 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정

                
                
                //마커의 이미지정보를 가지고 있는 마커이미지 생성
                let markerImage= new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption),
                    markerPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                
                
                // 마커와 인포윈도우를 표시합니다
                displayMarker(markerPosition, markerImage);
                    
            });
            
        } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
            
            var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
            markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption)
                
            displayMarker(markerPosition, markerImage);
        }

        // 지도에 마커와 인포윈도우를 표시하는 함수입니다
        function displayMarker(markerPosition, markerImage) {

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({  
                map: map, 
                position: markerPosition,
                image : markerImage
            }); 
            
            // var iwContent = message, // 인포윈도우에 표시할 내용
            //     iwRemoveable = true;

            // // 인포윈도우를 생성합니다
            // var infowindow = new kakao.maps.InfoWindow({
            //     content : iwContent,
            //     removable : iwRemoveable
            // });
            
            // // 인포윈도우를 마커위에 표시합니다 
            // infowindow.open(map, marker);
            
            // 지도 중심좌표를 접속위치로 변경합니다
            map.setCenter(markerPosition);      
        }    
        
        //마커를 표시할 위치와 샤싣 객체 배열

        //주소- 좌표 번환객채 생성
        // let geocoder = new kakao.maps.services.Geocoder();
        let geocoder = new kakao.maps.services.Geocoder();
        // 임시 오버레이
        let temp='';

        // //지도의 현재 중심좌표
        // let center =map.getCenter();
        // //지도 현재영역 반환
        // let bounds = map.getBounds();
        // console.log('bounds : ', bounds);
        // console.log('bounds.String : ', bounds.toString());
        // //영억의 남서쪽 좌표를 얻어옴
        // let swLatLng = bounds.getSouthWest();
        // //영역의 북동쪽 좌표를 얻어옴
        // let neLatLng = bounds.getNorthEast();

        // //영역 정보를 문자열로 얻어오기
        // let boundsStr = bounds.toString(); //((남,서)(북,동)) 형식
        // console.log('boundsStr : ',boundsStr)

        $.ajax({
            url : './ronaco',
            type : 'GET',
            traditional : true,
            success : function(data){
                // console.log(data)
               
                $.each(data, function(index,value){
                    //주소로 좌표를 검색합니다.
                    geocoder.addressSearch(data[index].agencyAddr,function(result,status){
                        let coords = new kakao.maps.LatLng(result[0].y, result[0].x)
                        //정상적으로 검색이 완료 됐으면
                        if(status === kakao.maps.services.Status.OK ){

                                let imageSrc ='/images/location/location.png',
                                    imageSize = new kakao.maps.Size(43,42),
                                    imageOption = {offset: new kakao.maps.Point(20,42)}
                                    
                                let markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption);
                                
                                
                                //결과값으로 받은 위치를 마커로 표시합니다.
                                
                                let marker = new kakao.maps.Marker({
                                    map : map,
                                    position : coords,
                                    image : markerImage
                                });
                                //커스텀 오버레이를 닫기 위해 호출되는 함수입니다.
                                function closeOverlay(){
                                    overlay.setMap(null);
                                }
                                  
                                    //커스텀 오버레이에 표시할 컨텐츠 입니다.
                                            let wrap = $('<div class="wrap" />');
                                            let info = $('<div class="info" />');
                                            let title = $('<div class="title" />').text(data[index].agencyName);
                                            let close = $('<div class="close" title="닫기" />').click(closeOverlay);
                                            let body = $('<div class="body" />');
                                            let img = $('<div class="img" />')
                                            let imgtag = $('<img src="/file/agency/' + data[index].fileVOs[0].fileName+ '\" width="73" height="70"/>');
                                            let desc = $('<div class="desc"/>');
                                            let ellipsis = $('<div class="ellipsis"/>').text(data[index].agencyAddr);
                                            let tel = $('<div class="tel"/>').text(data[index].agencyTel);
                                            let times =$('<div class="time d-flex justify-content-center"/>')
                                            let time1 =$('<div class="time1 me-4"/>')
                                            let time2 =$('<div class="time2"/>')
                                            let weekday =$('<div/>').text('평일 : '+data[index].agencyWorkHourVO.mon)
                                            let sat =$('<div style="color:#5d80de"/>').text('토요일 : '+data[index].agencyWorkHourVO.sat);
                                            // let sun =$('<div style="color:#De5d5d"/>').text('일요일 : '+data[index].agencyWorkHourVO.sun);
                                            let holiday =$('<div style="color:#De5d5d"/>').text('공휴일 : '+data[index].agencyWorkHourVO.holiday);
                                            let lunch =$('<div style="text-align:center"/>').text('점심시간 : '+data[index].agencyWorkHourVO.lunch);
                  
                                            wrap.append(info);
                                            info.append(title).append(body);
                                            title.append(close);
                                            body.append(img);
                                            img.append(imgtag);
                                            body.append(desc);
                                            desc.append(ellipsis);
                                            desc.append(tel);
                                            body.append(times);
                                            times.append(time1);
                                            time1.append(weekday);   //월요일
                                            time1.append(lunch);    //점심시간
                                            // time1.append(wed);   //수요일
                                            // time1.append(fri);   //금요일
                                            times.append(time2);
                                            // time2.append(tue);          //화요일
                                            // time2.append(thu);        //목요일
                                            time2.append(sat);       //토요일
                                            time2.append(holiday);  //공휴일
                                            // time2.append(sun);   //일요일
                                            

                                            

                                            
                                            let content = wrap[0];
                                            
                                            //마커 위에 커스텀오버레이를 표시합니다.
                                            //마커를 중심으로 커스텀 오버레이를 표시학 위해 css이용해 위치 설정
                                            let overlay = new kakao.maps.CustomOverlay({
                                                content : content,
                                                map : map,
                                                position : marker.getPosition()
                                            });
    
                                            // overlays.push(overlay);
    
                                        //마커를 클릭했을 때 커스텀 오버레이를 표시합니다.
                                        kakao.maps.event.addListener(marker, 'click' ,function(){
    
                                            if(temp != '') {
                                                temp.setMap(null);
                                            }
                                            temp = overlay;
    
                                            // for(let j=0; j<overlays.length; j++) {
                                            //     overlays[j].setMap(null);
                                            // }
    
                                            // console.log(data[index]);
                                            overlay.setMap(map)
                                        });
                                        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    
                                            closeOverlay();
                                        });
                                
                                closeOverlay();
    
                                marker.setMap(map)
                            // }//위경도

                            
                        }//if문
                    })
                })
            },
            error : function(xhr,status,error){
                console.log("xhr : ",xhr)
                console.log("status : ", status)

            }
        });
		
    </script>
</body>
</html>