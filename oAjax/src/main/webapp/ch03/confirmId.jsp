<%@page import="oAjax.MemberDao"%>
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
	String id = request.getParameter("id");
	MemberDao memberDao = MemberDao.getInstance(); //dao 객체 호출
	// member1 Read 
	// id 존재  --> return 1
	// id 존재X --> return 0
	int result = memberDao.confirm(id); //dao 의 confirm 실행
	if (result == 0) { //dao 에서 return한 result로 비교
		out.println("사용할 수 있는 ID입니다");
	} else {
		out.println("중복 ID가 존재합니다.");
	}
%>
</body>
</html>