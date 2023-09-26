<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
</head>
<body>

<%
	BoardVO data=(BoardVO)request.getAttribute("data");
	String mid = (String)session.getAttribute("mid");
	String writer = data.getWriter();
%>
	글 번호: <%=data.getNum()%> <br>
	글 제목: <%=data.getTitle()%> <br>
	글 내용: <%=data.getContent()%> <br>
	작성자: <%=data.getWriter()%> <br>
	
	<br>
<%
	if (mid != null && mid.equals(writer)) {
%>
	<form action="controller.jsp" method="post">
		<input type="hidden" name="action" value="updateBoard">
		<input type="hidden" name="num" value="<%=data.getNum()%>">
		제목 : <input type="text" name="title" value="<%=data.getTitle()%>"><br>
		내용 : <input type="text" name="content" value="<%=data.getContent()%>"><br>
		<input type="hidden" name="writer" value="<%= session.getAttribute("mid") %>">
		<input type="submit" value="글수정">
	</form>

	
	<a href="controller.jsp?action=deleteBoard&num=<%=data.getNum()%>">게시글 삭제</a>
<%
	}
%>
	<a href="controller.jsp?action=main">메인으로 돌아가기</a>
</body>
</html>