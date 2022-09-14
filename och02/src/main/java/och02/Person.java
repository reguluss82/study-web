package och02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Person
 */
@WebServlet("/Person")
public class Person extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Person() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	// post로 받기때문에 인코딩 필요
		String name     = request.getParameter("name");
		String id       = request.getParameter("id");
		String password = request.getParameter("password");
		String gender   = request.getParameter("gender");
		String[] notice = request.getParameterValues("notice");	//Values checkbox로 받기때문에 복수선택시 배열로 받아야 한다.
		String job      = request.getParameter("job");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body><h1>개인정보</h1>");
		out.printf("이름 : %s<p>"   , name);
		out.printf("아이디 : %s<p>" , id);
		out.printf("암호 : %s<p>"   , password);
		out.printf("성별 : %s<p>"   , gender);
		out.print("수신메일 : ");
		if (notice != null) {	// checkbox이므로 아무것도 선택하지 않은 경우를 고려한 조건문
			for (int i = 0; i < notice.length; i++) {
				out.printf(" %s"    , notice[i]);
			}
		} else out.println("없음");
		out.printf("<p>직업 : %s"   , job);
		out.close();
	}

}
