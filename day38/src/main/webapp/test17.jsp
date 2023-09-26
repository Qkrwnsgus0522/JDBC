<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,test.ProductVO"%>
<jsp:useBean id="pDAO" class="test.ProductDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- test17, 18, 19, 20 --%>
	<div id="header">
	<%
		if (session.getAttribute("name") == null) {
	%>
			<form action="test18.jsp" method="post">
				아이디 <input type="text" name="mid"><br>
				비밀번호 <input type="password" name="mpw"><br>
				<input type="submit" value="로그인">
			</form>
	<%
		}
		else {
	%>
			<%= session.getAttribute("name") %>님 안녕하세요 :D <a href="test19.jsp">로그아웃</a>
	<%
		}
	%>
	</div>
	
	<hr>
	
	<div id="content">
		<form action="test20.jsp">
			상품선택 <select name="pk">
				<%
					ArrayList<ProductVO> datas = pDAO.selectAll(null);
					for(ProductVO v : datas) {
						out.println("<option value='" + v.getPk() + "'>" + v + "</option>");
					}
				%>
			</select>
			<input type="submit" value="장바구니 추가하기">
		</form>
	</div>
	
	<hr>
	
	<a href="test21.jsp">결제하기</a>
</body>
</html>