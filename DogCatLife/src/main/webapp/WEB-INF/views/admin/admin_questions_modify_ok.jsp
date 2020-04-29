<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int flag = (Integer) request.getAttribute("flag");
	int seq = (Integer) request.getAttribute("seq");
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('질문이 수정되었습니다.')");
		out.println("location.href='admin_questions_view.mysql?cpage=1&seq="+seq+"'");
	} else {
		out.println("alert('질문 수정에 실패하였습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");

%>