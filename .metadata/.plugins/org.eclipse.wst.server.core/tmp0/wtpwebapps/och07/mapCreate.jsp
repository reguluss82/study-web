<%@page import="java.util.HashMap"%>
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
//          KEY      , Value
	HashMap<String   , String> map = new HashMap<String , String>();
	map.put("Park"   , "목동");
	map.put("공현지" , "신촌");
	map.put("권동주" , "홍대");
	map.put("Susan"  , "시드니");
	
	request.setAttribute("ADDRESS", map);             //form사용과 동일 parameter=value
	RequestDispatcher dispatcher = request.getRequestDispatcher("mapView.jsp?NAME=Park");
	dispatcher.forward(request, response);
%>
</body>
</html>