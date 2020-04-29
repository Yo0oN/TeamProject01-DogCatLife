<%@page import="TOs.BoardListsTO"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="TOs.UserTO"%>
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
	
	BoardListsTO userListsTO = (BoardListsTO)request.getAttribute("userListsTO");
	ArrayList<UserTO> userLists = userListsTO.getUserLists();
	// 현재페이지
	int cpage = userListsTO.getCpage();
	// 한 페이지당 출력 데이터 개수
	int recordPerPage = userListsTO.getRecordPerPage();
	// 전체 데이터(글) 개수
	int totalRecord = userLists.size();
	// 전체 페이지 개수 = 마지막 페이지
	int totalPage = ( ( (totalRecord - 1) / recordPerPage ) + 1 );
	// 페이지번호가 몇개씩 보이게 할지 설정
	int blockPerPage = userListsTO.getBlockPerPage();
	// 보이는 페이지 번호의 시작부분이다.
	int startBlock = ((cpage - 1) / blockPerPage) * blockPerPage + 1;
	// 보이는 페이지 번호의 끝부분이다.
	int endBlock = ((cpage - 1) / blockPerPage) * blockPerPage + blockPerPage;
	if (endBlock >= totalPage) {
		endBlock = totalPage;
	}
	
	//검색관련 변수
	String sdate = request.getParameter("sdate");
	String edate = request.getParameter("edate");
	String searchopt= request.getParameter("searchopt");
	String searchkey= request.getParameter("searchkey");	
	
	StringBuffer sbHTML = new StringBuffer();
	if (userLists.size() == 0) {
		sbHTML.append("<td align=\"center\">가입된 회원이 없습니다.</td>");
	} else {
		if( totalRecord < recordPerPage){
			recordPerPage = totalRecord;
		}
		if( (cpage==totalPage) && ( (totalRecord%10) > 0) ){
			recordPerPage = totalRecord%10;
		}
		for (int i = 0; i < userLists.size(); i++) {
			UserTO userTO = userLists.get(i);
			if( cpage != 1 ){	
				userTO = userLists.get(i+((cpage-1)*10));
			}
			
			String mseq = userTO.getMseq();
			String id = userTO.getId();
			String nickname = userTO.getNickname();
			String name = userTO.getName();
			String phone = userTO.getPhone();
			String email = userTO.getEmail();
			String joindate = userTO.getJoindate();		
	
			sbHTML.append("");
			sbHTML.append("<tr>");
			sbHTML.append("<td align=\"center\"><form style='margin:0;'><input type='hidden' name='idx' value='5318'><input type='checkbox' name='select_checkbox'></form></td>");
			sbHTML.append("<td height=\"30\" align=\"center\">"+mseq+"</td>");  
			sbHTML.append("<td style=\"text-align:center;\"><a href=\"javascript:bbsView('5318', 'notice');\" style=\"cursor:point\" > "+ id +" </a></td>");
			sbHTML.append("<td align=\"center\">" + nickname + "</td>");
			sbHTML.append("<td align=\"center\">" + name + "</td>");
			sbHTML.append("<td align=\"center\">" + phone + "</td>");
			sbHTML.append("<td align=\"center\">"+email+"</td>");
			sbHTML.append("<td align=\"center\">" + joindate + "</td>");  
			sbHTML.append("<td align=\"center\">");
			sbHTML.append("<button type=\"button\" class=\"h18 t3 color small round red_s\" onClick=\"deleteBbs('"+mseq+"');\">삭제</button>");
			sbHTML.append("</td>");
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
		
<h2><img src="./resources/assets/img/admin/header/icon3.png" alt=""> 계정 관리</h2>
	<ul id="Lnb">
		<li class="on"><a href="./admin_user.mysql?cpage=1&sdate=&edate=&searchopt=&searchkey=" onFocus="this.blur();">계정 관리</a>
			<ul>
				<li>
					<a href="./admin_user.mysql?cpage=1&sdate=&edate=&searchopt=&searchkey=">회원 통합관리</a>
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
	
	function deleteBbs(mseq){
		if(confirm('선택한 게시글을 삭제하시겠습니까?\n\n삭제한 데이타는 복구할수 없습니다.')){
			//document.location = './admin_contents_delete.mysql';
			document.location = './admin_users_delete.mysql?cpage=<%=cpage%>&mseq='+mseq
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
			alert('가입일은 다시 설정하여 주십시오.');
		}else{
			document.frm.submit();
			//alert('성공');
		}
		
	}
	</script>

<div id="location">HOME > 계정관리 > 회원 통합관리</div>
<div id="S_contents">
<h3>회원  통합관리</h3>	 

<form name="frm" action="admin_user.mysql" method="get">
<input type="hidden" name="cpage" value="1">

	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
	<tr>
		<th width="15%">등록일</th>
		<td width="85%">
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
		<th class="tdlast">회원 검색</th>
		<td class="tdlast">
			<select name="searchopt" class="select w80">			
			<option value="id" >아이디</option>
			<option value="name" >이름</option>
			</select>
			<input type="text" name="searchkey" value="" class="input w300">
		</td>
	</tr>
	</table>
	<div class="top15 center"><button type="button" onClick='search()' class="b h28 t5 color blue_big">검색하기</button></div>
</form>

	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="top5">
        <tr>
          <td>회원수 : <b><%=totalRecord %></b></td>
        </tr>
      </table> 
      
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list">
      	<thead> 
        <tr>
			<td width="40"><form style='margin:0;'><input type='checkbox' name='select_tmp' onClick='selectReverseBbs(this.form)'></form></td>
			<td width="5%">회원번호</td>
			<td>아이디</td>
			<td>닉네임</td>
			<td width="10%">이름</td>
			<td width="10%">번호</td>
			<td width="10%">이메일</td>
			<td>가입일</td>
			<td width="10%">비고</td>
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
				<button type='button' class='h22 t4 small icon gray' onClick="delBbsNewBbs('admin_user_multidelete.mysql', <%=cpage%>);"><span class='icon_x'></span>선택삭제</button>		    </div>
			<!-- <div class="bbs_btn_right">
		    	<button type="button" class="h22 t4 small icon gray" onClick="excelDown();"><span class="icon_exel"></span>엑셀 다운로드</button>
		    </div> -->
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
											/* out.println("<a href='admin_user.mysql?cpage=1'>");
											out.println("<img src='./resources/assets/img/admin/btn_prev2.gif' align='absmiddle' border=0'>");
											out.println("</a>"); */
											out.println("</td>");
										} else{											
											out.println("<td width='22' height='50'>");
											out.println("<a href='admin_user.mysql?cpage="+(cpage-5)+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_prev2.gif' align='absmiddle' border=0'>");
											out.println("</a>");
											out.println("</td>");
										}
									
										if( cpage == 1 ){																			
											out.println("<td width='22'>");
											/* out.println("<a href='admin_user.mysql?cpage=1'>");
											out.println("<img src='./resources/assets/img/admin/btn_prev.gif' align='absmiddle' border=0'>");
											out.println("</a>"); */
											out.println("</td>");
										} else{											
											out.println("<td width='22'>");
											out.println("<a href='admin_user.mysql?cpage="+(cpage-1)+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_prev.gif' align='absmiddle' border=0'>");
											out.println("</a>");
											out.println("</td>");										
										}
										
										out.println("<td align='center'>");
										
										for(int i=startBlock; i<=endBlock; i++){
											if( cpage == i ){
												//out.println("<b>["+i+"]</b>");
												out.println("<a href='admin_user.mysql?cpage=" + i + "&sdate="+sdate
														+"&edate="+edate+"&searchopt="+searchopt+"&searchkey="+searchkey+"'> [" + i + "] </a>");
											}else{
												out.println("<a href='admin_user.mysql?cpage=" + i + "'>" + i + "</a>");
											}
										}
										
										out.println( "</td>" );
																				
										if( cpage == totalPage ){										
											out.println("<td width='22' align='right'>");
											/* out.println("<a href='admin_user.mysql?cpage="+totalPage+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_next.gif' align='absmiddle' border='0'>");
											out.println("</a>"); */
											out.println("</td>");
										} else{
											out.println("<td width='22' align='right'>");
											out.println("<a href='admin_user.mysql?cpage="+(cpage+1)+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_next.gif' align='absmiddle' border='0'>");
											out.println("</a>");
											out.println("</td>");
										}
										
										if( cpage/blockPerPage >= 0 ){											
											out.println("<td width='22' align='right'>");
											/* out.println("<a href='admin_user.mysql?cpage="+totalPage+"'>");
											out.println("<img src='./resources/assets/img/admin/btn_next2.gif' align='absmiddle' border='0'>");
											out.println("</a>"); */
											out.println("</td>");
										} else{
											out.println("<td width='22' align='right'>");
											out.println("<a href='admin_user.mysql?cpage="+(startBlock+blockPerPage)+"'>");
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