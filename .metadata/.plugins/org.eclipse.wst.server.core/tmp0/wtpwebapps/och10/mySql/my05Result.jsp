<%@page import="och10.Professor"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr:hover {
		background-color: red;
}
</style>
</head>
<body>
<!-- MVC1 View -->
<% 
	ArrayList<Professor> al = (ArrayList<Professor>)request.getAttribute("al");
%>

	<table width="100%" border="1" bgcolor="yellow">
		<tr><th>사번</th><th>이름</th><th>업무</th><th>급여</th></tr>
<% 
	for (int i = 1; i < al.size(); i++) {
		out.println("<tr><td>" + al.get(i).getDeptno() + "</td>");
		out.println("<td>" + al.get(i).getName() + "</td>");
		out.println("<td>" + al.get(i).getPosition() + "</td>");
		out.println("<td>" + al.get(i).getSal() + "</td></tr>");
	}
%>
	</table>
</body>
</html>