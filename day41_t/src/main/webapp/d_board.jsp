<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
</head>
<body>

<script type="text/javascript">
	function delBoard(){
		var ans=confirm('정말 삭제할까요?');
		if(ans==true){
			document.form.action.value='deleteBoard';
			document.form.submit();	
		}
	}
</script>

<%
	BoardVO data=(BoardVO)request.getAttribute("data");

	boolean flag=data.getWriter().equals(session.getAttribute("mid"));
%>

<form name="form" action="controller.jsp" method="post">
	<input type="hidden" name="action" value="updateBoard">
	글 번호: <input type="text" name="num" value="<%=data.getNum()%>" readonly> <br>
	글 제목: <input type="text" name="title" value='<%=data.getTitle()%>' <% if(!flag){ %>readonly<% } %>> <br>
	글 내용: <input type="text" name="content" value='<%=data.getContent()%>' <% if(!flag){ %>readonly<% } %>> <br>
	작성자: <input type="text" name="writer" value='<%=data.getWriter()%>' readonly> <br>
	<% if(flag){ %><input type="submit" value="게시글 변경"> <input type="button" value="게시글 삭제" onClick="delBoard()"><% } %>
</form>


<br>

<a href="controller.jsp?action=main">메인으로 돌아가기</a>

</body>
</html>