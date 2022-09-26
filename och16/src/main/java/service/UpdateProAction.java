package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class UpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. num , pageNum , writer , email , subject , passwd , content Get
		request.setCharacterEncoding("utf-8");
		String pageNum = request.getParameter("pageNum");

		// 2. Board board Value Setting
		Board board = new Board();
		board.setNum(Integer.parseInt(request.getParameter("num")));
		board.setWriter(request.getParameter("writer"));
		board.setEmail(request.getParameter("email"));
		board.setSubject(request.getParameter("subject"));
		board.setPasswd(request.getParameter("passwd"));
		board.setContent(request.getParameter("content"));
		board.setIp(request.getRemoteAddr());
		try {
			// 3. BoardDao bd Instance
			BoardDao bd = BoardDao.getInstance();
			int result = bd.update(board);
			// 4. request 객체에 result , num , pageNum
			request.setAttribute("result"  , result);
			request.setAttribute("num"     , board.getNum());
			request.setAttribute("pageNum" , pageNum);	
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "updatePro.jsp";
	}

}
