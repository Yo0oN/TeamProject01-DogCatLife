<%@page import="TOs.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="TOs.BoardListsTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	BoardListsTO boardListsTO = (BoardListsTO) request.getAttribute("boardListsTO");

	// 현재 게시판
	String pseq = boardListsTO.getPseq() + "";
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
	for (int i = 0; i < toLists.size(); i++) {
		BoardTO boardTO = toLists.get(i);

		pseq = boardTO.getPseq();
		String seq = boardTO.getSeq();
		String subject = boardTO.getSubject();
		String writer = boardTO.getWriter();
		String wdate = boardTO.getWdate_ori();
		String hit = boardTO.getHit();
		String filename = boardTO.getFilename_new();
		String countComment = boardTO.getCmt();

		sbHTML.append("<tr>");

		sbHTML.append("<td>" + seq + "</td>");
		sbHTML.append("<td><a href='com_board_view.mysql?pseq=" + pseq + "&cpage=" + cpage + "&seq=" + seq
				+ "' style='color: black'>" + subject + "</a></td>");
		sbHTML.append("<td>" + writer + "</td>");
		sbHTML.append("<td>" + wdate + "</td>");
		sbHTML.append("<td>" + hit + "</td>");
		sbHTML.append("</tr>");
	}
%>



<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>SEO HTML-5 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="./resources/assets/img/favicon.ico">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/slicknav.css">
<link rel="stylesheet" href="./resources/assets/css/animate.min.css">
<link rel="stylesheet" href="./resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="./resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="./resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="./resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="./resources/assets/css/slick.css">
<link rel="stylesheet" href="./resources/assets/css/nice-select.css">
<link rel="stylesheet" href="./resources/assets/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>

<body>

<%-- 	<jsp:include page='../beforeLogin.jsp' />
	<jsp:include page='../menu_logo_form.jsp' /> --%>

	<hr>

	<!--================Blog Area =================-->
	<section class="blog_area section-paddingr">
		<div class="container">
			<div class="row">
				<h2 class="col-9">커뮤니티 게시판</h2>
				<div class="col-3" align="right">
					<a href="./com_board_write.mysql?pseq=<%=pseq%>">
					<span style="background-color: #2B4B80"
						class="btn pt-20 pb-20 pl-30 pr-30" >글 쓰기</span>
					</a>
				</div>
			</div>
			<!-- 게시판 목록 시작 -->
			<div>
				<div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th width="50%">제목</th>
								<th>글쓴이</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<%=sbHTML%>
							<!-- <tr>
								<td>3</td>
								<td><a href="#" style="color: black">제목제목</a></td>
								<td>작성자</td>
								<td>2020-01-01</td>
								<td>6</td>
							</tr> -->
						</tbody>
					</table>

					<div>
						<!-- 페이지 이동 -->
						<nav class="blog-pagination justify-content-center d-flex"
							style="margin-top: 30px; text-align: center">
							<!-- blog-pagination  -->


							<ul class="pagination">
								<%
									if (endBlock >= totalPage) {
										endBlock = totalPage;
									}

									// << 기호, 페이지 번호는 한번에 5개까지만 보여준다.
									// << 기호를 누르면 이전페이지 번호 5개를 보이게 하는 기능을 주자.
									if (startBlock == 1) {
										out.println("<li class='page-item'><a class='page-link'"
												+ " aria-label='Previous'> <i class='ti-angle-left'></i></a></li>");
									} else {
										out.println("<li class='page-item'><a href='./com_board_list.mysql?pseq=" + pseq + "&cpage="
												+ (startBlock - blockPerPage)
												+ "' class='page-link' aria-label='Previous'> <i class='ti-angle-left'></i></a></li>");
									}

									// < 기호, 즉 한페이지 앞으로 가게 해주는 기호는 현재 페이지가 1페이질경우에는 아무 작동을 하지 않지만,
									// 1페이지가 아닐경우에는 한페이지 앞으로 가게 하는 기능을 준다.
									if (cpage == 1) {
										out.println("<li class='page-item'><a class='page-link'"
												+ " aria-label='Previous'> <i class='ti-angle-left'></i></a></li>");
									} else {
										out.println(
												"<li class='page-item'><a href='./com_board_list.mysql?pseq=" + pseq + "&cpage=" + (cpage - 1)
														+ "' class='page-link' aria-label='Previous'> <i class='ti-angle-left'></i></a></li>");
									}

									// 아무 이동도 하지 않고 이 게시판에 바로 들어왔을 때에는 주소창이 board_list1.jsp인 상태이다.
									// 하지만 아래의 페이지 번호를 누르게 된다면, 새로운 게시판 목록 창이 열리며 i가 함께 넘어간다.
									// 그렇게 넘어간 i페이지는 현재페이지를 나타내는 cpage에 할당되어 해당 페이지에서 보여야할 글 목록을 보여준다. 
									for (int i = startBlock; i <= endBlock; i++) {
										if (cpage == i) {
											out.println("<li class='page-item'><a  class='page-link'>" + i + "</a></li>");
										} else {
											out.println("<li class='page-item active'><a href='./com_board_list.mysql?pseq=" + pseq + "&cpage="
													+ i + "' class='page-link'>" + i + "</a></li>");
										}
									}

									// > 기호, 즉 한페이지 뒤로 가게 해주는 기호는 현재 페이지가 마지막 페이질경우에는 아무 작동을 하지 않지만,
									// 마지막 페이지가 아닐경우에는 뒷페이지로 가게 하는 기능을 준다.
									if (cpage == totalPage) {
										out.println(
												"<li class='page-item'><a class='page-link' aria-label='Next'> <i class='ti-angle-right'></i> </a></li>");
									} else {
										out.println("<li class='page-item'><a href='com_board_list.mysql?pseq=" + pseq + "&cpage=" + (cpage + 1)
												+ "' class='page-link' aria-label='Next'> <i class='ti-angle-right'></i></a></li>");
									}

									// >> 기호, 페이지 번호는 한번에 5개씩만 보여진다. >>를 누르면 다음 5개의 숫자가 보이고, 그 페이지로 이동할 수 있게 해주자.
									// 현재 페이지가 마지막 페이질경우에는 아무 작동을 하지 않지만,
									// 마지막 페이지가 아닐경우에는 마지막 페이지로 가게 하는 기능을 준다.
									if (totalPage <= endBlock) {
										out.println(
												"<li class='page-item'><a class='page-link' aria-label='Next'> <i class='ti-angle-right'></i> </a></li>");
									} else {
										out.println("<li class='page-item'><a href='com_board_list.mysql?pseq=" + pseq + "&cpage="
												+ (startBlock + blockPerPage)
												+ "' class='page-link' aria-label='Next'> <i class='ti-angle-right'></i></a></li>");
									}
								%>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>

<%-- 	<jsp:include page='../footer.jsp' /> --%>

	<!-- JS here -->

	<!-- All JS Custom Plugins Link Here here -->
	<script src="./resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>

	<!-- Jquery, Popper, Bootstrap -->
	<script src="./resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="./resources/assets/js/popper.min.js"></script>
	<script src="./resources/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="./resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="./resources/assets/js/owl.carousel.min.js"></script>
	<script src="./resources/assets/js/slick.min.js"></script>

	<!-- One Page, Animated-HeadLin -->
	<script src="./resources/assets/js/wow.min.js"></script>
	<script src="./resources/assets/js/animated.headline.js"></script>

	<!-- Scrollup, nice-select, sticky -->
	<script src="./resources/assets/js/jquery.scrollUp.min.js"></script>
	<script src="./resources/assets/js/jquery.nice-select.min.js"></script>
	<script src="./resources/assets/js/jquery.sticky.js"></script>
	<script src="./resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- contact js -->
	<script src="./resources/assets/js/contact.js"></script>
	<script src="./resources/assets/js/jquery.form.js"></script>
	<script src="./resources/assets/js/jquery.validate.min.js"></script>
	<script src="./resources/assets/js/mail-script.js"></script>
	<script src="./resources/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="./resources/assets/js/plugins.js"></script>
	<script src="./resources/assets/js/main.js"></script>

</body>
</html>