package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardSet;
import model.BoardSetDAO;
import model.BoardVO;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		forward.setPath("main.jsp");
		forward.setRedirect(false);
		
		String count = request.getParameter("count");
		
		// TryCatch 처리하면 제일 좋음
		// null값 체크할 때 null을 조건문 첫 번째에 넣음
		if (count == null || count.isEmpty() || count.isBlank() || count.equals("")) {
			count = "2";
		}
		int cnt = Integer.parseInt(count);
		
		BoardSetDAO bsDAO = new BoardSetDAO();
		
		ArrayList<BoardSet> bdatas = bsDAO.selectAll(null, cnt);
		request.setAttribute("bdatas", bdatas);
		request.setAttribute("count", cnt);
		
		return forward;
	}

}
