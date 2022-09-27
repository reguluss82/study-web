package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;

public class DeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 1. num , passwd , pageNum Get
			int num = Integer.parseInt(request.getParameter("num"));
			String passwd = request.getParameter("passwd");
			String pageNum = request.getParameter("pageNum");
			// 2. BoardDao bd Instance
			BoardDao bd = BoardDao.getInstance();
			
			int result = bd.delete(num , passwd);
			request.setAttribute("num", num);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return "deletePro.jsp";
	}

}
