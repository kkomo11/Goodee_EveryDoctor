<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!--properties spring  -->
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
      <html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">

      <head>
        <div class="popuptestbtn">
          <button type="submit" class="btn">조회하기</button>
        </div>

        <script type="text/javascript">
          $(document).ready(function () {
            url = "http://info.sweettracker.co.kr/tracking/5"
            $.ajax({
              type: "POST",
              url: url,
              data: $("#popuptestbtn").serialize(),
              success: function (data) {
              },
              error: function (request, status, msg) {
              }
            });
          });
        </script>
      </head>

      <body oncontextmenu="return false" onselectstart="return false" ondragstart="return false"
        style="overflow-x:auto; overflow-y:auto; position:relative;">
      </body>
           <!-- ========================= JS here ========================= -->
           <script src="/js/drug/delivery.js"></script>

      </html>