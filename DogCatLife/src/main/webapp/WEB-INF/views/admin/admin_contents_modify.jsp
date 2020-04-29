<%@page import="TOs.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	ArrayList<BoardTO> modifyLists = (ArrayList) request.getAttribute("modifyLists");
	String cpage = (String) request.getAttribute("cpage");
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
	
	sbHTML.append("<table>"); 
	
	for (int i = 1; i < modifyLists.size(); i++) {
		cseq = modifyLists.get(i).getCseq();
		cmseq = modifyLists.get(i).getCmseq();
		cwriter = modifyLists.get(i).getCwriter();
		comment = modifyLists.get(i).getComment().replaceAll("\n", "<br>");
		cwdate_ori = modifyLists.get(i).getCwdate_ori();
		
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
			<form id="frm" action="admin_contents_modify_ok.mysql" method="post" enctype="multipart/form-data">
			<input type="hidden" name="seq" value="<%=seq %>"/>
			<input type="hidden" name="pseq" value="<%=pseq %>"/>
			<input type="hidden" name="wdate_ori" value="<%=wdate_ori %>"/>
			<input type="hidden" name="wdate_mod" value="<%=wdate_mod %>"/>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="AWbbs_view_table border">
					<tr> <td height="25">제목   :  <input type="text" name="subject" value="<%=subject%>" style="width:650px;"/></td></tr>
					<tr> 
					<%if(wdate_ori.equals(wdate_mod)) {%>
						<td height="40">
							작성자 : <%=writer %>&nbsp;&nbsp;&nbsp;
							작성일 : <%=wdate_ori %>&nbsp;&nbsp;&nbsp;
							조회수 : <%=hit %>
						</td>						
					<%}else{ %>
						<td height="40">
							작성자 : <%=writer %>&nbsp;&nbsp;&nbsp;
							작성일 : <%=wdate_ori %>&nbsp;&nbsp;&nbsp;
							최근 수정일 : <%=wdate_mod %>&nbsp;&nbsp;&nbsp;
							조회수 : <%=hit %>
						</td>
					<%} %>						
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
						if(!filename_new.equals("")){
					%>
						<p style="text-align: center;">&nbsp;</p>
						<p style="text-align: center;">
							<span style="font-size: 16px;">
								<img height="50%" src="<%=filename_new %>" width="50%" />
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
				<%=sbHTML %>
				</form>
					
			</td>
		</tr>
	</table>

</body>
</html>