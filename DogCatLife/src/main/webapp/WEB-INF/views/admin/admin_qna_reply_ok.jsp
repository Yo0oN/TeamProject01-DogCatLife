<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int flag = (Integer) request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('답변이 작성되었습니다.')");
		out.println("window.close();");
	} else {
		out.println("alert('답변 작성에 실패하였습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");

%>