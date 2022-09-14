<%@page import="java.sql.Types"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
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
	int empno = Integer.parseInt(request.getParameter("empno"));
	System.out.println("empno-> " + empno);
	Context    ctx  = new InitialContext();
	DataSource ds   = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	// Procedure Call
	String sql = "{call Emp_Info3(? , ?)}";
	CallableStatement cs = conn.prepareCall(sql);
	// 급여
	cs.registerOutParameter(2 , Types.DOUBLE);
	// 사번
	cs.setInt(1 , empno);
	cs.execute();
	out.println("급여 : " + cs.getDouble(2));
	cs.close();
	conn.close();
%>
<!-- registerOutParameter
서수 위치 parameterIndex에있는 OUT 매개 parameterIndex 를 JDBC 유형 sqlType 에 등록합니다 . 
모든 OUT 매개 변수는 저장 프로 시저가 실행되기 전에 등록되어야합니다.
OUT 매개 변수에 대해 sqlType 에 지정된 JDBC 유형 은 해당 매개 변수의 값을 읽기 get 메소드 에서 사용해야하는 Java 유형을 결정합니다 .
이 출력 매개변수에 반환될 것으로 예상되는 JDBC 유형이 이 특정 데이터베이스에 특정한 경우
sqlType 은 JDBCType.OTHER 또는 JDBC 드라이버에서 지원 하는 SQLType 일 수 있습니다. getObject(int) 메소드 는 값을 검색합니다. -->
</body>
</html>