<%@page import="och10.Dept"%>
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
	Dept dept = (Dept)request.getAttribute("dept");
%>
	<h2>Expression 부서정보</h2>
	부서코드 : <%=dept.getDeptno()  %><p>
	부서명 : <%=dept.getDname()  %><p>
	근무지 : <%=dept.getLoc()  %><p>
	<h2>EL 표기법 부서정보 (같은의미)</h2>
	<!-- 표기법이지만 내부적으로 getter를 통해 값을 가져온다. -->
	부서코드 : ${dept.getDeptno() }<p>
	부서명 : ${dept.dname }<p> 
	근무지 : ${dept.loc }<p>
</body>
</html>