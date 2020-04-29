<%@page import="TOs.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	ArrayList<BoardTO> modifyLists = (ArrayList) request.getAttribute("modifyLists");
	String ccseq = (String)request.getAttribute("ccseq");
	String path = "./resources/upload/";

	// 본문 설정
	String pseq = modifyLists.get(0).getPseq();
	String seq = modifyLists.get(0).getSeq();
	String subject = modifyLists.get(0).getSubject();
	String mseq = modifyLists.get(0).getMseq();
	String writer = modifyLists.get(0).getWriter();
	String content = modifyLists.get(0).getContent();
	String hit = modifyLists.get(0).getHit();
	String spseq = "";
	String filename_new = "";
	String filenameA = "";
	if (!modifyLists.get(0).getFilename_new().equals("")) {
		filename_new = path + modifyLists.get(0).getFilename_new();
		filenameA = modifyLists.get(0).getFilename_new();
	}
	String wdate_ori = modifyLists.get(0).getWdate_ori();
	String wdate_mod = modifyLists.get(0).getWdate_mod();

	// 댓글 설정
	String cseq = "";
	String cmseq = "";
	String cwriter = "";
	String comment = "";
	String cwdate_ori = "";
	String cwdate_mod = "";
	String cmt = modifyLists.size() - 1 + "";

	StringBuffer sbHTML = new StringBuffer();
	
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
	
	sbHTML.append("&nbsp;&nbsp;"+content+"</td></tr>");
	sbHTML.append("<table>");
	
	for (int i = 1; i < modifyLists.size(); i++) {
		cseq = modifyLists.get(i).getCseq();
		cmseq = modifyLists.get(i).getCmseq();
		cwriter = modifyLists.get(i).getCwriter();
		comment = modifyLists.get(i).getComment().trim().replaceAll("\n", "<br>");
		cwdate_ori = modifyLists.get(i).getCwdate_ori();
		cwdate_mod = modifyLists.get(i).getCwdate_mod();
		
		//sbHTML.append("");
		sbHTML.append("<tr>");
		sbHTML.append("<td style='width:10%'>");
		sbHTML.append("<h4 class='mb-0'><i class='fa fa-comments'></i>&nbsp;&nbsp;&nbsp; " + cwriter + "</h4>");
		sbHTML.append("</td>");
		
		if( cseq.equals(ccseq) ){
			sbHTML.append("<td width=30% colspan=2>");
			sbHTML.append("<textarea rows=\"3\" cols=\"60\" name=\"comment\" style=\"padding:2px 1px 1px 1px\">"+comment+"</textarea>");
			sbHTML.append("</td>");
			sbHTML.append("<td style='width:20%' >");
			sbHTML.append("<p class='date mb-0 pr-20' style='margin:0'>&nbsp;&nbsp;"+ cwdate_mod + "</p>");
			sbHTML.append("</td>");
			sbHTML.append("<td width=10% colspan=2>");
			sbHTML.append("<button type=\"submit\"  class=\"h22 t4 small icon gray\"><span class='icon_check'></span>수정</button>");
			sbHTML.append("</td>");
			
		}else{
			
			sbHTML.append("<td width=30% colspan=2>");
			sbHTML.append("&nbsp;" + comment + "&nbsp;");
			sbHTML.append("</td>");
			sbHTML.append("<td style='width:20%' >");
			sbHTML.append("<p class='date mb-0 pr-20' style='margin:0'>&nbsp;&nbsp;"
							+ cwdate_ori + "</p>");
			sbHTML.append("</td>");
			sbHTML.append("<td width=10% colspan=2></td>");
		}
		sbHTML.append("</tr>");
	}
	sbHTML.append("</table>");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시글</title>
<link href="./resources/assets/css/wiz_style.css" rel="stylesheet" type="text/css">
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
			<form id="frm" action="admin_comments_modify_ok.mysql" method="post" enctype="multipart/form-data">
			<input type="hidden" name="seq" value="<%=seq %>"/>
			<input type="hidden" name="cseq" value="<%=ccseq %>"/>
			<input type="hidden" name="cwdate_ori" value="<%=cwdate_ori %>"/>
			<input type="hidden" name="cwdate_mod" value="<%=cwdate_mod %>"/>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="AWbbs_view_table border">
					<%=sbHTML %>
				</table>
			</form>
				
			</td>
		</tr>
	</table>

</body>
</html>