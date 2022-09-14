<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	대박! 대박! 대박 <p>
	내가 에러를 내다니 <p>
	<%= exception.getMessage() %>
</body>
</html>