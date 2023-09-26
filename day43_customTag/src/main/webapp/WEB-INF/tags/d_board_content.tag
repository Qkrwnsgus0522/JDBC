<%@ tag language="java" pageEncoding="UTF-8" import="model.BoardVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- form 단위로 나눠서 c:if / c:choose 사용하는것이 좋음 -->
<c:choose>
	<c:when test="${ data.writer eq mid }">
		<form name="form" action="controller.jsp" method="post">
			<input type="hidden" name="action" value="updateBoard">
			글 번호: <input type="text" name="num" value="${ data.num }" readonly><br>
			글 제목: <input type="text" name="title" value="${ data.title }"><br>
			글 내용: <input type="text" name="content" value="${ data.content }"><br>
			<input type="submit" value="게시글 변경">
			<input type="button" value="게시글 삭제" onClick="delBoard()">
		</form>
	</c:when>
	<c:otherwise>
		<form name="form" action="controller.jsp" method="post">
			<input type="hidden" name="action" value="updateBoard">
			글 번호: <input type="text" name="num" value="${ data.num }" readonly><br>
			글 제목: <input type="text" name="title" value="${ data.title }" readonly><br>
			글 내용: <input type="text" name="content" value="${ data.content }" readonly><br>
		</form>
	</c:otherwise>
</c:choose>