<%@page import="TOs.UserTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int flag = (Integer) request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		session.removeAttribute("sess_mseq");
		session.removeAttribute("sess_nickname");
		out.println("location.href='main.mysql';");
		out.println("alert('탈퇴되었습니다.')");
	} else if (flag == 1) {
		out.println("alert('ID 또는 비밀번호를 다시 확인해주세요.');");
		out.println("history.back();");
	} else {
		out.println("alert('탈퇴에 실패하였습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>