package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Controller")
// 특정 Client(브라우저, 사용자)의 요청에 대해 반응할 수 있음
//	: 필터, 리스너(서블릿을 상속받은 특수한 서블릿)에서 사용한 @(어노테이션)
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L; // 직렬화
	
	// 웹에서는 기본생성자를 기본으로 활용하기때문에 꼭 필요함!!!
    public FrontController() {
        super();
    }

    private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 여기에 기능을 코딩
    	String action = request.getParameter("action");
    	ActionForward forward = null;
    	
    	System.out.println("로그: controller.jsp");
    	System.out.println("action: "+action);
    	System.out.println("bVO: "+bVO);
    	System.out.println("mVO: "+mVO);

    	if(action.equals("main")){
    		
    	}
    	else if(action.equals("board")){
    		
    	}
    	else if(action.equals("login")){
//    		new LoginAction().execute(request, response);
    		LoginAction loginAction = new LoginAction();
    		forward = loginAction.execute(request, response);
    	}
    	else if(action.equals("logout")){
    		
    	}
    	else if(action.equals("signupPage")){
    		response.sendRedirect("e_signup.jsp");
    	}
    	else if(action.equals("signup")){
    		boolean flag=mDAO.insert(mVO);
    		if(flag){
    			out.println("<script>alert('회원가입 성공! 로그인후에 이용하세요! :D');location.href='controller.jsp?action=main';</script>");
    		}
    		else{
    			out.println("<script>alert('회원가입 실패...');history.go(-1);</script>");
    		}
    	}
    	else if(action.equals("insertBoardPage")){
    		response.sendRedirect("c_insertBoard.jsp");
    	}
    	else if(action.equals("insertBoard")){
    		boolean flag=bDAO.insert(bVO);
    		if(flag){
    			out.println("<script>alert('게시글 작성 성공!');location.href='controller.jsp?action=main';</script>");
    		}
    		else{
    			out.println("<script>alert('게시글 작성 실패...');history.go(-1);</script>");
    		}
    	}
    	else if(action.equals("updateBoard")){
    		boolean flag=bDAO.update(bVO);
    		if(flag){
    			out.println("<script>alert('게시글 변경 성공!');location.href='controller.jsp?action=board&num="+bVO.getNum()+"';</script>");
    		}
    		else{
    			out.println("<script>alert('게시글 변경 실패...');history.go(-1);</script>");
    		}
    	}
    	else if(action.equals("deleteBoard")){
    		boolean flag=bDAO.delete(bVO);
    		if(flag){
    			response.sendRedirect("controller.jsp?action=main");
    		}
    		else{
    			out.println("<script>alert('게시글 삭제 실패...');history.go(-1);</script>");
    		}
    	}
    	else if(action.equals("mypagePage")){
    		response.sendRedirect("mypage.jsp");
    	}
    	else if(action.equals("mypage")){
    		///// mVO.setMid((String)session.getAttribute("mid"));
    		mVO=mDAO.selectOne(mVO);
    		if(mVO!=null){
    			request.setAttribute("data", mVO);
    			request.getRequestDispatcher("f_mypage.jsp").forward(request, response);
    		}
    		else{
    			out.println("<script>alert('비밀번호 불일치...');history.go(-1);</script>");
    		}
    	}
    	else if(action.equals("updateMember")){
    		boolean flag=mDAO.update(mVO);
    		if(flag){
    			out.println("<script>alert('회원정보 변경 성공! 로그인후에 이용하세요! :D');location.href='controller.jsp?action=logout';</script>");
    		}
    		else{
    			out.println("<script>alert('회원정보 변경 실패...');history.go(-1);</script>");
    		}
    	}
    	else if(action.equals("deleteMember")){
    		boolean flag=mDAO.delete(mVO);
    		if(flag){
    			out.println("<script>alert('회원탈퇴 성공!');location.href='controller.jsp?action=logout';</script>");
    		}
    		else{
    			out.println("<script>alert('회원탈퇴 실패...');history.go(-1);</script>");
    		}
    	}
    	else{
    		out.println("<script>alert('action 파라미터의 값을 확인해주세요!');history.go(-1);</script>");
    	}
    	
    	////////
    	// 3. 요청 처리가 완료되면 사용자에게 응답하기
    	//	: View로 이동
    	////////
    	// 데이터가 보낼게 있으면 포워드
    	// 데이터가 보낼게 없으면 response.sendRedirect(action);

    	if (forward.isRedirect()) {
    		response.sendRedirect(forward.getPath());    		
    	}
    	else {
    		// 포워드;
    	}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doAction(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		doAction(request, response);
	}

}
