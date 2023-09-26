<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,model.ProductVO" %>
<jsp:useBean id="pDAO" class="model.ProductDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="header">
	<%
	if( session.getAttribute("mid") == null ){
	%>
		<form action="d.jsp">
			아이디 <input type="text" name="mid"> <input type="submit" value="로그인">
		</form>
	<%
	}
	else{
	%>
		<%=session.getAttribute("mid")%>님, 안녕하세요! :D | <a href="e.jsp">로그아웃</a>
	<%
	}
	%>
</div>

<hr>

<div id="content">
	<form action="b.jsp">
		상품선택 <select name="num">
			<%
				ArrayList<ProductVO> datas=pDAO.selectAll(null);
				for(ProductVO v:datas){
					out.println("<option value='"+v.getNum()+"'>"+v+"</option>");
				}
			%>
		</select>
		<input type="submit" value="장바구니에 추가하기">
	</form>
</div>

<hr>

<a href="c.jsp">결제하기</a>





</body>
</html>