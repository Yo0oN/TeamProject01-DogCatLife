<%@page import="TOs.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="TOs.BoardListsTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	session.removeAttribute("endUrl");

	
	String sess_mseq = (String) session.getAttribute("sess_mseq");
	String sess_nickname = (String) session.getAttribute("sess_nickname");
	
	BoardListsTO boardListsTO = (BoardListsTO) request.getAttribute("boardListsTO");

	// 현재 게시판
	// String pseq = boardListsTO.getPseq() + "";
	// 현재페이지
	int cpage = boardListsTO.getCpage();
	// 한 페이지당 출력 데이터 개수
	int recordPerPage = boardListsTO.getRecordPerPage();
	// 전체 페이지 개수 = 마지막 페이지
	int totalPage = boardListsTO.getTotalPage();
	// 전체 데이터(글) 개수
	int totalRecord = boardListsTO.getTotalRecord();
	// 페이지번호가 몇개씩 보이게 할지 설정
	int blockPerPage = boardListsTO.getBlockPerPage();
	// 보이는 페이지 번호의 시작부분이다.
	int startBlock = boardListsTO.getStartBlock();
	// 보이는 페이지 번호의 끝부분이다.
	int endBlock = boardListsTO.getEndBlock();
	// 목록을 받아옴
	ArrayList<BoardTO> toLists = boardListsTO.getBoardLists();

	StringBuffer sbHTML = new StringBuffer();
	if (toLists.size() == 0) {
		sbHTML.append("<td class='text-center' colspan='5'>등록 된 게시글이 없습니다.</td>");
	} else {
		for (int i = 0; i < toLists.size(); i++) {
			BoardTO boardTO = toLists.get(i);

			String seq = boardTO.getSeq();
			String aseq = boardTO.getAseq();
			String subject = boardTO.getSubject();
			String wdate = boardTO.getWdate_ori();
			String content = boardTO.getContent();
			String pseq = boardTO.getPseq();

			sbHTML.append("<tr>");
			if (aseq.equals("")) {
				sbHTML.append("<th class='text-center'>Q</th>");
			} else {
				sbHTML.append("<th class='text-center'>A</th>");
			}
			
			if (aseq.equals("")) {
				sbHTML.append("<th><a href='myquestion_view.mysql?cpage=" + cpage + "&seq=" + seq + "' style='color: black'>" + subject + "</a></th>");
			} else {
				sbHTML.append("<th><a href='myquestion_answer.mysql?cpage=" + cpage + "&aseq=" + aseq + "' style='color: black'>&nbsp;&nbsp;ㄴ" + subject + "</a></th>");
			}
			sbHTML.append("<th class='text-center'>" + wdate + "</th>");
			sbHTML.append("</tr>");
		}
	}
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
	var sess_mseq = <%= sess_mseq %>;
	var sess_nickname = '<%= sess_nickname %>';
	$(document).ready(function() {
		$('#writebtn').on('click', function() {
			if(sess_mseq == null || sess_nickname == null) {
				alert('글을 작성하시려면 로그인을 해주세요.');
				return false;
			}
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
									<li class="active text-theme-colored">Q/A</li>
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
					<jsp:include page="./mypagemenu.jsp"></jsp:include>
						<div class="col-md-1"></div>
						<div class="col-md-7">
							<div class="row">
								<div class="col-md-12">

									<!-- 게시판 타이틀 -->
									<div class="section-title mb-10">
										<div class="row">
											<div class="col-md-12">
												<div class="text-center">
													<h2 class="title heading-line-bottom">Q/A</h2>
												</div>
											</div>
										</div>
									</div>


									<div>

										<div class="row">
											<div class="col-md-12">
												<div class="table-responsive">
													<table
														class="table table-striped table-hover table-bordered">
														<colgroup>
															<col style="width: 7%;">
															<col style="width: 56%;">
															<col style="width: 15%;">
														</colgroup>
														<thead>
															<tr class="bg-theme-colored" data-text-color="white">
																<th class="text-center"></th>
																<th class="text-center">제목</th>
																<th class="text-center">작성일</th>
															</tr>
														</thead>
														<tbody>
															<%=sbHTML%>
														</tbody>
													</table>
												</div>

												<!-- 글쓰기버튼 -->
												<div class="row">
													<div class="col-sm-12">
														<a href="myquestion_write.mysql">
															<button type="button" id="writebtn"
																class="btn btn-dark btn-flat pull-right m-0">질문하기</button>
														</a>
													</div>
												</div>

												<!-- 페이지 이동버튼 -->
												<div class="row">

													<div class="col-sm-12">
														<nav>
															<ul
																class="pagination theme-colored pull-right xs-pull-center mb-xs-40">
																<%
																	if (endBlock >= totalPage) {
																		endBlock = totalPage;
																	}

																	// << 기호, 페이지 번호는 한번에 5개까지만 보여준다.
																	// << 기호를 누르면 이전페이지 번호 5개를 보이게 하는 기능을 주자.
																	if (startBlock == 1) {
																		out.println("<li><a aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
																	} else {
																		out.println("<li><a aria-label='Previous' href='./myquestion_list.mysql?cpage="
																				+ (startBlock - blockPerPage) + "'><span aria-hidden='true'>&laquo;</span></a></li>");
																	}

																	// < 기호, 즉 한페이지 앞으로 가게 해주는 기호는 현재 페이지가 1페이질경우에는 아무 작동을 하지 않지만,
																	// 1페이지가 아닐경우에는 한페이지 앞으로 가게 하는 기능을 준다.
																	if (cpage == 1) {
																		out.println("<li><a aria-label='Previous'><span aria-hidden='true'>&lsaquo;</span></a></li>");
																	} else {
																		out.println("<li><a aria-label='Previous' href='./myquestion_list.mysql?cpage="
																				+ (cpage - 1) + "'><span aria-hidden='true'>&lsaquo;</span></a></li>");
																	}

																	// 아무 이동도 하지 않고 이 게시판에 바로 들어왔을 때에는 주소창이 board_list1.jsp인 상태이다.
																	// 하지만 아래의 페이지 번호를 누르게 된다면, 새로운 게시판 목록 창이 열리며 i가 함께 넘어간다.
																	// 그렇게 넘어간 i페이지는 현재페이지를 나타내는 cpage에 할당되어 해당 페이지에서 보여야할 글 목록을 보여준다. 
																	for (int i = startBlock; i <= endBlock; i++) {
																		if (cpage == i) {
																			out.println("<li class='active'><a>" + i + "</a></li>");
																		} else {
																			out.println("<li class='active'><a href='./myquestion_list.mysql?cpage=" + i + "'>"
																					+ i + "</a></li>");
																		}
																	}

																	// > 기호, 즉 한페이지 뒤로 가게 해주는 기호는 현재 페이지가 마지막 페이질경우에는 아무 작동을 하지 않지만,
																	// 마지막 페이지가 아닐경우에는 뒷페이지로 가게 하는 기능을 준다.
																	if (cpage == totalPage) {
																		out.println("<li><a aria-label='Next'> <span aria-hidden='true'>&rsaquo;</span></a></li>");
																	} else {
																		out.println("<li><a aria-label='Next' href='myquestion_list.mysql?cpage=" + (cpage + 1)
																				+ "'> <span aria-hidden='true'>&rsaquo;</span></a></li>");
																	}

																	// >> 기호, 페이지 번호는 한번에 5개씩만 보여진다. >>를 누르면 다음 5개의 숫자가 보이고, 그 페이지로 이동할 수 있게 해주자.
																	// 현재 페이지가 마지막 페이질경우에는 아무 작동을 하지 않지만,
																	// 마지막 페이지가 아닐경우에는 마지막 페이지로 가게 하는 기능을 준다.
																	if (totalPage <= endBlock) {
																		out.println("<li><a aria-label='Previous'><span aria-hidden='true'>&raquo;</span></a></li>");
																	} else {
																		out.println("<li><a aria-label='Previous' href='myquestion_list.mysql?cpage="
																				+ (startBlock + blockPerPage) + "'><span aria-hidden='true'>&raquo;</span></a></li>");
																	}
																%>
															</ul>
														</nav>
													</div>
												</div>

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
	</div>
	<!-- end main-content -->

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