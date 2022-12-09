<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>제휴 신청 리스트</title>

    <!-- Custom fonts for this template -->
    <link href="/knj/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/knj/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/knj/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css?after" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Components</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item" href="buttons.html">Buttons</a>
                        <a class="collapse-item" href="cards.html">Cards</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Utilities</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="utilities-color.html">Colors</a>
                        <a class="collapse-item" href="utilities-border.html">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.html">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item active">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/knj/img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler Â· 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/knj/img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun Â· 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/knj/img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez Â· 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog Â· 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle"
                                    src="/knj/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- 여기부터가 메인 -->
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">제휴리스트</h1>

                    <div class="row">
                        <div class="col-12">
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <button class="nav-link active" id="nav-doctor-tab" data-bs-toggle="tab"
                                        data-bs-target="#nav-latest" type="button" role="tab" aria-controls="nav-latest"
                                        aria-selected="true">의사 제휴</button>
                                    <button class="nav-link" id="nav-nurse-tab" data-bs-toggle="tab"
                                        data-bs-target="#nav-nurse" type="button" role="tab" aria-controls="nav-nurse"
                                        aria-selected="false">간호사 제휴</button>
                                    <button class="nav-link" id="nav-petDoc-tab" data-bs-toggle="tab"
                                        data-bs-target="#nav-petDoc" type="button" role="tab" aria-controls="nav-petDoc"
                                        aria-selected="false">수의사 제휴</button>
                                    <button class="nav-link" id="nav-petNurse-tab" data-bs-toggle="tab"
                                        data-bs-target="#nav-petNurse" type="button" role="tab" aria-controls="nav-petNurse"
                                        aria-selected="false">수간호사 제휴</button>
                                    <button class="nav-link" id="nav-pharmacy-tab" data-bs-toggle="tab"
                                        data-bs-target="#nav-pharmacy" type="button" role="tab" aria-controls="nav-pharmacy"
                                        aria-selected="false">약사 제휴</button>
                                    <button class="nav-link" id="nav-petHotel-tab" data-bs-toggle="tab"
                                        data-bs-target="#nav-petHotel" type="button" role="tab" aria-controls="nav-petHotel"
                                        aria-selected="false">보호소관리자 제휴</button>
                                </div>
                            </nav>
                            <div class="tab-content" id="nav-tabContent">
                                <!-- 의사 제휴 리스트 -->
                                <div class="tab-pane fade active show" id="nav-latest" role="tabpanel"
                                    aria-labelledby="nav-latest-tab">
                                    <div class="row">
                                        <table class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>이름</th>
                                                    <th>전문의</th>
                                                    <th>기관 구분</th>
                                                    <th>상호명</th>
                                                    <th>기관 전화번호</th>
                                                    <th>기관 타입</th>
                                                    <th>상세보기</th>
                                                </tr>
                                            </thead>
                                            <tbody id="doctorList">

                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- Pagination -->
                                    <div class="container">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination" style="justify-content: center;" id="doctorPagination">
                                                    
                                            </ul>
                                        </nav>
                                    </div>
                                    <!--/ End Pagination -->
                                </div>
                                <!-- 간호사 제휴 리스트 -->
                                <div class="tab-pane fade" id="nav-nurse" role="tabpanel" aria-labelledby="nav-nurse-tab">
                                    <div class="row">
                                        <table class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>이름</th>
                                                    <th>전문의</th>
                                                    <th>기관 구분</th>
                                                    <th>상호명</th>
                                                    <th>기관 전화번호</th>
                                                    <th>기관 타입</th>
                                                    <th>상세보기</th>
                                                </tr>
                                            </thead>
                                            <tbody id="nurseList">
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- Pagination -->
                                    <div class="container">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination" style="justify-content: center;" id="nursePagination">
                                                    
                                            </ul>
                                        </nav>
                                    </div>
                                    <!--/ End Pagination -->
                                </div>
                                <!-- 수의사 제휴 리스트 -->
                                <div class="tab-pane fade" id="nav-petDoc" role="tabpanel" aria-labelledby="nav-petDoc-tab">
                                    <div class="row">
                                        <table class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>이름</th>
                                                    <th>전문의</th>
                                                    <th>기관 구분</th>
                                                    <th>상호명</th>
                                                    <th>기관 전화번호</th>
                                                    <th>기관 타입</th>
                                                    <th>상세보기</th>
                                                </tr>
                                            </thead>
                                            <tbody id="petDocList">
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- Pagination -->
                                    <div class="container">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination" style="justify-content: center;" id="petDocPagination">
                                                    
                                            </ul>
                                        </nav>
                                    </div>
                                    <!--/ End Pagination -->
                                </div>
                                <!-- 수간호사 제휴 리스트 -->
                                <div class="tab-pane fade" id="nav-petNurse" role="tabpanel" aria-labelledby="nav-petNurse-tab">
                                    <div class="row">
                                        <table class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>이름</th>
                                                    <th>전문의</th>
                                                    <th>기관 구분</th>
                                                    <th>상호명</th>
                                                    <th>기관 전화번호</th>
                                                    <th>기관 타입</th>
                                                    <th>상세보기</th>
                                                </tr>
                                            </thead>
                                            <tbody id="petNurseList">
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- Pagination -->
                                    <div class="container">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination" style="justify-content: center;" id="petNursePagination">
                                                    
                                            </ul>
                                        </nav>
                                    </div>
                                    <!--/ End Pagination -->
                                </div>
                                <!-- 약사 제휴 리스트 -->
                                <div class="tab-pane fade" id="nav-pharmacy" role="tabpanel" aria-labelledby="nav-pharmacy-tab">
                                    <div class="row">
                                        <table class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>이름</th>
                                                    <th>전문의</th>
                                                    <th>기관 구분</th>
                                                    <th>상호명</th>
                                                    <th>기관 전화번호</th>
                                                    <th>기관 타입</th>
                                                    <th>상세보기</th>
                                                </tr>
                                            </thead>
                                            <tbody id="pharmacyList">
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- Pagination -->
                                    <div class="container">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination" style="justify-content: center;" id="pharmacyPagination">
                                                    
                                            </ul>
                                        </nav>
                                    </div>
                                    <!--/ End Pagination -->
                                </div>
                                <!-- 보호소 제휴 리스트 -->
                                <div class="tab-pane fade" id="nav-petHotel" role="tabpanel" aria-labelledby="nav-petHotel-tab">
                                    <div class="row">
                                        <table class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>이름</th>
                                                    <th>전문의</th>
                                                    <th>기관 구분</th>
                                                    <th>상호명</th>
                                                    <th>기관 전화번호</th>
                                                    <th>기관 타입</th>
                                                    <th>상세보기</th>
                                                </tr>
                                            </thead>
                                            <tbody id="petHotelList">
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- Pagination -->
                                    <div class="container">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination" style="justify-content: center;" id="petHotelPagination">
                                                    
                                            </ul>
                                        </nav>
                                    </div>
                                    <!--/ End Pagination -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 제휴 상세보기 모달창 -->
                    <div class="modal fade cooperationModal" id="cooperationDetail" tabindex="-1" role="dialog" aria-labelledby="cooperationModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h1 class="modal-title" id="cooperationModalLabel">상세내용</h1>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <div class="mb-3">
                                <h3>이름</h3>
                                <div id="medicName">
                                    
                                </div>
                            </div>
                            <div class="mb-3">
                                <h3>전문의 여부</h3>
                                <div id="medicSpecialty">

                                </div>
                            </div>
                            <div class="mb-3">
                                <h3>소개글</h3>
                                <div id="medicInfo">

                                </div>
                            </div>
                            <div class="mb-3">
                                <h3>기관명</h3>
                                <div id="agencyName">

                                </div>
                            </div>
                            <div class="mb-3">
                                <h3>기관 주소</h3>
                                <div id="agencyAddr">
                                    
                                </div>
                            </div>
                            <div class="mb-3">
                                <h3>기관소개글</h3>
                                <div id="agencyInfo">

                                </div>
                            </div>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-primary" id="approvalBtn">승인</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                          </div>
                        </div>
                      </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">Ã</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/knj/vendor/jquery/jquery.min.js"></script>
    <script src="/knj/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/knj/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/knj/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/knj/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/knj/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/knj/js/demo/datatables-demo.js"></script>
    <script src="/js/admin/admin/cooperationList.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

    <!-- Template -->
    <script type="text/template" id="cooperationListTemplate">
        <tr>
            <td>{name}</td>
            <td>{medicSpecialty}</td>
            <td>{agencyRole}</td>
            <td>{agencyName}</td>
            <td>{agencyTel}</td>
            <td>{agencyType}</td>
            <td><button type="button" class="btn btn-primary modalBtn" data-toggle="modal" data-target="#cooperationDetail" data-name="{username}">상세보기</button></td>
        </tr>
    </script>
</body>

</html>