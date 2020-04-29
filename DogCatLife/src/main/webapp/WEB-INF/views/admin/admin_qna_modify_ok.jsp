<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	int flag = (Integer) request.getAttribute("flag");
	int aseq = (Integer) request.getAttribute("aseq");
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('자주 묻는 질문이 수정되었습니다.')");
		out.println("location.href='admin_qna_view.mysql?cpage=1&seq="+aseq+"'");
	} else {
		out.println("alert('자주 묻는 질문에 실패하였습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");

%>