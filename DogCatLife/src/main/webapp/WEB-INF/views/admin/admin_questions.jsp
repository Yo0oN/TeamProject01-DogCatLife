<%@page import="TOs.QuestionsTO"%>
<%@page import="TOs.BoardListsTO"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="TOs.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
	//페이징
	BoardListsTO qListsTO = (BoardListsTO)request.getAttribute("qListsTO");
	ArrayList<QuestionsTO> qLists = qListsTO.getqLists();
	// 현재페이지
	//int cpage = Integer.valueOf(request.getParameter("cpage"));
	int cpage = qListsTO.getCpage();
	// 한 페이지당 출력 데이터 개수
	int recordPerPage = qListsTO.getRecordPerPage();	
	// 전체 데이터(글) 개수
	int totalRecord = qLists.size();
	// 전체 페이지 개수 = 마지막 페이지
	int totalPage = ( ( (totalRecord - 1) / recordPerPage ) + 1 );
	// 페이지번호가 몇개씩 보이게 할지 설정
	int blockPerPage = qListsTO.getBlockPerPage();
	// 보이는 페이지 번호의 시작부분이다.
	int startBlock = ((cpage - 1) / blockPerPage) * blockPerPage + 1;
	// 보이는 페이지 번호의 끝부분이다.
	int endBlock = ((cpage - 1) / blockPerPage) * blockPerPage + blockPerPage;
	if (endBlock >= totalPage) {
		endBlock = totalPage;
	}
	
	/* System.out.println(cpage+" CPAGE");
	System.out.println(recordPerPage+" RECORDPERPAGE");
	System.out.println(totalPage+" TOTALPAGE");
	System.out.println(totalRecord+" TOTALRECORD");
	System.out.println(blockPerPage+" BLOCKPERPAGE");
	System.out.println(startBlock+" STARTBLOCK");
	System.out.println(endBlock+" ENDBLOCK"); */
	
	
	
	StringBuffer sbHTML = new StringBuffer();
	String seq = null;
	
	//검색관련 변수
	String codeopt = request.getParameter("codeopt");
	String sdate = request.getParameter("sdate");
	String edate = request.getParameter("edate");
	String searchopt= request.getParameter("searchopt");
	String searchkey= request.getParameter("searchkey");
	if (qLists.size() == 0) {
		sbHTML.append("<td align=\"center\">등록 된 게시글이 없습니다.</td>");
	} else {
		if( totalRecord < recordPerPage){
			recordPerPage = totalRecord;
		}
		if( (cpage==totalPage) && ( (totalRecord%10) > 0) ){
			recordPerPage = totalRecord%10;
		}
		for ( int i=0; i < recordPerPage; i++) {
			
			QuestionsTO qTO = qLists.get(i);
			if( cpage != 1 ){	
				qTO = qLists.get(i+((cpage-1)*10));
			}
			
			seq = qTO.getSeq();
			String qseq = qTO.getQseq();
			String kinds = qTO.getKinds();
			String content = qTO.getContent();
			String subject = qTO.getSubject();
			String wdate = qTO.getWdate();
		
			
			//sbHTML.append("");
			sbHTML.append("<tr>");
			sbHTML.append("<td align=\"center\"><form style='margin:0;'><input type='hidden' name='idx' value='"+seq+"'><input type='checkbox' name='select_checkbox'></form></td>");
			sbHTML.append("<td height=\"30\" align=\"center\">"+ seq +"</td>");
			sbHTML.append("<td style=\"text-align:left;\"><a href=\"javascript:bbsView('"+seq+"');\" style=\"cursor:point\" ><b>["+kinds+"]</b>"+ subject +"</a></td>");
			sbHTML.append("<td align=\"center\">admin</td>");
			sbHTML.append("<td align=\"center\">"+ wdate +"</td>");
			sbHTML.append("<td align=\"center\"><a onclick=\"bbsModify('"+seq+"');\"><button type=\"button\" class=\"h18 t3 color small round black_s\">수정</button></a></td>");
			sbHTML.append("<td align=\"center\"><button type=\"button\" class=\"h18 t3 color small round red_s\" onClick=\"deleteBbs("+seq+");\">삭제</button></td>");
			sbHTML.append("</tr>");
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>관리자페이지</title>
<link rel="stylesheet" href="./resources/assets/css/jquery-ui.css">
<script src="./resources/assets/js/jquery-1.10.2.js"></script>
<script src="./resources/assets/js/jquery-ui.js"></script>
<script src="./resources/assets/js/jquery.highchartTable.js"></script>
<script src="./resources/assets/js/highcharts.js"></script>
<script src="./resources/assets/js/jquery.bpopup.min.js"></script>
<script src="./resources/assets/js/jquery.cookie.js"></script>
<link href="./resources/assets/css/wiz_style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="./resources/assets/js/default.js"></script>
<script language="JavaScript" src="./resources/assets/js/lib.js"></script>
<style>
	.ui-datepicker { width: 242px; font-size:90%;}
	.ui-datepicker-calendar > tbody td:first-child a { 
	COLOR: #f00; 
	}
	.ui-datepicker-calendar > tbody td:last-child a { 
		COLOR: blue; 
	}
</style>
<script>
	$(function() {
		$( "#datepicker1" ).datepicker({
			dateFormat: 'yy-mm-dd',
				//yearSuffix: '년',
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
				changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
				showMonthAfterYear: true // 년월 셀렉트 박스 위치 변경
				//altField: "#date", // 타겟 필드
				//minDate: '-0d', // 오늘 이전 날짜는 선택 못함
				
		});
	});
	$(function() {
		$( "#datepicker2" ).datepicker({
			dateFormat: 'yy-mm-dd',
				//yearSuffix: '년',
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
				changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
				showMonthAfterYear: true // 년월 셀렉트 박스 위치 변경
				//altField: "#date", // 타겟 필드
				//minDate: '-0d', // 오늘 이전 날짜는 선택 못함
				
		});
	});

	$(document).ready(function(){

	 if($.cookie("left_quick") == "close"){
		$('#Container_wrap').addClass('left_close'); 
	 }else{
		$('#Container_wrap').removeClass('left_close'); 

	 }


	});

	function leftBtn() {
		$('#Container_wrap').toggleClass('left_close');   
		if ($('#Container_wrap').hasClass('left_close')) {
			$.cookie('left_quick', 'close', { expires: 1, path: '/', domain: 'demoshop.naself.com', secure: false });
		}
		else {
			$.cookie('left_quick', 'open', { expires: 1, path: '/', domain: 'demoshop.naself.com', secure: false });			
		}
	}

	
</script>
</head>
<body class="home_body" style="">
<!-- 네비게이션바 -->
<jsp:include page='admin_navibar.jsp' />

<div id="Container_wrap" class="right_close">
    <!--
    class="left_close" 좌측만 닫힘
    class="right_close" 우측만 닫힘
    class="left_close right_close" 양쪽 닫힘
    -->
    <div class="nav_handle_left">
		<a href="#" onFocus="this.blur();" onclick="leftBtn();"></a>
	</div>

    <div id="left_area">
		



<h2><img src="./resources/assets/img/admin/header/icon3.png" alt=""> 고객센터 관리</h2>
	<ul id="Lnb">
		<li class="on"><a href="./admin_an.mysql?cpage=1&sdate=&edate=&searchopt=&searchkey=" onFocus="this.blur();">고객센터 관리</a>
			<ul>
				<li>
					<a href="./admin_an.mysql?cpage=1&sdate=&edate=&searchopt=&searchkey=">공지사항 관리</a>
				</li>
				<li>
					<a href="./admin_questions.mysql?cpage=1&searchopt=flag&searchkey=">자주 묻는 질문</a>
				</li>	
				<li>
					<a href="./admin_qna.mysql?cpage=1&codeopt=flag&sdate=&edate=&searchopt=&searchkey=">1:1 문의</a>
				</li>			
			</ul>
		</li>		
	</ul>
	</div>
	<!-- //left_area// -->

<div id="Container">
 
	<script language="JavaScript" type="text/javascript">
	
	/* function excelDown(){
		document.location = "bbs_manage_excel.php?ptype=bbs&searchopt=&searchkey=&codeopt=&sdate=&edate=";
	}
	
	function bbsView(idx, code) {
		window.open("bbs.php?ptype=view&idx=" + idx + "&code=" + code, "getBbs1", "width=800,height=850,resizable=yes,scrollbars=yes, left=50, top=50");				
	}
	function bbsModify(idx, code) {
		window.open("bbs.php?ptype=input&mode=modify&idx=" + idx + "&code=" + code, "getBbs2", "width=800,height=750,resizable=yes,scrollbars=yes, left=50, top=50");				
	}
	function bbsReply(idx, code) {
		window.open("bbs.php?ptype=input&mode=reply&idx=" + idx + "&code=" + code, "getBbs3", "width=800,height=750,resizable=yes,scrollbars=yes, left=50, top=50");				
	} */
	
	function bbsModify(seq) {
		window.open("admin_questions_modify.mysql?cpage=1&seq=" + seq, "getBbs1", "width=850,height=850,resizable=no,scrollbars=yes, left=50, top=50");				
	}
	
	function bbsView(seq) {
		window.open("admin_questions_view.mysql?cpage=1&seq=" + seq, "getBbs1", "width=800,height=850,resizable=no,scrollbars=yes, left=50, top=50");				
	}
	
	function deleteBbs(seq){
		if(confirm('선택한 게시글을 삭제하시겠습니까?\n\n삭제한 데이타는 복구할수 없습니다.')){
			//document.location = './admin_contents_delete.mysql';
			document.location = './admin_questions_delete.mysql?cpage=<%=cpage%>&seq='+seq;
		}
	}
	
	function questions_write(seq) {
		window.open("admin_questions_write.mysql?cpage=1", "getBbs1", "width=760,height=500,resizable=no,scrollbars=yes, left=50, top=50");				
	}
	
	Date.prototype.yyyymmdd = function()
	{
		var yyyy = this.getFullYear().toString();
		var mm = (this.getMonth() + 1).toString();
		var dd = this.getDate().toString();	
	
		return yyyy + (mm[1] ? '-'+mm : '-0'+mm[0]) + (dd[1] ? '-'+dd : '-0'+dd[0]);
	}
	
	function setPeriod(pdate){
		var dt = new Date().yyyymmdd();
		//dt = dt.getFullYear() + "-" + (dt.getMonth() + 1) + "-" + dt.getDate();
		var sdate = document.frm.sdate;
		var edate = document.frm.edate;
	
		sdate.value= pdate;
		edate.value = dt;
	}
	
	function clearPeriod(){
		
		var sdate = document.frm.sdate;
		var edate = document.frm.edate;
	
		sdate.value = "";
		edate.value = "";
	}
	
	function search(){
		document.frm.submit();		
	}
	</script>

<div id="location">HOME > 고객센터 관리 > 자주 묻는 질문 관리</div>
<div id="S_contents">
<h3>자주 묻는 질문  관리</h3>	 

<form name="frm" action="admin_questions.mysql" method="get">
<input type="hidden" name="cpage" value="1">

	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
	<tr>
		<th class="tdlast">키워드검색</th>
		<td class="tdlast">
			<select name="searchopt" class="select w80">
			<option value="subject" >제목</option>
			<option value="content" >내용</option>
			</select>
			<input type="text" name="searchkey" value="" class="input w300">
		</td>
	</tr>
	</table>
	<div class="top15 center"><button type="button" onClick='search()' class="b h28 t5 color blue_big">검색하기</button></div>
</form>

	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="top5">
        <tr>
          <td>게시글수 : <b><%=totalRecord %></b></td>
        </tr>
      </table> 
      
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list">
      	<thead> 
        <tr>
			<td width="40"><form style='margin:0;'><input type='checkbox' name='select_tmp' onClick='selectReverseBbs(this.form)'></form></td>
			<td width="5%">번호</td>
			<td>제목</td>
			<td width="10%">작성자</td>
			<td width="12%">작성일</td>
			<td width="50">수정</td>
			<td width="50">삭제</td>
        </tr>
		</thead>     
		<tbody>
			<%=sbHTML %>
		</tbody>
      </table>
			<div class="bbs_button top10">
				<div class="bbs_btn_left">
					<button type='button' class='h22 t4 small icon gray' name='select_tmp' onClick='selectAllBbs();'><span class='icon_check'></span>전체선택</button>
					<button type='button' class='h22 t4 small icon gray' name='select_tmp' onClick='selectCancelBbs();'><span class='icon_minus'></span>전체해제</button>
					<button type='button' class='h22 t4 small icon gray' onClick="delBbsNewBbs('admin_questions_multidelete.mysql', '<%=cpage%>');"><span class='icon_x'></span>선택삭제</button>
				</div>
				<div class="bbs_btn_right">
		    		<button type="button" class="h22 t4 small icon gray" onClick='questions_write();'><span class='icon_check'></span>쓰기</button>
		    	</div>
			</div>      
			<div class="top5">
						
				<table width='100%' border='0' cellspacing='0' cellpadding='0'>
					<tr>
						<td align='center'>
							<table border='0' cellspacing='0' cellpadding='0'>
								<tr>
									<%
										
										if(endBlock >= totalPage){
											endBlock = totalPage;
										}
									
										if( cpage <= blockPerPage ){											
											out.println("<td width='22' height='50'>");
											/* out.println("<a href='admin_questions.mysql?cpage=1'>");
											out.println("<img src='./resources/assets/img/admin/btn_prev2.gif' align='absmiddle' border=0'>");
											out.println("</a>"); */
											out.println("</td>");
										} else{											
											out.println("<td width='22' height='50'>");
											out.println("<a href='admin_questions.mysql?cpage="+(cpage-5)+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_prev2.gif' align='absmiddle' border=0'>");
											out.println("</a>");
											out.println("</td>");
										}
									
										if( cpage == 1 ){																			
											out.println("<td width='22'>");
											/* out.println("<a href='admin_questions.mysql?cpage=1'>");
											out.println("<img src='./resources/assets/img/admin/btn_prev.gif' align='absmiddle' border=0'>");
											out.println("</a>"); */
											out.println("</td>");
										} else{											
											out.println("<td width='22'>");
											out.println("<a href='admin_questions.mysql?cpage="+(cpage-1)+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_prev.gif' align='absmiddle' border=0'>");
											out.println("</a>");
											out.println("</td>");										
										}
										
										out.println("<td align='center'>");
										
										for(int i=startBlock; i<=endBlock; i++){
											if( cpage == i ){
												//out.println("<b>["+i+"]</b>");
												out.println("<a href='admin_questions.mysql?cpage=" + i + "'> [" + i + "] </a>");
											}else{
												out.println("<a href='admin_questions.mysql?cpage=" + i + "'>" + i + "</a>");
											}
										}
										
										out.println( "</td>" );
																				
										if( cpage == totalPage ){										
											out.println("<td width='22' align='right'>");
											/* out.println("<a href='admin_questions.mysql?cpage="+totalPage+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_next.gif' align='absmiddle' border='0'>");
											out.println("</a>"); */
											out.println("</td>");
										} else{
											out.println("<td width='22' align='right'>");
											out.println("<a href='admin_questions.mysql?cpage="+(cpage+1)+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_next.gif' align='absmiddle' border='0'>");
											out.println("</a>");
											out.println("</td>");
										}
										
										if( cpage/blockPerPage >= 0 ){											
											out.println("<td width='22' align='right'>");
											/* out.println("<a href='admin_questions.mysql?cpage="+totalPage+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_next2.gif' align='absmiddle' border='0'>");
											out.println("</a>"); */
											out.println("</td>");
										} else{
											out.println("<td width='22' align='right'>");
											out.println("<a href='admin_questions.mysql?cpage="+(startBlock+blockPerPage)+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_next2.gif' align='absmiddle' border='0'>");
											out.println("</a>");
											out.println("</td>");
										}
									%>
								</tr>
							</table>
						</td>
					</tr>
				</table>		
			</div>
		</div>
	</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

<div id="Footer">www.DogCatLife.com</div>

</body>
</html>