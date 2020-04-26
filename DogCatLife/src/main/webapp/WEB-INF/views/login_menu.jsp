<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header -->
<header id="header" class="header">
	<!-- 회원가입, 로그인 시작 -->
	<div class="header-top bg-theme-colored sm-text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<!-- <div class="widget no-border m-0">
								<ul class="list-inline xs-text-center mt-5">
									<li class="m-0"><a class="text-white" href="/help/fo/index.sd">고객센터</a></li>									
									<li class="text-white m-0">|</li>
									<li class="m-0"><a class="text-white" href="/help/fo/faqlist.sd">FAQ</a></li>
									<li class="text-white m-0">|</li>
									<li class="m-0"><a class="text-white" href="/home/fo/contact.sd">Contact Us</a></li>
								</ul>
							</div> -->
				</div>
				<div class="col-md-4">
					<div class="widget no-border m-0">
					<% if (session.getAttribute("sess_mseq") == null || session.getAttribute("sess_nickname") == null) { %>
						<ul
							class="list-inline pull-right flip sm-pull-none sm-text-center mt-5">
							<li class="sm-display-block mt-sm-10 mb-sm-10">
								<a class="bg-light p-5 text-theme-colored font-11 pl-10 pr-10"
									href="login.mysql">로그인</a>
							</li>
							<li class="sm-display-block mt-sm-10 mb-sm-10">
								<a class="bg-light p-5 text-theme-colored font-11 pl-10 pr-10"
									href="join.mysql">회원가입</a>
							</li>
						</ul>
					<% } else { %>
						<ul
							class="list-inline pull-right flip sm-pull-none sm-text-center mt-5">
							<li class="sm-display-block mt-sm-10 mb-sm-10" style="color:white">
								환영합니다! <%=session.getAttribute("sess_nickname") %> 님!
							</li>
							<li class="sm-display-block mt-sm-10 mb-sm-10">
								<a class="bg-light p-5 text-theme-colored font-11 pl-10 pr-10"
									href="input_password.mysql">마이페이지</a>
							</li>
							<li class="sm-display-block mt-sm-10 mb-sm-10">
								<a class="bg-light p-5 text-theme-colored font-11 pl-10 pr-10"
									href="logout_ok.mysql">로그아웃</a>
							</li>
						</ul>
					<% } %>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원가입, 로그인 끝 -->

	<!-- 메뉴 시작 -->
	<div class="header-nav">
		<div class="header-nav-wrapper navbar-scrolltofixed bg-lightest">
			<div class="container">
				<nav id="menuzord-right" class="menuzord blue bg-lightest">
					<!-- 메뉴부분 로고 -->
					<a class="menuzord-brand pull-left flip" href="./main.mysql"> <img
						src="resources/images/logo.png" alt="DogCatLife">
					</a>

					<!-- 누르면 우측에 홈, 마이페이지, 로그인등 바로가기 버튼이 보임 -->
					<!-- <div id="side-panel-trigger" class="side-panel-trigger">
								<a href="#"><i class="fa fa-bars font-24 text-gray"></i></a>
							</div> -->

					<ul class="menuzord-menu">
						<li><a>커뮤니티</a>
							<ul class="dropdown">
								<li><a href="com_board_list.mysql?pseq=11">커뮤니티</a></li>
								<li><a href="album_board_list.mysql?pseq=12">자랑하기</a></li>
							</ul></li>
						<li><a>찾아주세요</a>
							<ul class="dropdown">
								<li><a href="album_board_list.mysql?pseq=21">실종동물등록</a></li>
								<li><a href="album_board_list.mysql?pseq=22">재회 성공 사례</a></li>
							</ul></li>
						<li><a>입양</a>
							<ul class="dropdown">
								<li><a href="adoption_board_view.mysql">입양 절차</a></li>
								<li><a href="padoption_board_list.mysql?pseq=31">입양 가능 아이들</a></li>
								<li><a href="album_board_list.mysql?pseq=32">입양 후기</a></li>
							</ul></li>
						<li><a>위치찾기</a>
							<ul class="dropdown">
								<li><a href="hospital_map.mysql">병원</a></li>
								<li><a href="hotel_map.mysql">미용,호텔</a></li>
							</ul></li>
						<li><a>고객센터</a>
							<ul class="dropdown">
								<li><a href="noticelist.mysql?pseq=41">공지사항</a></li>
								<li><a href="faqlist.mysql?pseq=42">FAQ</a></li>
								<li><a href="commonagree.mysql">이용약관</a></li>
								<li><a href="commontext.mysql">개인정보처리방침</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<!-- 메뉴 끝 -->

</header>