<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="controller.jsp" method="post">
		<input type="hidden" name="action" value="updateMember">
		<input type="hidden" name="mid" value="<%= session.getAttribute("mid") %>">
		비밀번호 : <input type="password" name="mpw"><br>
		이름 : <input type="text" name="name"><br>
		<input type="submit" value="변경">
	</form>
	
	<br>
	
	<a href="controller.jsp?action=main">메인으로 돌아가기</a>
</body>
</html>