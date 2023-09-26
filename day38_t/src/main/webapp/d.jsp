<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mid=request.getParameter("mid");
	session.setAttribute("mid", mid);
	
	response.sendRedirect("a.jsp");
%>