<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="TOs.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%
	session.removeAttribute("endUrl");

	String sess_mseq = (String) session.getAttribute("sess_mseq");
	String sess_nickname = (String) session.getAttribute("sess_nickname");

	BoardTO boardTO = (BoardTO) request.getAttribute("boardTO");
	
	if (boardTO == null) {
		out.println("<script type='text/javascript'>");
		out.println("alert('존재하지 않는 게시물입니다.')");
		out.println("location.href='myquestion_list.mysql'");
		out.println("</script>");
	} else {
		String cpage = (String) request.getAttribute("cpage");

		// 본문 설정
		String seq = boardTO.getSeq();
		String aseq = boardTO.getAseq();
		String subject = boardTO.getSubject();
		String content = boardTO.getContent().replaceAll("\n", "<br>");
		String filename_new = "";
		if (!boardTO.getFilename_new().equals("")) {
			filename_new = "resources/upload/" + boardTO.getFilename_new();
		}
		String wdate_ori = boardTO.getWdate_ori();

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
var sess_mseq = <%=sess_mseq%>;
var sess_nickname = '<%=sess_nickname%>';
$(document).ready(function() {
	// 게시글 삭제
	$('#delete').on('click', function() {
		if (confirm('삭제하시겠습니까?')) {
			location.href("./com_board_delete_ok.mysql?seq=<%=seq%>");
			} else {
			}
		});
	});
</script>
</head>
<body
	class="has-side-panel side-panel-right fullwidth-page side-push-panel">

	<div class="body-overlay"></div>
	<!-- <div id="side-panel" class="dark" data-bg-img="http://placehold.it/1920x1280">
		<div class="side-panel-wrap">
			<div id="side-panel-trigger-close" class="side-panel-trigger">
				<a href="#"><i class="icon_close font-30"></i></a>
			</div>
		</div>
	</div> -->

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
								<h3 class="text-theme-colored font-36">마이페이지</h3>
								<ol class="breadcrumb white mt-10">
									<li><a href="main.mysql">Home</a></li>
									<li><a>마이페이지</a></li>
									<li class="active text-theme-colored">Q/A</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</section>

			<!-- Section: Blog -->
			<section>
				<div class="container">
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<div class="row">
								<div class="col-md-12">
									<div class="blog-posts single-post">
										<article class="post clearfix mb-0">
											<div class="entry-title pt-0">
												<h3><%=subject%></h3>
											</div>
											<div class="entry-meta pb-10 border-bottom-gray">
												<ul class="list-inline">
													<li>작성일 : <span class="text-theme-colored"><%=wdate_ori%></span></li>
												</ul>
											</div>
											<div class="entry-content mt-10"
												style="word-break: break-all; overflow: auto">

												<%
													if (!filename_new.equals("")) {
												%>
												<p style="text-align: center;">&nbsp;</p>
												<p>
													<span style="font-size: 16px;"> <img height="50%"
														src="<%=filename_new%>" width="50%" />
													</span>
												</p>
												<p style="text-align: center;">&nbsp;</p>
												<%
													}
												%>

												<p>
													<span style="font-size: 16px;"><%=content%></span>
												</p>

											</div>
										</article>

										<div class="row mt-10 pb-10 border-bottom-gray">
											<div class="col-sm-12">
												<a id="writebtn"
													href="myquestion_write.mysql?cpage=<%=cpage%>"
													class="btn btn-dark btn-flat m-0">질문하기</a> <a
													href="myquestion_list.mysql?cpage=<%=cpage%>"
													class="btn btn-dark btn-flat pull-right m-0">목록</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
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
	}
%>