<%@page import="TOs.BoardTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int flag = (Integer) request.getAttribute("flag");
	BoardTO boardTO = (BoardTO) request.getAttribute("boardTO");

	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("location.href='./album_board_view.mysql?pseq=" + boardTO.getPseq() + "&cpage=" + boardTO.getCpage() + "&seq=" + boardTO.getSeq() + "'");
		out.println("alert('삭제되었습니다.')");
	} else {
		out.println("history.back();");
		out.println("alert('삭제에 실패하였습니다.');");
	}
	out.println("</script>");
%>