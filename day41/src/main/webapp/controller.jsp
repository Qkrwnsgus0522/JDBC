<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,model.BoardVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bDAO" class="model.BoardDAO" />
<jsp:useBean id="mDAO" class="model.MemberDAO" />
<jsp:useBean id="mVO" class="model.MemberVO" />
<jsp:setProperty property="*" name="mVO" />
<jsp:useBean id="bVO" class="model.BoardVO" />
<jsp:setProperty property="*" name="bVO" />
<%
	String action = request.getParameter("action");

	System.out.println("로그: controller.jsp");
	System.out.println("action: " + action);
	System.out.println("bVO: " + bVO);
	System.out.println("mVO: " + mVO);

	if (action.equals("main")){
		ArrayList<BoardVO> datas = bDAO.selectAll(null);
		request.setAttribute("datas", datas);
		request.getRequestDispatcher("b_main.jsp").forward(request, response); // JSP 액션 태그를 자바로 작성한 형태
	}
	else if (action.equals("signupPage")) {
		response.sendRedirect("e_signup.jsp");
	}
	else if (action.equals("signup")) {
		if (!mDAO.insert(mVO)) {
			out.println("<script>alert('회원가입 실패...');history.go(-1);</script>");
		}
		else {
			out.println("<script>alert('회원가입 성공!');location.href='controller.jsp?action=main';</script>");
		}
	}
	else if (action.equals("board")) {
		bVO = bDAO.selectOne(bVO);
		if (bVO != null){
			request.setAttribute("data", bVO);
			request.getRequestDispatcher("d_board.jsp").forward(request, response);
		}
		else {
			out.println("<script>alert('글이 없음...');location.href='controller.jsp?action=main';</script>");
		}
	}
	else if (action.equals("boardWritePage")) {
		response.sendRedirect("c_insertBoard.jsp");
	}
	else if (action.equals("boardWrite")) {
		if(!bDAO.insert(bVO)) {
			out.println("<script>alert('글쓰기 실패...');history.go(-1);</script>");
		}
		else {
			response.sendRedirect("controller.jsp?action=main");
		}
	}
	else if (action.equals("updateBoard")) {
		if (!bDAO.update(bVO)) {
			out.println("<script>alert('글수정 실패...');history.go(-1);</script>");
		}
		else {
			out.println("<script>alert('글수정 성공!');location.href='controller.jsp?action=board&num=" + bVO.getNum() + "';</script>");
		}
	}
	else if (action.equals("deleteBoard")) {
		if (!bDAO.delete(bVO)) {
			out.println("<script>alert('글삭제 실패...');history.go(-1);</script>");
		} else {
			out.println("<script>alert('글삭제 성공!');location.href='controller.jsp?action=main';</script>");
		}
	}
	else if (action.equals("mypage")) {
		response.sendRedirect("f_mypage.jsp");
	}
	else if (action.equals("updateMemberPage")) {
		response.sendRedirect("g_updateMember.jsp");
	}
	else if (action.equals("updateMember")) {
		if (!mDAO.update(mVO)) {
			out.println("<script>alert('회원정보변경 실패...');history.go(-1);</script>");
		}
		else {
			out.println("<script>alert('회원정보변경 성공!');location.href='controller.jsp?action=logout';</script>");
		}
	}
	else if (action.equals("deleteMember")) {
		if (!mDAO.delete(mVO)) {
			out.println("<script>alert('회원탈퇴 실패...');history.go(-1);</script>");
		}
		else {
			out.println("<script>alert('회원탈퇴 성공!');location.href='controller.jsp?action=logout';</script>");
		}
 	}
	else if (action.equals("login")){
		mVO = mDAO.selectOne(mVO); // mVO에 mid, mpw가 setter에 의해 저장됨
		if (mVO == null){
			out.println("<script>alert('로그인 실패...');history.go(-1);</script>");
		}
		else {
			session.setAttribute("mid", mVO.getMid());
			response.sendRedirect("controller.jsp?action=main");
		}
	}
	else if (action.equals("logout")){
		session.removeAttribute("mid");
		response.sendRedirect("controller.jsp?action=main");
	}
	else {
		out.println("<script>alert('action 파라미터의 값을 확인해주세요!');history.go(-1);</script>");
	}
%>