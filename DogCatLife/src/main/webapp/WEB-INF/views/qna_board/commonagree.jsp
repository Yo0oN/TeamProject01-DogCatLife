<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String nowUrl = "commonagree.mysql?" + request.getQueryString();
	session.setAttribute("endUrl", nowUrl);
%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta name="author" content="soledot">
<meta name="description" content="애완동물을 위한, DogCatLife 입니다.">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="ALL">

<meta property="og:title" content="DogCatLife">
<meta property="og:description" content="애완동물을 위한, DogCatLife 입니다.">
<meta property="og:image" content="resources/images/logo.png">
<!-- <meta property="og:url" content="http://medisvc.com/home/fo/index.sd"> -->
<meta property="og:type" content="website">

<title>DogCatLife</title>

<!-- commoncss -->


<!-- Favicon and Touch Icons -->
<link href="resources/sitedesign/images/favicon.png" rel="shortcut icon"
	type="image/png">
<link href="resources/sitedesign/images/apple-touch-icon.png"
	rel="apple-touch-icon">
<link href="resources/sitedesign/images/apple-touch-icon-72x72.png"
	rel="apple-touch-icon" sizes="72x72">
<link href="resources/sitedesign/images/apple-touch-icon-114x114.png"
	rel="apple-touch-icon" sizes="114x114">
<link href="resources/sitedesign/images/apple-touch-icon-144x144.png"
	rel="apple-touch-icon" sizes="144x144">

<!-- Stylesheet -->
<link href="resources/sitedesign/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="resources/sitedesign/css/jquery-ui.min.css" rel="stylesheet"
	type="text/css">
<link href="resources/sitedesign/css/animate.css" rel="stylesheet"
	type="text/css">
<link href="resources/sitedesign/css/css-plugin-collections.css"
	rel="stylesheet" />
<!-- CSS | menuzord megamenu skins -->

<link id="menuzord-menu-skins"
	href="resources/sitedesign/css/menuzord-skins/menuzord-subcolored.css"
	rel="stylesheet" />

<!-- CSS | Main style file -->
<link href="resources/sitedesign/css/style-main.css" rel="stylesheet"
	type="text/css">
<!-- CSS | Preloader Styles -->

<!-- CSS | Custom Margin Padding Collection -->
<link
	href="resources/sitedesign/css/custom-bootstrap-margin-padding.css"
	rel="stylesheet" type="text/css">
<!-- CSS | Responsive media queries -->
<link href="resources/sitedesign/css/responsive.css" rel="stylesheet"
	type="text/css">
<!-- CSS | Style css. This is the file where you can place your own custom css code. Just uncomment it and use it. -->
<!-- <link href="resources/sitedesign/css/style.css" rel="stylesheet" type="text/css"> -->

<!-- CSS | Theme Color -->
<link href="resources/sitedesign/css/colors/theme-skin-blue.css"
	rel="stylesheet" type="text/css">

<link href="resources/soledot/css/fo/soledot.css" rel="stylesheet"
	type="text/css">

<!-- Revolution Slider 5.x CSS settings -->
<link href="resources/sitedesign/js/revolution-slider/css/settings.css"
	rel="stylesheet" type="text/css" />
<link href="resources/sitedesign/js/revolution-slider/css/layers.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/sitedesign/js/revolution-slider/css/navigation.css"
	rel="stylesheet" type="text/css" />

<!-- commonheaderjs -->


<!-- external javascripts -->
<script src="resources/sitedesign/js/jquery-2.2.0.min.js"></script>
<script src="resources/sitedesign/js/jquery-ui.min.js"></script>
<script src="resources/sitedesign/js/bootstrap.min.js"></script>
<!-- JS | jquery plugin collection for this theme -->
<script src="resources/sitedesign/js/jquery-plugin-collection.js"></script>

<!-- Revolution Slider 5.x SCRIPTS 메인에만 필요?-->
<script
	src="resources/sitedesign/js/revolution-slider/js/jquery.themepunch.tools.min.js"></script>
<script
	src="resources/sitedesign/js/revolution-slider/js/jquery.themepunch.revolution.min.js"></script>

</head>

<body
	class="has-side-panel side-panel-right fullwidth-page side-push-panel">

	<div class="body-overlay"></div>

	<div id="wrapper" class="clearfix">
		<jsp:include page='../login_menu.jsp' />

		<!-- Start main-content -->
		<div class="main-content">
			<!-- Section: inner-header -->
			<section class="inner-header divider layer-overlay overlay-light"
				style="background-image: url('resources/images/dogcat_board_main.jpg');"
				data-bg-img="resources/images/dogcat_board_main.jpg">
				<div class="container pt-90 pb-50">
					<!-- Section Content -->
					<div class="section-content">
						<div class="row">
							<div class="col-md-12 xs-text-center">
								<h3 class="text-theme-colored font-36">고객센터</h3>
								<ol class="breadcrumb white mt-10">
									<li><a href="main.mysql">Home</a></li>
									<li><a>고객센터</a></li>
									<li class="active text-theme-colored">이용약관</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</section>

			<!-- Section: event calendar -->
			<section>
				<div class="container">
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="row">
								<div class="col-md-2">
									<div class="sidebar sidebar-left mt-sm-30">
										<div class="widget">
											<h5 class="widget-title line-bottom">
												고객센터
											</h5>
											<div class="categories">
												<ul class="list list-border angle-double-right">
													<li><a href="noticelist.mysql?pseq=41">공지사항</a></li>
													<li><a href="faqlist.mysql?pseq=42">FAQ</a></li>
													<li><a href="./commonagree.mysql">이용약관</a></li>
													<li><a href="./commontext.mysql">개인정보처리방침</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-1"></div>
								<div class="col-md-9">
									<!-- 게시판 타이틀 -->
									<div class="section-title mb-10">
										<div class="row">
											<div class="col-md-12">
												<div class="text-center">
													<h2 class="title heading-line-bottom">이용약관</h2>
												</div>
											</div>
										</div>
									</div>
									<div>
										<div class="row">
											<textarea class="form-control" rows="20" readonly="readonly">제1조 (목적)

이 서비스 약관은 회원이 견생묘생(http://dogcatlife.com) 서비스(이하 "서비스")를 이용함에 있어 회사와 회원 간의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.


제2조 (약관의 명시와 설명 및 개정)

1. 회사는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편주소 등) 등을 이용자가 알 수 있도록 회사의 초기 서비스화면(전면)에 게시합니다. 다만 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
2. 회사는 약관의 규제에 관한 법률, 전자상거래 등에서의 소비자보호에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위 에서 이 약관을 개정합니다.
3. 회사가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 회사에 송신하여 회사의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.


제3조 (정의)

1. 이용자: 회사에 접속하여 이 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
2. 회원: 회사에 개인정보를 제공하여 회원등록을 한 자로서, 회사의 정보를 지속적으로 제공받으며, 회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
3. 비회원: 회원에 가입하지 않고 회사가 제공하는 서비스를 이용하는 자를 말합니다.


제4조 (회원 가입)

1 이용자는 회사가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.
2 회사는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 승낙합니다.
1) 가입신청자가 이 약관 제6조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우.
다만 회원자격 상실 후 3년이 경과한 자로서 회사의 회원 재가입 승낙을 얻은 경우에는 예외로 한다.
2) 등록 내용에 허위, 기재누락, 오기 등이 있는 경우
3) 기타 회원으로 등록하는 것이 회사의 기술상 현저히 지장이 있다고 판단되는 경우
4) 만14세 미만의 아동으로서 부모 등 법정대리인의 동의를 얻지 아니한 경우
3. 회원가입계약의 성립시기는 회사의 승낙이 회원에게 도달한 시점으로 합니다.
4. 회원은 개인정보 항목의 등록사항에 변경이 있는 경우 , 즉시 전자우편 기타 방법으로 회사에 대하여 그 변경사항을 알려야 합니다.
5. 사업자 회원일 경우 증빙자료 및 추가정보를 제공해야 합니다.


제5조 (서비스의 종류)

1. 회사가 제공하는 서비스는 다음과 같습니다. 
1) 병원관련정보
2) 건강검진기관정보
3) 응급의료정보
4) 산재의료정보
5) 진료수가정보
6) 약국정보
7) 의약품정보
8) 임상시험정보
9) 희귀의약품
10) 의약품 업체정보
11) 질병정보
12) 질병통계정보
13) 의료기기정보
14) 의료기기업체정보
15) GMP 지정업체정보
16) GMP 지정품목정보
17) 의료기기 회수·판매중지정보
18) 식품영양성분정보
19) 식품원재료정보
20) 식품첨가물정보
21) 건강기능식품정보
22) 식품행정처분정보
23) 식품 허위·과대광고정보
24) 검사부적합식품정보
25) 수입식품허가정보
26) 검사부적합수입식품정보
27) 화장품 제조·판매업체정보
28) 기능성화장품보고품목정보
29) 기능성화장품심사품목정보
30) 구인·구직정보
31) 커뮤니티
①게시판
②채팅
32) 쇼핑몰
① 판매관련 서비스
② 구매관련 서비스
③ 상품 검색서비스
④ 기타 전자상거래 관련 서비스
33) 병원·건강검진기관·약국 홈페이지 제공
34) 광고 집행 및 프로모션 서비스 
35) 기타 회사가 자체 개발하거나 다른 회사와의 협력계약 등을 통해 회원들에게 제공할 일체의 서비스
2. 회사는 필요한 경우 특정 서비스를 추가할 수 있습니다.
3. 회사는 필요한 경우 특정 서비스(혹은 그 일부)를 일시적 또는 영구적으로 수정하거나 중단할 수 있습니다. 


제6조 (서비스의 중단)

1. 본 약관에 따른 서비스 기간은 서비스 신청일로부터 이용계약의 해지 시까지 입니다. 
2. 회사는 컴퓨터 등 정보통신설비의 보수, 점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. 이 경우 서비스 일시 중단 사실과 그 사유를 견생묘생 초기화면에 통지합니다. 
3. 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스의 제공을 제한하거나 일시 중단할 수 있습니다.


제7조 (회원 탈퇴 및 자격 상실 등)

1. 회원은 회사에 언제든지 자신의 회원 등록 말소(회원 탈퇴)를 요청할 수 있으며 회사는 위 요청을 받은 즉시 해당 회원의 회원 등록 말소를 위한 절차를 밟습니다.
2. 회원 탈퇴가 이루어진 경우 회원의 게시물 중 개인 영역에 등록된 게시물 일체는 삭제됩니다. 다만, 커뮤니티 서비스, 기타 공용 게시판 등에 등록된 게시물은 삭제되지 않습니다.
3. 회원이 다음 각 호의 사유에 해당하는 경우, 회사의 회원자격을 제한 및 정지시킬 수 있습니다.
1) 가입 신청 시에 허위 내용을 등록한 경우
2) 회사를 이용하여 구입한 재화·용역 등의 대금, 기타 회사의 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
3) 다른 사람의 회사 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
4) 회사를 이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
5) 타인의 개인정보를 도용 및 임의사용 하거나 연락처의 허위/도용 또는 고의로 회사 및 판매자와의 연락을 두절하는 경우
6) 기타 회사의 영업행위를 고의로 방해하는 경우
7) 서비스를 이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
4. 회사가 회원의 회원자격을 상실시키기로 결정한 경우에는 회원등록을 말소합니다.
5. 이용자가 본 약관에 의해서 회원 가입 후 서비스를 이용하는 도중, 연속하여 1년 동안 서비스를 이용하기 위해 로그인 기록이 없는 경우, 회사는 회원의 회원자격을 상실시킬 수 있습니다.


제8조 (회원에 대한 통지)

1. 회사가 특정 회원에게 서비스에 관한 통지를 하는 경우 회원정보에 등록된 메일주소를 사용할 수 있습니다.
2. 회사가 불특정다수 회원에 대한 통지를 하는 경우 7일 이상 공지사항 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다.


제9조 (회원의 개인정보)

회사는 서비스를 제공하기 위하여 관련 법령의 규정에 따라 회원으로부터 필요한 개인정보를 수집합니다. (개인정보에 대한 개별 항목은 개인정보처리방침에서 고지)


제10조 (회사의 의무)

1. 회사는 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 본 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하기 위해서 노력합니다.
2. 회사는 회원이 안전하고 편리하게 서비스를 이용할 수 있도록 시스템을 구축합니다.
3. 회사는 회원이 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
4. 회사는 회원이 서비스를 이용함에 있어 회원에게 법률적인 증명이 가능한 고의 또는 중대한 과실을 입힐 경우 이로인한 손해를 배상할 책임이 있습니다.


제11조 (회원의 ID 및 비밀번호에 대한 의무)

1. 회사가 관계법령, "개인정보보호정책"에 의해서 그 책임을 지는 경우를 제외하고, 자신의 ID와 비밀번호에 관한 관리책임은 각 회원에게 있습니다.
2. 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
3. 회원은 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.


제12조 (이용자의 의무)

1. 이용자는 다음 행위를 해서는 안됩니다.
1) 회원가입신청 또는 변경시 허위내용을 등록하는 행위
2) 회사 및 제3자의 지적재산권을 침해하거나 회사의 권리와 업무 또는 제3자의 권리와 활동를 방해하는 행위
3) 다른 회원의 ID를 도용하는 행위
4) 관련 법령에 의하여 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램 등)의 게시 또는 전송하는 행위
5) 회사의 직원 또는 서비스의 관리자를 가장하거나 타인의 명의를 도용하여 정보를 게시, 전송하는 행위
6) 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 목적으로 고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을
포함하고 있는 자료를 게시하거나 전송하는 행위
7) 스토킹(stalking) 등 다른 회원을 괴롭히는 행위
8) 다른 회원에 대한 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위
9) 불특정 다수의 자를 대상으로 하여 광고 또는 선전을 게시하거나 음란물을 게시하는 행위
10) 회사가 제공하는 갤로그 및 관련 서비스에 게시된 공지사항 규정을 위반하는 행위
11) 법령에 따라 온라인 유통이 금지되거나 제한되는 재화, 용역을 구매하려는 행위
2. 제1항에 해당하는 행위를 한 이용자가 있을 경우 회사는 본 약관 제6조 제2, 3항에서 정한 바에 따라 회원의 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.
3. 이용자는 그 귀책사유로 인하여 회사나 다른 회원이 입은 손해를 배상할 책임이 있습니다.


제13조 (공개게시물의 삭제 또는 이용제한)

1 회원의 공개게시물의 내용이 다음 각 호에 해당하는 경우 회사는 해당 공개게시물에 대한 접근을 임시적으로 차단하는 조치를 취할 수 있고, 7일 이내에 각 호의 동일 사례가 2회 이상 반복되는 경우 해당 게시물을 삭제 또는 해당 회원의 회원 자격을 제한, 정지 또는 상실시킬 수 있습니다.
1) 다른 회원 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용
2) 음란물, 욕설 등 공서양속에 위반되는 내용의 정보, 문장, 도형 등을 유포하는 내용
3) 범죄행위와 관련이 있다고 판단되는 내용
4) 다른 회원 또는 제3자의 저작권 등 기타 권리를 침해하는 내용
5) 종교적, 정치적 분쟁을 야기하는 내용으로서, 이러한 분쟁으로 인하여 회사의 업무가 방해되거나 방해되리라고 판단되는 경우
6) 타인의 개인정보, 사생활을 침해하거나 명예를 손상시키는 경우
7) 동일한 내용을 중복하여 다수 게시하는 등 게시의 목적에 어긋나는 경우
8) 불필요하거나 승인되지 않은 광고, 판촉물을 게재하는 경우
② 회원의 공개게시물로 인한 법률상 이익 침해를 근거로, 다른 회원 또는 제3자가 회원 또는 회사를 대상으로 하여 민형사상의 법적 조치(예:고소, 가처분신청, 손해배상청구소송)를 취하는 동시에 법적 조치와 관련된 게시물의 삭제를 요청해오는 경우, 회사는 동 법적 조치의 결과(예: 검찰의 기소, 법원의 가처분결정, 손해배상판결)가 있을 때까지 관련 게시물에 대한 접근을 잠정적으로 제한할 수 있습니다.


제14조 (저작권의 귀속 및 저작물 책임)

1. 회사가 작성한 저작물에 대한 저작권, 기타 지적재산권은 회사에 귀속합니다.
2. 회원은 회사가 제공하는 서비스를 이용함으로써 얻은 정보를 회사의 사전승낙 없이 복제, 전송, 출판, 배포, 방송, 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
3. 회사가 제공하는 서비스를 이용하면서 작성한 각종 게시물의 저작권은 이를 작성한 회원 본인에게 있으며, 해당 게시물이 타인의 저작권을 침해하는 경우 그에 대한 책임은 회원 본인에게 있습니다.
4. 회원이 작성한 게시물은 상품의 판촉, 홍보등을 위하여 회사가 제휴한 타사이트에 복제, 배포, 전송, 전시 될 수 있으며, 본질적인 내용에 변경을 가하지 않는 범위 내에서 수정, 편집될 수 있습니다.
5. 회사는 게시물이 다음 각 호에 해당하는 경우 사전 통보 없이 해당 게시물을 삭제하거나 게시자에 대하여 특정서비스의 이용제한, 이용계약의 해지 등의 조치를 할 수 있습니다. 
1) 대한민국의 법령을 위반하는 내용을 포함하는 경우 
2) 관계법령에 의거 판매가 금지된 불법제품 또는 음란물을 게시, 광고하는 경우 
3) 허위 또는 과대광고의 내용을 포함하는 경우 
4) 타인의 권리나 명예, 신용 기타 정당한 이익을 침해하는 경우 
5) 직거래 유도 또는 타 사이트의 링크를 게시하는 경우 
6) 정보통신기기의 오작동을 일으킬 수 있는 악성코드나 데이터를 포함하는 경우 
7) 사회 공공질서나 미풍양속에 위배되는 경우 
8) 회사가 제공하는 서비스의 원활한 진행을 방해하는 것으로 판단되는 경우 
9) 범죄행위와 관련된 내용을 포함하는 경우


제15조 (광고게재 및 광고주와의 거래)

1. 회사가 회원에게 서비스를 제공할 수 있는 서비스 투자기반의 일부는 광고게재를 통한 수익으로부터 나옵니다. 회원은 회원이 등록한 게시물의 내용을 활용한 광고게재 및 기타 서비스상에 노출되는 광고게재에 대해 동의합니다.
2. 회사는 서비스상에 게재되어 있거나 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를 함으로써 발생하는 손실과 손해에 대해 책임을 지지 않습니다


제 16조 (회사의 면책)

1. 회사는 동물정보를 기반으로 제5조의 서비스를 제공할 뿐이며, 견생묘생 시스템을 활용하여 발생되는 회원 및 업체 간의 모든 분쟁에 대해서는 회원 및 업체들이 책임을 져야 합니다. 
2. 제11조 2항의 사유로 인하여 서비스를 일시적으로 중단하는 경우 회사는 이로 인하여 회원 또는 제3자가 입은 손해에 대하여 책임지지 않습니다.
3. 제11조 3항의 사유로 인하여 서비스를 제한하거나 중단하는 경우 회사는 불가항력을 이유로 그 책임을 면합니다. 
4. 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다. 
5. 회원이 자신의 개인정보를 타인에게 유출 또는 제공함으로써, 발생하는 피해에 대해서 회사는 일체의 책임을 지지 않습니다.


제17조 (약관의 개정)

1. 회사는 약관의규제등에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
2. 다만, 개정 내용이 회원에게 불리할 경우에는 적용일자 30일 이전부터 적용일자 전일까지 공지합니다.
3. 회원은 변경된 약관에 대해 거부할 권리가 있습니다. 회원은 변경된 약관이 공지된 후 15일 이내에 거부의사를 표명할 수 있습니다. 회원이 거부하는 경우 회사는 당해 회원과의 계약을 해지할 수 있습니다. 만약 회원이 변경된 약관이 공지된 후 15일 이내에 거부의사를 표시하지 않는 경우에는 동의하는 것으로 간주합니다.


제18조 (재판관할)

회사와 회원간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 민사소송법상의 관할을 가지는 대한민국의 법원에 제기합니다.
부칙 (2019년 3월 25일 공고)
본 약관은 2019년 3월 25일부터 시행됩니다.</textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- footer content -->

	<jsp:include page="../footer.jsp"></jsp:include>

	<!-- JS | Custom script for all pages -->
	<script src="resources/sitedesign/js/custom.js"></script>

	<!-- notify -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/mouse0270-bootstrap-notify/3.1.7/bootstrap-notify.min.js"></script>

	<!-- jquery-cookie-->
	<script src="resources/common/js/jquery-cookie/jquery.cookie.js"></script>

	<!-- soledot -->
	<script src="resources/soledot/js/fo/soledot.js"></script>
</body>
</html>