<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session.removeAttribute("endUrl");
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

<!-- Revolution Slider 5.x CSS settings -->
<link href="resources/sitedesign/js/revolution-slider/css/settings.css"
	rel="stylesheet" type="text/css" />
<link href="resources/sitedesign/js/revolution-slider/css/layers.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/sitedesign/js/revolution-slider/css/navigation.css"
	rel="stylesheet" type="text/css" />

<!-- commonheaderjs -->


<!-- external javascripts -->
<script src="resources/sitedesign/js/jquery-2.2.0.min.js"></script>
<script src="resources/sitedesign/js/jquery-ui.min.js"></script>
<script src="resources/sitedesign/js/bootstrap.min.js"></script>
<!-- JS | jquery plugin collection for this theme -->
<script src="resources/sitedesign/js/jquery-plugin-collection.js"></script>

<!-- Revolution Slider 5.x SCRIPTS 메인에만 필요?-->
<script
	src="resources/sitedesign/js/revolution-slider/js/jquery.themepunch.tools.min.js"></script>
<script
	src="resources/sitedesign/js/revolution-slider/js/jquery.themepunch.revolution.min.js"></script>

</head>

<body
	class="has-side-panel side-panel-right fullwidth-page side-push-panel">

	<div class="body-overlay"></div>
	<div id="wrapper" class="clearfix">

		<!-- header -->

		<jsp:include page="./login_menu.jsp"></jsp:include>

		<!-- Start main-content -->
		<div class="main-content">
			<!-- Section: home -->
			<section id="home" class="divider">
				<div class="container-fluid p-0">

					<!-- Slider Revolution Start -->
					<div class="rev_slider_wrapper">
						<div class="rev_slider" data-version="5.0">
							<ul>
								<!-- SLIDE 1 -->
								<li data-index="rs-1" data-transition="random"
									data-slotamount="7" data-easein="default"
									data-easeout="default" data-masterspeed="1000"
									data-thumb="resources/images/main-slider-image.jpg"
									data-rotate="0" data-fstransition="fade"
									data-fsmasterspeed="1500" data-fsslotamount="7"
									data-saveperformance="off" data-title="Intro"
									data-description="">
									<!-- MAIN IMAGE --> <img
									src="resources/images/main-slider-image.jpg" alt=""
									data-bgposition="center top" data-bgfit="cover"
									data-bgrepeat="no-repeat" class="rev-slidebg"
									data-bgparallax="6" data-no-retina>
								</li>

								<!-- SLIDE 2 -->
								<li data-index="rs-2" data-transition="random"
									data-slotamount="7" data-easein="default"
									data-easeout="default" data-masterspeed="1000"
									data-thumb="resources/images/main-slider-image.jpg"
									data-rotate="0" data-fstransition="fade"
									data-fsmasterspeed="1500" data-fsslotamount="7"
									data-saveperformance="off" data-title="Intro"
									data-description="">
									<!-- MAIN IMAGE --> <img
									src="resources/images/main-slider-image.jpg" alt=""
									data-bgposition="center top" data-bgfit="cover"
									data-bgrepeat="no-repeat" class="rev-slidebg"
									data-bgparallax="6" data-no-retina>
								</li>

								<!-- SLIDE 3 -->
								<li data-index="rs-3" data-transition="random"
									data-slotamount="7" data-easein="default"
									data-easeout="default" data-masterspeed="1000"
									data-thumb="resources/images/main-slider-image.jpg"
									data-rotate="0" data-fstransition="fade"
									data-fsmasterspeed="1500" data-fsslotamount="7"
									data-saveperformance="off" data-title="Intro"
									data-description="">
									<!-- MAIN IMAGE --> <img
									src="resources/images/main-slider-image.jpg" alt=""
									data-bgposition="center top" data-bgfit="cover"
									data-bgrepeat="no-repeat" class="rev-slidebg"
									data-bgparallax="6" data-no-retina>
								</li>
							</ul>
						</div>
					</div>
					<!-- end .rev_slider -->

				</div>
			</section>
		</div>
	</div>
	<!-- end main-content -->

	<jsp:include page="./footer.jsp"></jsp:include>

	<!-- commonfootjs -->


	<!-- SLIDER REVOLUTION 5.0 EXTENSIONS  
     (Load Extensions only on Local File Systems ! 
      The following part can be removed on Server for On Demand Loading) -->
	<script type="text/javascript"
		src="resources/sitedesign/js/revolution-slider/js/extensions/revolution.extension.actions.min.js"></script>
	<script type="text/javascript"
		src="resources/sitedesign/js/revolution-slider/js/extensions/revolution.extension.carousel.min.js"></script>
	<script type="text/javascript"
		src="resources/sitedesign/js/revolution-slider/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script type="text/javascript"
		src="resources/sitedesign/js/revolution-slider/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript"
		src="resources/sitedesign/js/revolution-slider/js/extensions/revolution.extension.migration.min.js"></script>
	<script type="text/javascript"
		src="resources/sitedesign/js/revolution-slider/js/extensions/revolution.extension.navigation.min.js"></script>
	<script type="text/javascript"
		src="resources/sitedesign/js/revolution-slider/js/extensions/revolution.extension.parallax.min.js"></script>
	<script type="text/javascript"
		src="resources/sitedesign/js/revolution-slider/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript"
		src="resources/sitedesign/js/revolution-slider/js/extensions/revolution.extension.video.min.js"></script>


	<!-- Footer Scripts -->
	<!-- JS | Custom script for all pages -->
	<script src="resources/sitedesign/js/custom.js"></script>

	<!-- notify -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/mouse0270-bootstrap-notify/3.1.7/bootstrap-notify.min.js"></script>

	<!-- soledot -->
	<script src="resources/soledot/js/fo/soledot.js"></script>

	<!-- end .rev_slider_wrapper -->
	<script>
		$(document).ready( function(e) {
		// 사진 슬라이드부분
		var revapi = $(".rev_slider").revolution({
			sliderType : "standard",
			sliderLayout : "auto",
			dottedOverlay : "none",
			delay : 5000,
			navigation : {
				keyboardNavigation : "off",
				keyboard_direction : "horizontal",
				mouseScrollNavigation : "off",
				onHoverStop : "off",
				touch : {
					touchenabled : "on",
					swipe_threshold : 75,
					swipe_min_touches : 1,
					swipe_direction : "horizontal",
					drag_block_vertical : false
				},
				arrows : {
					style : "gyges",
					enable : true,
					hide_onmobile : false,
					hide_onleave : true,
					hide_delay : 200,
					hide_delay_mobile : 1200,
					tmp : '',
					left : {
						h_align : "left",
						v_align : "center",
						h_offset : 0,
						v_offset : 0
					},
					right : {
						h_align : "right",
						v_align : "center",
						h_offset : 0,
						v_offset : 0
					}
				},
				bullets : {
					enable : true,
					hide_onmobile : true,
					hide_under : 800,
					style : "hebe",
					hide_onleave : false,
					direction : "horizontal",
					h_align : "center",
					v_align : "bottom",
					h_offset : 0,
					v_offset : 30,
					space : 5,
					tmp : '<span class="tp-bullet-image"></span><span class="tp-bullet-imageoverlay"></span><span class="tp-bullet-title"></span>'
				}
			},
			responsiveLevels : [ 1240,
					1024, 778 ],
			visibilityLevels : [ 1240,
					1024, 778 ],
			gridwidth : [ 1920, 1024, 778,
					480 ],
			// gridheight : [655, 349, 256, 164 ],
			gridheight : [ 655, 450, 400,
					300 ],
			lazyType : "none",
			parallax : {
				origo : "slidercenter",
				speed : 1000,
				levels : [ 5, 10, 15, 20,
						25, 30, 35, 40, 45,
						46, 47, 48, 49, 50,
						100, 55 ],
				type : "scroll"
			},
			shadow : 0,
			spinner : "off",
			stopLoop : "on",
			stopAfterLoops : 0,
			stopAtSlide : -1,
			shuffle : "off",
			autoHeight : "off",
			fullScreenAutoWidth : "off",
			fullScreenAlignForce : "off",
			fullScreenOffsetContainer : "",
			fullScreenOffset : "0",
			hideThumbsOnMobile : "off",
			hideSliderAtLimit : 0,
			hideCaptionAtLimit : 0,
			hideAllCaptionAtLilmit : 0,
			debugMode : false,
			fallbacks : {
				simplifyAll : "off",
				nextSlideOnWindowFocus : "off",
				disableFocusListener : false,
			}
		});
	});
	</script>
	<!-- Slider Revolution Ends -->

</body>
</html>