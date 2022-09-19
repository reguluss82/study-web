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
<!--   MultipartRequest
- 파일업로드 및 폼요소처리
- COS 라이브러리에서 가장 핵심적인 역할을 하는 클래스로 파일 업로드 담당
- MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy)
  request : MultipartRequest와 연결될 request 객체
  saveDirectory : 서버 측에 파일이 실질적으로 저장될 경로
  maxPostSize : 한번에 업로드 할 수 있는 최대 파일 크기
  encoding : 파일의 인코딩 방식
  policy : 파일 이름 중복 처리를 위한 인자  -->
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
	Enumeration      en    = multi.getFileNames(); //모든 파라미터 이름을 Enumeraton으로 반환
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
	/*getParameter(java.lang.String name)
	스트링으로 주어진 이름에 대한 값을 반환. 
	값없이 파라미터가 전송되었거나, 해당되는 이름의 파라미터가 전송이 
	안되었을 경우 null을 반환 */
	String name = multi.getParameter("name");//request가 아니라 위에 선언한 multi로 getpara
	String title = multi.getParameter("title");
	// DTO Setting
	// DML --> DAO
%>
</body>
</html>