<%@page import="TOs.BoardTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int flag = (Integer) request.getAttribute("flag");
	BoardTO boardTO = (BoardTO) request.getAttribute("boardTO");
	System.out.println(boardTO.getPseq());
	System.out.println(boardTO.getCpage());
	System.out.println(boardTO.getSeq());

	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("location.href='./com_board_view.mysql?pseq=" + boardTO.getPseq() + "&cpage=" + boardTO.getCpage() + "&seq=" + boardTO.getSeq() + "'");
		out.println("alert('댓글이 수정되었습니다.')");
	} else {
		out.println("history.back();");
		out.println("alert('수정에 실패하였습니다.');");
	}
	out.println("</script>");
%>