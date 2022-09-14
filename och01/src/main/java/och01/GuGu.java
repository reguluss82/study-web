package och01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class GuGu
 */
//@WebServlet("/GuGu") //url Web Setting Annotaiton @ //xml에서 매핑해주었다.
public class GuGu extends HttpServlet { //class는 url 역할을 하지 않는다.
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuGu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 목표 : num 구구단
		int num = Integer.parseInt(request.getParameter("num"));//String받은 값 parseInt
		
		response.setContentType("text/html;charset=utf-8"); // 브라우저에 출력할 데이터 인코딩
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.printf("<h1>구구단 %d단</h1>", num);
		for (int i = 1; i <= 9; i++) {
			out.printf("%d * %d = %d<br>" , num , i , (num * i));
		}
		out.println("<body><html>");
		out.close();
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
