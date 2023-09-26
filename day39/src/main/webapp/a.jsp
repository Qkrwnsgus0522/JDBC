<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (session.getAttribute("id") == null) {
	%>
	<form action="b.jsp" method="post">
		<input type="text" name="mid" placeholder="아이디" required="required">
		<input type="password" name="mpw" placeholder="비밀번호" required="required">
		<input type="submit" value="로그인">
	</form>	
	<%
		} else {
	%>
	<form action="d.jsp">
		<input type="submit" value="로그아웃">
	</form>	
	<%
		}
	%>
	<%
		if (session.getAttribute("id") != null) {
	%>
	<hr>
	<form action="c.jsp">
		<input type="text" name="content" placeholder="내용을 입력해주세요.">
		<input type="submit" value="글작성">
	</form>	
	<%
		}
	%>
	<hr>
	<ul>
		<%
			ArrayList<String> list = (ArrayList<String>)application.getAttribute("list");
			if (list == null) {
				out.println("등록된 글이 없습니다.");
			} else {
				for (String v : list) {
					out.println("<li>" + v + "</li>");
				}			
			}
		%>
	</ul>
</body>
</html>