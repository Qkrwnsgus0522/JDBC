<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session.setAttribute("mid", null); // 해당 세션을 비워줘
	session.removeAttribute("name"); // 해당 세선을 지워줘
	session.removeAttribute("cart");
	//session.invalidate(); // 모든 세션을 지워줘
	
	response.sendRedirect("test17.jsp");
%>