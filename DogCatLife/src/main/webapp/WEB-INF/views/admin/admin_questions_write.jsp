<%@page import="TOs.BoardTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String cpage = (String) request.getAttribute("cpage");
	String id = (String)session.getAttribute("id");
	
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
	<h3 style="background: url(./resources/assets/img/admin/sub/h3.gif) left 6px no-repeat;line-height: 1.6;font-size: 16px;font-weight: bold;color: #2f2f2f;padding-left: 16px;  font-family:'돋움','Dotum',Helvetica;"></h3>
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
				<form id="frm" action="admin_questions_write_ok.mysql" method="post" enctype="multipart/form-data">					
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="AWbbs_view_table border">
						<tr>
							<td colspan="2" style="height:25; padding:5px">제목   :  <input type="text" name="subject" value="" style="width:650px; height:25px;"/></td>
						</tr>
						<tr>
						<td colspan="2" class="tdlast">
						주제 : <select name="searchopt" class="select w80">								
							<option value="hompage" >홈페이지</option>
							<option value="join" >회원가입</option>
							</select>								
						</td>
						</tr>
						<tr> <td colspan="2" height="25"> 파일첨부 : <input type="file" name="upload" value="" align="right" style="width:300px;" class="board_write_input" />
							</td>
					 	</tr>
						<tr>
							<td colspan="2" style="padding:20px 0;">
								<textArea style="widrh:300px;" name="content" cols="115" rows="10" ></textArea>
							</td>
						</tr>
					</table>
				<div class="bbs_button top10">
					<div class="bbs_btn_right">
				    		<button type="submit"  class="h22 t4 small icon gray"><span class='icon_check'></span>쓰기</button>
				    </div>
				</div>
				</form>
			</td>
			
			<td width=30% colspan=2>
			&nbsp;&nbsp;
			</td>
			<td style='width:20%' >
				<p class='date mb-0 pr-20' style='margin:0'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
			</td>
		</tr>
	</table>
</body>
</html>