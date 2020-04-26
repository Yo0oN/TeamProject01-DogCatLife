<%@page import="TOs.UserTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	UserTO userTO = (UserTO) request.getAttribute("userTO");

	int flag = Integer.parseInt(userTO.getFlag());
	String mseq = userTO.getMseq();
	String nickname = userTO.getNickname();
	
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('환영합니다! " + nickname + "님!')");
		session.setAttribute("sess_mseq", mseq);
		session.setAttribute("sess_nickname", nickname);

		if (session.getAttribute("endUrl") != null) {
			String endUrl = session.getAttribute("endUrl").toString();
			response.sendRedirect(endUrl);
		} else {
			out.println("location.href='./main.mysql'");
		}
	} else {
		out.println("alert('아이디 또는 비밀번호를 다시 확인해주세요.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>