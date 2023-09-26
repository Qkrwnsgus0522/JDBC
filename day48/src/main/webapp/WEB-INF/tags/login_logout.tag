<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${ empty ssmVO }">
	<li><a href="javascript:signup()">회원가입</a></li>
	<li><a href="javascript:signin()">로그인</a></li>
</c:if>
<c:if test="${ not empty ssmVO }">
	<li><a href="logout.do">로그아웃</a></li>
</c:if>
