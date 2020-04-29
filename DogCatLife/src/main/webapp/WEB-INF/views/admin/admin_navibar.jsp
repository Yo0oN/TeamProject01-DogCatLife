<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	
	out.println("<script type='text/javascript'>");
	if( id == null ){
		out.println("alert('로그인을 하여 주십시오.')");
		out.println("location.href='./admin_login.mysql'");
	}
	out.println("</script>");
%>
<link rel="stylesheet" href="./resources/assets/css/jquery-ui.css">
<script src="./resources/assets/js/jquery-1.10.2.js"></script>
<script src="./resources/assets/js/jquery-ui.js"></script>
<!-- <script src="./resources/assets/js/jquery.highchartTable.js"></script>
<script src="./resources/assets/js/highcharts.js"></script> -->
<script src="./resources/assets/js/jquery.bpopup.min.js"></script>
<script src="./resources/assets/js/jquery.cookie.js"></script>
<link href="./resources/assets/css/wiz_style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="./resources/assets/js/default.js"></script>
<script language="JavaScript" src="./resources/assets/js/lib.js"></script>
<div id="Header">
	<h1><a href="./admin_main.mysql" onfocus="this.blur();"><img src="./resources/assets/img/admin/header/logo.png"></a></h1>
    <ul id="gnb">
    	<li class="first" onfocus="this.blur();"><a>관리자 : <%=id %></a></li>
    	<li><a href="./admin_main.mysql" onfocus="this.blur();">Home</a></li>
    	<li><a href="./admin_login.mysql" onfocus="this.blur();" class="logbtn"><img src="./resources/assets/img/admin/header/logout.gif"></a></li>
    </ul>
    <div id="navi">
		<li>
			<a href="./admin_contents.mysql?cpage=1&codeopt=1&sdate=&edate=&searchopt=&searchkey=" onfocus="this.blur();"><span>게시판 관리</span></a>
        	<ul class="category">
				<li>
					<a href="./admin_contents.mysql?cpage=1&codeopt=1&sdate=&edate=&searchopt=&searchkey=">게시물 통합관리</a>
				</li>
				<li>
					<a href="./admin_comments.mysql?cpage=1&codeopt=1&sdate=&edate=&searchopt=&searchkey=">댓글 통합관리</a>
				</li>
			</ul>
		</li>
        <li>
			<a href="./admin_user.mysql?cpage=1&codeopt=1&sdate=&edate=&searchopt=&searchkey=" onfocus="this.blur();"><span>계정관리</span></a>
			<ul class="category">
				<li>
					<a href="./admin_user.mysql?cpage=1&sdate=&edate=&searchopt=&searchkey=">회원 통합관리</a>
				</li>
			</ul>
		</li>
    	<li>
			<a href="./admin_an.mysql?cpage=1&sdate=&edate=&searchopt=&searchkey=" onfocus="this.blur();"><span>고객센터 관리</span></a>
        	<ul class="category">
				<li>
					<a href="./admin_an.mysql?cpage=1&sdate=&edate=&searchopt=&searchkey=">공지사항</a>
				</li>
				<li>
					<a href="./admin_questions.mysql?cpage=1&searchopt=flag&searchkey=">자주묻는질문</a>
				</li>
				<li>
					<a href="./admin_qna.mysql?cpage=1&codeopt=flag&sdate=&edate=&searchopt=&searchkey=">1:1문의</a>
				</li>
			</ul>
		</li>
    </div>
</div>