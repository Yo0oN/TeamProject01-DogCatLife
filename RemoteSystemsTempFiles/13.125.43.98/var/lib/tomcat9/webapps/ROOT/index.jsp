<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>

<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">

<meta name="HandheldFriendly" content="true">

<meta name="format-detection" content="telephone=no">

<meta http-equiv="imagetoolbar" content="no">

<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">

<!-- 즐겨찾기 아이콘 -->
<link rel="shortcut icon" href="./img/title_icon.png">

<!-- <meta name="naver-site-verification"
	content="ee5b4e9e976287ef40ebb933fe060fc171af3b46" /> -->
<head>

<meta property="og:type" content="website">
<meta property="og:title" content="안심위탁보호센터">
<!-- 타이틀이미지 -->
<meta property="og:image" content="./img/title_icon.png">
<!-- <meta property="og:url" content="http://www.mysite.com"> -->
</head>

<title>견생묘생</title>
<link rel="stylesheet" href="./css/theme/default.css">
<link rel="stylesheet" href="./css/theme/animate.min.css">
<link rel="stylesheet"
	href="./css/theme/bootstrap.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="//fonts.googleapis.com/css?family=Montserrat:400,700">
<link rel="stylesheet"
	href="//fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic">
<link rel="stylesheet"
	href="http://com2petstory.com/theme/freelancer/css/app.css">
<!--<link rel="shortcut icon" href="http://com2petstory.com/img/logogo.ico">-->

<script>
	// 자바스크립트에서 사용하는 전역변수 선언
	// 사용되는곳 없음. 어디서사용중인지?
	/* var g5_url = "http://www.com2petstory.com";
	var g5_bbs_url = "http://www.com2petstory.com/bbs";
	var g5_is_member = "";
	var g5_is_admin = "";
	var g5_is_mobile = "";
	var g5_bo_table = "";
	var g5_sca = "";
	var g5_editor = "";
	var g5_cookie_domain = ""; */
</script>
<script
	src="http://www.com2petstory.com/theme/freelancer/js/jquery.min.js"></script>
<script src="http://www.com2petstory.com/js/jquery.menu.js"></script>
<script src="http://www.com2petstory.com/js/common.js"></script>
<script src="http://www.com2petstory.com/js/wrest.js"></script>
<script src="./css/bootstrap.min.css"></script>
<script type="text/javascript">
	// 뭐하는건지모르겠음
	/* var token = '';
	var cnt = 10;
	var token = '7192992585.34ebc51.908294f7e15949ceaf113c7a6fd71f20';
	var api = 'https://api.instagram.com/v1/users/self/media/recent/?access_token='
			+ token;
	var info;
	
	// jQuery + Ajax
	$.ajax({
		url : api + '&callback=',
		type : 'GET',
		dataType : 'jsonp',
		jsonpCallback : 'callbackFunction'
	});
	
	
	function callbackFunction(mydata) {
		var a = '';

		var limit = 4;
		var feed = mydata.data;
		for (var i = 0; i < limit; i++) {
			a += '<a href="'+feed[i].link+'">';
			a += '<img src="'+feed[i].images.thumbnail.url+'" />';
			a += '</a>';
		}
		var insta1 = $('#insta');
		insta1.html(a);
	} */
	/* 북마크
	function addbookmark() {
		var url = "http://www.com2petstory.com"; //URL
		var title = "Com2petStory - 사설요양보호소"; //사이트이름
		var browser = navigator.userAgent.toLowerCase();

		//Mozilla, Firefox, Netscape
		if (window.sidebar) {
			window.sidebar.addPanel(title, url, "");
		}
		//IE or chrome
		else if (window.external) {
			//IE
			if (browser.indexOf('chrome') == -1) {
				window.external.AddFavorite(url, title);
			} else {
				//chrome
				alert('CTRL+D 또는 Command+D를 눌러 즐겨찾기에 추가해주세요.');
			}
		}
		//Opera - automatically adds to sidebar if rel=sidebar in the tag
		else if (window.opera && window.print) {
			return true;
		}
		//Konqueror
		else if (browser.indexOf('Konqueror') != -1) {
			alert('CTRL+B를 눌러 즐겨찾기에 추가해주세요.');
		}
		//safari
		else if (browser.indexOf('webkit') != -1) {
			alert('CTRL+B 또는 Command+B를 눌러 즐겨찾기에 추가해주세요.');
		} else {
			alert('사용하고 계시는 브라우저에서는 이 버튼으로 즐겨찾기를 추가할 수 없습니다. 수동으로 링크를 추가해주세요.');
		}
	} */
</script>
</head>

<body id="page-top" class="index">

	<!-- Navigation -->
	<!-- ★Table1-1즐겨찾기/관리자  -->
	<div class="container3"
		style="background: #ffffff; position: absolute; top: 0; width: 100%; text-align: right; height: 40px; line-height: 40px;">
		<!-- <a href="javascript:addbookmark()" style="">즐겨찾기 / </a> -->
		<a href="#"><b>관리자</b></a>
	</div>
	
	<!-- class="navbar navbar-default navbar-fixed-top" -->
	

		<!-- ★Table1-2로고 컴펫스토리★ -->
		<div class="container3 row" style="text-align: center;">
			<a href="#">
			<img src="./img/title_icon.png" style="width: 250px; height: 250px; margin-top: 50px; margin-bottom: 50px">
			</a>
		</div>
		
	<!-- ★Table1-3메뉴 상단바★ -->
	<nav class="row">
		<div class="container3" style="background: #FDE6BF; height: 40px; line-height: 40px">
			<span style="font-size: 15px; cursor: pointer" onclick="openNav()" id="sidemenu">&#9776; 메뉴</span>
			<!-- Brand and toggle get grouped for better mobile display -->
			
			<!-- <div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="">컴투펫스토리</a>
			</div> -->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1" style="text-align: center;">

				<div class="dropdown" style="font-weight: bold;">
					<div style="float: left; width: 16%">
						<a href="#">커뮤니티</a>
					</div>

					<div style="float: left; width: 16%">
						<a href="#">찾아주세요</a>
					</div>

					<div style="float: left; width: 16%">
						<a href="#">입양안내</a>
					</div>

					<div style="float: left; width: 16%">
						<a href="#">판매</a>
					</div>

					<div style="float: left; width: 16%">
						<a href="#">찾기</a>
					</div>
					
					<div style="float: left; width: 16%">
						<a href="#">고객센터</a>
					</div>
					
					<!-- 일반크기일때 아래보이는 메뉴 -->
					<div class="dropdown-content bg-dark" style="">
						<div style="width: 16%">
							<a href="#">게시판</a>
						</div>
						<div style="width: 16%">
							<a href="#">실종 동물 등록</a>
						</div>
						<div style="width: 16%">
							<a href="#">입양 절차</a>
						</div>
						<div style="width: 16%">
							<a href="#" class="">견생</a>
						</div>
						<div style="width: 16%">
							<a href="#" class="">병원</a>
						</div>
						<div style="width: 16%">
							<a href="#" class="">Q&A</a>
						</div>
						
						<div style="width: 16%">
							<a href="#">자랑게시판</a>
						</div>
						<div style="width: 16%">
							<a href="#">재회 성공 사례</a>
						</div>
						<div style="width: 16%">
							<a href="#">입양 가능 아이들</a>
						</div>
						<div style="width: 16%">
							<a href="#">묘생</a>
						</div>
						<div style="width: 16%">
							<a href="#" class="">미용, 호텔</a>
						</div>
						<div style="width: 16%">
							<a href="#">공지사항</a>
						</div>
						
						<div style="width: 16%">&nbsp;</div>
						
						<div style="width: 16%">
							<a href="#">입양 후기</a>
						</div>
						
					</div>
				</div>
			</div>
			
			<!-- 화면작아졌을때 옆에 뜨는부분 -->
			<!-- /.container-fluid -->
			<div id="mySidenav" class="sidenav">
				<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				<a href="#">커뮤니티</a>
				<a href="#" style="font-size: 15px"> - 게시판</a>
				<a href="#" style="font-size: 15px"> - 자랑게시판</a>
				
				<a href="#">찾아주세요</a>
				<a href="#" style="font-size: 15px"> - 실종 동물 등록</a>
				<a href="#" style="font-size: 15px"> - 재회 성공 사례</a>
				
				<a href="#">입양</a>
				<a href="#" style="font-size: 15px"> - 입양절차</a>
				<a href="#" style="font-size: 15px"> - 입양 가능 아이들</a>
				<a href="#" style="font-size: 15px"> - 입양 후기</a>
				
				<a href="#">판매</a>
				<a href="#" style="font-size: 15px"> - 견생</a>
				<a href="#" style="font-size: 15px"> - 묘생</a>
				
				<a href="#">위치찾기</a>
				<a href="#" style="font-size: 15px"> - 병원</a>
				<a href="#" style="font-size: 15px"> - 미용&호텔</a>
				
				<a href="#">고객센터</a>
				<a href="#" style="font-size: 15px"> - Q&A</a>
				<a href="#" style="font-size: 15px"> - 공지사항</a>
			</div>
	</nav>

	<!-- 메뉴바 스타일 -->
	<style>
		#sidemenu {
			display: none;
		}
		
		@media ( max-width : 1000px) {
			#sidemenu {
				display: block;
			}
		}
		
		.sidenav {
			height: 100%;
			width: 0;
			position: fixed;
			z-index: 90;
			top: 0;
			left: 0;
			background-color: #111;
			overflow-x: hidden;
			transition: 0.5s;
			padding-top: 60px;
		}
		
		.sidenav a {
			padding: 8px 8px 8px 32px;
			text-decoration: none;
			font-size: 20px;
			color: #818181;
			display: block;
			transition: 0.3s;
		}
		
		.sidenav a:hover {
			color: #f1f1f1;
		}
		
		.sidenav .closebtn {
			position: absolute;
			top: 0;
			right: 25px;
			font-size: 36px;
			margin-left: 50px;
		}
		
		@media screen and (max-height: 450px) {
			.sidenav {
				padding-top: 15px;
			}
			.sidenav a {
				font-size: 18px;
			}
		}
		
		.dropbtn {
			background-color: #FDE6BF;
			color: black;
			padding: 9px;
			font-size: 16px;
			border: none;
		}
		
		.dropbtn a:hover {
			background-color: #FDE6BF;
			color: black;
		}
		
		.dropdown {
			position: relative;
			display: inline-block;
			width: 80%;
		}
		
		.dropdown a {
			text-decoration: none;
			color: black;
		}
		
		.dropdown-content {
			display: none;
			position: absolute;
			background-color: #f1f1f1;
			min-width: 100%;
			/*box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);*/
			z-index: 1;
			/* opacity: 0.8; */
			font-weight: bold;
			margin-top: 40px
		}
		
		.dropdown-content div {
			width: 20%;
			float: left;
		}
		
		.dropdown-content a {
			color: black;
			padding: 12px 16px;
			text-decoration: none;
			display: block;
		}
		
		.dropdown-content a:hover {
			background-color: #ddd;
		}
		
		#bs-example-navbar-collapse-1:hover .dropdown-content {
			display: block;
		}
		
		.dropdown:hover .dropbtn {
			background-color: #FADAA5;
			color: black;
		}
	</style>
	<script>
		// 상단 메뉴바 열기
		function openNav() {
			document.getElementById("mySidenav").style.width = "100%";
		}

		// 상단 메뉴바 닫기
		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
	
	<!-- 메뉴 아래의 본문부분 -->
	<div id="container">
		<!-- 더보기부분의 페이지번호 디자인 -->
		<style>
			.pagecss {
				color: #000000;
				padding: 10px;
			}
		</style>
		
		<!-- Header -->
		<!-- ★Table2 carousel 메인사진 -->
		<header id="header row">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active" />
					<li data-target="#carousel-example-generic" data-slide-to="1" />
					<li data-target="#carousel-example-generic" data-slide-to="2" />
				</ol>
				
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<!-- 화면이 클 때 -->
						<img src="./img/Jellyfish.jpg" alt="">
						<!-- 화면이 작을 때 : 핸드폰 -->
						<img src="./img/Jellyfish.jpg" alt="" class="mimg">
						<div class="carousel-caption flex-caption">
							<h2 class=""></h2>
						</div>
					</div>
					<div class="item">
						<img src="./img/Jellyfish.jpg" alt="">
						<img src="./img/Jellyfish.jpg" alt="" class="mimg">
						<div class="carousel-caption flex-caption">
							<h2 class=""></h2>
						</div>
					</div>
					<div class="item">
						<img src="./img/Jellyfish.jpg" alt="">
						<img src="./img/Jellyfish.jpg" alt="" class="mimg">
						<div class="carousel-caption flex-caption">
							<h2 class=""></h2>
						</div>
					</div>
				</div>
				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</header>


		<!-- ★table3 우리아이확인하기, 지정병원, 더알아보기 -->
		<section id="CLASSES">
			<div class="con-area3" style="padding-bottom: 20px;">
				<div class="container2" style="padding-top: 50px;">
					<div>
						<a href="#" class=""><img src="./img/3.jpg"></a>
						<a href="#" class=""><img src="./img/3.jpg"></a>
					</div>
					<div>
						<a href="#"><img src="./img/3.jpg"><img src="/img/3.jpg"></a>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-12 text-center">
							<!--<h2 class="wow fadeInDown title" data-wow-delay=".5s">OUR CLASSES</h2>-->
						</div>
					</div>
					<div class="row" style="margin-top: 5em; text-align: center;">
						<div class="col-sm-4" style="width: 25%">
							<a href="#"><img src="./img/3.jpg"></a>
						</div>
						<div class="col-sm-4" style="width: 25%">
							<a href="#" class=""><img src="./img/3.jpg"></a>
						</div>
						<div class="col-sm-4" style="width: 25%">
							<a href="#"><img src="./img/3.jpg"></a>
						</div>
						<div class="col-sm-4" style="width: 25%">
							<a href="#"><img src="./img/3.jpg"></a>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- ★Table4.보호중인 아이들 -->
		<section id="portfolio" style="background: #FDE6BF">
			<div class="container">
				<div class="row" style="margin-bottom: 4em;">
					<div class="col-lg-12 text-center">
						<h3 class="wow fadeInDown title" data-wow-delay=".5s">보호중인아이들</h3>
						<br>
						<h4 class="wow fadeInDown title" data-wow-delay=".5s">새로운 가족을
							기다리는 아이들에게 가족이 되어주세요!</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 portfolio-item" id="abcd">
						<a href="#portfolioModal0" class="portfolio-link"
							data-toggle="modal">
							<div class="caption">
								<div class="caption-content">
									<i class="fa fa-search-plus fa-3x"></i>
								</div>
							</div> <img src="./img/3.jpg" class="img-responsive img-centered" alt="">
						</a>
						<div id="wr_info">
							<p></p>
							<strong><span id="ca_name2">보호견</span></strong> <strong><span>봄이/믹스견/1살/여아</span></strong>
							<p>
								<span id="wr_datetime">등록일: <strong>2020-04-05</strong>조회: 12</span>
							</p>
						</div>
					</div>
					
					<!-- 사진을 누르면 아래 창이 띄워짐 -->
					<div class="portfolio-modal modal fade" id="portfolioModal0"
						tabindex="-1" role="dialog" aria-hidden="true"
						style="z-index: 9999; padding-left: 0 !important;">
						<div class="modal-content">
							<div class="close-modal" data-dismiss="modal">
								<div class="lr">
									<div class="rl"></div>
								</div>
							</div>
							<div class="container">
								<div class="row">
									<div class="col-lg-8 col-lg-offset-2">
										<div class="modal-body">
											<h2 style="margin-bottom: 1em;">봄이/믹스견/1살/여아</h2>
											<img
												src="http://www.com2petstory.com/data/file/2019table1/thumb-3076522375_JbY0F4lz_c4c5cea55562e48542e3be95d5d051c3a67250d3_400x400.jpg"
												class="img-responsive img-centered" alt="">
											<p>
											<center>
												<table class="__se_tbl"
													style="border-width: 1px 1px 0px 0px; text-align: center; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid;"
													border="0" cellspacing="0" cellpadding="0">
													<tbody>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">견종/묘종</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;">믹스견</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">나이</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 1살</span>
																</p></td>
														</tr>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">성별</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 여아</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">분류</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 강아지</span>
																</p></td>
														</tr>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">모색</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 기본</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">접종여부</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 접종완료</span>
																</p></td>
														</tr>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">중성화</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 안됨</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">인식표</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 없음</span>
																</p></td>
														</tr>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 31px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"
																rowspan="1" colspan="1"><p>
																	<span style="font-size: 14pt;">몸무게</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 31px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"
																rowspan="1" colspan="1"><p>
																	<span style="font-size: 14pt;">﻿4kg</span><span
																		style="font-size: 14pt;">﻿</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 31px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"
																rowspan="1" colspan="1"><p>
																	<span style="font-size: 14pt;">특이사항</span> <span
																		style="font-size: 14pt;">﻿</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 31px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"
																rowspan="1" colspan="1"><p>
																	<span style="font-size: 14pt;">﻿</span> <span
																		style="font-size: 14pt;">﻿</span>
																</p></td>
														</tr>
													</tbody>
												</table>
											</center>
											<div align="center" style="text-align: center;"></div>
											<div align="center" style="text-align: center;">
												<br />
											</div>
											<div align="center" style="text-align: center;"></div>
											<div align="center" style="text-align: center;"></div>
											<div align="center" style="text-align: center;">
												<img
													title="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586075444_6631.jpg"
													src="http://com2petstory.com/data/editor/2004/8c135cd0e9aa4bd0ecf4e48ea5aec183_1586075444_6631.jpg"
													alt="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586075444_6631.jpg" /><br
													style="clear: both;" /> <img
													title="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586075444_7387.jpg"
													src="http://com2petstory.com/data/editor/2004/8c135cd0e9aa4bd0ecf4e48ea5aec183_1586075444_7387.jpg"
													alt="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586075444_7387.jpg" /><br
													style="clear: both;" /> <img
													title="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586075445_7932.png"
													src="http://com2petstory.com/data/editor/2004/8c135cd0e9aa4bd0ecf4e48ea5aec183_1586075445_7932.png"
													alt="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586075445_7932.png" /><br
													style="clear: both;" />
											</div>
											</p>
											<ul class="list-inline item-details">
												<!--<li>Client:
                                            <strong><span class="sv_member">Com2Petstory</span>                                            </strong>
                                        </li>-->
												<li>등록일: <strong>2020-04-05 </strong>
												</li>
												<li>지점: <strong>보호견 </strong>
												</li>
											</ul>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">
												<i class="fa fa-times"></i> Close
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-4 portfolio-item" id="abcd">
						<a href="#portfolioModal1" class="portfolio-link"
							data-toggle="modal">
							<div class="caption">
								<div class="caption-content">
									<i class="fa fa-search-plus fa-3x"></i>
								</div>
							</div> <img
							src="http://www.com2petstory.com/data/file/2019table1/thumb-3076522375_0GCIkw9R_d1d934c27b6b60ea158fa92cae12ea0c3d5052d3_400x400.jpg"
							class="img-responsive img-centered" alt="">
						</a>
						<div id="wr_info">
							<p></p>
							<strong><span id="ca_name2">보호견</span></strong> <strong><span>믹스견/대박이/3살/남아</span></strong>
							<p>
								<span id="wr_datetime">등록일: <strong>2020-04-05</strong>
									조회: 6
								</span>
							</p>
						</div>
					</div>

					<div class="portfolio-modal modal fade" id="portfolioModal1"
						tabindex="-1" role="dialog" aria-hidden="true"
						style="z-index: 9999; padding-left: 0 !important;">
						<div class="modal-content">
							<div class="close-modal" data-dismiss="modal">
								<div class="lr">
									<div class="rl"></div>
								</div>
							</div>
							<div class="container">
								<div class="row">
									<div class="col-lg-8 col-lg-offset-2">
										<div class="modal-body">
											<h2 style="margin-bottom: 1em;">믹스견/대박이/3살/남아</h2>
											<img
												src="http://www.com2petstory.com/data/file/2019table1/thumb-3076522375_0GCIkw9R_d1d934c27b6b60ea158fa92cae12ea0c3d5052d3_400x400.jpg"
												class="img-responsive img-centered" alt="">
											<p>
											<center>
												<table class="__se_tbl"
													style="border-width: 1px 1px 0px 0px; text-align: center; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid;"
													border="0" cellspacing="0" cellpadding="0">
													<tbody>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">견종/묘종</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;">믹스견</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">나이</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;">3살 </span>
																</p></td>
														</tr>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">성별</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 남아</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">분류</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 강아지</span>
																</p></td>
														</tr>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">모색</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 기본</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">접종여부</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 접종완료</span>
																</p></td>
														</tr>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">중성화</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 완료</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">인식표</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 없음</span>
																</p></td>
														</tr>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 31px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"
																rowspan="1" colspan="1"><p>
																	<span style="font-size: 14pt;">몸무게</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 31px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"
																rowspan="1" colspan="1"><p>
																	<span style="font-size: 14pt;">﻿5kg</span> <span
																		style="font-size: 14pt;">﻿</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 31px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"
																rowspan="1" colspan="1"><p>
																	<span style="font-size: 14pt;">특이사항</span> <span
																		style="font-size: 14pt;">﻿</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 31px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"
																rowspan="1" colspan="1"><p>
																	<span style="font-size: 14pt;">﻿</span> <span
																		style="font-size: 14pt;">﻿</span>
																</p></td>
														</tr>
													</tbody>
												</table>
											</center>
											<div align="center" style="text-align: center;"></div>
											<div align="center" style="text-align: center;">​</div>
											<div align="center" style="text-align: center;"></div>
											<div align="center" style="text-align: center;"></div>
											<div align="center" style="text-align: center;">
												<img
													title="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072889_4773.jpg"
													src="http://com2petstory.com/data/editor/2004/8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072889_4773.jpg"
													alt="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072889_4773.jpg" /><br
													style="clear: both;" /> <img
													title="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072889_5711.jpg"
													src="http://com2petstory.com/data/editor/2004/8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072889_5711.jpg"
													alt="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072889_5711.jpg" /><br
													style="clear: both;" /> <img
													title="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072896_7672.png"
													src="http://com2petstory.com/data/editor/2004/8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072896_7672.png"
													alt="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072896_7672.png" />
											</div>
											<div align="center" style="text-align: center;">
												<br />
											</div>
											</p>
											<ul class="list-inline item-details">
												<!--<li>Client:
                                            <strong><span class="sv_member">Com2Petstory</span>                                            </strong>
                                        </li>-->
												<li>등록일: <strong>2020-04-05 </strong>
												</li>
												<li>지점: <strong>보호견 </strong>
												</li>
											</ul>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">
												<i class="fa fa-times"></i> Close
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-4 portfolio-item" id="abcd">
						<a href="#portfolioModal2" class="portfolio-link"
							data-toggle="modal">
							<div class="caption">
								<div class="caption-content">
									<i class="fa fa-search-plus fa-3x"></i>
								</div>
							</div> <img
							src="http://www.com2petstory.com/data/file/2019table1/thumb-3076522375_PkBig3WT_e52a85501fbde6cddad84d1ae71be40904e037d4_400x400.jpg"
							class="img-responsive img-centered" alt="">
						</a>
						<div id="wr_info">
							<p></p>
							<strong><span id="ca_name2">보호견</span></strong> <strong><span>말티즈/연지/8살추정/여아</span></strong>
							<p>
								<span id="wr_datetime">등록일: <strong>2020-04-05</strong>
									조회: 11
								</span>
							</p>
						</div>
					</div>
					<div class="portfolio-modal modal fade" id="portfolioModal2"
						tabindex="-1" role="dialog" aria-hidden="true"
						style="z-index: 9999; padding-left: 0 !important;">
						<div class="modal-content">
							<div class="close-modal" data-dismiss="modal">
								<div class="lr">
									<div class="rl"></div>
								</div>
							</div>
							<div class="container">
								<div class="row">
									<div class="col-lg-8 col-lg-offset-2">
										<div class="modal-body">
											<h2 style="margin-bottom: 1em;">말티즈/연지/8살추정/여아</h2>
											<img
												src="http://www.com2petstory.com/data/file/2019table1/thumb-3076522375_PkBig3WT_e52a85501fbde6cddad84d1ae71be40904e037d4_400x400.jpg"
												class="img-responsive img-centered" alt="">
											<p>
											<center>
												<table class="__se_tbl"
													style="border-width: 1px 1px 0px 0px; text-align: center; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid;"
													border="0" cellspacing="0" cellpadding="0">
													<tbody>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">견종/묘종</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;">말티즈</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">나이</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 8살 추정</span>
																</p></td>
														</tr>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">성별</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 여아</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">분류</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 강아지</span>
																</p></td>
														</tr>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">모색</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 화이트</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">접종여부</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 접종완료</span>
																</p></td>
														</tr>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">중성화</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 안됨</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"><p>
																	<span style="font-size: 14pt;">인식표</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><p>
																	<span style="font-size: 14pt;"> 있음</span>
																</p></td>
														</tr>
														<tr>
															<td
																style="border-width: 0px 0px 1px 1px; width: 132px; height: 31px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"
																rowspan="1" colspan="1"><p>
																	<span style="font-size: 14pt;">몸무게</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 133px; height: 31px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"
																rowspan="1" colspan="1"><p>
																	<span style="font-size: 14pt;">﻿3kg</span><span
																		style="font-size: 14pt;">﻿</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 31px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(253, 230, 191);"
																rowspan="1" colspan="1"><p>
																	<span style="font-size: 14pt;">특이사항</span> <span
																		style="font-size: 14pt;">﻿</span>
																</p></td>
															<td
																style="border-width: 0px 0px 1px 1px; width: 134px; height: 31px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"
																rowspan="1" colspan="1"><p>
																	<span style="font-size: 14pt;">﻿</span> <span
																		style="font-size: 14pt;">﻿</span>
																</p></td>
														</tr>
													</tbody>
												</table>
											</center>
											<div align="center" style="text-align: center;"></div>
											<div align="center" style="text-align: center;">
												<br />
											</div>
											<div align="center" style="text-align: center;">​</div>
											<div align="center" style="text-align: center;"></div>
											<div align="center" style="text-align: center;">
												<img
													title="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072037_4526.jpg"
													src="http://com2petstory.com/data/editor/2004/8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072037_4526.jpg"
													alt="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072037_4526.jpg" /><br
													style="clear: both;" /> <img
													title="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072038_708.jpg"
													src="http://com2petstory.com/data/editor/2004/8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072038_708.jpg"
													alt="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072038_708.jpg" /><br
													style="clear: both;" /> <img
													title="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072039_6452.png"
													src="http://com2petstory.com/data/editor/2004/8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072039_6452.png"
													alt="8c135cd0e9aa4bd0ecf4e48ea5aec183_1586072039_6452.png" />
											</div>
											</p>
											<ul class="list-inline item-details">
												<!--<li>Client:
                                            <strong><span class="sv_member">Com2Petstory</span>                                            </strong>
                                        </li>-->
												<li>등록일: <strong>2020-04-05 </strong>
												</li>
												<li>지점: <strong>보호견 </strong>
												</li>
											</ul>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">
												<i class="fa fa-times"></i> Close
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
						</div>
				<div class="row">
					<div class="col-lg-12 text-center" style="padding-bottom: 10px">
						<a href='?page=1' class='pagecss'>1</a>
					</div>
					<div class="col-lg-12 text-center">
						<a
							href="http://com2petstory.com/bbs/board.php?bo_table=2019table1"><span
							id="ca_name3"><strong>더보기</strong></span></a>
					</div>
				</div>
			</div>
		</section>


		<!-- ★Table5.입양후기 -->
		<section id="portfolio">
			<div class="container">
				<div class="row" style="margin-bottom: 4em;">
					<div class="col-lg-12 text-center">
						<h3 class="wow fadeInDown title" data-wow-delay=".5s">입양후기</h3>
						<br>
						<h4 class="wow fadeInDown title" data-wow-delay=".5s">새로운 가족이
							된 아이와 함께 후기를 작성하고 함께 행복을 나눠요!</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 portfolio-item" id="abcd">
						<a href="#portfolioModal55" class="portfolio-link"
							data-toggle="modal" style="border: none;">
							<div class="caption" style="background: #18bc9c6e">
								<div class="caption-content">
									<i class="fa fa-heart fa-3x" style="color: red; opacity: 0.9;"></i>
								</div>
							</div> <img
							src="http://www.com2petstory.com/data/file/table01/thumb-3076522375_xod2HJsI_afa65b9c21eed6a1d9f78f2f0542b848aa7d5b69_400x300.jpg"
							class="img-responsive img-centered" alt="">
						</a>
						<div id="wr_info2">
							<p></p>
							<strong><span>귀염둥이 강아지 입양후기 입니다 이름은 오공이에요</span></strong>
							<p>오공이 사진 올립니다</p>
							<!--<p><span id="wr_datetime">고객명: <strong>박지혁</strong> 작성일: <strong>2020-04-06</strong></span></p>-->
						</div>
					</div>
					<div class="portfolio-modal modal fade" id="portfolioModal55"
						tabindex="-1" role="dialog" aria-hidden="true"
						style="z-index: 9999; padding-left: 0 !important;">
						<div class="modal-content">
							<div class="close-modal" data-dismiss="modal">
								<div class="lr">
									<div class="rl"></div>
								</div>
							</div>
							<div class="container">
								<div class="row">
									<div class="col-lg-8 col-lg-offset-2">
										<div class="modal-body">
											<h2 style="margin-bottom: 1em;">귀염둥이 강아지 입양후기 입니다 이름은
												오공이에요</h2>
											<img
												src="http://www.com2petstory.com/data/file/table01/thumb-3076522375_xod2HJsI_afa65b9c21eed6a1d9f78f2f0542b848aa7d5b69_400x300.jpg"
												class="img-responsive img-centered" alt="">
											<p>오공이 사진 올립니다</p>
											<ul class="list-inline item-details">
												<li>고객명: <strong><span class="sv_guest">박지혁</span>
												</strong>
												</li>
												<li>작성일: <strong>2020-04-06 </strong>
												</li>
												<!--<li>Category:
                                            <strong>                                            </strong>-->
												</li>
											</ul>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">
												<i class="fa fa-times"></i> Close
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-4 portfolio-item" id="abcd">
						<a href="#portfolioModal56" class="portfolio-link"
							data-toggle="modal" style="border: none;">
							<div class="caption" style="background: #18bc9c6e">
								<div class="caption-content">
									<i class="fa fa-heart fa-3x" style="color: red; opacity: 0.9;"></i>
								</div>
							</div> <img
							src="http://www.com2petstory.com/data/file/table01/thumb-3076522375_fiLCQ0Jk_db114872df47a1bb0002bd313eec6515bf39273b_400x300.jpg"
							class="img-responsive img-centered" alt="">
						</a>
						<div id="wr_info2">
							<p></p>
							<strong><span>보호견 토리 말티즈 7살 입양해서 집에 잘 도착 했어요</span></strong>
							<p>입양아이 사진 올립니다</p>
							<!--<p><span id="wr_datetime">고객명: <strong>황예원</strong> 작성일: <strong>2020-04-06</strong></span></p>-->
						</div>
					</div>
					<div class="portfolio-modal modal fade" id="portfolioModal56"
						tabindex="-1" role="dialog" aria-hidden="true"
						style="z-index: 9999; padding-left: 0 !important;">
						<div class="modal-content">
							<div class="close-modal" data-dismiss="modal">
								<div class="lr">
									<div class="rl"></div>
								</div>
							</div>
							<div class="container">
								<div class="row">
									<div class="col-lg-8 col-lg-offset-2">
										<div class="modal-body">
											<h2 style="margin-bottom: 1em;">보호견 토리 말티즈 7살 입양해서 집에 잘
												도착 했어요</h2>
											<img
												src="http://www.com2petstory.com/data/file/table01/thumb-3076522375_fiLCQ0Jk_db114872df47a1bb0002bd313eec6515bf39273b_400x300.jpg"
												class="img-responsive img-centered" alt="">
											<p>
											<p>입양아이 사진 올립니다</p>
											</p>
											<ul class="list-inline item-details">
												<li>고객명: <strong><span class="sv_guest">황예원</span>
												</strong>
												</li>
												<li>작성일: <strong>2020-04-06 </strong>
												</li>
												<!--<li>Category:
                                            <strong>                                            </strong>-->
												</li>
											</ul>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">
												<i class="fa fa-times"></i> Close
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-sm-4 portfolio-item" id="abcd">
						<a href="#portfolioModal57" class="portfolio-link"
							data-toggle="modal" style="border: none;">
							<div class="caption" style="background: #18bc9c6e">
								<div class="caption-content">
									<i class="fa fa-heart fa-3x" style="color: red; opacity: 0.9;"></i>
								</div>
							</div> <img
							src="http://www.com2petstory.com/data/file/table01/thumb-3076522375_0SleL12p_79b079f411a4643eda523885ba2d5ecd90df257a_400x300.jpg"
							class="img-responsive img-centered" alt="">
						</a>
						<div id="wr_info2">
							<p></p>
							<strong><span>보호견 메리 입양후기 집에 잘 도착해서 사진 올립니다</span></strong>
							<p>입양시켜주셔서 감사합니다</p>
							<!--<p><span id="wr_datetime">고객명: <strong>구미숙</strong> 작성일: <strong>2020-04-05</strong></span></p>-->
						</div>
					</div>
					
					<div class="portfolio-modal modal fade" id="portfolioModal57"
						tabindex="-1" role="dialog" aria-hidden="true"
						style="z-index: 9999; padding-left: 0 !important;">
						<div class="modal-content">
							<div class="close-modal" data-dismiss="modal">
								<div class="lr">
									<div class="rl"></div>
								</div>
							</div>
							<div class="container">
								<div class="row">
									<div class="col-lg-8 col-lg-offset-2">
										<div class="modal-body">
											<h2 style="margin-bottom: 1em;">보호견 메리 입양후기 집에 잘 도착해서 사진
												올립니다</h2>
											<img
												src="http://www.com2petstory.com/data/file/table01/thumb-3076522375_0SleL12p_79b079f411a4643eda523885ba2d5ecd90df257a_400x300.jpg"
												class="img-responsive img-centered" alt="">
											<p>
											<p>입양시켜주셔서 감사합니다</p>
											</p>
											<ul class="list-inline item-details">
												<li>고객명: <strong><span class="sv_guest">구미숙</span>
												</strong>
												</li>
												<li>작성일: <strong>2020-04-05 </strong>
												</li>
												<!--<li>Category:
                                            <strong>                                            </strong>-->
												</li>
											</ul>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">
												<i class="fa fa-times"></i> Close
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 text-center">
						<a href="http://com2petstory.com/bbs/board.php?bo_table=table01"><span
							id="ca_name3" style="background: #FDE6BF"><strong>더보기</strong></span></a>
					</div>
				</div>
				
				<!-- 아래에 광고바 -->
				<div class="row">
					<a href="#">
						<img src="http://www.com2petstory.com/img/longban1.png" style="width: 100%; padding-top: 50px">
					</a>
				</div>
			</div>
		</section>

		<!-- ★Table6-1인스타그램/인스타그램bar/상호명 -->
		<section id="portfolio" style="background: #FDE6BF">
			<div class="container">
				<div class="row" style="margin-bottom: 4em;">
					<div class="col-lg-12 text-center">
						<h3 class="wow fadeInDown title" data-wow-delay=".5s">
							<a href="#" style="color: #000000" target="_BLANK">
								<img src="http://www.com2petstory.com/img/glyph-logo_May2016.png" style="width: 100px;" />인스타그램
							</a>
						</h3>
						<br>
						<h4 class="wow fadeInDown title" data-wow-delay=".5s">
							인스타그램 팔로우하고 실시간으로 새로운 아이들을 확인해요!
						</h4>
					</div>
				</div>
				<div id="insta"></div>
			</div>
		</section>


		<!-- ★Table6-2 인스타그램bar -->
		<div class="row"
			style="background: #e2865b; height: 40px; width: 100%; margin-left: 0px; text-align: center; line-height: 40px">
			<div style="width: 33%; float: left;">&nbsp;</div>
			<div style="width: 33%; float: left;">
				<a href="#"><div class="fa fa-instagram" style="color: white; width: 30%; font-size: 20px"></div></a>
				<a href="#"><div class="fa fa-facebook" style="color: white; width: 30%; font-size: 20px"></div></a>
				<a href="#"><div class="fa fa-youtube" style="color: white; width: 30%; font-size: 20px"></div></a>
			</div>
			<div style="width: 33%; float: left;">&nbsp;</div>
		</div>
	</div>
	
	
	<!-- Footer -->
	<footer class="text-center">
		<div class="footer-above">
			<div class="container">
				<div class="row">
				</div>
			</div>
		</div>
		<div class="footer-below">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						상호명: 컴투펫스토리<br> 대표: 박상석<br> 주소: 서울특별시 광진구 자양로 54 2층<br>
						사업자등록번호: 206-87-05773<br> Tel: 010-4497-0401<br>
						Copyright &copy; 2018-2019 Com2petStory All Rights Reserved.
					</div>
				</div>
			</div>
		</div>
		</div>
		<div class="footer-below2" style="">
			<div style="width: 100%; position: fixed; float: left; bottom: 0;">
				<div style="width: 25%;">
					<a href="tel:01044970401"><img
						src="http://www.com2petstory.com/img/tail1.png"
						style="width: 100%;"></a>
				</div>
				<div style="width: 25%;">
					<a href="https://open.kakao.com/o/ssQQFEeb"><img
						src="http://www.com2petstory.com/img/tail2.png"
						style="width: 100%;"></a>
				</div>
				<div style="width: 25%;">
					<a href="http://www.com2petstory.com/bbs/content.php?co_id=map"><img
						src="http://www.com2petstory.com/img/tail3.png"
						style="width: 100%;"></a>
				</div>
				<div style="width: 25%;">
					<a href="http://com2petfamily.com"><img
						src="http://www.com2petstory.com/img/tail4.png"
						style="width: 100%;"></a>
				</div>
			</div>
		</div>
	</footer>

	<!-- 화면이 작아지면 버튼이생긴다는데 안보인다. -->
	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<!-- <div class="scroll-top page-scroll visible-xs visible-sm">
		<a class="btn btn-primary" href="#page-top"> <i
			class="fa fa-chevron-up"></i>
		</a>
	</div> -->
	<script
		src="http://www.com2petstory.com/theme/freelancer/js/bootstrap.min.js"></script>
	<script
		src="http://www.com2petstory.com/theme/freelancer/js/jquery.easing.min.js"></script>
	<script
		src="http://www.com2petstory.com/theme/freelancer/js/wow.min.js"></script>
	<!-- Contact Form JavaScript -->
	<script
		src="http://www.com2petstory.com/theme/freelancer/js/jqBootstrapValidation.js"></script>
	<script
		src="http://www.com2petstory.com/theme/freelancer/js/contact_me.js"></script>
	<script>
		(function($) {
			'use strict';
			// 링크가 #인곳을 클릭하면 이벤트 제거, 아무일도 일어나지않는다.
			$("a[href='#']").click(function(e) {
				e.preventDefault();
			});
			
			// 화면이 작아지면 하단에 버튼이 생기고, 버튼을누르면 최 상단으로 간다.
			// jQuery for page scrolling feature - requires jQuery Easing plugin
			/* $(function() {
				$('body').on('click', '.page-scroll a', function(event) {
					var $anchor = $(this);
					$('html, body').stop().animate({
						scrollTop : $($anchor.attr('href')).offset().top
					}, 1500, 'easeInOutExpo');
					event.preventDefault();
				});
			}); */

			// 뭐하는건지모르겠는데 없어도 지장없음
			// Floating label headings for the contact form
			/* $(function() {
				$("body").on(
						"input propertychange",
						".floating-label-form-group",
						function(e) {
							$(this).toggleClass(
									"floating-label-form-group-with-value",
									!!$(e.target).val());
						}).on(
						"focus",
						".floating-label-form-group",
						function() {
							$(this).addClass(
									"floating-label-form-group-with-focus");
						}).on(
						"blur",
						".floating-label-form-group",
						function() {
							$(this).removeClass(
									"floating-label-form-group-with-focus");
						});
			}); */

			// 뭔지모르겠지만 navbar-fixed-top부분 주석처리되어있음
			// Highlight the top nav as scrolling occurs
			/* $('body').scrollspy({
				target : '.navbar-fixed-top'
			}) */

			// Closes the Responsive Menu on Menu Item Click
			$('.navbar-collapse ul li a:not(.dropdown-toggle)').click(
					function() {
						$('.navbar-toggle:visible').click();
					});
			$('[data-toggle="popover"]').popover();
			$('[data-toggle="tooltip"]').tooltip();
			if ($().lightSlider) {
				$('#main-slider').lightSlider({
					item : 1,
					auto : true,
					loop : true,
					slideMove : 1,
					slideMargin : 0,
					speed : 1000,
					pause : 4000,
					keyPress : true,
					pager : false
				});
			}
			
			// 없어도 달라지는게없는데..
			/* if ($().imagesLoaded) {
				$('#container').imagesLoaded({
					background : true
				}, function() {
					$('#loader').fadeOut('slow');
				});
			} */
			
			// 로딩이끝나면 화면사이즈 확인하기
			$(window).resize(function() {
				var width = $(this).width();
				var height = $(this).height();

				$('.full-height').height(height);
				$('.half-height').height(height / 2);
				$('.aThird-height').height(height / 3);
			}).trigger('resize');
			
			// 스크롤이위로가면 id가 header인 태그에
			// 클래스가 사라지고, 아래로가면 생기는데,
			// 뭔지모르겠음..
			/* $(window).scroll(function() {
				var st = $(this).scrollTop();
				if (st > 10) {
					$('#header').addClass('st-active');
				} else {
					$('#header').removeClass('st-active');
				}
			}); */
		})(jQuery);

		(function(window) {

			'use strict';

			// class helper functions from bonzo https://github.com/ded/bonzo

			function classReg(className) {
				return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
			}

			// classList support for class management
			// altho to be fair, the api sucks because it won't accept multiple classes at once
			var hasClass, addClass, removeClass;

			if ('classList' in document.documentElement) {
				hasClass = function(elem, c) {
					return elem.classList.contains(c);
				};
				addClass = function(elem, c) {
					elem.classList.add(c);
				};
				removeClass = function(elem, c) {
					elem.classList.remove(c);
				};
			} else {
				hasClass = function(elem, c) {
					return classReg(c).test(elem.className);
				};
				addClass = function(elem, c) {
					if (!hasClass(elem, c)) {
						elem.className = elem.className + ' ' + c;
					}
				};
				removeClass = function(elem, c) {
					elem.className = elem.className.replace(classReg(c), ' ');
				};
			}

			function toggleClass(elem, c) {
				var fn = hasClass(elem, c) ? removeClass : addClass;
				fn(elem, c);
			}

			var classie = {
				// full names
				hasClass : hasClass,
				addClass : addClass,
				removeClass : removeClass,
				toggleClass : toggleClass,
				// short names
				has : hasClass,
				add : addClass,
				remove : removeClass,
				toggle : toggleClass
			};

			// transport
			if (typeof define === 'function' && define.amd) {
				// AMD
				define(classie);
			} else {
				// browser global
				window.classie = classie;
			}

		})(window);

		var cbpAnimatedHeader = (function() {

			var docElem = document.documentElement, header = document
					.querySelector('.navbar-fixed-top'), didScroll = false, changeHeaderOn = 300;

			function init() {
				window.addEventListener('scroll', function(event) {
					if (!didScroll) {
						didScroll = true;
						setTimeout(scrollPage, 250);
					}
				}, false);
			}

			function scrollPage() {
				var sy = scrollY();
				if (sy >= changeHeaderOn) {
					classie.add(header, 'navbar-shrink');
					$('.scroll-top').removeClass('hidden-sm hidden-xs');
					$('.scroll-top').fadeIn(500);
				} else {
					classie.remove(header, 'navbar-shrink');
					$('.scroll-top').fadeOut(500, function() {
						$('.scroll-top').addClass('hidden-sm hidden-xs');
					});

				}
				didScroll = false;
			}

			function scrollY() {
				return window.pageYOffset || docElem.scrollTop;
			}

			init();

		})();

		/* IE8 이하 브라우저는 에니메이션 스크립트 실행 막아야함 */
		var IE = -1;
		if (navigator.appName == 'Microsoft Internet Explorer') {
			var ua = navigator.userAgent;
			var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
			if (re.exec(ua) != null) {
				IE = parseFloat(RegExp.$1);
			}
		}
		if (IE > 9 || IE == -1)
			new WOW().init();
	</script>


	<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
	<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->

</body>
</html>
