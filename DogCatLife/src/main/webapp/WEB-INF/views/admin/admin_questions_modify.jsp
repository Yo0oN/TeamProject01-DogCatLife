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
	String content = qLists.get(0).getContent();
	String spseq = "";
	String filename = "";
	String filenameA = "";
	if (!qLists.get(0).getFilename().equals("")) {
		filename = path + qLists.get(0).getFilename();
		filenameA = qLists.get(0).getFilename();
	}
	String wdate = qLists.get(0).getWdate();

	StringBuffer sbHTML = new StringBuffer();
	
	//게시글 append
	/* sbHTML.append("<tr>");
	sbHTML.append("<th colspan=\"2\">"+subject+"</th>");
	sbHTML.append("</tr>");
	sbHTML.append("<tr>");
	sbHTML.append("<td height=\"40\">작성자 : "+writer+" 작성일 : "+wdate_ori+" 조회수 : "+hit+"</td>");
	sbHTML.append("<td align=\"right\"><!--추천:0--></td>");
	sbHTML.append("</tr>");
	sbHTML.append("<tr><td colspan=\"2\" height=\"40\">파일첨부 : "+filename_new+" </td></tr>");
	sbHTML.append("<tr><td colspan=\"2\" style=\"padding:20px 0;\"><input type=\"textArea\" value=\""+content+"\"/>&nbsp;&nbsp;&nbsp;&nbsp;   </textArea></td></tr>");
	*/
	
	//sbHTML.append("<table>");
	//sbHTML.append("");
	
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
			<form id="frm" action="admin_questions_modify_ok.mysql" method="post" enctype="multipart/form-data">
			<input type="hidden" name="seq" value="<%=seq %>"/>
			<input type="hidden" name="qseq" value="<%=qseq %>"/>
			<input type="hidden" name="wdate" value="<%=wdate %>"/>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="AWbbs_view_table border">
					<tr> <td height="25">제목   :  <input type="text" name="subject" value="<%=subject%>" style="width:650px;"/></td></tr>
					<tr> 					
						<td height="40">
							작성자 : 관리자&nbsp;&nbsp;&nbsp;
							작성일 : <%=wdate %>&nbsp;&nbsp;&nbsp;				
						</td>										
					</tr>
					<tr> 
						<td colspan="2" height="40">
						파일첨부 :&nbsp;&nbsp;&nbsp;<%=filenameA %>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="file" name="upload" value="" align="right" style="width:300px;" class="board_write_input" />
						</td>
					 </tr>
					<tr>
						<td colspan="2" style="padding:20px 0;">
					<% 
						if(!filename.equals("")){
					%>
						<p style="text-align: center;">&nbsp;</p>
						<p style="text-align: center;">
							<span style="font-size: 16px;">
								<img height="50%" src="<%=filename %>" width="50%" />
							</span>
						</p>
						<br/><br/><br/>
							
						<p style="text-align: center;">&nbsp;</p>							
						
					<%
						}
					%>
					<textArea style="widrh:300px;" name="content" cols="115" rows="10" ><%=content %></textArea></td></tr>
				</table>
				<div class="bbs_button top10">
					<div class="bbs_btn_right">
				    		<button type="submit"  class="h22 t4 small icon gray"><span class='icon_check'></span>수정</button>
				    </div>
				</div>
				</form>
					
			</td>
		</tr>
	</table>

</body>
</html>