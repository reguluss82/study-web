<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../dBError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- DBCP DataBase Connection Pool
데이터베이스와 애플리케이션을 효율적으로 연결하는 커넥션 풀 라이브러리를 의미한다.
WAS가 실행되면서 미리 일정량의 DB Connection 객체를 생성하고 pool이라는 공간에 저장하고, 
저장된 DB Connection 객체는 요청에 따라 필요할 때마다 pool에서 가져다 쓰고 반환할 수 있다.

DBCP를 사용하는 이유
DBCP를 사용하지 않는다면 JDBC를 통하여 DB에 연결하기 위해서는 드라이버를 로드하고 커넥션 객체를 받아와야 한다. 
사용자가 요청을 할 때마다 매번 드라이버를 로드하고 커넥션 객체를 생성하여 연결하고 종료하기 때문에 매우 비효율적이다. 
또한, 접속하는 사용자만큼 Connection 객체를 생성하여 사용하게 되며 이로 인해 시스템에 부하를 많이 주어 성능에 이슈를 발생시킬 수 있다.
커넥션 풀을 사용하면 커넥션을 생성하고 닫는 시간이 소모되지 않기 때문에 그만큼 애플리케이션의 실행 속도가 빨라지며, 
한 번에 생성될 수 있는 커넥션 수를 제어하기 때문에 동시 접속자 수가 몰려도 웹 애플리케이션이 쉽게 다운되지 않는다. -->

<!-- JNDI (Java Naming and Directory Interface)
- 디렉터리 서비스에서 제공하는 데이터 및 객체를 발견하고 참고(lookup)하기 위한 자바 API
- 즉, 외부에 있는 객체를 가져오기 위한 기술
- Tomcat과 같은 WAS를 보면 특정 폴더에 필요한 데이터 소스(라이브러리)가 있는데
그것을 우리가 사용하기 위해 JNDI를 이용해서 가져오는 것

Context    init = new InitialContext();
- InitialContext()는 웹 애플리케이션이 처음 배치될 때 설정되고,
모든 설정된 엔트리와 자원은 JNDI namespace의 java:comp/env 부분에 놓이게 됨 -->
<!-- 
JNDI와 DBCP의 전체적인 구성
① 사용자가 요청.
② 요청은 Control을 거쳐 JNDI에 등록된 데이터베이스 객체(Type:DataSource)를 검색.
③ JNDI를 통해 찾은 객체로부터 커넥션을 획득.
④ 데이터베이스 DML 작업 수행.
⑤ 데이터베이스 작업이 끝난 후 획득한 커넥션을 반납
-->
</head>
<body>
	<h2>DBCP 연결</h2>
<% 
	Context    init = new InitialContext();
	DataSource ds   = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	if(conn != null) out.println("연결성공");
	else             out.println("연결실패");
	conn.close();
%>
</body>
</html>