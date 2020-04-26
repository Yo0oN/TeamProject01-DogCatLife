<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String flag = (String) request.getAttribute("flag");
	out.println(flag.trim());
%>