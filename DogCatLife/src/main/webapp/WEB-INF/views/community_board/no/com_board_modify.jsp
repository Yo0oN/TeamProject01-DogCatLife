<%@page import="TOs.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardTO boardTO = (BoardTO) request.getAttribute("boardTO");

	String pseq = boardTO.getPseq();
	String cpage = boardTO.getCpage();
	String seq = boardTO.getSeq();
	String writer = boardTO.getWriter();
	String content = boardTO.getContent();
	String subject = boardTO.getSubject();
	String filename_ori = boardTO.getFilename_ori();
	if (filename_ori.equals("")) {
		filename_ori = "없음";
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
<link rel="stylesheet" href="./resources/assets/css/slick.css">
<link rel="stylesheet" href="./resources/assets/css/nice-select.css">
<link rel="stylesheet" href="./resources/assets/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet"
	href="./resources/assets/css/board_comment_delete.css">
<link rel="stylesheet" href="./resources/assets/css/board_list.css">
<link rel="stylesheet" href="./resources/assets/css/board_view">
<link rel="stylesheet" href="./resources/assets/css/board_write">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#back').on('click', function() {
			history.back();
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

<body>

	<%-- <jsp:include page='../beforeLogin.jsp' />
	<jsp:include page='../menu_logo_form.jsp' /> --%>

	<hr>

	<!--================Blog Area =================-->
	<section class="blog_area single-post-area mb-30">
		<div class="container">
			<div style="align: center">
				<h2>게시글 수정</h2>
			</div>
			<form action="./com_board_modify_ok.mysql" method="post" name="frm"
				enctype="multipart/form-data">
				<input type="hidden" name="pseq" value="<%=pseq%>" /> <input
					type="hidden" name="cpage" value="<%=cpage%>" /> <input
					type="hidden" name="seq" value="<%=seq%>" />

				<div class="row">
					<div class="col-1">제목</div>
					<div class="col-11">
						<input type="text" id="subject" name="subject"
							value="<%=subject%>" class="col-12 col-sm-12" />
					</div>
				</div>
				<div>&nbsp;</div>
				<div class="row">
					<div class="col-1">내용</div>
					<div class="col-11">
						<textarea class="col-12" id="content" name="content" wrap="hard"
							style="resize: none;"><%=content%></textarea>
					</div>
				</div>
				<div>&nbsp;</div>
				<div class="row">
					<div class="col-1">첨부</div>
					<div class="col-11">
						<input type="file" name="upload" value=""
							class="board_write_input" />
					</div>
				</div>
				<div>&nbsp;</div>
				<div class="row">
					<div class="col-1">원본</div>
					<div class="col-11"><%=filename_ori%></div>
				</div>
				<div align="right">
					<span id="back" style="background-color: white; color: black"
							class="btn pt-20 pb-20 pl-30 pr-30" >취소</span>
					<span id="submit" style="background-color: #2B4B80"
							class="btn pt-20 pb-20 pl-30 pr-30" >수정</span>
				</div>
			</form>


		</div>
	</section>
	<!--================ Blog Area end =================-->
	<%-- <jsp:include page='../footer.jsp' /> --%>

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
	<!-- Date Picker -->
	<script src="./resources/assets/js/gijgo.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="./resources/assets/js/wow.min.js"></script>
	<script src="./resources/assets/js/animated.headline.js"></script>
	<script src="./resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- Scrollup, nice-select, sticky -->
	<script src="./resources/assets/js/jquery.scrollUp.min.js"></script>
	<script src="./resources/assets/js/jquery.nice-select.min.js"></script>
	<script src="./resources/assets/js/jquery.sticky.js"></script>

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