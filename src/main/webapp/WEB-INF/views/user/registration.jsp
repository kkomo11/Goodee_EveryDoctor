<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>에브리닥터 회원가입</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />	
    <!-- Place favicon.ico in the root directory -->
	<c:import url="../temp/boot.jsp"></c:import>
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
                <span></span>
                <span></span>
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
                        <h1 class="page-title">회원가입</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html">Home</a></li>
                        <li>회원가입</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- start Registration section -->
    <section class="login registration section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                    <div class="form-head">
                        <h4 class="title">회원가입</h4>
                        <form:form action="./registration" modelAttribute="userVO" method="post">
                            
                            <div class="form-group">
                                <label>아이디 ID</label>
                                <div class="d-flex">
                                    <form:input path="username" id="username"/>
                                    <button class="btn btn-primary" type="button" style="width:150px;" id="chkId">중복확인</button>
                                </div>
                                <span class="text-danger" id="errorUsername">
                                    <form:errors path="username"></form:errors>
                                </span>
                            </div>
                            <div class="form-group">
                                <label>성함 Name</label>
                                <form:input path="name" />
                                <span  class="text-danger"><form:errors path="name"></form:errors></span>
                            </div>
                            <div class="form-group">
                                <label>이메일 Email</label>
                                <form:input path="email" type="email"/>
                                <span  class="text-danger"><form:errors path="email"></form:errors></span>
                            </div>
                            <div class="form-group">
                                <label>비밀번호 Password</label>
                                <form:password path="password"/>
                                <span  class="text-danger"><form:errors path="password"></form:errors></span>
                            </div>
                            <div class="form-group">
                                <label>비밀번호 확인 Confirm Password</label>
                                <input name="password2" type="password">
                            </div>
                            <div class="alt-option">
                                
                            </div>
                            <div class="check-and-pass">
                                <div class="accordion" id="accordionExample">
                                    <div class="d-flex">
                                        <div class="p-2" >
                                            <input type="checkbox" class="form-check-input" name="agree_all" > 
                                        </div>	
                                        <div class= "flex-fill p-2"><span><b> 전체동의 </b></span></div>
                                    </div>
                                    <div class="d-flex">
                                        <div class="p-2" >
                                            <input type="checkbox" class="form-check-input" > 
                                        </div>	
                                        <div class="accordion-item flex-fill">
                                            <h2 class="accordion-header" id="headingOne">	                                
                                                <button class="accordion-button collapsed" data-bs-toggle="collapse" type="button"
                                                    data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                                    <span>개인정보 수집 및 이용 동의</span><i class="lni lni-plus"></i>
                                                </button>
                                            </h2>
                                            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
                                                data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>제 1장 총칙<br><br>제 1 조(목적)<br><br>본 약관은 에브리닥터 웹사이트(이하 &quot;에브리닥터&quot;)가 제공하는 모든 서비스(이하 &quot;서비스&quot;)의 이용조건 및 절차, 회원과 에브리닥터의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br><br>제 2 조(약관의 효력과 변경)<br><br>1. 에브리닥터는 이용자가 본 약관 내용에 동의하는 경우, 에브리닥터의 서비스 제공 행위 및 회원의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.<br>2. 변경된 약관은 에브리닥터 홈페이지에 공지하거나 e-mail을 통해 회원에게 공지하며, 약관의 부칙에 명시된 날부터 그 효력이 발생됩니다. 회원이 변경된 약관에 동의하지 않는 경우, 회원은 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이내에 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우는 약관 변경에 대한 동의로 간주됩니다.<br><br>제 3 조(약관 외 준칙)<br><br>본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.<br><br>제 4 조(용어의 정의)<br><br>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>1. 이용자 : 본 약관에 따라에브리닥터가 제공하는 서비스를 받는 자<br>2. 가입 : 에브리닥터가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위<br>3. 회원 : 에브리닥터에 개인 정보를 제공하여 회원 등록을 한 자로서 에브리닥터이 제공하는 서비스를 이용할 수 있는 자.<br>4. 계정(ID) : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 에브리닥터에서 부여하는 문자와 숫자의 조합<br>5. 비밀번호 : 회원과 계정이 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 회원 자신이 선정한 문자와 숫자의 조합<br>6. 탈퇴 : 회원이 이용계약을 종료시키는 행위<br>7. 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정에서 정의합니다.<br><br><br>제 2장 서비스 제공 및 이용<br><br>제 5 조 (이용계약의 성립)<br><br><strong>1. 이용계약은 이용자가 온라인으로 에브리닥터에서 제공하는 소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다.</strong><br><strong>2. 에브리닥터는 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.</strong><br>&nbsp; &nbsp;1) 다른 사람의 명의를 사용하여 신청하였을 때<br>&nbsp; &nbsp;2) 이용계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때<br>&nbsp; &nbsp;3) 다른 사람의 에브리닥터 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때<br>&nbsp; &nbsp;4) 에브리닥터을 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우<br>&nbsp; &nbsp;5) 기타 에브리닥터이 정한 이용신청요건이 미비 되었을 때<br><br>제 6 조 (회원정보 사용에 대한 동의)<br><br><strong>1. 회원의 개인정보는 「공공기관의개인정보보호에관한법률」에 의해 보호됩니다.</strong><br><strong>2. 에브리닥터의 회원 정보는 다음과 같이 사용, 관리, 보호됩니다.</strong><br>&nbsp; &nbsp;1) 개인정보의 사용 : 에브리닥터는 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습 니다. 단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 이용자 스스로 개인정보를 공개한 경우에는 그러 하지 않습니다.<br>&nbsp; &nbsp;2) 개인정보의 관리 : 회원은 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 회원의 개인정보를 수정/삭제할 수 있습니다.<br>&nbsp; &nbsp;3) 개인정보의 보호 : 회원의 개인정보는 오직 본인만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 회원의 계정과 비밀번호에 의해 관리되고 있습니다. 따라서 타인에게 본인의 계정과 비밀번호를 알려주어서는 안되며, 작업 종료시에는 반드시 로그아웃해 주시기 바랍니다.<br><strong>3. 회원이 본 약관에 따라 이용신청을 하는 것은, 에브리닥터의 신청서에 기재된 회원정보를 수집, 이용하는 것에 동의하는 것으로 간주 됩니다.</strong><br><br>제 7 조 (사용자의 정보 보안)<br><br>1. 이용자는 에브리닥터 서비스 가입 절차를 완료하는 순간부터 본인이 입력한 정보의 비밀을 유지할 책임이 있으며, 회원이 고의나 중대한 실수로 회원의 계정과 비밀번호를 사용하여 발생한 피해에 대한 책임은 회원 본인에게 있습니다.<br>2. 계정과 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 계정이나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 에브리닥터에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다.<br>3. 이용자는 에브리닥터 서비스의 사용 종료시마다 정확히 접속을 종료해야 하며, 정확히 종료하지 아니함으로써 제3자가 이용자에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 에브리닥터은 책임을 부담하지 아니합니다.<br><br>제 8 조 (서비스의 변경)<br><br>1. 당 사이트는 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.<br>2. 당 사이트는 서비스 이용과 관련하여 가입자에게 발생한 손해 중 가입자의 고의,과실에 의한 손해에 대하여 책임을 부담하지 아니합니다.<br><br>제 9 조 (이용기간 및 자격의 정지 및 상실)<br><br>1. 에브리닥터 회원이용기간은 조직통폐합에 따른 불가항력을 제외하고 회원신청에서 탈퇴까지로 합니다.<br>2. 에브리닥터은 이용자가 본 약관에 명시된 내용을 위배하는 행동을 한 경우, 이용자격을 일시적으로 정지하고 30일 이내에 시정하도록 이용자에게 요구할 수 있으며, 이후 동일한 행위를 2회 이상 반복할 경우에 30일간의 소명기회를 부여한 후 이용자격을 상실시킬 수 있습니다.<br>3. 에브리닥터 회원이 신청 후 12개월이상 장시간 이용하지 않은 회원은 휴면아이디로 분류하여, 자격 정지 및 상실이 가능합니다.<br><br>제 10 조 (계약해제, 해지 등)<br><br>1. 회원은 언제든지 서비스 초기화면의 마이페이지 또는 정보수정 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, 에브리닥터은 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.<br>2. 회원이 계약을 해지할 경우, 관련법 및 개인정보취급방침에 따라 에브리닥터이 회원정보를 보유하는 경우를 제외하고는 해지 즉시 회원의 모든 데이터는 소멸됩니다.<br>3. 회원이 계약을 해지하는 경우, 회원이 작성한 게시물 중 블로그 등과 같이 본인 계정에 등록된 게시물 일체는 삭제됩니다. 단, 타인에 의해 스크랩 되어 재게시되거나, 공용게시판에 등록된 게시물 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하시기 바랍니다.<br><br>제 11 조 (게시물의 저작권)<br><br><strong>1. 이용자가 게시한 게시물의 저작권은 이용자가 소유하며, 에브리닥터는 서비스 내에 이를 게시할 수 있는 권리를 갖습니다.</strong><br><strong>2. 에브리닥터은 다음 각 호에 해당하는 게시물이나 자료를 사전통지 없이 삭제하거나 이동 또는 등록 거부를 할 수 있습니다.</strong><br>&nbsp; &nbsp;1) 본서비스 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우<br>&nbsp; &nbsp;2) 다른 회원 또는 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우<br>&nbsp; &nbsp;3) 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우<br>&nbsp; &nbsp;4) 불법복제 또는 해킹을 조장하는 내용인 경우<br>&nbsp; &nbsp;5) 영리를 목적으로 하는 광고일 경우<br>&nbsp; &nbsp;6) 범죄와 결부된다고 객관적으로 인정되는 내용일 경우<br>&nbsp; &nbsp;7) 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우<br>&nbsp; &nbsp;8) 에브리닥터에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우<br>&nbsp; &nbsp;9) 기타 관계법령에 위배된다고 판단되는 경우<br><strong>3. 이용자의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 이용자가 부담하여야 합니다.</strong><br><br><br>제 3장 의무 및 책임<br><br><br>제 12 조 (에브리닥터의 의무)<br><br>1. 에브리닥터은 회원의 개인 신상 정보를 본인의 승낙없이 타인에게 누설, 배포하지 않습니다. 단, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.<br>2. 에브리닥터은 법령과 본 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 지속적&middot;안정적으로 서비스를 제공하기 위해 노력 할 의무가 있습니다.<br>3. 에브리닥터은 이용자의 귀책사유로 인한 서비스 이용 장애에 대하여 책임을 지지 않습니다.<br><br>제 13 조 (회원의 의무)<br><br><strong>1. 회원 가입시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 회원에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 계정 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</strong><br><strong>2. 회원은 에브리닥터의 사전 승낙없이 서비스를 이용하여 어떠한 영리행위도 할 수 없으며, 그 영업활동의 결과에 대해 에브리닥터은 일절 책임을 지지 않습니다. 또한 회원은 이와 같은 영업활동으로 에브리닥터이 손해를 입은 경우 손해배상의무를 지며, 에브리닥터은 해당 회원에 대해 서비스 이용제한 및 적법한 절차를 거쳐 손해배상 등을 청구할 수 있습니다.</strong><br><strong>3. 회원은 에브리닥터 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.</strong><br>&nbsp; &nbsp;1) 회원가입 신청 또는 회원정보 변경 시 허위내용을 기재하거나 다른 회원의 비밀번호와 ID를 도용하여 부정 사용하는 행위<br>&nbsp; &nbsp;2) 저속, 음란, 모욕적, 위협적이거나 타인의 Privacy를 침해할 수 있는 내용을 전송, 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위<br>&nbsp; &nbsp;3) 에브리닥터 운영진, 직원 또는 관계자를 사칭하는 행위<br>&nbsp; &nbsp;4) 서비스를 통하여 전송된 내용의 출처를 위장하는 행위<br>&nbsp; &nbsp;5) 법률, 계약에 의해 이용할 수 없는 내용을 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위<br>&nbsp; &nbsp;6) 서버 해킹 및 컴퓨터바이러스 유포, 웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하는 행위<br>&nbsp; &nbsp;7) 타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위<br>&nbsp; &nbsp;8) 에브리닥터의 승인을 받지 아니한 광고, 판촉물, 스팸메일, 행운의 편지, 피라미드 조직 기타 다른 형태의 권유를 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위<br>&nbsp; &nbsp;9) 다른 사용자의 개인정보를 수집, 저장, 공개하는 행위<br>&nbsp; &nbsp;10) 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위<br>&nbsp; &nbsp;11) 선량한 풍속, 기타 사회질서를 해하는 행위<br>&nbsp; &nbsp;12) 타인의 명예를 훼손하거나 모욕하는 행위<br>&nbsp; &nbsp;13) 타인의 지적재산권 등의 권리를 침해하는 행위<br>&nbsp; &nbsp;14) 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위<br>&nbsp; &nbsp;15) 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위<br>&nbsp; &nbsp;17) 본 약관을 포함하여 기타 에브리닥터이 정한 제반 규정 또는 이용 조건을 위반하는 행위<br>&nbsp; &nbsp;18) 기타 관계법령에 위배되는 행위<br><br><br>제 4장 기타<br><br><br>제 14 조 (양도금지)<br><br>회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없습니다.<br><br>제 15조 (면책조항)<br><br>1. 에브리닥터은 서비스 이용과 관련하여 이용자에게 발생한 손해에 대하여 에브리닥터의 중대한 과실, 고의 또는 범죄행위로 인해 발생한 손해를 제외하고 이에 대하여 책임을 부담하지 않으며, 이용자가 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.<br>2. 에브리닥터은 서비스 이용과 관련하여 이용자에게 발생한 손해 중 이용자의 고의, 실수에 의한 손해에 대하여 책임을 부담하지 아니합니다.<br>3. 에브리닥터은 이용자간 또는 이용자와 제3자간에 서비스를 매개로 하여 물품거래 혹은 금전적 거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 이용자가 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.<br><br>제 16 조 (재판관할)<br><br><strong>에브리닥터과 이용자간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 민사소송법상의 관할법원에 제기합니다.</strong><br>부 칙 1. (시행일) 본 약관은 2022년 12월 21일부터 시행됩니다.&nbsp;</p>
                                                </div>
                                            </div>
                                        </div>
                                   </div>
                                   <div class="d-flex">
                                        <div class="p-2" >
                                            <input type="checkbox" class="form-check-input" > 
                                        </div>	
                                        <div class="accordion-item flex-fill">
                                            <h2 class="accordion-header" id="headingTwo">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                    <span>고유식별정보 처리 동의</span><i
                                                        class="lni lni-plus"></i>
                                                </button>
                                            </h2>
                                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                                                data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                      <p class="terms_tit">에스케이텔레콤(주), (주)케이티, LG유플러스(주) (이하 "본인확인기관")가 코리아크레딧뷰로(주) (이하 "회사")를 통해 제공하는 휴대폰 본인인증 서비스와 관련하여 고객으로부터 수집한 고유식별정보를 이용하거나 타인에게 제공할 때에는 '정보통신망 이용촉진 및 정보보호 등에 관한 법률'(이하 "정보통신망법")에 따라 고객의 동의를 얻어야 합니다.<br />※ 본 고유식별정보 처리동의는 거부할 수 있으나, 거부 시에는 휴대폰본인확인서비스를 제공받으실 수 없습니다.</p>
      <h6>[고유식별정보의 수집 및 이용 목적]</h6>
      <p class="terms_tit">"본인확인기관"은 휴대폰 본인인증 서비스 제공시,&nbsp;<strong>아래 두 가지 목적을 위해 고객의 고유식별정보를 처리</strong>할 수 있습니다<br /><br /><strong>① 정보통신망법 제23조의2 제2항에 따라 인터넷상에서 주민등록번호를 입력하지 않고도 본인임을 확인할 수 있는 휴대폰 본인인증 서비스를 제공하기 위해 고유식별정보를 이용<br />② '본인확인기관 지정 등에 관한 기준(방송통신위원회 고시)'에 따라 "회사"와 계약한 정보통신서비스 제공자의 연계서비스 및 중복가입확인을 위해 필요한 경우, 다른 본인확인기관이 아래의 고유식별정보를 제공받아 처리하기 위함.</strong></p>
      <h6>[수집하는 개인정보의 항목]</h6>
      <p class="terms_tit"><strong>① 주민등록번호(내국인)<br />② 외국인등록번호(국내거주외국인)</strong></p>
      <h6>[개인정보의 보유 및 이용기간]</h6>
      <p class="terms_tit">"회사"는 휴대폰 본인확인 서비스 제공, 연계서비스 및 중복가입확인을 위하여&nbsp;<strong>필요한 기간 동안 이용자의 고유식별정보를 보유</strong>합니다.<br /><br />상기 내용과 같이 고유식별정보의 처리에 동의합니다.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                   <div class="d-flex">
                                        <div class="p-2" >
                                            <input type="checkbox" class="form-check-input" > 
                                        </div>	
                                        <div class="accordion-item flex-fill">
                                        <h2 class="accordion-header" id="headingThree">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                                data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                <span>위치기반 서비스 이용약관</span><i class="lni lni-plus"></i>
                                            </button>
                                        </h2>
                                        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                                            data-bs-parent="#accordionExample">
                                            <div class="accordion-body">
                                                &lt;p&gt;제 1장 총칙<br /> <br />제 1조 (목적)<br /> <br />이 약관은 SK텔레콤주식회사(이하 &ldquo;&ldquo;회사&rdquo;&rdquo;라 합니다)가 제공하는 위치기반서비스(이하 &lsquo;서비스&rsquo;라 합니다)를 회사와 이용계약을 체결한 &lsquo;고객&rsquo;이 이용함에 있어 필요한 회사와 고객의 권리 및 의무, 기타 제반 사항을 정함을 목적으로 합니다.</p>
    <p><br />제 2조 (약관 외 준칙)<br /> <br />이 약관에 명시되지 않은 사항에 대해서는 위치 정보의 보호 및 이용 등에 관한 법률, 전기통신사업법, 정보통신망 이용 촉진및 보호 등에 관한 법률 등 관계법령 및 회사가 정한 서비스의 세부이용지침 등의 규정에 따릅니다.</p>
    <p><br />제 2장 서비스의 이용<br /> <br />제 3조 (가입자격)<br /> <br />① 서비스에 가입할 수 있는 자는 회사가 제공하는 &lsquo;서비스&rsquo;를 이용하고자 하는 자로서, 개인 또는 법인고객을 포함합니다.<br /> <br />② 법인 명의의 이동전화를 사용하는 고객은 법인의 사업자번호를 사용하여 서비스에 가입할 수 있습니다.<br /> <br />제 4조 (서비스 가입)<br /> <br />① 회사가 정한 본 약관에 고객이 동의하고, 회사가 승낙함으로써 서비스 가입의 효력이 발생합니다.<br /> <br />② 회사는 다음 각 호의 고객 가입신청에 대해서는 이를 승낙하지 아니할 수 있습니다.<br /> <br />1. 실명이 아니거나 다른 사람의 명의를 사용하는 등 허위로 신청하는 경우<br /> <br />2. 고객 등록 사항을 누락하거나 오기하여 신청하는 경우<br /> <br />3. 공공질서 또는 미풍양속을 저해하거나 저해할 목적으로 신청한 경우<br /> <br />4. 기타 회사가 정한 이용신청 요건이 충족되지 않았을 경우<br /> <br />제 5조 (서비스의 해지)<br /> <br />서비스 해지를 희망하는 고객은 회사가 정한 소정의 절차(유무선인터넷 홈페이지 등을 통해 공지합니다)를 통해 서비스 해지를 신청할 수 있습니다.&lt;/p&gt;
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            </div>
                            <div class="button">
                                <button type="submit" class="btn">회원가입</button>
                            </div>
                            <p class="outer-link">계정이 있으신가요? <a href="login"> 로그인 하기</a>
                            </p>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Registration section -->

    <!-- Footer -->
    <c:import url="../temp/footer.jsp"></c:import>
    
    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
<!-- <script src="/js/user/registration.js"></script> -->
</body>

</html>