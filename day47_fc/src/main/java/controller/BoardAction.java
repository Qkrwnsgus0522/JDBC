package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardVO;

public class BoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// CUD에 실패하거나 데이터가 없는 상태는 forward를 null로 반환
		ActionForward forward = null;
		
		BoardVO bVO = new BoardVO();
		BoardDAO bDAO = new BoardDAO();
		
		bVO.setNum(Integer.parseInt(request.getParameter("num")));
		bVO = bDAO.selectOne(bVO);
		
		if (bVO != null) {
			request.setAttribute("data", bVO);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("d_board.jsp");
		}
		
		return forward;
	}

}
