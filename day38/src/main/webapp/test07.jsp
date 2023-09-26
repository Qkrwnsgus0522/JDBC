<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response.sendRedirect()</title>
</head>
<body>

<%-- 데이터를 전달하기만 할 경우 HTML이 필요없음 --%>
<%
	response.sendRedirect("test08.jsp");
	// 처음에 전송한(요청한) 데이터가 유지 xxxxx
	// URL이 변경됨
	//	== 새로운 요청이 처리됨
%>

</body>
</html>