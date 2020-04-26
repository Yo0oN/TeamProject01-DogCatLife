<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="assets/img/favicon.ico">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">

</head>

<body>

	<!-- Preloader Start -->
	<!-- <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/logo.png" alt="">
                </div>
            </div>
        </div>
    </div> -->
	<!-- Preloader Start-->
<%-- 	<jsp:include page='../beforeLogin.jsp' />
	<jsp:include page='../menu_logo_form.jsp' /> --%>

	<hr>
	<!-- Slider Area Start-->
	<!-- <div class="services-area">
		<div class="container">
			Section-tittle
			<div class="row d-flex justify-content-center">
				<div class="col-lg-8">
					<div class="section-tittle mb-80">
						<h2>커뮤니티 게시판</h2>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	<!-- Slider Area End-->

	<!--================Blog Area =================-->
	<section class="blog_area section-paddingr">
		<div class="container">
			<div style="align: center">
				<!--  section-tittle -->
				<h2>나의 작성글</h2>
			</div>

			<form action="#" class="row">
				<div class=" col-8 default-select" id="default-select">
					<select name="cars" class="custom-select">
						<option value="all_board">전체 게시판</option>
						<option value="com_board">커뮤니티</option>
						<option value="album_board">자랑하기</option>
						<option value="lost_board">실종</option>
						<option value="lost_case_board">찾기후기</option>
						<option value="adopcase_board">입양 후기</option>
					</select>
				</div>
				<div class="col-4" align="right">
					<button type="button" style="min-width: 50px;padding:15px 20px 15px 20px" class="btn bg-dark"
						disabled>찾기</button>
				</div>
			</form>
			<br>
			<!-- 게시판 목록 시작 -->
			<div>
				<div class="table-responsive-sm">
					<table class="table">
						<thead>
							<tr>
								<th>게시판</th>
								<th width="50%">제목</th>
								<th>글쓴이</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>커뮤니티</td>
								<td><a href="#" style="color: black">제목제목</a></td>
								<td>작성자</td>
								<td>2020-01-01</td>
								<td>6</td>
							</tr>
							<tr>
								<td>자랑하기</td>
								<td><a href="#" style="color: black">제목제목</a></td>
								<td>작성자</td>
								<td>2020-01-01</td>
								<td>6</td>
							</tr>
							<tr>
								<td>자랑하기</td>
								<td><a href="#" style="color: black">제목제목</a></td>
								<td>작성자</td>
								<td>2020-01-01</td>
								<td>6</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 게시판 목록  끝 -->


			<div>
				<!-- 페이지 이동 -->
				<nav class="blog-pagination justify-content-center d-flex"
					style="margin-top: 30px; text-align: center">
					<!-- blog-pagination  -->
					<ul class="pagination">
						<li class="page-item"><a href="#" class="page-link"
							aria-label="Previous"> <i class="ti-angle-left"></i>
						</a></li>
						<li class="page-item"><a href="#" class="page-link">1</a></li>
						<li class="page-item active"><a href="#" class="page-link">2</a>
						</li>
						<li class="page-item"><a href="#" class="page-link"
							aria-label="Next"> <i class="ti-angle-right"></i>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
		</div>
	</section>

	<%-- <jsp:include page='../footer.jsp' /> --%>

	<!-- JS here -->

	<!-- All JS Custom Plugins Link Here here -->
	<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>

	<!-- Jquery, Popper, Bootstrap -->
	<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="./assets/js/popper.min.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="./assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="./assets/js/owl.carousel.min.js"></script>
	<script src="./assets/js/slick.min.js"></script>

	<!-- One Page, Animated-HeadLin -->
	<script src="./assets/js/wow.min.js"></script>
	<script src="./assets/js/animated.headline.js"></script>

	<!-- Scrollup, nice-select, sticky -->
	<script src="./assets/js/jquery.scrollUp.min.js"></script>
	<script src="./assets/js/jquery.nice-select.min.js"></script>
	<script src="./assets/js/jquery.sticky.js"></script>
	<script src="./assets/js/jquery.magnific-popup.js"></script>

	<!-- contact js -->
	<script src="./assets/js/contact.js"></script>
	<script src="./assets/js/jquery.form.js"></script>
	<script src="./assets/js/jquery.validate.min.js"></script>
	<script src="./assets/js/mail-script.js"></script>
	<script src="./assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="./assets/js/plugins.js"></script>
	<script src="./assets/js/main.js"></script>

</body>
</html>