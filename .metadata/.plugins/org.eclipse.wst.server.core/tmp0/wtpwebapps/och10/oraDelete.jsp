<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dBError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>scriptlet + Statement 삭제 Hw3</h2>
<% 
	String deptno = request.getParameter("deptno");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String sql    = String.format("delete dept where deptno = %s", deptno);
	Class.forName(driver);
	Connection conn   = DriverManager.getConnection(url , "scott" , "tiger");
	Statement  stmt   = conn.createStatement();
	int        result = stmt.executeUpdate(sql);
	if (result > 0) out.println("삭제성공");
	else            out.println("삭제실패");
	stmt.close();
	conn.close();
%>
</body>
</html>