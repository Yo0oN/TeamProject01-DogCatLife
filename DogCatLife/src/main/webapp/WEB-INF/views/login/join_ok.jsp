<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int flag = (Integer) request.getAttribute("flag");

	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('회원가입에 성공하였습니다.')");
		out.println("location.href='./login.mysql'");
	} else {
		out.println("alert('회원가입에 실패하였습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>