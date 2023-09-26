<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session.setAttribute("mid", null);
	session.removeAttribute("mid");
	//session.invalidate();
	
	session.removeAttribute("cart");
	
	response.sendRedirect("a.jsp");
%>