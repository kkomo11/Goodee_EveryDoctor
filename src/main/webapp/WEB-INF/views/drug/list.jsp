<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html class="no-js" lang="zxx">

    <head>
      <meta charset="utf-8" />
      <meta http-equiv="x-ua-compatible" content="ie=edge" />
      <title>보유약현황</title>
      <meta name="description" content="" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <c:import url="../temp/boot.jsp"></c:import>
      <!-- ========================= CSS here ========================= -->
      <link rel="stylesheet" href="/css/drug/drug.css" type="text/css" />

    </head>

    <body>
      <!--[if lte IE 9]>
          <p class="browserupgrade">
            You are using an <strong>outdated</strong> browser. Please
            <a href="https://browsehappy.com/">upgrade your browser</a> to improve
            your experience and security.
          </p>
        <![endif]-->

      <!-- Preloader -->
      <div class="preloader">
        <div class="preloader-inner">
          <div class="preloader-icon">
            <span></span> <span></span>
          </div>
        </div>
      </div>
      <!-- /End Preloader -->

      <!-- Header -->
      <c:import url="../temp/header.jsp"></c:import>

      <!-- Start Breadcrumbs -->
      <div class="breadcrumbs">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="breadcrumbs-content">
                <h1 class="page-title">약 리스트</h1>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
              <ul class="breadcrumb-nav">
                <li><a href="/">Home</a></li>
                <li>약 리스트</li>
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
            <div class="col-12">
              <div class="main-content">
                <!-- Start Post Ad Block Area -->
                <div class="dashboard-block mt-0">
                  <h3 class="block-title">보유 약 현황
                    <!-- 검색창 -->
                    <div class="row mb-3">
                      <form action="./list" class="row row-cols-lg-auto g-3 align-items-center">

                        <div class="navbar bg-light">
                          <label class="visually-hidden" for="Kind">Kind</label>
                          <select name="kind" class="form-select" id="Kind">
                            <option class="kinds" value="drugName">약이름</option>
                            <option class="kinds" value="drugInfo">약정보</option>
                          </select>
                        </div>

                        <div class="navbar bg-light">
                          <label class="visually-hidden" for="search">Search</label>
                          <div class="input-group">
                            <input type="text" name="search" value="${param.search}" class="form-control" id="search"
                              placeholder="Search">
                          </div>
                        </div>
                         <div class="navbar bg-light">
                                  <button class="btn btn-outline-success" type="submit"><i class="lni lni-search-alt"></i> Search</button>
                                </div>
                      </form>
                    </div>
                  </h3>
                  <div class="inner-block">

                    <!-- 약목록 -->
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>약번호</th>
                          <th>약이름</th>
                          <th>약정보</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${list}" var="vo">
                          <tr>
                            <td>${vo.drugNum}</td>
                            <td><a href="detail?drugName=${vo.drugName}">${vo.drugName}</a></td>
                            <td><a href="detail?drugName=${vo.drugName}">${vo.drugInfo}</a></td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                    <!-- 페이징처리 -->
                    <div class="pagination left">
                      <nav aria-label="Page navigation example">
                        <ul class="pagination-list">
                          <c:if test="${pager.pre}">
                            <li class="page-item">
                              <a class="page-link"
                                href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">&laquo;</a>
                            </li>
                          </c:if>
                          <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                            <li class="page-item"><a class="page-link"
                                href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
                          </c:forEach>
                          <c:if test="${pager.next}">
                            <li class="page-item">
                              <a class="page-link"
                                href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">&raquo;</a>
                            </li>
                          </c:if>
                        </ul>
                      </nav>
                    </div>

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

      <!-- ========================= scroll-top ========================= -->
      <a href="#" class="scroll-top btn-hover"> <i class="lni lni-chevron-up"></i>
      </a>

      <!-- ========================= JS here ========================= -->
      <!-- <script src="/js/drug.js"></script> -->
    </body>

    </html>