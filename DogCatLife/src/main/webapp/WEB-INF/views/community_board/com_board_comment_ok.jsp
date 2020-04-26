<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute("flag");
	String pseq = (String) request.getAttribute("pseq");
	String cpage = (String) request.getAttribute("cpage");
	String seq = (String) request.getAttribute("seq");

	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println(
				"location.href='./com_board_view.mysql?pseq=" + pseq + "&cpage=" + cpage + "&seq=" + seq + "'");
		out.println("alert('댓글을 달았습니다.')");
	} else {
		out.println("history.back();");
		out.println("alert('댓글 달기에 실패하였습니다.');");
	}
	out.println("</script>");
%>