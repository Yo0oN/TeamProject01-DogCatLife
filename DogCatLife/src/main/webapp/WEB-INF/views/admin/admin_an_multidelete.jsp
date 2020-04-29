<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int flag = (Integer)request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('삭제에 실패하였습니다.');");
		out.println("history.back();");
	} else {
		out.println("alert('"+flag+"개의 글이 삭제되었습니다.')");
		out.println("location.href='./admin_an.mysql?cpage=1&sdate=&edate=&searchopt=&searchkey='");
	}
	out.println("</script>");

%>