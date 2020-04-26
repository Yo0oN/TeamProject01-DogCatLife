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

<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./assets/css/flaticon.css">
<link rel="stylesheet" href="./assets/css/slicknav.css">
<link rel="stylesheet" href="./assets/css/animate.min.css">
<link rel="stylesheet" href="./assets/css/magnific-popup.css">
<link rel="stylesheet" href="./assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="./assets/css/themify-icons.css">
<link rel="stylesheet" href="./assets/css/slick.css">
<link rel="stylesheet" href="./assets/css/nice-select.css">
<link rel="stylesheet" href="./assets/css/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>

<body>

	<!-- Preloader Start -->
	<!-- 페이지 시작할때 애니메이션 -->
	<!-- <div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="./images/logo.png" alt="">
				</div>
			</div>
		</div>
	</div> -->
	<!-- Preloader Start -->

<%-- 	<jsp:include page='../beforeLogin.jsp' />
	<jsp:include page='../menu_logo_form.jsp' />
 --%>


	<div class="w3-container">

		<h3>회원정보수정</h3>

		<table border="1" aling="center" class="w3-table w3-striped w3-border">

			<tr align="center">
				<td width="150" heigth="150" align="center">아이디(ID)</td>
				<td></td>

			</tr>
			<tr>
				<td>이름</td>
				<td></td>

			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td></td>

			</tr>
			<tr>
				<td>이메일</td>
				<td></td>

			</tr>
			<tr>
				<td>비밀번호변경</td>
				<td></td>

			</tr>
				<tr>
				<td>배송지</td>
				<td></td>

			</tr>
				<tr>
				<td>수신설정</td>
				<td></td>

			</tr>
			
		</table>
	</div>










	<hr>


	<section class="blog_area single-post-area mb-30">
		<div class="container">

			<div class="row">
				<div class="col-lg-12">
					<h3>회원정보수정</h3>
				</div>
			</div>
			<div class="row">
				<form action="#">
					<div class="row">
						<div class="mt-10 col-4">
							<input type="text" name="id" value="ID">
						</div>
						<div class="mt-10 col-4">
							<input type="text" name="id" placeholder="ID"
								onfocus="this.placeholder = ''" onblur="this.placeholder = 'ID'"
								required class="single-input-primary">
						</div>
						<div class="mt-10 col-4">
							<input type="text" name="id" placeholder="ID"
								onfocus="this.placeholder = ''" onblur="this.placeholder = 'ID'"
								required class="single-input-primary">
						</div>
						<div class="mt-10 col-4">
							<input type="text" name="name" placeholder="이름"
								onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'"
								required class="single-input-primary">
						</div>
						<div class="mt-10 col-4 default-select" id="default-select">
							<select name="cars" class="custom-select">
								<option value="f">여자</option>
								<option value="m">남자</option>
							</select>
						</div>
						<div class="mt-10 col-12">
							<input type="text" name="email" placeholder="이메일"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = '이메일'" required
								class="single-input-primary">
						</div>
						<div class="mt-10 col-12">
							<input type="text" name="phone" placeholder="전화번호"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = '전화번호'" required
								class="single-input-primary">
						</div>
						<div class="mt-10 col-12">
							<input type="password" name="password" placeholder="암호"
								onfocus="this.placeholder = ''" onblur="this.placeholder = '암호'"
								required class="single-input-primary">
						</div>
						<div class="mt-10 col-12">
							<input type="text" name="nickname" placeholder="별명"
								onfocus="this.placeholder = ''" onblur="this.placeholder = '별명'"
								required class="single-input-primary">
						</div>

					</div>
					<div class="col-12 mt-30" align="right">
						<button type="button" style="min-width: 100px" class="btn bg-dark"
							disabled>회원가입</button>
					</div>
				</form>
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
	<!-- Date Picker -->
	<script src="./assets/js/gijgo.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="./assets/js/wow.min.js"></script>
	<script src="./assets/js/animated.headline.js"></script>
	<script src="./assets/js/jquery.magnific-popup.js"></script>

	<!-- Scrollup, nice-select, sticky -->
	<script src="./assets/js/jquery.scrollUp.min.js"></script>
	<script src="./assets/js/jquery.nice-select.min.js"></script>
	<script src="./assets/js/jquery.sticky.js"></script>

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