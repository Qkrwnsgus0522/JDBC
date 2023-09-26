package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardVO;

public class InsertBoard implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = null;
		
		BoardVO bVO = new BoardVO();
		BoardDAO bDAO = new BoardDAO();
		
		bVO.setMid(request.getParameter("mid"));
		bVO.setContent(request.getParameter("content"));
		
		if (bDAO.insert(bVO)) {			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("main.do");
		}
		
		return forward;
	}

}
