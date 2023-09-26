<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.BoardVO,java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="jun" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>
<body>

<script type="text/javascript">
	function check(){
		var ans=prompt('비밀번호를 입력하세요.');
		location.href='controller.jsp?action=mypage&mpw='+ans;
	}
</script>
	<jun:b_main_header/>
	<hr>
	
	<table border="1">
		<tr>
			<th>글 번호</th><th>글 제목</th><th>작성자</th>
		</tr> <!-- xxx.getAttribute() / request.getParameter() -->
		<c:forEach var="v" items="${ datas }">
		<tr>
			<td><a href="controller.jsp?action=board&num=${ v.num }">${ v.num }</a></td>
			<td>${ v.title }</td>
			<td>${ v.writer }</td>
		</tr>
		</c:forEach>
	</table>
	
	<br>

	<c:if test="${ not empty mid }">
		<a href='controller.jsp?action=insertBoardPage'>게시글 작성</a>
	</c:if>

</body>
</html>