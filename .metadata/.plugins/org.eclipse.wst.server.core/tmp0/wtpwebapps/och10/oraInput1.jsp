
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
	String deptno = request.getParameter("deptno");
	String dname  = request.getParameter("dname");
	String loc    = request.getParameter("loc");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	Connection conn = null;
	Statement  stmt = null;
	String sql    = String.format("insert into dept values(%s , '%s' , '%s')", deptno , dname , loc);
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url , "scott" , "tiger");
		stmt = conn.createStatement();
		int result = stmt.executeUpdate(sql);
		if (result > 0) out.println("입력성공");
		else            out.println("입력실패");	
	} catch (Exception e) {
		out.println(e.getMessage());
	} finally {
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
	}
	
%>
</body>
</html>