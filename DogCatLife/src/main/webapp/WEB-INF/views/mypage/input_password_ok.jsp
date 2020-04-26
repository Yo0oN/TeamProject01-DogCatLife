<%@page import="TOs.UserTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int flag = (Integer) request.getAttribute("flag");

	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("location.href='./myinfo.mysql'");
	} else {
		out.println("history.back();");
		out.println("alert('비밀번호를 다시 확인해주세요.');");
	}
	out.println("</script>");
%>