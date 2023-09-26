<%@page import="test.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pDAO" class="test.ProductDAO"/>
    
<%
// ★★★★★★★★★★
// 장바구니, 로그인 유지 여부, 광고 띄우지않기 성정 등
// 서버가 변경되어도 '브라우저가 유지되고있었다면 설정이 유지되어야하는 상태'에 있는 데이터들을
// "세션(session)"으로 관리!!!!!
// 일정 시간이 흐르면 연결이 해제됨
// ★★★★★★★★★★

	// 현재 한글 데이터 전송중 -> 인코딩 필수
	request.setCharacterEncoding("UTF-8");
	
	ArrayList<ProductVO> datas = (ArrayList<ProductVO>)session.getAttribute("datas");
	
	// 사용자가 product라는 이름의 파라미터를 전송할 예정
	int product = Integer.parseInt(request.getParameter("product"));
	
	// 전달받은 상품을 "장바구니"에 추가
	if (datas == null) { // datas가 없으면
		// 장바구니를 맨 처음 만드는 경우에는 새로 new
		// 즉, 첫 번째 상품이면
		datas = new ArrayList<ProductVO>();
		session.setAttribute("datas", datas);
	}
	// 기존 장바구니가 있는 경우에는 .add()
	datas.add(pDAO.selectOne(new ProductVO(product, null, 0)));
	
	// 추가완료되면 다시 test10.jsp로 이동	
%>
<script>
	alert('<%= product %>이(가)장바구니에 추가되었습니다! :D');
	history.go(-1);
</script>