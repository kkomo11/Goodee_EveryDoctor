<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>에브리닥터</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.svg" />
<c:import url="../../temp/boot.jsp"></c:import>
<!-- Place favicon.ico in the root directory -->

<!-- Web Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">

<!-- ========================= CSS here ========================= -->
<link rel="stylesheet" href="/css/delivery.css" />

</head>

	<!-- Header -->
	<c:import url="../../temp/header.jsp"></c:import>

<body>
  <a href="https://tracker.delivery/#/:carrier_id/:track_id" target="_blank">배송조회</a>


  <!-- 택배조회Coll -->
  <script type="text/javascript">
    var focusDeleveryNum = function () {
      if ($('drugDeliveryNum').value == "예)1234567890" || $('drugDeliveryNum').value == "11자리 숫자만 입력" || $('drugDeliveryNum').value == "예)PKR000249650" || $('drugDeliveryNum').value == "예)1Z04845XYN48937807") {
        $('drugDeliveryNum').value = "";
      }
    };
  </script>

  <div id="deliveryColl" class="wid_w">
    <div class="coll_tit">
      <h2 class="tit">택배 및 항공화물 조회</h2>
    </div>
    <div class="coll_cont">
      <div class="mg_cont">
        <div class="wrap_inquiry">
          <div class="box_search">
            <form name="kocn_mm" method="post" target="_blank" onsubmit="return kocnSubmit();">
              <fieldset>
                <legend>택배 및 항공화물 조회</legend>
                <input type="hidden" name="InvNo">
                <input type="hidden" name="f_slipno">
                <input type="hidden" name="sheetno">
                <input type="hidden" name="sendno">
                <input type="hidden" name="billno">
                <input type="hidden" name="tc">
                <input type="hidden" name="cust_id">
                <input type="hidden" name="invc_no">
                <input type="hidden" name="slipnom">
                <input type="hidden" name="gubun">
                <input type="hidden" name="slipno">
                <input type="hidden" name="slipno_salecd">
                <input type="hidden" name="iv_no">
                <input type="hidden" name="search_item_no">
                <input type="hidden" name="mode" value="SEARCH">
                <input type="hidden" name="search_type" value="1">
                <input type="hidden" name="searchMethod" value="I">
                <input type="hidden" name="bl_num">
                <input type="hidden" name="dtdShtno">
                <input type="hidden" name="sid1">
                <input type="hidden" name="wbl_num">
                <input type="hidden" name="hawb_no">

                <dl class="info_delivery">
                  <dt class="tit">업체명</dt>
                  <dd class="cont">
                    <select id="_jsDeliveryCorpListHiddenSelBox" name="_jsDeliveryCorpListHiddenSelBox"
                      class="select_box">
                      <option value="0">선택해 주세요</option>
                      <option value="1">경동택배</option>
                      <option value="2">대신택배</option>
                      <option value="3">대한항공</option>
                      <option value="4">동부택배</option>
                      <option value="5">로젠택배</option>
                      <option value="6">범한판토스</option>
                      <option value="7">우체국택배</option>
                      <option value="8">일양로지스택배</option>
                      <option value="9">천일택배</option>
                      <option value="10">한덱스택배</option>
                      <option value="11">한의사랑택배</option>
                      <option value="12">한진택배</option>
                      <option value="13">현대택배</option>
                      <option value="14">CJ 대한통운택배</option>
                      <option value="15">CVSnet편의점택배</option>
                      <option value="16">DHL택배</option>
                      <option value="17">FedEx택배</option>
                      <option value="18">GTX로지스택배</option>
                      <option value="19">KG옐로우캡택배</option>
                      <option value="20">KGB택배</option>
                      <option value="21">OCS택배</option>
                      <option value="22">TNT Express</option>
                      <option value="23">UPS택배</option>
                    </select>
                  </dd>
                </dl>

                <dl class="info_delivery delivery_num">
                  <dt class="tit">송장번호</dt>
                  <dd class="cont">
                    <input id="drugDeliveryNum" type="text" class="inp_txt" style="width:130px" name="drugDeliveryNum"
                      value="예)1234567890" onfocus='focusDeleveryNum();'>
                    <input type="submit" class="btn_bus btn_inquiry" value="조회">
                  </dd>
                </dl>

                <div class="refer" id="deleveryInfoMes">업체명 선택 후, 송장번호를 입력해주세요.</div>
              </fieldset>
            </form>
          </div>
        </div>

        <dl class="collDl list_relation">
          <dt class="g_tit">관련정보</dt>
          <dd class="con">
            <a class="stit" href="?w=tot&q=%EC%9A%B0%ED%8E%B8%EB%B2%88%ED%98%B8"
              onclick='smartLog(this, "s=TO&d=&a=ABQK&dc=CQX&pg=1&r=1&p=2&rc=3", event); '>우편번호</a>
            <span class="vline">|</span>
            <a class="stit" href="?w=tot&q=%EC%A7%80%EC%97%AD%EB%B2%88%ED%98%B8"
              onclick='smartLog(this, "s=TO&d=&a=ABQK&dc=CQX&pg=1&r=2&p=2&rc=3", event); '>지역번호</a>
            <span class="vline">|</span>
            <a class="stit" href="?w=tot&q=%EC%98%81%EB%AC%B8%EC%A3%BC%EC%86%8C"
              onclick='smartLog(this, "s=TO&d=&a=ABQK&dc=CQX&pg=1&r=3&p=2&rc=3", event); '>영문주소</a>
          </dd>
        </dl>
      </div>
    </div>
  </div>
  <!-- end 택배조회Coll -->

	<!-- Footer -->
	<c:import url="../../temp/footer.jsp"></c:import>

	<!-- ========================= scroll-top ========================= -->
	<a href="#" class="scroll-top btn-hover"> <i
		class="lni lni-chevron-up"></i>
	</a>

	<!-- ========================= JS here ========================= -->
  	<script src="/js/drug/delivery.js"></script>
</body>
</html>