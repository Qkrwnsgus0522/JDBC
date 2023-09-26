<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%
	String id = (String)session.getAttribute("id");
	String content = request.getParameter("content");
	ArrayList<String> list = (ArrayList<String>)application.getAttribute("list");
	
	System.out.println("글정보: " + content);
	
	if (request.getParameter("content").equals("")) { // 현재 내용이 공백인지
		out.println("<script>alert('내용을 입력해주세요.');</script>");
	} else {
		if (list == null) {
			list = new ArrayList<String>();
			application.setAttribute("list", list);
		}
		list.add(0, id + ": " + content);	
	}
	
//	response.sendRedirect("a.jsp");
//	out.println("<script>history.go(-1);</script>");
	out.println("<script>location.href = 'a.jsp';</script>");
%>