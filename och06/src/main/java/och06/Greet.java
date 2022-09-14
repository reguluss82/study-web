package och06;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*Servlet Lifecycle
	1. init() 메소드를 호출하여 초기화
	2. service() 메소드를 호출하여 클라이언트의 요청을 처리
	3. destroy() 메소드를 호출하여 종료*/
/**
 * Servlet implementation class Greet
 */
@WebServlet("/Greet")
public class Greet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PrintWriter log;   // class 전역변수 선언
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Greet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	/*
	 * init() 메소드 - 서블릿 요청시 맨 처음 한번만 호출됩니다.
	 * - 오로지 서블릿이 생성 될 때만 호출되며 이후, 사용자의 요청에 호출되지 않습니다.
	 * - 주로 반복적으로 해야하는 기본 세팅을 담는 것이 일반적입니다.
	 * - 서블릿 생성 시 초기화 작업을 주로 수행합니다
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init start...");
		try {
			log = new PrintWriter(new FileWriter("c:/log/log.txt" , true));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("헐 !");
		}
	}

	/**
	 * @see Servlet#destroy()
	 */
	/*
	 * destroy() 메소드
	 * - destroy() 메소드 역시 init() 메소드와 같이
	 *    라이프 사이클이 끝날 때 한 번만 호출됩니다.
	 * - 서블릿이 기능을 수행하고 메로리에서 소멸될 때 호출됩니다.
	 * - 이 메소드에서는 DB의 연결을 해제하거나,
	 *    서버의 리소스들을 다시 반납해주는
	 *    일련의 정리 활동들을 수행할 수 있게 해줍니다.
	 */
	public void destroy() {
		System.out.println("destroy start...");
		log.flush();
		// 유언장
		if (log != null) log.close();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*
	 * service() 메소드
	 * - doGet()과 doPost() - 서블릿 요청시 매번 호출됩니다.
	 * - 실제 클라이언트가 요청하는 작업을 수행합니다.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet start...");
		String name = request.getParameter("name");
		String msg  = name + "님 반가워 \r\n";
		GregorianCalendar gc = new GregorianCalendar();
		String date = String.format("%TF %TT\r\n" , gc , gc);
		// File 출력  --> date + msg
		log.print(date + msg);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 화면 출력  --> msg
		out.println("<html><body><h2>인사</h2>" + msg);
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
