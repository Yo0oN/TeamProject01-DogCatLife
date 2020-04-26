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
	href="resources/assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/assets/css/flaticon.css">
<link rel="stylesheet" href="resources/assets/css/slicknav.css">
<link rel="stylesheet" href="resources/assets/css/animate.min.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="resources/assets/css/slick.css">
<link rel="stylesheet" href="resources/assets/css/nice-select.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	// ID 형식 확인
	var idBoolean = false;
	// ID 중복 확인
	var usedid = false;
	// 이름 형식 확인
	var nameBoolean = false;
	// 암호 형식 확인
	var passwordBoolean = false;
	// 전화번호 형식 확인
	var phoneBoolean = false;
	// 이메일 확인
	var emailBoolean = false;
	// 이메일 중복 확인
	var usedemail = false;
	
	$(document).ready(function() {
		// ID확인
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
		// 이름 형식 확인
		$('#name').focus().on('keyup', function() {
			nameCheck();
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
		
		
		
		$('#submit').on('click', function() {
			if (idBoolean == false || usedid == false) {
				alert('ID를 확인하세요.');
				return false;
			}
			if (passwordBoolean == false) {
				alert('암호를 확인하세요.');
				return false;
			}
			if (nameBoolean == false) {
				alert('이름을 확인하세요.');
				return false;
			}
			if ($('#nickname').val().trim() == "") {
				alert('별명을 입력해주세요.');
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
			if ($('#confirm').val().trim().length != 6) {
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
			$('#namefocus').html('<p style="color:red">2~50 길이의 한글만 입력해주세요.</p>');
			nameBoolean = false;
			return;
		} else {
			$('#namefocus').html('');
			nameBoolean = true;
			return;
		}
	}
	// 비밀번호 형식 확인
	function passwordCheck() {
		var check = $('#password').val().trim();
		var languageCheck1 = /[a-z]{0,20}/g;
		var languageCheck2 = /[0-9]{0,20}/g;
		/* || /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
		.test(value); */
		
		if (languageCheck1.test(check) && languageCheck2.test(check) && check.length >= 8 &&check.length <= 20) {
			$('#passwordfocus').html('<p style="color:blue">사용 가능한 암호입니다.</p>');
			passwordBoolean = true;
			return;
		} else {
			$('#passwordfocus').html('<p style="color:red">8~20 길이 중 알파벳과 숫자가 필수로 들어가야합니다.</p>');
			passwordBoolean = false;
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
		var languageCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
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
			alert(emailBoolean);
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
					$('#confirmnumber').attr('vlaue', data);
				} else {
					if (data == "1") {
						alert('인증메일 전송에 실패하였습니다.');
					} else if (data == "2"){
						alert('등록된 이메일입니다.');
					} else {
						alert('인증메일 전송에 실패하였습니다.');
					}
				}
			},
			error : function(error) {
				alert('인증메일 발송에 실패하였습니다. 다시 시도해주세요.');
			}
		})
	}
</script>
</head>

<body>

	<%-- <jsp:include page='../login_menu.jsp' /> --%>

	<hr>

	<section class="blog_area single-post-area mb-30">
		<div class="container" style="width: 460px">

			<div class="row">
				<div class="col-lg-12">
					<h3>회원가입</h3>
				</div>
			</div>
			<!-- <div class="row"> -->
			<form action="join_ok.mysql" method="post" id="frm">
				<input type="hidden" id="confirmnumber" value="">
				<div class="row">
					<div class="mt-20 col-12">
						<input type="text" id="id" name="id" placeholder="ID"
							onfocus="this.placeholder = ''" onblur="this.placeholder = 'ID'"
							required class="single-input-primary" maxlength="20">
					</div>
					<div class="col-12" id="idfocus"></div>

					<div class="mt-30 col-12">
						<input type="password" id="password" name="password"
							placeholder="암호" onfocus="this.placeholder = ''"
							onblur="this.placeholder = '암호'" required
							class="single-input-primary" maxlength="20">
					</div>
					<div class="col-12" id="passwordfocus"></div>

					<div class="mt-30 col-12">
						<input type="text" id="nickname" name="nickname" placeholder="별명"
							onfocus="this.placeholder = ''" onblur="this.placeholder = '별명'"
							required class="single-input-primary" maxlength="20">
					</div>

					<div class="mt-30 col-12">
						<input type="text" id="name" name="name" placeholder="이름"
							onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'"
							required class="single-input-primary" maxlength="20">
					</div>
					<div class="col-12" id="namefocus"></div>

					<div class="mt-30 col-12">
						<input type="text" id="phone" name="phone" placeholder="전화번호"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '전화번호'" required
							class="single-input-primary" maxlength="13">
					</div>
					<div class="col-12" id="phonefocus"></div>

					<div class="mt-30 col-12">
						<input type="text" id="email" name="email" placeholder="이메일"
							onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'"
							required class="single-input-primary" value="" maxlength="30">
					</div>
					<div class="col-12" id="emailfocus"></div>

					<div class="col-8 mt-30">
						<input type="text" id="confirm" name="confirm"
							placeholder="인증번호를 입력하세요." onfocus="this.placeholder = ''"
							onblur="this.placeholder = '인증번호를 입력하세요.'" required
							class="single-input-primary" maxlength="6">
					</div>
					<div class="col-4 mt-20">
						<span id="confirmbtn" style="background-color: #2B4B80"
							class="btn pt-20 pb-20 pl-30 pr-30">메일 인증</span>
					</div>

				</div>

				<div class="col-12 mt-30" style="text-align: right">
					<span id="submit" style="background-color: #2B4B80"
						class="btn btn-block">회원 가입</span>
					<!--  pt-20 pb-20 pl-30 pr-30 -->
				</div>
			</form>

		</div>
	</section>

	<%-- <jsp:include page='../footer.jsp' /> --%>

	<!-- JS here -->

	<!-- All JS Custom Plugins Link Here here -->
	<script src="resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script src="resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="resources/assets/js/popper.min.js"></script>
	<script src="resources/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="resources/assets/js/owl.carousel.min.js"></script>
	<script src="resources/assets/js/slick.min.js"></script>
	<!-- Date Picker -->
	<script src="resources/assets/js/gijgo.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="resources/assets/js/wow.min.js"></script>
	<script src="resources/assets/js/animated.headline.js"></script>
	<script src="resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- Scrollup, nice-select, sticky -->
	<script src="resources/assets/js/jquery.scrollUp.min.js"></script>
	<script src="resources/assets/js/jquery.nice-select.min.js"></script>
	<script src="resources/assets/js/jquery.sticky.js"></script>

	<!-- contact js -->
	<script src="resources/assets/js/contact.js"></script>
	<script src="resources/assets/js/jquery.form.js"></script>
	<script src="resources/assets/js/jquery.validate.min.js"></script>
	<script src="resources/assets/js/mail-script.js"></script>
	<script src="resources/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="resources/assets/js/plugins.js"></script>
	<script src="resources/assets/js/main.js"></script>

</body>
</html>