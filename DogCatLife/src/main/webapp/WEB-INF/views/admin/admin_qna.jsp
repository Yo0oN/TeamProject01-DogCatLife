<%@page import="TOs.PersonalQTO"%>
<%@page import="TOs.BoardListsTO"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="TOs.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
	//날짜 세팅
	Calendar cal = new GregorianCalendar();
	String today =null;
	String yesterday =null;
	String oneWeeksAgo =null;
	String oneMonthsAgo = null;
	//오늘
	if((cal.get(Calendar.MONTH)+1)<10){
		today = cal.get(Calendar.YEAR)+"-0"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
		
	}else{
		today = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
		
	}
	
	//하루전 세팅
	cal.add(Calendar.DAY_OF_MONTH,-1);
	if((cal.get(Calendar.MONTH)+1)<10){
		yesterday = cal.get(Calendar.YEAR)+"-0"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
		
	}else{
		yesterday = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
		
	}
	
	//일주일전 세팅
	cal.add(Calendar.DAY_OF_MONTH,-6);
	if((cal.get(Calendar.MONTH)+1)<10){
		oneWeeksAgo = cal.get(Calendar.YEAR)+"-0"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
		
	}else{
		oneWeeksAgo = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
		
	}
	
	//한달전 세팅
	cal.add(Calendar.MONTH,-1);
	cal.add(Calendar.DAY_OF_MONTH,+7);
	if((cal.get(Calendar.MONTH)+1)<10){
		oneMonthsAgo = cal.get(Calendar.YEAR)+"-0"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
		
	}else{
		oneMonthsAgo = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DAY_OF_MONTH);
		
	}
	
	//페이징
	BoardListsTO qnaListsTO = (BoardListsTO)request.getAttribute("qnaListsTO");
	ArrayList<BoardTO> qnaLists = qnaListsTO.getQnaLists();
	// 현재페이지
	//int cpage = Integer.valueOf(request.getParameter("cpage"));
	int cpage = qnaListsTO.getCpage();
	// 한 페이지당 출력 데이터 개수
	int recordPerPage = qnaListsTO.getRecordPerPage();	
	// 전체 데이터(글) 개수
	int totalRecord = qnaLists.size();
	// 전체 페이지 개수 = 마지막 페이지
	int totalPage = ( ( (totalRecord - 1) / recordPerPage ) + 1 );
	// 페이지번호가 몇개씩 보이게 할지 설정
	int blockPerPage = qnaListsTO.getBlockPerPage();
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
	
	if (qnaLists.size() == 0) {
			sbHTML.append("<td></td>");
			sbHTML.append("<td></td>");
			sbHTML.append("<td align=\"center\">등록 된 게시글이 없습니다.</td>");
			sbHTML.append("<td></td>");
			sbHTML.append("<td></td>");
			sbHTML.append("<td></td>");
	}else {
		if( totalRecord < recordPerPage){
			recordPerPage = totalRecord;
		}
		if( (cpage==totalPage) && ( (totalRecord%10) > 0) ){
			recordPerPage = totalRecord%10;
		}
		for ( int i=0; i < recordPerPage; i++) {
				
			BoardTO qnaTO = qnaLists.get(i);
			if( cpage != 1 ){	
				qnaTO = qnaLists.get(i+((cpage-1)*10));
			}
				
			seq = qnaTO.getSeq();
			String subject = qnaTO.getSubject();
			//aseq 를 mseq에
			String aseq = qnaTO.getMseq();
			String wdate_ori = qnaTO.getWdate_ori();
			String kind = "";
			String num = "";
			if(aseq.equals("")){
				kind="    [질문]";
				num = seq;				
			}else{
				kind="    [답변] ㄴ";
				num="답변"+aseq;
			}
			
			//sbHTML.append("");
			sbHTML.append("<tr>");
			if(aseq.equals("")){
				sbHTML.append("<td align=\"center\"><form style='margin:0;'><input type='hidden' name='idx' value='"+seq+"'><input type='checkbox' name='select_checkbox'></form></td>");
			}else{
				sbHTML.append("<td align=\"center\"><form style='margin:0;'><input type='hidden' name='idx' value='"+aseq+"'><input type='checkbox' name='select_checkbox'></form></td>");
			}
			sbHTML.append("<td width=\"5%\">"+num+"</td>");
			
			
			if(aseq.equals("")){
				sbHTML.append("<td style=\"text-align:left;\"><a href=\"javascript:bbsView('"+seq+"');\" style=\"cursor:point\" ><b>"+kind+"</b>"+ subject +"</a></td>");
				sbHTML.append("<td align=\"center\">"+wdate_ori+"</td>");
				sbHTML.append("<td align=\"center\"><a onclick=\"bbsReply('"+seq+"');\"><button type=\"button\" class=\"h18 t3 color small round black_s\">답변</button></a></td>");
				sbHTML.append("<td align=\"center\"><button type=\"button\" class=\"h18 t3 color small round red_s\" onClick=\"deleteQnA("+seq+");\">삭제</button></td>");
			}else{
				sbHTML.append("<td style=\"text-align:left;\"><a href=\"javascript:bbsView('"+aseq+"');\" style=\"cursor:point\" ><b>"+kind+"</b>"+ subject +"</a></td>");
				sbHTML.append("<td align=\"center\">"+wdate_ori+"</td>");
				sbHTML.append("<td align=\"center\"><a onclick=\"bbsModify('"+aseq+"');\"><button type=\"button\" class=\"h18 t3 color small round black_s\">수정</button></a></td>");
				sbHTML.append("<td align=\"center\"><button type=\"button\" class=\"h18 t3 color small round red_s\" onClick=\"deleteQnA("+aseq+");\">삭제</button></td>");
			}	
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
	
	//답변
	function bbsReply(seq) {
		window.open("admin_qna_reply.mysql?cpage=1&seq=" + seq, "getBbs1", "width=800,height=850,resizable=no,scrollbars=yes, left=50, top=50");				
	}
	//답변수정
	function bbsModify(aseq) {
		window.open("admin_qna_modify.mysql?cpage=1&aseq=" + aseq, "getBbs1", "width=800,height=850,resizable=no,scrollbars=yes, left=50, top=50");				
	}
	
	function bbsView(seq) {
		window.open("admin_qna_view.mysql?cpage=1&seq=" + seq, "getBbs1", "width=800,height=850,resizable=no,scrollbars=yes, left=50, top=50");				
	}
	
	function deleteQnA(seq){
		if(confirm('선택한 게시글을 삭제하시겠습니까?\n\n삭제한 데이타는 복구할수 없습니다.')){
			
			document.location = './admin_qna_delete.mysql?cpage=<%=cpage%>&seq='+seq;
		}
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
		if( ( (document.frm.sdate.value !="") && (document.frm.edate.value =="") )
				||
				( (document.frm.sdate.value =="") && (document.frm.edate.value !="") ) ){
			alert('등록일은 다시 설정하여 주십시오.')
		}else{
			document.frm.submit();
		}
		
	}
	</script>

<div id="location">HOME > 고객센터 관리 > 1:1 문의</div>
<div id="S_contents">
<h3>1:1 문의</h3>	 

<form name="frm" action="admin_qna.mysql" method="get">
<input type="hidden" name="cpage" value="1">

	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
	<tr>
		<th width="15%">종류별 보기</th>
		<td width="85%">
			<select name="codeopt" onchange="">
			<!-- <select name="codeopt" onchange="this.form.submit();"> -->
				<option value="flag">&nbsp;&nbsp;전체&nbsp;&nbsp;</option>
				<option value="q">&nbsp;&nbsp;질문&nbsp;&nbsp;</option>
				<option value="a">&nbsp;&nbsp;답변&nbsp;&nbsp;</option>				
			</select>
		</td>
	</tr>
	<tr>		
		<th>등록일</th>
		<td>
			<input class="input w100" type="text" id="datepicker1" name="sdate" value="" >
			<input type="button" class="btn_calendar" id=""/> ~
			<input class="input w100" type="text" id="datepicker2" name="edate" value="" >
			<input type="button" class="btn_calendar" id=""/>
		    <button type="button" class="h22 small t3 gray_s" onclick="setPeriod('<%=today%>')">오늘</button>
		    <button type="button" class="h22 small t3 gray_s" onclick="setPeriod('<%=yesterday%>')">어제</button>
		    <button type="button" class="h22 small t3 gray_s" onclick="setPeriod('<%=oneWeeksAgo%>')">1주일</button>
		    <button type="button" class="h22 small t3 gray_s" onclick="setPeriod('<%=oneMonthsAgo%>')">1개월</button>
		    <button type="button" class="h22 small t3 gray_s" onclick="clearPeriod()">초기화</button>
		</td>
	</tr>
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
			<td width="60%">글제목</td>
			<!-- <td width="10%">작성자</td> -->
			<td width="12%">작성일</td>
			<!-- <td width="5%">조회수</td> -->
			<td width="50">수정/답글</td>
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
					<button type='button' class='h22 t4 small icon gray' onClick="delBbsNewBbs('admin_qna_multidelete.mysql', '<%=cpage %>');"><span class='icon_x'></span>선택삭제</button>
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
											/* out.println("<a href='admin_an.mysql?cpage=1'>");
											out.println("<img src='./resources/assets/img/admin/btn_prev2.gif' align='absmiddle' border=0'>");
											out.println("</a>"); */
											out.println("</td>");
										} else{											
											out.println("<td width='22' height='50'>");
											out.println("<a href='admin_an.mysql?cpage="+(cpage-5)+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_prev2.gif' align='absmiddle' border=0'>");
											out.println("</a>");
											out.println("</td>");
										}
									
										if( cpage == 1 ){																			
											out.println("<td width='22'>");
											/* out.println("<a href='admin_an.mysql?cpage=1'>");
											out.println("<img src='./resources/assets/img/admin/btn_prev.gif' align='absmiddle' border=0'>");
											out.println("</a>"); */
											out.println("</td>");
										} else{											
											out.println("<td width='22'>");
											out.println("<a href='admin_an.mysql?cpage="+(cpage-1)+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_prev.gif' align='absmiddle' border=0'>");
											out.println("</a>");
											out.println("</td>");										
										}
										
										out.println("<td align='center'>");
										
										for(int i=startBlock; i<=endBlock; i++){
											if( cpage == i ){
												//out.println("<b>["+i+"]</b>");
												out.println("<a href='admin_an.mysql?cpage=" + i + "'> [" + i + "] </a>");
											}else{
												out.println("<a href='admin_an.mysql?cpage=" + i + "'>" + i + "</a>");
											}
										}
										
										out.println( "</td>" );
																				
										if( cpage == totalPage ){										
											out.println("<td width='22' align='right'>");
											/* out.println("<a href='admin_an.mysql?cpage="+totalPage+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_next.gif' align='absmiddle' border='0'>");
											out.println("</a>"); */
											out.println("</td>");
										} else{
											out.println("<td width='22' align='right'>");
											out.println("<a href='admin_an.mysql?cpage="+(cpage+1)+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_next.gif' align='absmiddle' border='0'>");
											out.println("</a>");
											out.println("</td>");
										}
										
										if( cpage/blockPerPage >= 0 ){											
											out.println("<td width='22' align='right'>");
											/* out.println("<a href='admin_an.mysql?cpage="+totalPage+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_next2.gif' align='absmiddle' border='0'>");
											out.println("</a>"); */
											out.println("</td>");
										} else{
											out.println("<td width='22' align='right'>");
											out.println("<a href='admin_an.mysql?cpage="+(startBlock+blockPerPage)+"'>");
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