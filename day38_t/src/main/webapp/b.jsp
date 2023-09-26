<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.ProductVO,java.util.ArrayList" %>
<jsp:useBean id="pDAO" class="model.ProductDAO" />
<jsp:useBean id="pVO" class="model.ProductVO" />
<jsp:setProperty property="*" name="pVO" />
<%	
	ProductVO data = pDAO.selectOne( pVO );
	
	ArrayList<ProductVO> cart=(ArrayList<ProductVO>)session.getAttribute("cart");
	
	if(cart == null){
		cart=new ArrayList<ProductVO>();
		session.setAttribute("cart", cart);
	}
	
	cart.add(data);
%>
<script>
	alert('<%=data.getName()%>이(가) 장바구니에 추가되었습니다! :D');
	location.href='a.jsp';
</script>