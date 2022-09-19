<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
	//                5Mb
	int    maxSize  = 5 * 1024 * 1024;
	String fileSave = "/fileSave"; //실행하면 metadata생기므로 미리 폴더를 만들어두는게 편하다.
	// Meta Data
	String realPath = getServletContext().getRealPath(fileSave);//실제 unix server에 upload
	System.out.println("realPath->" + realPath);
	MultipartRequest multi = new MultipartRequest(request , realPath , maxSize , "utf-8" , new DefaultFileRenamePolicy());
	Enumeration      en    = multi.getFileNames();
	while (en.hasMoreElements()) {
		//input 태그의 속성이 file인 태그의 name 속성값 : 파라미터이름
		String parameterName = (String)en.nextElement(); //파라미터이름
		//서버에 저장된 파일 이름
		String serverSaveFilename = multi.getFilesystemName(parameterName);
		//전송전 원래의 파일 이름
		String original  = multi.getOriginalFileName(parameterName);
		//전송된 파일 의 내용 타입
		String type      = multi.getContentType(parameterName);
		//전송된 파일속성이 file인 태그의 name 속성값을 이용해 파일객체생성
		File file = multi.getFile(parameterName);
		out.println("real Path : "       + realPath            + "<br>");
		out.println("파라미터 이름 : "   + parameterName       + "<br>");
		out.println("실제 파일 이름:"    + original            + "<br>");
		out.println("저장된 파일 이름 :" + serverSaveFilename  + "<br>");
		out.println("파일 타입 : "       + type                + "<br>");
		if (file != null) {
			out.println("크기 : " + file.length() + "<br>");
		}
	}
	String name = multi.getParameter("name");//request가 아니라 위에 선언한 multi로 getpara
	String title = multi.getParameter("title");
	// DTO Setting
	// DML --> DAO
%>
</body>
</html>