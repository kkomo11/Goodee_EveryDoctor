<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>약국찾기</title>
    <c:import url="../temp/boot.jsp"></c:import>
    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .tel {font-size: 11px;color: #888;margin-top: -2px;}
    .desc .reservation {margin-top: 5px !important; margin-left: 109px !important; font-size: 15px; width: 79px; height: 30px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    #map{
        width:1200px;
        height:500px;
        margin-bottom: 300px;
    }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f74af817be66222985c3a1eadae6b460&libraries=services"></script>
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

    
    <script>
        let mapContainer = document.getElementById("map"),  //지도에 표시할 div
            mapOption = {
                center : new kakao.maps.LatLng(37.4787931,126.8807551), //지도 중심좌표
                level : 4 //지도 확대레벨 
            };
        
        let map = new kakao.maps.Map(mapContainer,mapOption);   //지도 생성

        // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
        if (navigator.geolocation) {
            
            // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {
                
                var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도    
                console.log("위경도====",lat,lon)

                let imageSrc="/images/location/locate.png",
                    imageSize= new kakao.maps.Size(50, 50),  //마커이미지의 크기
                    imageOption ={offset: new kakao.maps.Point(27, 69)}   //마커이미지의 옵션 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정

                    
                    
                    //마커의 이미지정보를 가지고 있는 마커이미지 생성
                    let markerImage= new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption),
                        markerPosition = new kakao.maps.LatLng(lat, lon);
                // var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                //     message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다
                
                // 마커와 인포윈도우를 표시합니다
                displayMarker(markerPosition, markerImage);
                    
            });
            
        } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
            
            var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667),
             markerImage= new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption)
                // message = 'geolocation을 사용할수 없어요..'
                
            displayMarker(markerPosition, markerImage);
        }

        // 지도에 마커와 인포윈도우를 표시하는 함수입니다
        function displayMarker(markerPosition, markerImage) {

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({  
                map: map, 
                position: markerPosition,
                image :markerImage
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
        

        function notifyMe() {
            if (!("Notification" in window)) {
               
                alert("This browser does not support desktop notification");
            } else if (Notification.permission === "granted") {

                // const notification = new Notification("Hi there!",{body:'약국을 선택하셨습니다.'});
                // alert("선택 완료~")
                let msg = '해당약국에 처방전을 보냈습니다.';
                notify(msg);

            } else if (Notification.permission !== "denied") {
                alert("알람을 차단하셨습니다.\n브라우저의 사이트 설정에서 변경하실 수 있습니다.")
                // We need to ask the user for permission
                Notification.requestPermission().then((permission) => {
                // If the user accepts, let's create a notification
                if (permission === "granted") {
                    const notification = new Notification("Hi there!");

                    // …
                }
                });
            }
            // At last, if the user has denied notifications, and you
            // want to be respectful there is no need to bother them anymore.
            }

            //알림 띄우기
            function notify(msg){
                let options= {
                    body :msg
                }

                //데스크톱 알림 요청
                let notification = new Notification("약국선택 완료!",options);

                //3초뒤 알람 닫기
                setTimeout(function(){
                    notification.close();
                },3000);
            }
        //마커를 표시할 위치와 샤싣 객체 배열

        //주소- 좌표 번환객채 생성
        let geocoder = new kakao.maps.services.Geocoder();
        //마커를 담을 배열
        let vc = [];
        //오버레이 담을 배열
        let ov =[];

        $.ajax({
            url : './pharmacy',
            type : 'GET',
            traditional : true,
            success : function(data){
                // console.log(data)
                $.each(data, function(index,value){
                    //주소로 좌표를 검색합니다.
                    geocoder.addressSearch(data[index].agencyAddr,function(result,status){
                        //정상적으로 검색이 완료 됐으면
                        if(status === kakao.maps.services.Status.OK){
                            let coords = new kakao.maps.LatLng(result[0].y, result[0].x)
                            // console.log("coords ==", coords);

                            let imageSrc ='/images/location/pharmacy.png',
                                    imageSize = new kakao.maps.Size(40,42),
                                    imageOption = {offset: new kakao.maps.Point(20,42)}

                                let markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption);

                            //결과값으로 받은 위치를 마커로 표시합니다.
                            let marker = new kakao.maps.Marker({
                                map : map,
                                position : coords,
                                image : markerImage
                            });
                            //커스텀 오버레이에 표시할 컨텐츠 입니다.
                            //커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
                            //별도의 이벤트 메소드를 제공하지않습니다.
                            
                            //커스텀 오버레이를 닫기 위해 호출되는 함수입니다.
                            function closeOverlay(){
                                overlay.setMap(null);
                            }
                            let wrap = $('<div class="wrap" />');
                            let info = $('<div class="info" />');
                            let title = $('<div class="title" />').text(data[index].agencyName);
                            let close = $('<div class="close" title="닫기" />').click(closeOverlay);
                            let body = $('<div class="body" />');
                            let img = $('<div class="img" />')
                            let imgtag = $('<img src="/images/location/geolocation2.png" width="73" height="70">')
                            let desc = $('<div class="desc"/>');
                            let ellipsis = $('<div class="ellipsis"/>').text(data[index].agencyAddr);
                            let tel = $('<div class="tel"/>').text(data[index].agencyTel);
                            let reservation = $('<button class="btn btn-outline-secondary reservation" type="button" onclick="notifyMe()" />').text(' 직접수령 ')

                            wrap.append(info);
                            info.append(title).append(body);
                            title.append(close);
                            body.append(img);
                            img.append(imgtag);
                            body.append(desc);
                            desc.append(ellipsis);
                            desc.append(tel);
                            desc.append(reservation);
                            
                            let content = wrap[0];

                            //마커 위에 커스텀오버레이를 표시합니다.
                            //마커를 중심으로 커스텀 오버레이를 표시학 위해 css이용해 위치 설정
                            let overlay = new kakao.maps.CustomOverlay({
                                content : content,
                                map : map,
                                position : marker.getPosition()
                            });

                            ov.push(overlay);
                            //마커를 클릭했을 때 커스텀 오버레이를 표시합니다.
                            kakao.maps.event.addListener(marker, 'click' ,function(){

                                for(let i=0; i<ov.length; i++){
                                    ov[i].setMap(null);
                                }
                                overlay.setMap(map);
                            });

                            closeOverlay();

                            marker.setMap(map)
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