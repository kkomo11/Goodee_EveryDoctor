<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Reservated List</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Place favicon.ico in the root directory -->

    <style>
        .toggleLabel {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
            padding: 25px 30px;
            font-size: 18px;
            font-weight: 500;
        }

        .text {
            padding: 25px 30px;
            font-size: 18px;
            font-weight: 500;
        }
    </style>
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
    <sec:authentication property="Principal" var="user"/>
    <!-- Header -->
    <c:import url="../temp/header.jsp"></c:import>

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">요청된 진료</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>요청된 진료</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Dashboard Section -->
    <section class="dashboard section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-12 col-12">
					<c:import url="sidebar.jsp"></c:import>
                </div>
                <div class="col-lg-9 col-md-12 col-12">
                    <div class="main-content">
                        <div class="dashboard-block mt-0">
                            <!-- Start Invoice Items Area -->
                            <div class="invoice-items default-list-style">

                                <!-- Start Single List -->
                                <div class="single-list  my-items">
                                    <!-- Start Item List Title -->
                                    <div class="item-list-title">
                                        <div class="row align-items-center">
                                            <div class="col-md-5 col-12">
                                                <p>진료</p>
                                            </div>
                                            <div class="col-md-3 col-12">
                                                <p>진료 카테고리</p>
                                            </div>
                                            <div class="col-md-1 col-12">
                                                <p>상태</p>
                                            </div>
                                            <div class="col-md-3 col-12 align-right">
                                                <p>대기시간</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End List Title -->
                                    <c:forEach items="${reservatedList}" var="reservated">
                                        <!-- Start Single List -->
                                        <div class="single-item-list" data-user-name="${reservated.username}" data-dans-num=${reservated.dansNum }>
                                            <div class="row align-items-center">
                                                <div class="col-md-5 col-12">
                                                    <div class="item-image">
                                                        <c:if test="${reservated.dansFiles.size() > 0 }">
                                                            <img src="/file/PETDANS/${reservated.dansFiles[0].fileName }" alt="#">
                                                        </c:if>
                                                        <c:if test="${reservated.dansFiles.size() <= 0 }">
                                                            <img src="/images/pet/home/website_icon.svg" alt="#">
                                                        </c:if>
                                                        <div class="content">
                                                            <!-- 엄밀히 따지면 멤버변수명이 아니라 getter명이라 getter명으로 맨 앞을 대문자로 바꿨더니 된다. -->
                                                            <h3 class="title"><a>${reservated.patient}</a></h3>
                                                            <span class="price">${reservated.dansReqTime}</span>
                                                            <a class="badge bg-info" data-bs-toggle="collapse" href="#collapseExample${reservated.dansNum }" role="button" aria-expanded="false" aria-controls="collapseExample${reservated.dansNum }">
                                                                상담 내용 보기
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-12">
                                                    <p>${reservated.dansCategory}</p>
                                                </div>
                                                <div class="col-md-1 col-12">
                                                    <p>대기</p>
                                                </div>
                                                <div class="col-md-3 col-12 align-right">
                                                    <ul class="action-btn" >
                                                        <li><a class="create-room" data-time="0" style="width: 48px;">즉시</a></li>
                                                        <li><a class="create-room" data-time="5" style="width: 48px;">5분</a></li>
                                                        <li><a class="create-room" data-time="10" style="width: 48px;">10분</i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                                <form method="post" action="/room" id="mkRoom">
                                                    <input type="hidden" id="uuid" name="uuid" />
                                                    <!-- <input type="hidden" name="id" /> -->
                                                </form>
                                            <div class="collapse" id="collapseExample${reservated.dansNum }">
                                                <div class="card card-body">
                                                    ${reservated.dansContent}
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Single List -->
                                    </c:forEach>
                                </div>
                            <!-- End Single List -->
                            <!-- Pagination -->
                            <div class="pagination left" style="margin-left: 1rem;">
                                <ul class="pagination-list">
                                    <c:if test="${pager.pre }">
                                        <li><a href="/hospital/diagnosis/management?page=${pager.startNum - 1 }"><i class="lni lni-chevron-left"></i></a></li>
                                    </c:if>
                                    <c:forEach begin="${pager.startNum }" end="${pager.lastNum }" step="1" var="i">
                                        <li><a href="/hospital/diagnosis/management?page=${i }">${i }</a></li>
                                    </c:forEach>
                                    <c:if test="${pager.next }">
                                        <li><a href="/hospital/diagnosis/management?page=${pager.lastNum + 1 }"><i class="lni lni-chevron-right"></i></a></li>
                                    </c:if>
                                </ul>
                            </div>
                            <!--/ End Pagination -->
                            <!-- End Invoice Items Area -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Dashboard Section -->

	<!-- Footer -->
    <c:import url="../temp/footer.jsp"></c:import>
    <!-- <script src="/js/user/profile.js"></script> -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script type="text/javascript">
        const uuidInput = document.querySelector('input#uuid');
        $(function () {

            function guid() {
                return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                    let r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
                    return v.toString(16);
                });
            }

            if (localStorage.getItem("uuid") === null) {
                localStorage.setItem("uuid", guid());
            }
            uuidInput.value = localStorage.getItem("uuid");
            console.log("local.uuid:" + localStorage.getItem("uuid"));
            console.log("input.value:" + uuidInput.value);
        });

        $('.single-item-list').click(function(e) {
            if(e.target.classList.contains('create-room')) {
                createRoom($(this).attr('data-dans-num'),$(this).attr('data-user-name'), $(this).find('.action-btn'), e.target.getAttribute('data-time'));
                console.log($(e.target.parentNode.parentNode))

            }
        })

        //ajax를 요청하자
        function createRoom(dansnum, username, roomBtn, delayTime){
            let mrdata = new FormData($("#mkRoom")[0]);
            mrdata.append("dansnum", dansnum);
            mrdata.append("action", "make");
            mrdata.append("id", Number.parseInt(Math.random() * 100000000));
            mrdata.append("time", delayTime);
            mrdata.append("username",username);
            $.ajax({
                type:"POST",
                url:"/room",
                cache:false,
                contentType:false,
                processData:false,
                data: mrdata,
                success:function(dt){
                    if(dt!=""){
                        roomBtn.empty()
                        roomBtn.append('<a class="btn btn-primary" href="/room/'+dt.roomid.id+'/user/'+dt.uuid+'?dansnum='+dansnum+'">입장</a>')

                    }else{

                    }
                }
            })
        }

    </script>
</body>
</html>