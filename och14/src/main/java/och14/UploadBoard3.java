package och14;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UploadBoard3
 */
@WebServlet("/UploadBoard3")
public class UploadBoard3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadBoard3() {
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
		System.out.println("UploadBoard3 doPost Start...");
		String serverSaveFilename = "";
		String uploadFilename     = "";
		request.setCharacterEncoding("utf-8");
		int    maxSize  = 5 * 1024 * 1024;
		String fileSave = "/fileSave";
		String realPath = getServletContext().getRealPath(fileSave);
		System.out.println("realPath->" + realPath);
		// Upload
		MultipartRequest multi = new MultipartRequest(request , realPath , maxSize , "utf-8" , new DefaultFileRenamePolicy());
		Enumeration      en    = multi.getFileNames();
		while (en.hasMoreElements()) {
			//input 태그의 속성이 file인 태그의 name 속성값 : 파라미터이름
			String parameterName = (String)en.nextElement();
			//서버에 저장된 파일 이름
			serverSaveFilename = multi.getFilesystemName(parameterName);
			//전송전 원래의 파일 이름
			String original = multi.getOriginalFileName(parameterName);
			//전송된 파일 의 내용 타입
			String type = multi.getContentType(parameterName);
			//전송된 파일속성이 file인 태그의 name 속성값을 이용해 파일객체생성
			File file = multi.getFile(parameterName);
			System.out.println("realPath->"         + realPath);
			System.out.println("파라미터 이름->"    + parameterName);
			System.out.println("실제 파일 이름->"   + original);
			System.out.println("저장된 파일 이름->" + serverSaveFilename);
			System.out.println("파일 타입->"        + type);
			if (file != null) {
				System.out.println("크기 ->" + file.length());
				//out.println("크기 ->" + file.length() + "<br>")
			}
		}
		String name  = multi.getParameter("name");
		String title = multi.getParameter("title");
		System.out.println("name->"  + name);
		System.out.println("title->" + title);
		uploadFilename = realPath + "\\" + serverSaveFilename; // \\특수문자가 다음에 나온다
		System.out.println("전달 uploadFilename ->" + uploadFilename);
		
		request.setAttribute("filename"       , "fileSave\\" + serverSaveFilename);
		request.setAttribute("uploadFilename" , uploadFilename);
		request.setAttribute("title"          , title);
		
		RequestDispatcher rd = request.getRequestDispatcher("uploadBoardResult.jsp");
		rd.forward(request, response);
	}
	
}
