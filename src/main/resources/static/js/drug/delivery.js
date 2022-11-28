// var _jsDeliveryCompanyArr = [
//   ["0", "선택해주세요"],
//   ["1", "경동택배", { cpName: "경동", url: "http://www.kdexp.com/sub3_shipping.asp?stype=1&p_item=##NUM##" }]
//   ,
//   ["2", "대신택배", { cpName: "대신", url: "https://www.ds3211.co.kr/freight/internalFreightSearch.ht" }]
//   ,
//   ["3", "대한항공", { cpName: "대한항공", url: "http://cargo.koreanair.com/ecus/trc/servlet/TrackingServlet?pid=5&version=kor&menu1=m1&menu2=m01-1&awb_no=##NUM##" }]
//   ,
//   ["4", "동부택배", { cpName: "동부익스프레스", url: "http://www.dongbups.com/newHtml/delivery/delivery_search_view.jsp?item_no=##NUM##" }]
//   ,
//   ["5", "로젠택배", { cpName: "로젠", url: "http://www.ilogen.com/iLOGEN.Web.New/TRACE/TraceView.aspx?gubun=slipno&slipno=##NUM##" }]
//   ,
//   ["6", "범한판토스", { cpName: "범한판토스", url: "http://www.epantos.com/jsp/gx/tracking/tracking/trackingInquery.jsp?refNo=##NUM##" }]
//   ,
//   ["7", "우체국택배", { cpName: "우체국", url: "http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=##NUM##" }]
//   ,
//   ["8", "일양로지스택배", { cpName: "일양로지스", url: "http://www.ilyanglogis.com/functionality/tracking_result.asp?hawb_no=##NUM##" }]
//   ,
//   ["9", "천일택배", { cpName: "천일", url: "http://www.chunil.co.kr/HTrace/HTrace.jsp?transNo=##NUM##" }]
//   ,
//   ["10", "한덱스택배", { cpName: "한덱스", url: "http://btob.sedex.co.kr/work/app/tm/tmtr01/tmtr01_s4.jsp?IC_INV_NO=##NUM##" }]
//   ,
//   ["11", "한의사랑택배", { cpName: "한의사랑", url: "http://www.hanips.com/html/sub03_03_1.html?logicnum=##NUM##" }]
//   ,
//   ["12", "한진택배", { cpName: "한진", url: "http://www.hanjin.co.kr/Delivery_html/inquiry/result_waybill.jsp?wbl_num=##NUM##" }]
//   ,
//   ["13", "현대택배", { cpName: "현대", url: "http://www.hlc.co.kr/personalService/tracking/06/tracking_goods_result.jsp?InvNo=##NUM##" }]
//   ,
//   ["14", "CJ 대한통운택배", { cpName: "CJ대한통운", url: "https://www.doortodoor.co.kr/parcel/doortodoor.do?fsp_action=PARC_ACT_002&fsp_cmd=retrieveInvNoACT&invc_no=##NUM##" }]
//   ,
//   ["15", "CVSnet편의점택배", { cpName: "CVSNET편의점", url: "http://was.cvsnet.co.kr/_ver2/board/ctod_status.jsp?invoice_no=##NUM##" }]
//   ,
//   ["16", "DHL택배", { cpName: "DHL", url: "http://www.dhl.co.kr/content/kr/ko/express/tracking.shtml?brand=DHL&AWB=##NUM##" }]
//   ,
//   ["17", "FedEx택배", { cpName: "FEDEX", url: "http://www.fedex.com/Tracking?ascend_header=1&clienttype=dotcomreg&cntry_code=kr&language=korean&tracknumbers=##NUM##" }]
//   ,
//   ["18", "GTX로지스택배", { cpName: "GTX로지스", url: "http://www.gtxlogis.co.kr/tracking/default.asp?awblno=##NUM##" }]
//   ,
//   ["19", "KG옐로우캡택배", { cpName: "KG옐로우캡", url: "http://www.yellowcap.co.kr/custom/inquiry_result.asp?INVOICE_NO=##NUM##" }]
//   ,
//   ["20", "KGB택배", { cpName: "KGB", url: "http://www.kgbls.co.kr/sub5/trace.asp?f_slipno=##NUM##" }]
//   ,
//   ["21", "OCS택배", { cpName: "OCS", url: "http://www.ocskorea.com/online_bl_multi.asp?mode=search&search_no=##NUM##" }]
//   ,
//   ["22", "TNT Express", { cpName: "TNTExpress", url: "http://www.tnt.com/webtracker/tracking.do?respCountry=kr&respLang=ko&searchType=CON&cons=##NUM##" }]
//   ,
//   ["23", "UPS택배", { cpName: "UPS", url: "http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=##NUM##" }]
// ];
// if (totCollCount == "1" && daum.$("mCenter")) {
//   daum.$("mCenter").style.paddingBottom = "100px";
// }
// function kocnSubmit() {
//   var num = daum.$("drugDeliveryNum").value;
//   var kocn_1 = daum.$("_jsDeliveryCorpListHiddenSelBox").value;
//   if (kocn_1 === "0" || num == "" || num.startWith("예)") || num.startWith("11자리")) {
//     alert('업체명과 송장번호를 확인해주세요.');
//     return false;
//   }
//   var cpName = _jsDeliveryCompanyArr[kocn_1][2].cpName;
//   num = num.replaceAll('-', '');
//   var url = _jsDeliveryCompanyArr[kocn_1][2].url;
//   smartLog(null, "s=TO&d=&a=ABQK&dc=CQX&pg=1&r=1&p=1&rc=1&u=" + encodeURIComponent(url), "");
//   if (url.match(/##NUM##/)) {
//     if (cpName == "CVSNET편의점") {
//       url = url.replace(/##NUM##/, num);
//       document.kocn_mm.method = "post";
//       document.kocn_mm.slipno.value = num;
//     } else {
//       window.open(url.replace(/##NUM##/, num), "kocnss");
//       return false;
//     }
//   } else {
//     if (cpName == "대신") {
//       document.kocn_mm.method = "GET";
//       document.kocn_mm.billno.value = num;
//     }
//   }
//   document.kocn_mm.action = url;
// }
// SF.M.addStayLogColl({ code: "CQX", id: "deliveryColl" });

// <!-- Code injected by live-server -->

  // <![CDATA[  <-- For SVG support
  if ('WebSocket' in window) {
    (function () {
      function refreshCSS() {
        var sheets = [].slice.call(document.getElementsByTagName("link"));
        var head = document.getElementsByTagName("head")[0];
        for (var i = 0; i < sheets.length; ++i) {
          var elem = sheets[i];
          var parent = elem.parentElement || head;
          parent.removeChild(elem);
          var rel = elem.rel;
          if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
            var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
            elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
          }
          parent.appendChild(elem);
        }
      }
      var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
      var address = protocol + window.location.host + window.location.pathname + '/ws';
      var socket = new WebSocket(address);
      socket.onmessage = function (msg) {
        if (msg.data == 'reload') window.location.reload();
        else if (msg.data == 'refreshcss') refreshCSS();
      };
      if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
        console.log('Live reload enabled.');
        sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
      }
    })();
  }
  else {
    console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
  }
  // ]]>