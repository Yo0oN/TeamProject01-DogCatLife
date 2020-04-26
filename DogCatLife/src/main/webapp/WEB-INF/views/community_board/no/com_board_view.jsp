<%@page import="TOs.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<BoardTO> toLists = (ArrayList) request.getAttribute("toLists");
	String cpage = (String) request.getAttribute("cpage");

	// 본문 설정
	String pseq = toLists.get(0).getPseq();
	String seq = toLists.get(0).getSeq();
	String subject = toLists.get(0).getSubject();
	String mseq = toLists.get(0).getMseq();
	String writer = toLists.get(0).getWriter();
	String content = toLists.get(0).getContent().replaceAll("\n", "<br>");
	String hit = toLists.get(0).getHit();
	String filename_new = "";
	if (!toLists.get(0).getFilename_new().equals("")) {
		filename_new = "./resources/upload/" + toLists.get(0).getFilename_new();
	}
	String wdate_ori = toLists.get(0).getWdate_ori();
	String wdate_mod = toLists.get(0).getWdate_mod();

	// 댓글 설정
	String cseq = "";
	String cmseq = "";
	String cwriter = "";
	String comment = "";
	String cwdate_ori = "";
	String cmt = toLists.size() - 1 + "";

	StringBuffer sbHTML = new StringBuffer();

	for (int i = 1; i < toLists.size(); i++) {
		cseq = toLists.get(i).getCseq();
		cmseq = toLists.get(i).getCmseq();
		cwriter = toLists.get(i).getCwriter();
		comment = toLists.get(i).getComment().replaceAll("\n", "<br>");
		cwdate_ori = toLists.get(i).getCwdate_ori();

		sbHTML.append("<tr>");
		sbHTML.append("<td style='width:100px'>");
		sbHTML.append("<h4 class='mb-0'><i class='fa fa-comments'></i> " + cwriter + "</h4>");
		sbHTML.append("</td>");
		sbHTML.append("<td>");
		sbHTML.append("<p class='date mb-0 pr-20' style='margin:0'>" + cwdate_ori + "</p>");
		sbHTML.append("</td>");
		sbHTML.append("<td><a class='comment_modify' cseq='" + cseq
				+ "' class='date ml-10' style='color:#635c5c;font-size:14px'>수정</a></td>");
		sbHTML.append(
				"<td style='color:#635c5c;font-size:14px'>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='./com_board_comment_delete_ok.mysql?pseq="
						+ pseq + "&cpage=" + cpage + "&seq=" + seq + "&cseq=" + cseq
						+ "' class='comment_delete' id='comment_delete_" + cseq
						+ "' class='date ml-10' style='color:#635c5c;font-size:14px'>삭제</a></td>");
		sbHTML.append("</tr>");

		sbHTML.append("<tr style='' cseq='" + cseq + "'>");
		sbHTML.append("<td colspan=4>");
		sbHTML.append("" + comment + "");
		sbHTML.append("</td>");
		sbHTML.append("<tr><td colspan=4>&nbsp;</td>");
		sbHTML.append("</tr>");
	}
%>


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
	href="./resources/assets/img/favicon.ico">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/slicknav.css">
<link rel="stylesheet" href="./resources/assets/css/animate.min.css">
<link rel="stylesheet" href="./resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="./resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="./resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="./resources/assets/css/slick.css">
<link rel="stylesheet" href="./resources/assets/css/nice-select.css">
<link rel="stylesheet" href="./resources/assets/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#delete').on('click', function() {
			if (confirm('삭제하시겠습니까?')) {
				location.href("./com_board_delete_ok.mysql?pseq=<%=pseq%>&seq=<%=seq%>");
			} else {
			}
		});

		$('#reply').on('click', function() {
			if ($('#comment').val().trim() == "") {
				alert('댓글을 입력해주세요.');
				return false;
			}
			$('#commentForm').submit();
		});

		$('.comment_delete').on('click', function() {
			if (confirm('댓글을 삭제하시겠습니까?')) {
			} else {
				return false;
			}
		});

		$('.comment_modify').on(
				'click',
				function() {
					var addAttr = 'tr[cseq='
							+ $(this).attr('cseq') + ']';
					$(addAttr).attr('style', 'display:none');

					/* alert('modify' + addAttr);
					$.ajax({
						url : './com_board_comment_modify.mysql',
						data : {
							cseq : $(this).attr('cseq')
						},
						type : 'get',
						dataType : 'text',
						success : function(data) {
							$(addAttr).attr('style', 'display:none');
							
						},
						error : function(error) {
							alert('수정에 실패하였습니다.');
						}
					}); */
				});
	});
</script>

</head>

<body>

	<%-- <jsp:include page='../beforeLogin.jsp' />
	<jsp:include page='../menu_logo_form.jsp' /> --%>

	<hr>

	<!--================Blog Area =================-->
	<section class="blog_area single-post-area">
		<div class="container">

			<div class="row">
				<div class="col-lg-12">
					<div>
						<div>
							<div class="row">
								<div class="col-8">
									<h2 class="mb-30"><%=subject%></h2>
								</div>
								<div align="right">
									<a href="./com_board_write.mysql?pseq=<%=pseq%>"> <span
										style="background-color: #2B4B80"
										class="btn pt-20 pb-20 pl-30 pr-30">글 쓰기</span>
									</a> <a
										href="./com_board_list.mysql?pseq=<%=pseq%>&cpage=<%=cpage%>">
										<span style="background-color: #2B4B80"
										class="btn pt-20 pb-20 pl-30 pr-30">목록</span>
									</a>
								</div>
							</div>
							<ul class="blog-info-link">
								<li><i class="fa fa-user"></i> <%=writer%></li>
								<li><i class="fa fa-comments"></i> <%=cmt%> Comments</li>
								<li><%=hit%> hit</li>
								<li><%=wdate_ori%></li>
								<li><a
									href="./com_board_modify.mysql?pseq=<%=pseq%>&cpage=<%=cpage%>&seq=<%=seq%>">
										수정 </a></li>
								<li><a id="delete"> 삭제 </a></li>
							</ul>

							<hr style="margin: 10px">

							<%
								if (!filename_new.equals("")) {
							%>
							<div class="mb-30 mt-30">
								<img class="img-fluid" src="<%=filename_new%>" alt=""
									width='50%' onerror='' />
							</div>
							<%
								}
							%>

							<p>
								<%=content%>
							</p>

						</div>
					</div>


					<!-- 댓글부분 -->
					<div class="comments-area">
						<h4><%=cmt%>
							Comments
						</h4>
						<div class="comment-list" style="padding-bottom: 0px;">
							<table>
								<%=sbHTML%>
							</table>
						</div>

						<!-- 댓글쓰기 -->
						<div class="comment-form">
							<form class="form-contact comment_form"
								action="./com_board_comment_ok.mysql" id="commentForm">
								<input type="hidden" name="pseq" value="<%=pseq%>" /> <input
									type="hidden" name="cpage" value="<%=cpage%>" /> <input
									type="hidden" name="seq" value="<%=seq%>" />
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<textarea class="form-control w-100" name="comment"
												id="comment" cols="25" rows="4" placeholder="댓글쓰기"></textarea>
										</div>
									</div>
									<div class="col-12" align="right">
										<span id="reply" style="background-color: #2B4B80"
											class="btn pt-20 pb-20 pl-30 pr-30" >댓글등록</span>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--================ Blog Area end =================-->

	<%-- <jsp:include page='../footer.jsp' /> --%>

	<!-- JS here -->

	<!-- All JS Custom Plugins Link Here here -->
	<script src="./resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>

	<!-- Jquery, Popper, Bootstrap -->
	<script src="./resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="./resources/assets/js/popper.min.js"></script>
	<script src="./resources/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="./resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="./resources/assets/js/owl.carousel.min.js"></script>
	<script src="./resources/assets/js/slick.min.js"></script>
	<!-- Date Picker -->
	<script src="./resources/assets/js/gijgo.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="./resources/assets/js/wow.min.js"></script>
	<script src="./resources/assets/js/animated.headline.js"></script>
	<script src="./resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- Scrollup, nice-select, sticky -->
	<script src="./resources/assets/js/jquery.scrollUp.min.js"></script>
	<script src="./resources/assets/js/jquery.nice-select.min.js"></script>
	<script src="./resources/assets/js/jquery.sticky.js"></script>

	<!-- contact js -->
	<script src="./resources/assets/js/contact.js"></script>
	<script src="./resources/assets/js/jquery.form.js"></script>
	<script src="./resources/assets/js/jquery.validate.min.js"></script>
	<script src="./resources/assets/js/mail-script.js"></script>
	<script src="./resources/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="./resources/assets/js/plugins.js"></script>
	<script src="./resources/assets/js/main.js"></script>


</body>

</html>