<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<% 
		BoardVO data = (BoardVO)request.getAttribute("data");
	%>
	<form action="controller.jsp" method="post">
		<input type="hidden" name="action" value="boardWrite">
		제목 : <input type="text" name="title"><br>
		내용 : <input type="text" name="content"><br>
		<input type="hidden" name="writer" value="<%= session.getAttribute("mid") %>">
		<input type="submit" value="글작성">
	</form>
	
	<br>
	
	<a href="controller.jsp?action=main">메인으로 돌아가기</a>
</body>
</html>