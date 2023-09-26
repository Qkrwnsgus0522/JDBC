<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${ empty ssmVO }">
		<input type="text" name="mid" disabled value="로그인 후 이용해주세요.">
		<input type="text" name="content" disabled value="로그인 후 이용해주세요">
		<input type="submit" value="글 작성하기">
</c:if>
<c:if test="${ not empty ssmVO }">
	<form action="insertBoard.do" method="post">
		<input type="text" name="mid" required value="${ ssmVO.mid }">
		<input type="text" name="content" required placeholder="내용을 작성하세요.">
		<input type="submit" value="글 작성하기">
	</form>
</c:if>