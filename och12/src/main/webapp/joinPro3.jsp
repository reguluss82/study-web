<%@page import="java.io.File"%>
<%@page import="och12.Member"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
	int maxSize = 5 * 1024 * 1024;
	String fileSave = "/fileSave";
	
	// meta data
	String realPath = getServletContext().getRealPath(fileSave);
	System.out.println("realPath->" + realPath);
	MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
	Enumeration en = multi.getFileNames();
	// 서버에 저장된 파일 이름
	String serverSaveFilename = "";
	while (en.hasMoreElements()) {
		String parameterName = (String) en.nextElement();
		serverSaveFilename = multi.getFilesystemName(parameterName);
		String original = multi.getOriginalFileName(parameterName);
		String type = multi.getContentType(parameterName);
		File file = multi.getFile(parameterName);
		out.println("realPaht : " + realPath + "<br>");
		out.println("파라미터이름 : " + parameterName + "<br>");
		out.println("실제 파일 이름 : " + original + "<br>");
		out.println("저장된 파일 이름 : " + serverSaveFilename + "<br>");
		out.println("파일 타입 : " + type + "<br>");
		if (file != null) {
			out.println("크기 : " + file.length() + "<br>");
		}
	}
	String id = multi.getParameter("id"); //일반적인 칼럼도 multi로 getPara
	String name = multi.getParameter("name");
	String passwd = multi.getParameter("passwd");
	String address = multi.getParameter("address");
	String tel = multi.getParameter("tel");
	String img_path = serverSaveFilename;
	
	// DTO 작업
	Member member = new Member();
	member.setId(id);
	member.setName(name);
	member.setPasswd(passwd);
	member.setAddress(address);
	member.setTel(tel);
	member.setImg_path(img_path);
	

	MemberDao md = MemberDao.getInstance();
	int result = md.insert3(member); // HW
	if (result > 0) {
%>	
	<script type="text/javascript">
		alert("회원가입(image) 축하 !! 이제 고생 좀 해");
		location.href="loginForm.jsp";
	</script>
<% 

	} else { %>
		<script type="text/javascript">
			alert("헐 실패야 똑바로 해 ~");
			location.href="joinForm.jsp";
		</script>
<% } %>
</body>
</html>