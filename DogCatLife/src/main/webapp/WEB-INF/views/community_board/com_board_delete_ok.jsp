<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int flag = (Integer) request.getAttribute("flag");
	String pseq = (String) request.getAttribute("pseq");

	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("location.href='./com_board_list.mysql?pseq=" + pseq + "&cpage=1'");
		out.println("alert('삭제되었습니다.')");
	} else {
		out.println("history.back();");
		out.println("alert('삭제에 실패하였습니다.');");
	}
	out.println("</script>");
%>