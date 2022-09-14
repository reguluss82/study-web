<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
  JDBC 드라이버를 로드하고, 데이터베이스로 연결하고, 연결을 끊는 방법
- con = DriverManager.getConnection(url,“scott“,”tiger" );
- 이 메서드는 데이터베이스로의 연결에 성공하면 java.sql.Connection
  인터페이스 타입의 객체를 만들어서 리턴.
- 데이터베이스로의 연결을 끊기 위해서는 Connection 객체에 대해
  close 메서드를 호출
-->
</head>
<body>
<% 
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	
	/* JDBC 드라이버 로드 */
	Class.forName(driver);
	
	/* - 데이터베이스로 연결을 맺기 위해 java.sql.DriverManager 클래스
	의 getConnection 메서드를 호출
	데이터베이스로의 연결에 성공하면 java.sql.Connection
	인터페이스 타입의 객체를 만들어서 리턴.*/
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	
	if (conn != null) out.println("연결 성공 ㅋㅋ");
	else              out.println("연결 실패");
	
	/* - 데이터베이스로의 연결을 끊기 위해서는 Connection 객체에 대해
	close 메서드를 호출 */
	conn.close();
%>
</body>
</html>