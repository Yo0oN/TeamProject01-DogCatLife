<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int flag = (Integer) request.getAttribute("flag");
	String id = (String) request.getAttribute("id");
	
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('로그인에 성공하였습니다..')");
		out.println("location.href='./admin_main.mysql?'");
		session.setAttribute("id", id);
		
		//cpage=1&codeopt=1&sdate=&edate=&searchopt=flag&searchkey=
	} else {
		out.println("alert('로그인에 실패하였습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");

%>