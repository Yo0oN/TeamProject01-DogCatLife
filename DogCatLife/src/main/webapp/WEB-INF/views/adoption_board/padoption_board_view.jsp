<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="TOs.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%
	String nowUrl = "com_board_view.mysql?" + request.getQueryString();
	session.setAttribute("endUrl", nowUrl);
	String sess_mseq = (String) session.getAttribute("sess_mseq");
	String sess_nickname = (String) session.getAttribute("sess_nickname");

	ArrayList<BoardTO> toLists = (ArrayList) request.getAttribute("toLists");
	
	if (toLists == null || toLists.size() == 0) {
		out.println("<script type='text/javascript'>");
		out.println("alert('존재하지 않는 게시물입니다.')");
		out.println("location.href='com_board_list.mysql?pseq=11'");
		out.println("</script>");
	} else {
		String cpage = (String) request.getAttribute("cpage");

		// 본문 설정
		String pseq = toLists.get(0).getPseq();
		String seq = toLists.get(0).getSeq();
		String subject = toLists.get(0).getSubject();
		String mseq = toLists.get(0).getMseq();
		String writer = toLists.get(0).getWriter();
		String content = toLists.get(0).getContent().replaceAll("\n", "<br>");
		String hit = toLists.get(0).getHit();
		String filename_new = "";
		if (!toLists.get(0).getFilename_new().equals("")) {
			filename_new = "resources/upload/" + toLists.get(0).getFilename_new();
		}
		String wdate_ori = toLists.get(0).getWdate_ori();
		String wdate_mod = toLists.get(0).getWdate_mod();

		// 댓글 설정
		String cseq = "";
		String cmseq = "";
		String cwriter = "";
		String comment = "";
		String cwdate_ori = "";
		String cmt = toLists.size() - 1 + "";
		
		/* StringBuffer sbHTML = new StringBuffer();
		
		for (int i = 1; i < toLists.size(); i++) {
			cseq = toLists.get(i).getCseq();
			cmseq = toLists.get(i).getCmseq();
			cwriter = toLists.get(i).getCwriter();
			comment = toLists.get(i).getComment().replaceAll("\n", "<br>");
			cwdate_ori = toLists.get(i).getCwdate_ori();

			sbHTML.append("<ul class='list-inline'>");
			sbHTML.append("<li>작성자 : <span class='text-theme-colored'>" + cwriter + "</span></li>");
			sbHTML.append("<li>작성일 : <span class='text-theme-colored'>" + cwdate_ori + "</span></li>");
			if (sess_mseq != null && sess_mseq.equals(cmseq)) {
				sbHTML.append("<li><a id='comment_modify' cseq='" + cseq + "'><span>수정</span></a></li>");
				sbHTML.append("<li><a id='comment_delete'><span>삭제</span></a></li>");
			}
			sbHTML.append("</ul>");
			sbHTML.append("<ul class='list-inline'>");
			sbHTML.append("<li><span style='font-size: 14px;' cseq='" + cseq + "'>" + comment + "</span></li>");
			sbHTML.append("</ul>");
			sbHTML.append("<hr>");
		} */
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
								<h3 class="text-theme-colored font-36">입양</h3>
								<ol class="breadcrumb white mt-10">
									<li><a href="main.mysql">Home</a></li>
									<li><a href="padoption_board_list.mysql?pseq=31">입양 가능 아이들</a></li>
									<li class="active text-theme-colored">입양 가능 아이들</li>
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
								<div class="col-md-1"></div>
								<div class="col-md-9">
									<div class="blog-posts single-post">
										<article class="post clearfix mb-0">
											<div class="entry-title pt-0">
												<h3><%=subject%></h3>
											</div>
											<div class="entry-meta pb-10 border-bottom-gray">
												<ul class="list-inline">
													<li>작성일 : <span class="text-theme-colored"><%=wdate_ori%></span></li>
													<%
														if (!wdate_ori.equals(wdate_mod)) {
													%>
													<li>수정일 : <span class="text-theme-colored"><%=wdate_mod%></span></li>
													<%
														}
													%>
													<li>조회수 : <span class="text-theme-colored"><%=hit%></span></li>
												</ul>
											</div>
											<div class="entry-content mt-10 text-center"
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
												<a href='padoption_board_list.mysql?pseq=<%=pseq%>&cpage=<%=cpage%>' class="btn btn-dark btn-flat pull-right m-0">목록</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-1"></div>
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