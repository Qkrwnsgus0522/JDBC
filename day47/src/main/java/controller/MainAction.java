package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainAction {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO bDAO = new BoardDAO();
		ArrayList<BoardVO> datas=bDAO.selectAll(null);
		request.setAttribute("datas", datas);
//		request.getRequestDispatcher("b_main.jsp").forward(request, response);
		// Controller로 돌아갈 준비
		// 1. 리다이렉트? 포워드?
		// 2. 어디로 가야되니?
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("b_main.jsp");
		return forward;
	}
}
