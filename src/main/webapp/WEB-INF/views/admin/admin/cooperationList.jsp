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
        <c:import url="../temp/sideBar.jsp"></c:import>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">


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
                                                    <th>승인 여부</th>
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
                                                    <th>승인 여부</th>
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
                                                    <th>승인 여부</th>
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
                                                    <th>승인 여부</th>
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
                                                    <th>승인 여부</th>
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
                                                    <th>승인 여부</th>
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
                            <div>
                                <input type="hidden" data-username="" data-medicRole="" id="hiddenData">
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
            <td>{medicEnabled}</td>
            <td><button type="button" class="btn btn-primary modalBtn" data-toggle="modal" data-target="#cooperationDetail" data-username="{username}" data-medicRole="{medicRole}">상세보기</button></td>
        </tr>
    </script>
</body>

</html>