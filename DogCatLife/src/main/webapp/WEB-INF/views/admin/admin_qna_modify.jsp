<%@page import="TOs.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	ArrayList<BoardTO> qLists = (ArrayList) request.getAttribute("qLists");
	String path = "./resources/upload/";
	// 본문 설정
	String aseq = qLists.get(0).getMseq();
	String seq = qLists.get(0).getSeq();
	String subject = qLists.get(0).getSubject();
	String content = qLists.get(0).getContent();
	String spseq = "";
	String filename_new = "";
	String filenameA = "";
	
	if (!qLists.get(0).getFilename_new().equals("")) {
		filename_new = path+qLists.get(0).getFilename_new();
		filenameA = qLists.get(0).getFilename_new();
	}
	String wdate_ori = qLists.get(0).getWdate_ori();
	String wdate_mod = qLists.get(0).getWdate_mod();	
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
			<form id="frm" action="admin_qna_modify_ok.mysql" method="post" enctype="multipart/form-data">
			<input type="hidden" name="seq" value="<%=seq %>"/>
			<input type="hidden" name="aseq" value="<%=aseq %>"/>
			<input type="hidden" name="wdate_ori" value="<%=wdate_ori %>"/>
			<input type="hidden" name="wdate_mod" value="<%=wdate_mod %>"/>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="AWbbs_view_table border">
					<tr> <td height="25">제목   :  <input type="text" name="subject" value="<%=subject%>" style="width:650px;"/></td></tr>
					<tr> 
					<%if(wdate_ori.equals(wdate_mod)) {%>
						<td height="40">
							작성자 : 관리자&nbsp;&nbsp;&nbsp;
							작성일 : <%=wdate_ori %>&nbsp;&nbsp;&nbsp;
							
						</td>						
					<%}else{ %>
						<td height="40">
							작성자 : &nbsp;&nbsp;&nbsp;
							작성일 : <%=wdate_ori %>&nbsp;&nbsp;&nbsp;
							최근 수정일 : <%=wdate_mod %>&nbsp;&nbsp;&nbsp;
							
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
				</form>
					
			</td>
		</tr>
	</table>

</body>
</html>