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
<script type="text/javascript">
	// ID 형식 확인
	var idBoolean = false;
	// ID 중복 확인
	var usedid = false;
	// 이름 형식 확인
	var nameBoolean = false;
	// 닉네임 형식 확인
	var nicknameBoolean = false;
	// 암호 형식 확인
	var passwordBoolean = false;
	// 암호2 일치 확인
	var passwordBoolean2 = false;
	// 전화번호 형식 확인
	var phoneBoolean = false;
	// 이메일 확인
	var emailBoolean = false;
	// 이메일 중복 확인
	var usedemail = false;
	// 메일 전송 확인
	var sendmailBoolean = false;
	// 인증번호 확인
	var confirmnumberBoolean = false;
	
	$(document).ready(function() {
		// ID 형식 확인
		$('#id').focus().on('keyup', function() {
			idCheck();
		});
		// ID 중복 확인
		$('#id').focusout(function() {
			useuserid();
		});
		// 암호 형식 확인
		$('#password').focus().on('keyup', function() {
			passwordCheck();
		});
		// 암호2 일치 확인
		$('#password2').focus().on('keyup', function() {
			passwordCheck2();
		});
		// 이름 형식 확인
		$('#name').focus().on('keyup', function() {
			nameCheck();
		});
		// 닉네임 형식 확인
		$('#nickname').focus().on('keyup', function() {
			nicknameCheck();
		});
		// 전화번호 형식 확인
		$('#phone').focus().on('keyup', function() {
			phoneCheck();
		});
		// 이메일 형식 확인
		$('#email').focus().on('keyup', function() {
			emailCheck();
		});
		// 이메일 중복 확인
		$('#email').blur(function() {
			usedemailCheck();
		});
		// 이메일 보내기
		$('#confirmbtn').on('click', function() {
			sendmail();
		});
		// 인증 번호 확인
		$('#confirmbtn2').on('click', function() {
			confirmNumber();
		});
		
		
		$('#submit').on('click', function() {
			if (idBoolean == false || usedid == false) {
				alert('ID를 확인하세요.');
				return false;
			}
			if (passwordBoolean == false || passwordBoolean2 == false) {
				alert('암호를 확인하세요.');
				return false;
			}
			if (nameBoolean == false) {
				alert('이름을 확인하세요.');
				return false;
			}
			if (nicknameBoolean == false) {
				alert('닉네임을 확인하세요.');
				return false;
			}
			if (phoneBoolean == false) {
				alert('전화번호를 확인하세요.');
				return false;
			}
			if (emailBoolean == false || usedemail == false) {
				alert('이메일을 확인하세요.');
				return false;
			}
			if (confirmnumberBoolean == false) {
				alert('인증번호를 확인하세요.');
				return false;
			}
			
			$('#frm').submit();
		});
	});

	// 아이디 형식 확인
	function idCheck() {
		var check = $('#id').val().trim();
		var languageCheck = /^[a-z0-9]{4,19}$/g;

		if (!languageCheck.test(check) || check.length < 5 || check.length > 20) {
			$('#idfocus').html('<p style="color:red">ID는 5~20의 영문소문자, 숫자만 사용 가능합니다.</p>');
			idBoolean = false;
			return;
		} else {
			$('#idfocus').html('<p style="color:blue">사용 가능한 ID입니다.</p>');
			idBoolean = true;
			return;
		}
	}
	// 아이디 입력 후 중복아이디 있는지 확인
	function useuserid() { 
		var userid = $('#id').val().trim();
		if (idBoolean == false) {
			return false;
		}
		$.ajax({
			url : 'join_id_confirm.mysql',
			data : {
				userid : userid
			},
			type : 'post',
			success : function(data) {
				
				if (data == "1") {
					$('#idfocus').html('<p style="color:red">이미 사용중인 ID 입니다.</p>');
					usedid = false;
				} else {
					$('#idfocus').html('<p style="color:blue">사용 가능한 ID 입니다.</p>');
					usedid = true
				}
			},
			error : function(error) {
				alert('중복 ID 확인에 실패하였습니다. 다시 시도해주세요.');
			}
		});
	}
	// 이름 형식 확인
	function nameCheck() {
		var check = $('#name').val().trim();
		var languageCheck = /^[가-힣]{2,20}$/g;

		if (!languageCheck.test(check)) {
			$('#namefocus').html('<p style="color:red">2~20 길이의 한글만 입력해주세요.</p>');
			nameBoolean = false;
			return;
		} else {
			$('#namefocus').html('');
			nameBoolean = true;
			return;
		}
	}
	// 닉네임 형식 확인
	function nicknameCheck() {
		var check = $('#nickname').val().trim();

		if (check.length < 3 || check.length > 15) {
			$('#nicknamefocus').html('<p style="color:red">3~15 길이로 입력해주세요.</p>');
			nicknameBoolean = false;
			return;
		} else {
			$('#nicknamefocus').html('');
			nicknameBoolean = true;
			return;
		}
	}
	// 비밀번호 형식 확인
	function passwordCheck() {
		var check = $('#password').val().trim();
		var languageCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*-+])(?=.*[0-9]).{8,16}$/g;

		if (languageCheck.test(check)) {
			$('#passwordfocus').html('<p style="color:blue">사용 가능한 암호입니다.</p>');
			passwordBoolean = true;
			return;
		} else {
			$('#passwordfocus').html('<p style="color:red">8~20 길이 중 알파벳, 숫자, 특수기호는 최소 1개 이상씩 필수로 들어가야합니다.</p>');
			passwordBoolean = false;
			return;
		}
	}
	// 비밀번호2 일치 확인
	function passwordCheck2() {
		var check1 = $('#password').val().trim();
		var check2 = $('#password2').val().trim();
		
		if (check1 != check2) {
			$('#passwordfocus2').html('<p style="color:red">암호가 일치하지 않습니다.</p>');
			passwordBoolean2 = false;
			return;
		} else {
			$('#passwordfocus2').html('<p></p>');
			passwordBoolean2 = true;
			return;
		}
	}
	// 전화번호 형식 확인
	function phoneCheck() {
		var check = $('#phone').val().trim();
		var languageCheck = /^\d{3}-\d{3,4}-\d{4}$/;
		
		if (languageCheck.test(check)) {
			$('#phonefocus').html('<p style="color:blue">사용 가능한 번호입니다.</p>');
			phoneBoolean = true;
			return;
		} else {
			$('#phonefocus').html('<p style="color:red">010-1234-5678 형식으로 입력해주세요.</p>');
			phoneBoolean = false;
			return;
		}
	}
	// 이메일 형식 확인
	function emailCheck() {
		var check = $('#email').val().trim();
		/* var languageCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; */
		var languageCheck = /\w+@\w+\.\w+/;
		
		if (languageCheck.test(check)) {
			$('#emailfocus').html('<p style="color:blue"></p>');
			emailBoolean = true;
			return;
		} else {
			$('#emailfocus').html('<p style="color:red">이메일을 확인해주세요.</p>');
			emailBoolean = false;
			return;
		}
	}
	// 이메일 중복 확인
	function usedemailCheck() {
		var useremail = $('#email').val().trim();
		if (emailBoolean == false) {
			return false;
		}
		$.ajax({
			url : 'join_used_mail.mysql',
			data : {
				useremail : useremail
			},
			type : 'post',
			success : function(data) {
				if (data == 0) {
					$('#emailfocus').html('<p style="color:blue">사용 가능한 메일입니다.</p>');
					usedemail = true;
				} else {
					$('#emailfocus').html('<p style="color:red">사용중인 메일입니다.</p>');
					usedemail = false;
				}
			},
			error : function(error) {
			}
		});
	}
	// 인증번호 보내기
	function sendmail() {
		var useremail = $('#email').val().trim();
		if (emailBoolean == false || usedemail == false) {
			alert('이메일을 확인해주세요.');
			return false;
		}
		$.ajax({
			url : 'join_mail_confirm.mysql',
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
						alert('등록된 이메일입니다.');
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
		alert(confirmnumber + ":" + realnumber);
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
								<h3 class="text-theme-colored font-36">회원가입</h3>
								<ol class="breadcrumb white mt-10">
									<li><a href="main.mysql">Home</a></li>
									<li class="active text-theme-colored">회원 가입</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section>
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-md-push-3">
							
							<form id="frm" name="frm" class="register-form" method="post" action="join_ok.mysql">
								<div class="icon-box mb-0 p-0">
									<h4 class="text-gray pt-10 mt-0 mb-30">회원정보 입력</h4>
								</div>
								<hr>
								
								<div class="row">
									<div class="form-group col-md-12">
										<label for="mb_id">이메일</label>
										<input id="email" name="email" class="form-control" type="email"
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
										<label for="nickname">닉네임</label> <input id="nickname"
											name="nickname" class="form-control" type="text"
											placeholder="닉네임">
										<div class="col-12" id="nicknamefocus"></div>
									</div>
								</div>
								
								<div class="row">
									<div class="form-group col-md-12">
										<label for="id">ID</label> <input id="id"
											name="id" class="form-control" type="text"
											placeholder="ID">
										<div class="col-12" id="idfocus"></div>
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-12">
										<label for="password">비밀번호</label> <input id="password"
											name="password" class="form-control" type="password"
											placeholder="비밀번호는 영문, 숫자, 특수문자가 반드시 포함되어야합니다.">
										<div class="col-12" id="passwordfocus"></div>
									</div>
									<div class="form-group col-md-12">
										<label for="password2" class="sr-only">비밀번호 확인</label> <input
											id="password2" name="password2" class="form-control"
											type="password" placeholder="비밀번호 확인">
										<div class="col-12" id="passwordfocus2"></div>
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-12">
										<label for="phone">휴대전화</label> <input id="phone"
											name="phone" class="form-control" type="text"
											placeholder="휴대전화 예) 010-1234-5678">
										<div class="col-12" id="phonefocus"></div>
									</div>
								</div>

								<div class="form-group">
									<button id="submit" class="btn btn-dark btn-flat btn-lg btn-block mt-15"
										type="submit">가입하기</button>
								</div>
								
							</form>
							
						</div>
					</div>
				</div>
			</section>
		</div>
		<!-- end main-content -->
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

	<script src="resources/common/js/jquery-validation/jquery.validate.js"></script>
	<script
		src="resources/common/js/jquery-validation/additional-methods.js"></script>
	<script
		src="resources/common/js/jquery-validation/localization/messages_ko.js"></script>

</body>
</html>