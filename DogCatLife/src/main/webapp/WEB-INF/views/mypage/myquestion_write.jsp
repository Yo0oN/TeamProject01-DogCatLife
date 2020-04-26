<%@page import="TOs.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session.removeAttribute("endUrl");
	String sess_mseq = (String) session.getAttribute("sess_mseq");
	String sess_nickname = (String) session.getAttribute("sess_nickname");

	BoardTO boardTO = (BoardTO) request.getAttribute("boardTO");
	String cpage = boardTO.getCpage();
	String seq = boardTO.getSeq();
%>
<% if (sess_mseq != null) {
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

<!-- CSS | Theme Color -->
<link href="resources/sitedesign/css/colors/theme-skin-blue.css"
	rel="stylesheet" type="text/css">

<link href="resources/soledot/css/fo/soledot.css" rel="stylesheet"
	type="text/css">

<!-- commonheaderjs -->


<!-- external javascripts -->
<script src="resources/sitedesign/js/jquery-2.2.0.min.js"></script>
<script src="resources/sitedesign/js/jquery-ui.min.js"></script>
<script src="resources/sitedesign/js/bootstrap.min.js"></script>
<!-- JS | jquery plugin collection for this theme -->
<script src="resources/sitedesign/js/jquery-plugin-collection.js"></script>

<script data-ad-client="ca-pub-3935451468089596" async
	src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var cpage = '<%=cpage%>';
		var seq = '<%=seq%>';
		
		$('#back').on('click', function() {
			if (seq == 'null') {
				location.href="myquestion_list.mysql";
			} else {
				location.href="myquestion_view.mysql?cpage=<%=cpage%>&seq=<%=seq %>";
			}
		});
		$('#submit').on('click', function() {
			if ($('#subject').val().trim() == "") {
				alert('제목을 입력하세요!');
				return false;
			}
			if ($('#content').val().trim() == "") {
				alert('내용을 입력하세요!');
				return false;
			}
			document.frm.submit();
		});
	});
</script>
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
				data-bg-img="resources/images/dogcat_board_main.jpg">
				<div class="container pt-90 pb-50">
					<!-- Section Content -->
					<div class="section-content">
						<div class="row">
							<div class="col-md-12 xs-text-center">
								<h3 class="text-theme-colored font-36">마이페이지</h3>
								<ol class="breadcrumb white mt-10">
									<li><a href="main.mysql">Home</a></li>
									<li><a>마이페이지</a></li>
									<li class="active text-theme-colored">질문글쓰기</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</section>

			<!-- Section: Blog -->
			<section class="divider">
				<div class="container">
					<div class="row pt-30">
						<div class="col-md-1"></div>
						<div class="col-md-9">
							<div class="aa-contact-address-left">
								<form class="comments-form contact-form" action="./myquestion_write_ok.mysql"
									id="frm" name="frm" method="post" enctype="multipart/form-data">
									<input type="hidden" name="mseq" value="<%=sess_mseq%>" />
									<input type="hidden" name="writer" value="<%=sess_nickname%>" />
									
									<div class="form-group">
										<label for="rqms_title">제목 <small>*</small></label>
										<input id="subject" name="subject" class="form-control required" type="text" value="">
									</div>

									<div class="form-group">
										<label for="rqms_content">내용</label>
										<textarea id="content" name="content" class="form-control required" rows="10"></textarea>
									</div>
									
									<div class="form-group">
										<label for="rqms_content">첨부</label>
										<input type="file" name="upload" value=""
											class="board_write_input" />
									</div>
									
								</form>
								<div class="row mt-10">
									<div class="col-sm-12">
										<a id="back" class="btn btn-dark btn-flat m-0">취소</a>
										<a id="submit" class="btn btn-dark btn-flat pull-right m-0">글작성</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</section>
		</div>
		<!-- end main-content -->
	</div>

	<!-- Footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
	<!-- commonfootjs -->


	<!-- JS | Custom script for all pages -->
	<script src="resources/sitedesign/js/custom.js"></script>

	<!-- notify -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/mouse0270-bootstrap-notify/3.1.7/bootstrap-notify.min.js"></script>

	<!-- jquery-cookie-->
	<!-- <script src="resources/common/js/jquery-cookie/jquery.cookie.js"></script> -->

	<!-- soledot -->
	<script src="resources/soledot/js/fo/soledot.js"></script>
</body>
</html>
<%
	} else {
		out.println("<script type='text/javascript'>");
		out.println("alert('로그인을 해주세요.')");
		out.println("location.href='./login.mysql'");
		out.println("</script>");
	}
%>