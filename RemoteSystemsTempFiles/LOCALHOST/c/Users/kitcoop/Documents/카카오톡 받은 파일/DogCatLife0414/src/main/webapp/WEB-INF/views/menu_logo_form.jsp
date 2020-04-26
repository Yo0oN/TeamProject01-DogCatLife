<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
	<!-- 로고 -->
	<div style="text-align: center; margin: 50px">
		<a href="main.mysql"><img src="resources/images/logo.png" height="300px"></a>
	</div>

	<!-- 메인 -->
	<div class="main-header header-sticky">
		<div class="container">
			<div class="row align-items-center">
				<!-- Main-menu -->
				<div class="main-menu d-none d-lg-block">
					<nav>
						<ul id="navigation">
							<li style="padding: 20px">커뮤니티
								<ul class="submenu">
									<li><a href="com_board_list.mysql?pseq=100">게시판</a></li>
									<li><a href="album_board_list.mysql">자랑하기</a></li>
								</ul>
							</li>

							<li style="padding: 20px">찾아주세요
								<ul class="submenu">
									<li><a href="lost_board_list.mysql">실종동물등록</a></li>
									<li><a href="lost_case_board_list.mysql">재회 성공 사례</a></li>
								</ul>
							</li>

							<li style="padding: 20px">입양
								<ul class="submenu">
									<li><a href="#">입양 절차</a></li>
									<li><a href="#">입양 가능 아이들</a></li>
									<li><a href="adoption_case_board_list.mysql">입양 후기</a></li>
								</ul>
							</li>

							<!-- <li style="padding: 20px">판매
								<ul class="submenu">
									<li><a href="#">견생</a></li>
									<li><a href="#">묘생</a></li>
								</ul>
							</li> -->

							<li style="padding: 20px">위치찾기
								<ul class="submenu">
									<li><a href="hospital_map.mysql">병원</a></li>
									<li><a href="hotel_map.mysql">미용호텔</a></li>
								</ul>
							</li>

							<li style="padding: 20px">고객센터
								<ul class="submenu">
									<li><a href="#">Q & A</a></li>
									<li><a href="#">공지사항</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- Mobile Menu -->
			<div class="col-12" style="padding-top: 15px">
				<div class="mobile_menu d-block d-lg-none"></div>
			</div>
		</div>
	</div>
	<!-- </div> -->

</header>