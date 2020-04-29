<%@page import="TOs.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	ArrayList<BoardTO> viewLists = (ArrayList) request.getAttribute("viewLists");
	String cpage = (String) request.getAttribute("cpage");
	String path = "./resources/upload/";
	
		// 본문 설정
		String pseq = viewLists.get(0).getPseq();
		String seq = viewLists.get(0).getSeq();
		String subject = viewLists.get(0).getSubject();
		String mseq = viewLists.get(0).getMseq();
		String writer = viewLists.get(0).getWriter();
		String content = viewLists.get(0).getContent().replaceAll("\n", "<br>");
		String hit = viewLists.get(0).getHit();
		String spseq = "";
		String filename_new = "";
		String filenameA = "";
		if (!viewLists.get(0).getFilename_new().equals("")) {
			filename_new = path + viewLists.get(0).getFilename_new();
			filenameA = viewLists.get(0).getFilename_new();
		}
		String wdate_ori = viewLists.get(0).getWdate_ori();
		String wdate_mod = viewLists.get(0).getWdate_mod();
	
		// 댓글 설정
		String cseq = "";
		String cmseq = "";
		String cwriter = "";
		String comment = "";
		String cwdate_ori = "";
		String cmt = viewLists.size() - 1 + "";
		
		StringBuffer sbHTML = new StringBuffer();
		
	if (viewLists == null || viewLists.size() == 0) {
		out.println("<script type='text/javascript'>");
		out.println("alert('존재하지 않는 게시물입니다.')");
		out.println("history.back();");
		out.println("</script>");
	} else {		
		
		if( pseq.equals("11") ){
			spseq = "게시판";
		}else if( pseq.equals("12") ){
			spseq = "자랑하기";
		}else if( pseq.equals("21") ){
			spseq = "실종동물등록";
		}else if( pseq.equals("22") ){
			spseq = "재회성공사례";
		}else if( pseq.equals("31") ){
			spseq = "입양가능아이들";
		}else if( pseq.equals("32") ){
			spseq = "입양후기";
		}else if( pseq.equals("41") ){
			spseq = "공지사항";
		}
		
		//게시글 append
		sbHTML.append("<tr>");
		sbHTML.append("<th colspan=\"2\">["+spseq+"]"+subject+"</th>");
		sbHTML.append("</tr>");
		sbHTML.append("<tr>");
		sbHTML.append("<td height=\"40\">작성자 : "+writer+" 작성일 : "+wdate_ori+" 조회수 : "+hit+"</td>");
		sbHTML.append("<td align=\"right\"><!--추천:0--></td>");
		sbHTML.append("</tr>");
		sbHTML.append("<tr><td colspan=\"2\" height=\"40\">파일첨부 : "+filenameA+" </td></tr>");
		
		sbHTML.append("<tr><td colspan=\"2\" style=\"padding:20px 0;\">");
		if(!filename_new.equals("")){
			
			sbHTML.append("<p style=\"text-align: center;\">&nbsp;</p>");
			sbHTML.append("<p style=\"text-align: center;\">");
			sbHTML.append("<span style=\"font-size: 16px;\">");
			sbHTML.append("<img height=\"50%\" src=\""+filename_new+"\" width=\"50%\" />");
			sbHTML.append("</span>");
			sbHTML.append("</p>");
			sbHTML.append("<p style=\"text-align: center;\">&nbsp;</p>");					
			
		}
		sbHTML.append(content+"</td></tr>");
		sbHTML.append("<table>");
		
		for (int i = 1; i < viewLists.size(); i++) {
			cseq = viewLists.get(i).getCseq();
			cmseq = viewLists.get(i).getCmseq();
			cwriter = viewLists.get(i).getCwriter();
			comment = viewLists.get(i).getComment().replaceAll("\n", "<br>");
			cwdate_ori = viewLists.get(i).getCwdate_ori();
			
			//sbHTML.append("");
			
			sbHTML.append("<tr>");
			sbHTML.append("<td style='width:10%'>");
			sbHTML.append("<h4 class='mb-0'><i class='fa fa-comments'></i>&nbsp;&nbsp;&nbsp; " + cwriter + "</h4>");
			sbHTML.append("</td>");
			sbHTML.append("<td width=30% colspan=2>");
			sbHTML.append("&nbsp;" + comment + "&nbsp;");
			sbHTML.append("</td>");
			sbHTML.append("<td style='width:20%' >");
			sbHTML.append("<p class='date mb-0 pr-20' style='margin:0'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
							+ cwdate_ori + "</p>");
			sbHTML.append("</td>");
			/* sbHTML.append("<td><a class='comment_modify' cseq='" + cseq
					+ "' class='date ml-10' style='color:#635c5c;font-size:14px'>수정</a></td>");
			sbHTML.append(
					"<td style='color:#635c5c;font-size:14px'>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='./com_board_comment_delete_ok.mysql?pseq="
							+ pseq + "&cpage=" + cpage + "&seq=" + seq + "&cseq=" + cseq
							+ "' class='comment_delete' id='comment_delete_" + cseq
							+ "' class='date ml-10' style='color:#635c5c;font-size:14px'>삭제</a></td>"); */
			sbHTML.append("</tr>");		
		}
		sbHTML.append("</table>");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시글</title>
<link href="./resources/assets/css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<body>
	<h3 style="background: url(./resources/assets/img/admin/sub/h3.gif) left 6px no-repeat;line-height: 1.6;font-size: 16px;font-weight: bold;color: #2f2f2f;padding-left: 16px;  font-family:'돋움','Dotum',Helvetica;"><%=spseq %></h3>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="top15">
		<tr>
			<td style="padding:0px 10px 10px 10px">
				
				<script language="javascript">
<!--
function viewImg(img){
   var url = "/adm/bbs/view_img.php?code=notice&img=" + img;
   window.open(url, "viewImg", "height=100, width=100, menubar=no, scrollbars=no, resizable=yes, toolbar=no, status=no");
}
//-->
				</script>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="AWbbs_view_table border">
					<%=sbHTML %>
					<!-- <tr>
							<th colspan="2">공지사항 테스트 입니다.</th>
					</tr>
					<tr>
							<td height="40">작성자 : 홈페이지(test@test.com) 작성일 : 2019-03-08 조회수 : 55</td>
							<td align="right">추천:0</td>
					</tr>
				    
				        <tr>
				        <td colspan="2" height="40">파일첨부 :             </td>
				    </tr>
				    	<tr>
						<td colspan="2" style="padding:20px 0;">
				            			                        공지사항 테스트 입니다.		</td>
					</tr> -->
					
    
				</table>
				
				<!-- <table width="100%" border="0" cellpadding="0" cellspacing="0" class="AWbbs_view_table">      
    				<tr>
						<th width="15%">이전글</th>
        				<td>
        					<a href='/adm/manage/bbs/bbs.php?ptype=view&code=notice&idx=5251'>공지사항 테스트 입니다.</a>
        				</td>
    				</tr>          
    				<tr>
        				<th>다음글</th>
        				<td></td>
    				</tr>
				</table> -->

				<div style="margin:0 0 10px;"></div>
				<!-- <table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td align="right">
							&nbsp;&nbsp;
							<a href='/adm/manage/bbs/bbs.php?ptype=list&code=notice&idx=5250'>
								<image src='/adm/bbs/skin/bbsBasic/image/btn_list.gif' border='0'>
							</a>
							&nbsp;
							<a href='/adm/manage/bbs/bbs.php?ptype=input&mode=insert&code=notice&idx=5250'>
								<image src='/adm/bbs/skin/bbsBasic/image/btn_write.gif' border='0'>
							</a>
							&nbsp;
							<a href='/adm/manage/bbs/bbs.php?ptype=input&mode=modify&code=notice&idx=5250'>
								<image src='/adm/bbs/skin/bbsBasic/image/btn_modify.gif' border='0'>
							</a>
							&nbsp;
							<a href='/adm/manage/bbs/bbs.php?ptype=passwd&mode=delete&code=notice&idx=5250'>
								<image src='/adm/bbs/skin/bbsBasic/image/btn_delete.gif' border='0'>
							</a>
							&nbsp;
							<a href='/adm/manage/bbs/bbs.php?ptype=input&mode=reply&code=notice&idx=5250'>
								<image src='/adm/bbs/skin/bbsBasic/image/btn_reply.gif' border=0>
							</a>
							&nbsp;
						</td>
					</tr>
				</table> -->
			</td>
		</tr>
	</table>
</body>
</html>