<%@page import="TOs.PersonalQTO"%>
<%@page import="TOs.UserTO"%>
<%@page import="TOs.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="TOs.BoardListsTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	BoardListsTO boardListsTO = (BoardListsTO) request.getAttribute("boardListsTO");
	ArrayList<BoardTO> boardLists = boardListsTO.getBoardLists();
	ArrayList<BoardTO> commentLists = boardListsTO.getCommentLists();
	ArrayList<UserTO> userLists = boardListsTO.getUserLists();
	ArrayList<PersonalQTO> pqLists = boardListsTO.getQnLists();

	StringBuffer sbHTMLBoard = new StringBuffer();
	StringBuffer sbHTMLComment = new StringBuffer();
	StringBuffer sbHTMLQnA = new StringBuffer();
	StringBuffer sbHTMLUser = new StringBuffer();
	int totalBoard = boardListsTO.getTotalBoard();
	int totalComment = boardListsTO.getTotalComment();
	int totalUser = boardListsTO.getTotalUser();
	int userSecession = boardListsTO.getUserSecession();
	int totalSecession = boardListsTO.getTotalSecession();

	//오늘 등록된 게시글,댓글, 오늘가입한 회원
	int boardToday = boardListsTO.getBoardToday();
	int commentToday = boardListsTO.getCommentToday();
	int userToday = boardListsTO.getUserToday();

	//게시글
	if (boardLists.size() == 0) {

		sbHTMLBoard.append("<tr>");
		sbHTMLBoard.append("<td align=\"center\">등록 된 게시글이 없습니다.</td>");
		sbHTMLBoard.append("<td align=\"right\" class=\"date\"></td>");
		sbHTMLBoard.append("</tr>");

	} else {

		for (int i = 0; i < boardLists.size(); i++) {

			BoardTO boardTO = boardLists.get(i);

			String seq = boardTO.getSeq();
			String pseq_kind = boardTO.getPseq_kind();
			String subject = boardTO.getSubject();
			String wdate_ori = boardTO.getWdate_ori();

			//sbHTML.append("");
			//sbHTMLBoard.append("");			

			sbHTMLBoard.append("<tr>");
			sbHTMLBoard.append("<td><a href=\"javascript:bbsView('" + seq + "');\" style=\"cursor:point\" >["
					+ pseq_kind + "] " + subject + "</a> </td>");
			sbHTMLBoard.append("<td align=\"right\" class=\"date\">" + wdate_ori + "</td>");
			sbHTMLBoard.append("</tr>");
		}
	}

	//댓글
	if (commentLists.size() == 0) {

		sbHTMLComment.append("<tr>");
		sbHTMLComment.append("<td align=\"center\">등록 된 댓글이 없습니다.</td>");
		sbHTMLComment.append("<td align=\"right\" class=\"date\"></td>");
		sbHTMLComment.append("</tr>");

	} else {
		for (int i = 0; i < commentLists.size(); i++) {

			BoardTO commentTO = commentLists.get(i);
			String seq = commentTO.getSeq();
			String cseq = commentTO.getCseq();
			String comment = commentTO.getComment();
			String cpseq_kind = commentTO.getPseq_kind();
			String cwdate_ori = commentTO.getCwdate_ori();

			//sbHTMLComment.append("");
			sbHTMLComment.append("<tr>");
			sbHTMLComment.append("<td><a href=\"javascript:bbsView('" + seq + "');\" style=\"cursor:point\" >["
					+ cpseq_kind + "] " + comment + "</a> </td>");
			sbHTMLComment.append("<td align=\"right\" class=\"date\">" + cwdate_ori + "</td>");
			sbHTMLComment.append("</tr>");
		}

	}

	//1:1질문
	if (pqLists.size() == 0) {
		sbHTMLQnA.append("<tr>");
		sbHTMLQnA.append("<td></td>");
		sbHTMLQnA.append("<td align=\"center\">등록 된 질문이 없습니다.</td>");
		sbHTMLQnA.append("<td align=\"right\" class=\"date\"></td>");
		sbHTMLQnA.append("</tr>");
	} else {
		for (int i = 0; i < pqLists.size(); i++) {

			PersonalQTO pqto = pqLists.get(i);
			String seq = pqto.getSeq();
			String nickname = pqto.getNickname();
			String subject = pqto.getSubject();
			String wdate = pqto.getWdate();

			//sbHTMLQnA.append("");

			sbHTMLQnA.append("<tr>");
			sbHTMLQnA.append("<td align=\"left\">" + nickname + "</td>");
			sbHTMLQnA.append("<td align=\"center\"><a href=\"javascript:bbsQView('" + seq
					+ "');\" style=\"cursor:point\" >" + subject + "</a> </td>");
			sbHTMLQnA.append("<td align=\"right\" class=\"date\">" + wdate + "</td>");
			sbHTMLQnA.append("</tr>");
		}
	}

	//회원목록
	if (userLists.size() == 0) {
		sbHTMLUser.append("<tr>");
		sbHTMLUser.append("<td></td>");
		sbHTMLUser.append("<td align=\"center\">등록 된 회원이 없습니다.</td>");
		sbHTMLUser.append("<td></td>");
		sbHTMLUser.append("<td align=\"right\" class=\"date\"></td>");
		sbHTMLUser.append("</tr>");
	} else {

		for (int j = 0; j < userLists.size(); j++) {

			UserTO userTO = userLists.get(j);

			String id = userTO.getId();
			String nickname = userTO.getNickname();
			String name = userTO.getName();
			String joindate = userTO.getJoindate();

			//sbHTMLUser.append("");

			sbHTMLUser.append("<tr>");
			sbHTMLUser.append("<td class=\"lt\">" + id + "</td>");
			sbHTMLUser.append("<td>" + nickname + "</td>");
			sbHTMLUser.append("<td>" + name + "</td>");
			sbHTMLUser.append("<td>" + joindate + "</td>");
			sbHTMLUser.append("</tr>");

		}
	}
	// 회원 그래프
	ArrayList<ArrayList> graphLists1 = (ArrayList) request.getAttribute("graphLists1");
	ArrayList contentscountlist = graphLists1.get(0);
	ArrayList commentscountlist = graphLists1.get(1);
	// 회원 그래프
	ArrayList<ArrayList> graphLists2 = (ArrayList) request.getAttribute("graphLists2");
	ArrayList joincountlist = graphLists2.get(0);
	ArrayList leavecountlist = graphLists2.get(1);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>관리자페이지</title>
<link rel="stylesheet" href="./resources/assets/css/jquery-ui.css">
<link href="./resources/assets/css/wiz_style.css" rel="stylesheet"
	type="text/css">

<script src="./resources/assets/js/jquery-1.10.2.js"></script>
<script src="./resources/assets/js/jquery-ui.js"></script>
<script src="./resources/assets/js/jquery.bpopup.min.js"></script>
<script src="./resources/assets/js/jquery.cookie.js"></script>
<script language="JavaScript" src="./resources/assets/js/default.js"></script>
<script language="JavaScript" src="./resources/assets/js/lib.js"></script>
<script>
	$(document).ready(function() {

		if ($.cookie("left_quick") == "close") {
			$('#Container_wrap').addClass('left_close');
		} else {
			$('#Container_wrap').removeClass('left_close');

		}

	});

	function leftBtn() {
		$('#Container_wrap').toggleClass('left_close');
		if ($('#Container_wrap').hasClass('left_close')) {
			$.cookie('left_quick', 'close', {
				expires : 1,
				path : '/',
				domain : 'demoshop.naself.com',
				secure : false
			});
		} else {
			$.cookie('left_quick', 'open', {
				expires : 1,
				path : '/',
				domain : 'demoshop.naself.com',
				secure : false
			});
		}
	}
</script>
</head>
<body class="home_body" style="">
	<!-- 네비게이션바 -->
	<jsp:include page='admin_navibar.jsp' />


	<div id="Container_wrap" class="right_close left_close">
		<!--
    class="left_close" 좌측만 닫힘
    class="right_close" 우측만 닫힘
    class="left_close right_close" 양쪽 닫힘
    -->
		<div class="nav_handle_left">
			<a href="#" onfocus="this.blur();" onclick="leftBtn();"></a>
		</div>

		<div id="left_area">

			<script type="text/javascript">
				function go_popup() {

					$('#popup').bPopup({
						speed : 650,
						transition : 'slideIn',
						transitionClose : 'slideBack'
					});

				};

				function bbsView(seq) {
					window
							.open("admin_contents_view.mysql?cpage=1&seq="
									+ seq, "getBbs1",
									"width=800,height=850,resizable=yes,scrollbars=yes, left=50, top=50");
				};

				$(document).ready(function() {

					$(":checkbox").click(function() {
						var len = $(":checkbox:checked").length;

						var max = 10;
						if (len > max) {
							alert(max + " 개 이상 등록할 수 없습니다");
							$(this).attr("checked", false);
							return;
						}

					});
					/*
						$(".quick_btn").click(function(){
							var $chk = $(":checkbox:checked");
							var max = 5;
							var quick;
							
							if($chk.length < 1)
							{
								alert("Quick Link에 등록할 메뉴를 하나이상 선택하세요");
								return;
							}
							else if( $chk.length > max )
							{
								alert(max + " 개 이상 등록할 수 없습니다");
								return;
							}

							quick = $chk.serialize();

							$.post("./quick_link.act.php",{quick:quick},function(data){
								alert("Quick Link 등록 완료");
								location.reload();
							});
						});
					 */

				});
				/* function addurl() {

					var frm = document.frm;
					var tbl = document.getElementById('quick');
					var row = tbl.insertRow(-1);
					var t = 1;
					for (i=0;i<tbl.rows[0].cells.length;i++){
						cell = row.insertCell(0);
						cell.innerHTML = "링크명 : <input type=\"text\" size='15' class=\"input\" name=\"url[]\">";
						cell.innerHTML += " Url : <input type=\"text\" size=\"50\" class=\"input\" name=\"urlname[]\">";
						cell.innerHTML += " 사용여부 : <input id='c" +(tbl.rows.length - 1) +"' type=\"checkbox\" onclick=used('c" +(tbl.rows.length - 1)+"','t"+(tbl.rows.length - 1)+"');>";
						cell.innerHTML += " <input id='t" +(tbl.rows.length - 1)+"' type=\"hidden\" value='' name=\"used[]\">";
					
					}
				} */

				/* function delurl() {

					var tbl = document.getElementById('quick');
					if (tbl.rows.length > 1) tbl.deleteRow(-1);
				} */

				/* function used (idx,uid) {
					if (document.getElementById(idx).checked == true) {
						document.getElementById(uid).value = 'Y';
					}
					else {
						document.getElementById(uid).value = 'N';
					}
					
				} */

				function bbsView(seq) {
					window
							.open("admin_view.mysql?cpage=1&seq=" + seq,
									"getBbs1",
									"width=800,height=850,resizable=no,scrollbars=yes, left=50, top=50");
				}
				function bbsQView(seq) {
					window
							.open("admin_qnaq.mysql?cpage=1&seq=" + seq,
									"getBbs1",
									"width=800,height=850,resizable=no,scrollbars=yes, left=50, top=50");
				}
			</script>

			<style type="text/css">
.Pstyle {
	opacity: 0;
	display: none;
	position: relative;
	width: 700px;
	border: 5px solid #fff;
	padding: 20px;
	background-color: #fff;
}

.b-close {
	position: absolute;
	right: 5px;
	top: 5px;
	padding: 5px;
	display: inline-block;
	cursor: pointer;
}
</style>

			<div id="popup" class="Pstyle">
				<span class="b-close">X</span>
				<div class="content" style="height: auto; width: 700px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="2">
						<tbody>
							<tr>
								<td><h3
										style="background: url(../image/sub/h3.gif) left 6px no-repeat; line-height: 1.6; font-size: 16px; font-weight: bold; color: #2f2f2f; padding-left: 16px;">퀵링크
										메뉴관리</h3></td>
							</tr>
						</tbody>
					</table>
					<br>
					<form name="frm" action="../menu_save.php" method="post">
						<table width="100%" class="table_basic">
							<tbody>
								<tr>
									<td>
										<table width="100%" border="0" cellspacing="0" cellpadding="0"
											id="quick">
											<tbody>
												<tr>
													<td>
														<button type="button"
															class="h18 t3 color small round black_s"
															onclick="addurl()">추가</button>
														<button type="button"
															class="h18 t3 color small round red_s" onclick="delurl()">삭제</button>
													</td>
												</tr>
												<tr>
													<td>링크명 : <input type="text" size="15" class="input"
														name="url[]" value="주문관리"> Url : <input
														type="text" size="50" class="input" name="urlname[]"
														value="/adm/manage/product/order_list.php"> 사용여부 :
														<input id="c1" checked="" type="checkbox"
														onclick="used('c1','t1');"> <input id="t1"
														type="hidden" class="input" name="used[]" value="Y">
													</td>
												</tr>
												<tr>
													<td>링크명 : <input type="text" size="15" class="input"
														name="url[]" value="회원관리"> Url : <input
														type="text" size="50" class="input" name="urlname[]"
														value="/adm/manage/member/member_list.php"> 사용여부 :
														<input id="c2" checked="" type="checkbox"
														onclick="used('c2','t2');"> <input id="t2"
														type="hidden" class="input" name="used[]" value="Y">
													</td>
												</tr>
												<tr>
													<td>링크명 : <input type="text" size="15" class="input"
														name="url[]" value="게시판관리"> Url : <input
														type="text" size="50" class="input" name="urlname[]"
														value="/adm/manage/bbs/bbs_list.php"> 사용여부 : <input
														id="c3" checked="" type="checkbox"
														onclick="used('c3','t3');"> <input id="t3"
														type="hidden" class="input" name="used[]" value="Y">
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<div align="center">
							<button type="submit" style="margin-top: 5px"
								class="b h28 t5 color blue_big">저장</button>
						</div>
					</form>

				</div>
			</div>



			<div class="main_left">
				<!-- 메인일때 좌, 우측 여백 -->
				<!-- <div class="License">
        <p class="tit type1">라이센스</p>
        <ul class="cont">
            <li><span>솔루션</span><br>Wizcom Plus</li>
            <li><span>라이센스</span><br>
				1513d9e161a40fe991ae002a8
4936eb8			</li>
            <li><span>설치일</span><br>1970-01-01 09:33:39</li>
            <li><span>도메인</span><br>demoshop.naself.com</li>                  
        </ul>
    </div>//M_license// -->
				<!-- <script>
		function openMenu() {
			window.open('../menu_config.php', 'cm', 'width=850,height=700,menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, top=100, left=100');
			
		}
	</script> -->
				<div class="Quicklink top15">
					<p class="tit type1">퀵 링크</p>
					<ul class="cont">
						<li><a
							href="./admin_contents.mysql?cpage=1&codeopt=1&sdate=&edate=&searchopt=&searchkey=">게시물
								통합관리</a></li>
						<li><a
							href="./admin_comments.mysql?cpage=1&codeopt=1&sdate=&edate=&searchopt=&searchkey=">댓글
								통합관리</a></li>
						<li><a
							href="./admin_user.mysql?cpage=1&sdate=&edate=&searchopt=&searchkey=">회원
								통합관리</a></li>
					</ul>
					<!-- <a href="javascript:go_popup();void(0);" onfocus="this.blur();" class="more">메뉴관리</a> -->
				</div>
				<!-- //M_quicklink// -->



				<!-- //M_cs// -->
			</div>
			<!-- //main_left// -->


		</div>
		<!-- //left_area// -->

		<div id="Container">
			<div class="main_cont">
				<!-- 메인 컨텐츠 여백 -->
				<div class="leftcont M_latest">
					<p class="tit type1">최근 게시물</p>
					<div class="bbs">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<%=sbHTMLBoard%>
							</tbody>
						</table>
					</div>
					<div class="bbs_stats">
						<table width="100%" height="100%" border="0" cellpadding="0"
							cellspacing="0">
							<tbody>
								<tr>
									<td class="first"><p>총 게시판수</p> <b>7</b> 개</td>
									<td><p>총 게시글</p> <b><%=totalBoard%></b> 개</td>
									<td><p>오늘 게시물</p> <b><%=boardToday%></b> 개</td>

									<!-- <td><p>오늘 댓글</p><b>0</b> 개</td> -->
								</tr>
							</tbody>
						</table>
					</div>
					<a
						href="./admin_contents.mysql?cpage=1&codeopt=1&sdate=&edate=&searchopt=&searchkey="
						onfocus="this.blur();" class="more"><img
						src="./resources/assets/img/admin/main/more.gif"></a>
				</div>
				<div class="rightcont M_latest">
					<p class="tit type1">최근 댓글</p>
					<div class="bbs">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<%=sbHTMLComment%>
							</tbody>
						</table>
					</div>
					<div class="bbs_stats">
						<table width="100%" height="100%" border="0" cellpadding="0"
							cellspacing="0">
							<tbody>
								<tr>
									<td class="first"><p>총 댓글 수</p> <b><%=totalComment%></b> 개</td>
									<td><p>오늘 작성된 댓글</p> <b><%=commentToday%></b> 개</td>
								</tr>
							</tbody>
						</table>
					</div>
					<a
						href="./admin_comments.mysql?cpage=1&codeopt=1&sdate=&edate=&searchopt=&searchkey="
						onfocus="this.blur();" class="more"><img
						src="./resources/assets/img/admin/main/more.gif"></a>
				</div>
				<!-- //M_latest// -->

				<!-- //M_visitor// -->
				<div class="leftcont M_latest_re">
					<p class="tit type2">
						<span>최근</span> 1:1 질문
					</p>
					<div class="cont">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<%=sbHTMLQnA%>
							</tbody>
						</table>
					</div>
					<a
						href="./admin_qna.mysql?cpage=1&sdate=&edate=&searchopt=&searchkey="
						onfocus="this.blur();" class="more"><img
						src="./resources/assets/img/admin/main/more.gif"></a>
				</div>
				<!-- //M_latest_re// -->

				<div class="rightcont M_member">
					<p class="tit type2">
						<span>회원</span>현황<a
							href="./admin_user.mysql?cpage=1&sdate=&edate=&searchopt=&searchkey="
							style="float: right; padding-right: 10px; padding-top: 3px"><img
							src="./resources/assets/img/admin/main/more.gif"></a>
					</p>

					<div class="mem_latest">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<%=sbHTMLUser%>
								<!-- <tr>
					<td class="lt">test2</td>
					<td>테스트2</td>
					<td>일반회원</td>
					<td>2016-05-25</td>
				</tr> -->

							</tbody>
						</table>
					</div>
					<div class="mem_stats">
						<table width="100%" height="100%" border="0" cellpadding="0"
							cellspacing="0">
							<tbody>
								<tr>
									<td class="lt">
										<p>오늘 가입회원</p> <b><%=userToday%>명</b>
									</td>

									<td>
										<p>전체 회원수</p> <b><%=totalUser%>명</b>
									</td>

									<td>
										<p>오늘 탈퇴회원</p> <b><%=userSecession%>명</b>
									</td>

									<td>
										<p>총 탈퇴회원</p> <b><%=totalSecession%>명</b>
									</td>

								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- //M_member// -->

				<div class="leftcont graph1">
					<div class="cont">
						<p class="tit type2">
							<span>게시판</span>통계<a
								href="./admin_user.mysql?cpage=1&sdate=&edate=&searchopt=&searchkey="
								style="float: right; padding-right: 10px; padding-top: 3px"><img
								src="./resources/assets/img/admin/main/more.gif"></a>
						</p>
						<br>
						<div id="my_chart1">
							<%@ include file="./graph1.jsp"%>
						</div>
						<!-- 게시판 그래프 -->
						<div></div>
					</div>

				</div>
				<!-- //graph1// -->
				<div class="rightcont graph2">
					<div class="cont">
						<p class="tit type2">
							<span>회원 수</span> 변동 추이<a
								href="/adm/manage/connect/connect_list.php"
								style="float: right; padding-right: 10px; padding-top: 3px"><img
								src="./resources/assets/img/admin/main/more.gif"></a>
						</p>
						<br>
						<div id="my_chart2">
							<%@ include file="./graph2.jsp"%>
						</div>
					</div>
					<!-- //graph2// -->

				</div>
				<!-- //main_cont// -->
			</div>
			<!-- //Container// -->
		</div>
		<!-- //Container_wrap// -->

		<div id="Footer">www.DogCatLife.com</div>



	</div>
</body>
</html>