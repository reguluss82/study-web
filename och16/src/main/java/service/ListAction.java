package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class ListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ListActionService start...");

		BoardDao bd = BoardDao.getInstance();
		try {
			int totCnt      = bd.getTotalCnt();   // 37
			
			String pageNum  = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) { pageNum = "1"; }
			int currentPage = Integer.parseInt(pageNum);	    // 1	2
			int pageSize    = 10;
			int blockSize   = 10;
			int startRow    = (currentPage - 1) * pageSize + 1; // 1    11
			int endRow      = startRow + pageSize - 1;          // 10   20
			int startNum    = totCnt   - startRow + 1;          // 
			request.setAttribute("totCnt", totCnt);
			// Board 조회                   1        , 10
			List<Board> list = bd.boardList(startRow , endRow); // ListAction(service)가 BoardDao(DAO)에 DB조회 요청후 list받아온다.
			//	                                   37     / 10
			int pageCnt     = (int)Math.ceil((double)totCnt / pageSize); // 4
			//                    1                            
			int startPage   = (int)(currentPage - 1) / blockSize * blockSize + 1; // 1	
			int endPage     = startPage + blockSize -1;                           // 10   
			// 공갈 Page 방지 10    >   4
			if (endPage > pageCnt) endPage = pageCnt;                           // 4
			
			request.setAttribute("list"        , list); // ***
			request.setAttribute("totCnt"      , totCnt);
			request.setAttribute("pageNum"     , pageNum);
			request.setAttribute("currentPage" , currentPage);
			request.setAttribute("startNum"    , startNum);
			request.setAttribute("blockSize"   , blockSize);
			request.setAttribute("startPage"   , startPage);
			request.setAttribute("endPage"     , endPage);
		} catch (Exception e) {
			System.out.println("ListAction e.getMessage()"+e.getMessage());
		}
		return "list.jsp";
	}

}
