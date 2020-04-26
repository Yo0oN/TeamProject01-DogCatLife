<%@page import="TOs.UserTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	out.println("<script type='text/javascript'>");
		session.removeAttribute("sess_mseq");
		session.removeAttribute("sess_nickname");

		out.println("alert('로그아웃 되었습니다.');");

		if (session.getAttribute("endUrl") != null) {
			String endUrl = session.getAttribute("endUrl").toString();
			response.sendRedirect(endUrl);
		} else {
			out.println("location.href='./main.mysql'");
		}
	out.println("</script>");
%>