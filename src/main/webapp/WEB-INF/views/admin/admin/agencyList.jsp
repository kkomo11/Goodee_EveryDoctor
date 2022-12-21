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

    <title>기관 리스트</title>

    <!-- Custom fonts for this template -->
    <link href="/knj/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/knj/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/knj/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css?after" rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

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
                <div class="container-fluid" id="agencyListParent">

                    <!-- 여기부터가 메인 -->
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">기관리스트</h1>

                    <div class="row">
                        <div class="col-12">
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <button class="nav-link active" id="nav-hospital-tab" data-bs-toggle="tab"
                                        data-bs-target="#nav-latest" type="button" role="tab" aria-controls="nav-latest"
                                        aria-selected="true">병원</button>
                                    <button class="nav-link" id="nav-petHospital-tab" data-bs-toggle="tab"
                                        data-bs-target="#nav-petHospital" type="button" role="tab"
                                        aria-controls="nav-petHospital" aria-selected="false">동물병원</button>
                                    <button class="nav-link" id="nav-pharmacy-tab" data-bs-toggle="tab"
                                        data-bs-target="#nav-pharmacy" type="button" role="tab"
                                        aria-controls="nav-pharmacy" aria-selected="false">약국</button>
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
                                                    <th>기관명</th>
                                                    <th>주소</th>
                                                    <th>전화번호</th>
                                                    <th>기관 타입</th>
                                                    <th>영구삭제</th>
                                                </tr>
                                            </thead>
                                            <tbody id="hospitalList">

                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- Pagination -->
                                    <div class="container">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination" style="justify-content: center;"
                                                id="hospitalPagination">

                                            </ul>
                                        </nav>
                                    </div>
                                    <!--/ End Pagination -->
                                </div>
                                <!-- 간호사 제휴 리스트 -->
                                <div class="tab-pane fade" id="nav-petHospital" role="tabpanel"
                                    aria-labelledby="nav-petHospital-tab">
                                    <div class="row">
                                        <table class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>기관명</th>
                                                    <th>주소</th>
                                                    <th>전화번호</th>
                                                    <th>기관 타입</th>
                                                    <th>영구삭제</th>
                                                </tr>
                                            </thead>
                                            <tbody id="petHospitalList">

                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- Pagination -->
                                    <div class="container">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination" style="justify-content: center;"
                                                id="petHospitalPagination">

                                            </ul>
                                        </nav>
                                    </div>
                                    <!--/ End Pagination -->
                                </div>
                                <!-- 수의사 제휴 리스트 -->
                                <div class="tab-pane fade" id="nav-pharmacy" role="tabpanel"
                                    aria-labelledby="nav-pharmacy-tab">
                                    <div class="row">
                                        <table class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>기관명</th>
                                                    <th>주소</th>
                                                    <th>전화번호</th>
                                                    <th>기관 타입</th>
                                                    <th>영구삭제</th>
                                                </tr>
                                            </thead>
                                            <tbody id="pharmacyList">

                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- Pagination -->
                                    <div class="container">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination" style="justify-content: center;"
                                                id="pharmacyPagination">

                                            </ul>
                                        </nav>
                                    </div>
                                    <!--/ End Pagination -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <!-- /.container-fluid -->

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
        <!-- End of Main Content -->


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
    <script src="/js/admin/admin/agencyList.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>


    <!-- Template -->
    <script type="text/template" id="agencyListTemplate">
        <tr>
            <td>{agencyName}</td>
            <td>{agencyAddr}</td>
            <td>{agencyTel}</td>
            <td>{agencyType}</td>
            <td><button type="button" class="btn btn-primary deleteBtn" data-agencyNum="{agencyNum}">영구삭제</button></td>
        </tr>
    </script>
</body>

</html>