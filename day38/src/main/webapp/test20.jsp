<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.ProductVO,java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="test.ProductDAO"/>
<jsp:useBean id="pVO" class="test.ProductVO"/>
<jsp:setProperty property="*" name="pVO"/>
<%
	// 상품을 받아와서,
	// == selectOne()
	ProductVO data = pDAO.selectOne(pVO);
	
	ArrayList<ProductVO> cart = (ArrayList<ProductVO>)session.getAttribute("cart");

	if (cart == null) {
		cart = new ArrayList<ProductVO>();
		session.setAttribute("cart", cart);
	}
	
	cart.add(data);
	
	// 그걸 장바구니에 추가하고,
	
	// 혹시 장바구니가 없으면?
	// 만들어서 넣으면됨
	
	// 사용자한테 ㅁㅁ가 장바구니에 추가되었습니다! :D
	// 다시 메인으로 페이지 이동~
%>
<script>
	alert('<%= data.getName() %> 이(가) 장바구니에 추가되었습니다! :D');
	location.href = 'test17.jsp';
</script>