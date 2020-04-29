<%@page import="TOs.QuestionsTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	ArrayList<QuestionsTO> qLists = (ArrayList) request.getAttribute("qLists");
	String cpage = (String) request.getAttribute("cpage");
	String path = "./resources/upload/";
	
		// 본문 설정
		String qseq = qLists.get(0).getQseq();
		String seq = qLists.get(0).getSeq();
		String subject = qLists.get(0).getSubject();
		String content = qLists.get(0).getContent().replaceAll("\n", "<br>");
		String kinds = qLists.get(0).getKinds();
		String filename = "";
		String filenameA = "";
		if (!qLists.get(0).getFilename().equals("")) {
			filename = path + qLists.get(0).getFilename();
			filenameA = qLists.get(0).getFilename();
		}
		String wdate = qLists.get(0).getWdate();		
		
		StringBuffer sbHTML = new StringBuffer();
		
	if (qLists == null || qLists.size() == 0) {
		out.println("<script type='text/javascript'>");
		out.println("alert('존재하지 않는 게시물입니다.')");
		out.println("history.back();");
		out.println("</script>");
	} else {
		
		//게시글 append
		sbHTML.append("<tr>");
		sbHTML.append("<th colspan=\"2\">["+kinds+"]"+subject+"</th>");
		sbHTML.append("</tr>");
		sbHTML.append("<tr>");
		sbHTML.append("<td height=\"40\">작성자 : 관리자   작성일 : "+wdate+"</td>");
		sbHTML.append("<td align=\"right\"><!--추천:0--></td>");
		sbHTML.append("</tr>");
		sbHTML.append("<tr><td colspan=\"2\" height=\"40\">파일첨부 : "+filenameA+" </td></tr>");
		
		sbHTML.append("<tr><td colspan=\"2\" style=\"padding:20px 0;\">");
		if(!filename.equals("")){
			
			sbHTML.append("<p style=\"text-align: center;\">&nbsp;</p>");
			sbHTML.append("<p style=\"text-align: center;\">");
			sbHTML.append("<span style=\"font-size: 16px;\">");
			sbHTML.append("<img height=\"50%\" src=\""+filename+"\" width=\"50%\" />");
			sbHTML.append("</span>");
			sbHTML.append("</p>");
			sbHTML.append("<p style=\"text-align: center;\">&nbsp;</p>");					
			
		}
		sbHTML.append(content+"</td></tr>");
		sbHTML.append("<table>");
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
	<h3 style="background: url(./resources/assets/img/admin/sub/h3.gif) left 6px no-repeat;line-height: 1.6;font-size: 16px;font-weight: bold;color: #2f2f2f;padding-left: 16px;  font-family:'돋움','Dotum',Helvetica;"><%=kinds %></h3>
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