<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int flag = (Integer) request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('삭제되었습니다.')");
		out.println("location.href='./admin_qna.mysql?cpage=1&codeopt=flag&sdate=&edate=&searchopt=&searchkey='");
	} else {
		out.println("alert('삭제에 실패하였습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");

%>