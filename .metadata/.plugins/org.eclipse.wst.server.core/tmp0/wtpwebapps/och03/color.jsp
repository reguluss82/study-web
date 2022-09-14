<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% 
	String color = request.getParameter("color");
%> <!-- scriptlet은 어디서나 가능 -->
<body bgcolor="<%=color %>">
	<h1>익스프레션을 이용한 색깔 변경</h1>
</body>
</html>