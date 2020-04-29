<%@page import="TOs.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	ArrayList<BoardTO> qLists = (ArrayList) request.getAttribute("qLists");
	String cpage = (String) request.getAttribute("cpage");
	String path = "./resources/upload/";
		// 본문 설정
		String aseq = qLists.get(0).getMseq();
		String seq = qLists.get(0).getSeq();
		String subject = qLists.get(0).getSubject();
		String mseq = qLists.get(0).getMseq();
		String writer = qLists.get(0).getWriter();
		//String content = qLists.get(0).getContent().replaceAll("\n", "<br>");
		String content = qLists.get(0).getContent();
		String hit = qLists.get(0).getHit();
		String filename_new = "";
		String filenameA = "";
		if (!qLists.get(0).getFilename_new().equals("")) {
			//filename_new = "./resources/upload/" + qLists.get(0).getFilename_new();
			filename_new = path+qLists.get(0).getFilename_new();
			filenameA = qLists.get(0).getFilename_new();
		}
		String wdate_ori = qLists.get(0).getWdate_ori();
		String wdate_mod = qLists.get(0).getWdate_mod();
		
		StringBuffer sbHTML = new StringBuffer();
		
	if (qLists == null || qLists.size() == 0) {
		out.println("<script type='text/javascript'>");
		out.println("alert('존재하지 않는 게시물입니다.')");
		out.println("history.back();");
		out.println("</script>");
	} else {		
		
		//게시글 append
		sbHTML.append("<tr>");
		sbHTML.append("<th colspan=\"2\">[답변]&nbsp;&nbsp;"+subject+"</th>");
		sbHTML.append("</tr>");
		sbHTML.append("<tr>");
		sbHTML.append("<td height=\"40\">작성자 : 관리자 작성일 : "+wdate_ori+"</td>");
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
	<h3 style="background: url(./resources/assets/img/admin/sub/h3.gif) left 6px no-repeat;line-height: 1.6;font-size: 16px;font-weight: bold;color: #2f2f2f;padding-left: 16px;  font-family:'돋움','Dotum',Helvetica;">1:1 문의</h3>
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
				</table>
			
			</td>
		</tr>
	</table>

</body>
</html>