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

    <title>신고리스트</title>

    <!-- Custom fonts for this template -->
    <link href="/knj/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/knj/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/knj/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="/css/admin/admin/reportList.css" rel="stylesheet">
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
                <div class="container-fluid">

                    <!-- 여기부터가 메인 -->
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">신고리스트</h1>

                    <!-- 신고리스트 테이블 -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">신고리스트</h6>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" role="switch"
                                    id="flexSwitchCheckDefault">
                                <label class="form-check-label" for="flexSwitchCheckDefault">답변 미완료된 글만 보기</label>
                            </div>
                        </div>
                        <div class="card-body">
                            <section class="container col-lg-6" id="listSearchFrame">
                                <form method="get" action="./reportList"
                                    class="d-flex justify-contents-center align-items-center">
                                    <select name="kind" class="form-select" id="kind">
                                        <option value="reporterName">신고자</option>
                                        <option value="reportedName">피신고자</option>
                                        <option value="reportContents">신고내용</option>
                                        <option value="reportTitle">신고제목</option>
                                    </select>

                                    <!-- 라벨의 for와 input의 id를 같게하면 같은 영역으로 인식되서 편리하다. -->
                                    <div class="input-group" id="searchFrame">
                                        <input type="text" class="form-control" id="search" name="search">
                                    </div>

                                    <div>
                                        <button type="submit" class="btn btn-primary">Search</button>
                                    </div>
                                </form>
                            </section>
                            <div>
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>신고글번호</th>
                                            <th>신고자</th>
                                            <th>피신고자</th>
                                            <th>신고유형</th>
                                            <th>상담번호</th>
                                            <th>신고제목</th>
                                            <th>답변여부</th>
                                            <th>상세보기</th>
                                            <th>답변등록</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${list}" var="list">
                                            <tr>
                                                <td class="ajaxNum">${list.reportNum}</td>
                                                <td>${list.reporterName}</td>
                                                <td>${list.reportedName}</td>
                                                <td>${list.reportTypeVO.reportTypeName}</td>
                                                <td>${list.consultNum}</td>
                                                <td>${list.reportTitle}</td>
                                                <td>${list.reportChecked}</td>
                                                <td><button type="button" class="btn btn-primary modalBtn"
                                                        data-toggle="modal" data-target="#reportDetail">상세보기</button>
                                                </td>
                                                <td><button type="button" class="btn btn-primary answerModalBtn"
                                                        data-toggle="modal" data-target="#reportAnswer2"
                                                        data-num=${list.reportNum}>답변등록</button></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- 페이징 -->
                    <div class="container">
                        <nav aria-label="Page navigation example" id="nav">
                            <ul class="pagination" style="justify-content: center;">
                                <c:if test="${pager.pre}">
                                    <li class="page-item">
                                        <a class="page-link"
                                            href="./reportList?page=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}">Previous</a>
                                    </li>
                                </c:if>

                                <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                                    <li class="page-item">
                                        <a class="page-link"
                                            href="./reportList?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
                                    </li>
                                </c:forEach>

                                <c:if test="${pager.next}">
                                    <li class="page-item">
                                        <a class="page-link"
                                            href="./reportList?page=${pager.lastNum + 1}&kind=${pager.kind}&search=${pager.search}">Next</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>

                    <!-- 신고 상세보기 모달창 -->
                    <div class="modal fade reportModal" id="reportDetail" tabindex="-1" role="dialog"
                        aria-labelledby="reportModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title" id="reportModalLabel">신고 상세내용</h1>
                                    <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <h3>신고자</h3>
                                        <div id="reporterName">

                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <h3>피신고자</h3>
                                        <div id="reportedName">

                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <h3>신고 유형</h3>
                                        <div id="reportType">

                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <h3>신고 제목</h3>
                                        <div id="reportTitle">

                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <h3>신고 내용</h3>
                                        <div id="reportContents">

                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <h3>첨부 사진</h3>
                                        <div id="reportFile">

                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <input type="hidden" name="reportNum" id="reportNum">
                                        <h3>관리자 답변</h3>
                                        <div id="reportAnswer">

                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 관리자 답변등록 모달창 -->
                    <div class="modal fade reportAnswerModal" id="reportAnswer2" tabindex="-1"
                        aria-labelledby="reportAnswerModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title" id="reportAnswerModalLabel">신고 답변등록</h1>
                                    <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <form action="/admin/report/answer" method="post" id="answerForm">
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <input type="hidden" name="reportNum" id="numForAnswer">
                                            <h3>관리자 답변</h3>
                                            <textarea name="reportAnswerContents" id="" cols="50" rows="10"></textarea>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary" id="registAnswerBtn">답변
                                            등록</button>
                                    </div>
                                </form>
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
    <script src="/js/admin/admin/reportList.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>

</body>

</html>