<%@page import="och10.Division"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../dBError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String dno = request.getParameter("dno");
	String driver = "com.mysql.cj.jdbc.Driver";
	String url    = "jdbc:mysql://localhost:3306/scottdb?serverTimezone=UTC";
	String sql    = "select * from division where dno=" + dno;
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url , "root" , "mysql80");
	Statement  stmt = conn.createStatement();
	ResultSet  rs   = stmt.executeQuery(sql);
	Division division = new Division(); /* DTO */
	if (rs.next()) {
		division.setDno(rs.getInt(1));
		division.setDname(rs.getString(2));
		division.setPhone(rs.getString(3));
		division.setPosition(rs.getString(4));
		request.setAttribute("division", division);
		rs.close();
		stmt.close();
		conn.close();
	}
		RequestDispatcher rd = request.getRequestDispatcher("my04Result.jsp");
		rd.forward(request, response);
		out.println("없는 부서야");
		stmt.close();
		conn.close();

%>
</body>
</html>