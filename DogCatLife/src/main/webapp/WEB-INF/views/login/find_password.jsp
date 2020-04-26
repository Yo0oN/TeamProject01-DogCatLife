<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	// 이름 형식 확인
	var nameBoolean = false;
	// id 형식 확인
	var idBoolean = false;
	// 이메일 형식 확인
	var emailBoolean = false;
	// 실제 있는 이름 + id + 메일인지 확인
	var name_id_email_Boolean = false;
	// 메일 전송 확인
	var sendmailBoolean = false;
	// 인증번호 확인
	var confirmnumberBoolean = false;
	
	$(document).ready(function() {
		// 이름 형식 확인
		$('#name').focus().on('keyup', function() {
			nameCheck();
		});
		// id 형식 확인
		$('#id').focus().on('keyup', function() {
			idCheck();
		});
		// 이메일 형식 확인
		$('#email').focus().on('keyup', function() {
			emailCheck();
		});
		// 이름 + id + 메일 확인한 후 이메일 보내기
		$('#confirmbtn').on('click', function() {
			find_name_id_email();
		});
		// 인증 번호 확인
		$('#confirmbtn2').on('click', function() {
			confirmNumber();
		});
		
		
		$('#submit').on('click', function() {
			if (nameBoolean == false || idBoolean == false || emailBoolean == false || name_id_email_Boolean == false || sendmailBoolean == false || confirmnumberBoolean == false) {
				alert('메일을 인증해주세요.');
				return false;
			}
			$('#frm').submit();
		});
	});
	// 이름 형식 확인
	function nameCheck() {
		var check = $('#name').val().trim();
		var languageCheck = /^[가-힣]{2,20}$/g;

		if (!languageCheck.test(check)) {
			$('#namefocus').html('<p style="color:red">2~20 길이의 한글만 입력해주세요.</p>');
			nameBoolean = false;
			name_email_Boolean = false;
			return;
		} else {
			$('#namefocus').html('');
			nameBoolean = true;
			return;
		}
	}
	// 아이디 형식 확인
	function idCheck() {
		var check = $('#id').val().trim();
		var languageCheck = /^[a-z0-9]{4,19}$/g;

		if (!languageCheck.test(check) || check.length < 5 || check.length > 20) {
			$('#idfocus').html('<p style="color:red">ID는 5~20의 영문소문자, 숫자만 사용 가능합니다.</p>');
			idBoolean = false;
			return;
		} else {
			$('#idfocus').html('<p style="color:blue"></p>');
			idBoolean = true;
			return;
		}
	}
	// 이메일 형식 확인
	function emailCheck() {
		var check = $('#email').val().trim();
		var languageCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if (languageCheck.test(check)) {
			$('#emailfocus').html('<p style="color:blue"></p>');
			emailBoolean = true;
			return;
		} else {
			$('#emailfocus').html('<p style="color:red">이메일을 확인해주세요.</p>');
			emailBoolean = false;
			name_email_Boolean = false;
			return;
		}
	}
	// 실제 있는 이름 + ID + 메일인지 확인하기
	function find_name_id_email () {
		var username = $('#name').val().trim();
		var userid = $('#id').val().trim();
		var useremail = $('#email').val().trim();
		if (emailBoolean == false) {
			alert('이메일을 다시 적어주세요.');
			return false;
		}
		if (nameBoolean == false) {
			alert('이름을 다시 적어주세요.');
			return false;
		}
		if (idBoolean == false) {
			alert('id를 다시 적어주세요.');
			return false;
		}
		$.ajax({
			url : 'find_password_name_id_email_confirm.mysql',
			data : {
				useremail : useremail,
				username : username,
				userid : userid
			},
			type : 'post',
			success : function(data) {
				if (data == 0) {
					name_id_email_Boolean = true;
					sendmail();
				} else {
					alert('가입되어있지 않은 회원입니다. 다시 확인해주세요.');
					name_id_email_Boolean = false;
				}
			},
			error : function(error) {
				alert('인증메일 발송에 실패하였습니다. 다시 시도해주세요.');
			}
		})
	}
	// 인증번호 보내기
	function sendmail() {
		var useremail = $('#email').val().trim();
		$.ajax({
			url : 'find_password_mail_confirm.mysql',
			data : {
				useremail : useremail
			},
			type : 'post',
			success : function(data) {
				if (data.length >= 6) {
					alert('인증메일을 전송하였습니다. 확인해주세요.');
					$('#confirmbtn2').attr('num', data);
					sendmailBoolean = true;
				} else {
					if (data == "1") {
						alert('인증메일 전송에 실패하였습니다.');
						sendmailBoolean = false;
					} else if (data == "2"){
						sendmailBoolean = false;
					} else {
						alert('인증메일 전송에 실패하였습니다.');
						sendmailBoolean = false;
					}
				}
			},
			error : function(error) {
				alert('인증메일 발송에 실패하였습니다. 다시 시도해주세요.');
			}
		})
	}
	// 인증번호 확인하기
	function confirmNumber() {
		if (sendmailBoolean == false) {
			alert('인증메일을 먼저 발송해주세요!');
			return false;
		}
		var confirmnumber = $('#confirm').val().trim();
		var realnumber = $('#confirmbtn2').attr('num').trim();
		if (confirmnumber == realnumber) {
			alert('인증 되었습니다.');
			$('#confirmfocus').html('<p style="color:blue">인증 완료</p>')
			confirmnumberBoolean = true;
		} else {
			alert('인증번호를 다시 확인해주세요.');
			confirmnumberBoolean = false;
		}
	}
</script>
</head>

<body
	class="has-side-panel side-panel-right fullwidth-page side-push-panel">

	<div class="body-overlay"></div>
	<div id="wrapper" class="clearfix">
		<!-- Header -->
		<jsp:include page="../login_menu.jsp"></jsp:include>

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
								<h3 class="text-theme-colored font-36">로그인</h3>
								<ol class="breadcrumb white mt-10">
									<li><a href="main.mysql">Home</a></li>
									<li class="active text-theme-colored">비밀번호 찾기</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section>
				<div class="container">
					<div class="row">
						<div class="icon-box mb-0 p-0">
							<h4 class="text-gray pt-10 mt-0 mb-30">비밀번호 찾기</h4>
						</div>
						<hr>
						<div class="col-sm-3"></div>
						<div class="col-sm-6"> <!-- col-md-push-3 -->
							
							<form id="frm" name="frm" class="register-form" method="post" action="find_password_change.mysql">
								
								<div class="row">
									<div class="form-group col-md-12">
										<label for="name">이름</label>
										<input id="name" name="name" class="form-control"
											type="text" placeholder="예) 홍길동">
										<div id="namefocus"></div>
									</div>
								</div>
								
								<div class="row">
									<div class="form-group col-md-12">
										<label for="id">ID</label>
										<input id="id" name="id" class="form-control"
											type="text" placeholder="ID">
										<div id="idfocus"></div>
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-12">
										<label for="email">이메일</label>
										<input id="email"
											name="email" class="form-control" type="email"
											placeholder="예) email@dogcatlife.com">
										<div class="col-12" id="emailfocus"></div>
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-12">
										<label class="sr-only">인증메일발송</label>
										<button id="confirmbtn"
											class="btn btn-theme-colored btn-flat btn-lg btn-block"
											type="button">인증메일발송</button>
									</div>
								</div>
								
								<div class="row">
									<div class="form-group col-md-12">
										<label class="sr-only">인증번호입력</label>
										<input id="confirm" name="confirm" class="form-control"
											type="text" placeholder="인증번호입력">
										<div id="confirmfocus"></div>
									</div>
								</div>
								
								<div class="row">
									<div class="form-group col-md-12">
										<label class="sr-only">인증번호 확인</label>
										<button id="confirmbtn2"
											class="btn btn-theme-colored btn-flat btn-lg btn-block"
											type="button">인증번호 확인</button>
									</div>
								</div>
								
								<div class="form-group">
									<button id="submit" class="btn btn-dark btn-flat btn-lg btn-block mt-15"
										type="submit">비밀번호 찾기</button>
								</div>
								
							</form>
							
						</div>
						<div class="col-sm-3"></div>
					</div>
				</div>
			</section>

		</div>
		<!-- end main-content -->
	</div>
	<!-- end wrapper -->
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

	<script src="resources/common/js/jquery-validation/jquery.validate.js"></script>
	<script
		src="resources/common/js/jquery-validation/additional-methods.js"></script>
	<script
		src="resources/common/js/jquery-validation/localization/messages_ko.js"></script>

</body>
</html>