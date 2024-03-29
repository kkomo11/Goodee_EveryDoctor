<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>EveryDoctor</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f74af817be66222985c3a1eadae6b460&libraries=services"></script>
    <c:import url="../temp/boot.jsp"></c:import>
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

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">Doctor Details</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">Home</a></li>
                        <li>Doctor Details</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Item Details -->
    <section class="item-details section">
        <div class="container">
            <div class="top-area">
                <div class="row">
                    <div class="col-lg-6 col-md-12 col-12">
                        <div class="product-images">
                            <main id="gallery">
                                <div class="main-img">
                                    <img src="${doctorVO.fileName}">
                                </div>
                            </main>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-12">
                        <div class="product-info">
                            <div>
                                <h2 class="title">${doctorVO.name} 의사
                                	<c:if test="${not empty doctorVO.medicVO.medicSpecialty}">
                                		<span style="font-size: 16px; color: skyblue; margin-left: 10px;">${doctorVO.medicVO.medicSpecialty} 전문의</span>
                                	</c:if>
                                </h2>
                                <p class="location"><i class="lni lni-map-marker"></i>
                                    <a href="javascript:void(0)">${doctorVO.agencyVO.agencyName}</a>
                                </p>
                                <i class="lni lni-heart like"></i>
                            </div>
                            <div class="list-info">
                                <h3 class="price mb-3"><img class="grade-star" src="/images/star.png"> 4.9</h3> 후기 2059개
                                <ul>
                                    <li><span>친절하게 알려주셨어요</span> 1517</li>
                                    <li><span>꼼꼼하게 진단해주셨어요</span> 1278</li>
                                    <li><span>차후에 대해 걱정해주셨어요</span> 922</li>
                                </ul>
                            </div>
                            <div class="contact-info">
                                <ul>
                                    <li>
                                        <a href="/hospital/diagnosis/reservation?doctorName=${doctorVO.username}" class="call" style="padding-left: 40px;">진료 신청</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item-details-blocks">
                <div class="row">
                    <div class="col-lg-8 col-md-7 col-12">
                        <!-- Start Single Block -->
                        <div class="single-block description">
                            <h3>의사상세</h3>
                            <p>
                                ${doctorVO.medicVO.medicInfo}
                            </p>
                        </div>
                        <!-- End Single Block -->
                        <!-- Start Single Block -->
                        <div class="single-block description">
                            <h3>비급여 진료비</h3>
                            <p>
                                ${doctorVO.medicVO.medicInfo}
                            </p>
                        </div>
                        <!-- End Single Block -->
                        <!-- Start Single Block -->
                        <div class="single-block tags">
                            <h3>진료 시간</h3>
                            <ul>
                                <li><a>월요일 : ${doctorVO.agencyVO.agencyWorkHourVO.mon }</a></li>
                                <li><a>화요일 : ${doctorVO.agencyVO.agencyWorkHourVO.tue }</a></li>
                                <li><a>수요일 : ${doctorVO.agencyVO.agencyWorkHourVO.wed }</a></li>
                                <li><a>목요일 : ${doctorVO.agencyVO.agencyWorkHourVO.thu }</a></li>
                                <li><a>금요일 : ${doctorVO.agencyVO.agencyWorkHourVO.fri }</a></li>
                                <li><a>토요일 : ${doctorVO.agencyVO.agencyWorkHourVO.sat }</a></li>
                                <li><a>일요일 : ${doctorVO.agencyVO.agencyWorkHourVO.sun }</a></li>
                                <li><a>휴일 : ${doctorVO.agencyVO.agencyWorkHourVO.holiday }</a></li>
                                <li><a>점심 : ${doctorVO.agencyVO.agencyWorkHourVO.lunch }</a></li>
                            </ul>
                        </div>
                        <!-- End Single Block -->
                    </div>
                    <div class="col-lg-4 col-md-5 col-12">
                        <div class="item-details-sidebar">
                            <!-- Start Single Block -->
                            <div class="single-block tags">
                                <h3>Tags</h3>
                                <ul>
									<c:forEach items="${doctorVO.hospitalSectionVOs}" var="sectionVO">
	                                    <li><a href="javascript:void(0)">${sectionVO.sectionName}</a></li>
									</c:forEach>
                                </ul>
                            </div>
                            <!-- End Single Block -->
                            <!-- Start Single Block -->
                            <div class="single-block ">
                                <h3>위치</h3>
                                <div class="mapouter">
                                    <div class="gmap_canvas" id="map" data-addr="${doctorVO.agencyVO.agencyAddr}">
                                    <iframe width="100%" height="300" id="gmap_canvas"
                                            frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                                            <a></a><br>
                                        <style>
                                            .mapouter {
                                                position: relative;
                                                text-align: right;
                                                height: 300px;
                                                width: 100%;
                                            }
                                        </style><a href="https://www.embedgooglemap.net">google map code for website</a>
                                        <style>
                                            .gmap_canvas {
                                                overflow: hidden;
                                                background: none !important;
                                                height: 300px;
                                                width: 100%;
                                            }
                                        </style>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Block -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Item Details -->

    <!-- Start Footer Area -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>
    <script type="text/javascript">
        const current = document.getElementById("current");
        const opacity = 0.6;
        const imgs = document.querySelectorAll(".img");
        imgs.forEach(img => {
            img.addEventListener("click", (e) => {
                //reset opacity
                imgs.forEach(img => {
                    img.style.opacity = 1;
                });
                current.src = e.target.src;
                //adding class
                //current.classList.add("fade-in");
                //opacity
                e.target.style.opacity = opacity;
            });
        });

        let mapContainer = document.getElementById("map"),  //지도에 표시할 div
        mapOption = {
            center : new kakao.maps.LatLng(37.4787931,126.8807551), //지도 중심좌표
            level : 2 //지도 확대레벨
        };

   		 let map = new kakao.maps.Map(mapContainer,mapOption);   //지도 생성

   		 //병원주소 가져오기
   		 let addr = $("#map").attr("data-addr");
   		 console.log("addr==",addr);

   		 //주소-좌표 변환 객체 생성
   		 let geocoder = new kakao.maps.services.Geocoder();

   		 //주소로 좌표를 검색
   		 geocoder.addressSearch(addr,function(result,status){
   			 console.log('status==',status)
   			 console.log('result ==', result)
   			//정상 검색완료
   			if(status === kakao.maps.services.Status.OK){

   				var coords = new kakao.maps.LatLng(result[0].y,result[0].x);

                //마커 이미지 설정
                let imageSrc = "/images/location/hospital.png",
                    imageSize = new kakao.maps.Size(50,50),
                    imageOption = {offer: new kakao.maps.Point(27,69)};

                //마커 이미지 생성
                let markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption),
   		 	         markerPosition = new kakao.maps.LatLng(coords);


   				//결과값으로 받은 위치를 마커로 표시
   				let marker = new kakao.maps.Marker({
   					map:map,
   					position :coords,
                    image: markerImage
   				});
   		 //마커가 지도위에 표시되도록 설정
   		 map.setCenter(coords);
   			}//if end
   		 });

    </script>
</body>
</html>
