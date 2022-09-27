package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class AjaxGetDeptNameAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AjaxGetDeptNameAction Start...");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		try {
			// 본인 필요 DB Text 가져옴 (DAO 연결)
			int num = Integer.parseInt(request.getParameter("num"));
			BoardDao bd = BoardDao.getInstance();
			Board board = bd.select(num);
			request.setAttribute("writer", board.getWriter());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		// ajax 경우 --> 더미 Return
		return "ajax";
	}

}
