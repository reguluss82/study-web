package och11;
// DBCP context.xml 설정

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/*
DAO
Data Access Object의 약자로, 데이터베이스의 데이터에 접근하기 위해 생성하는 객체이다.
데이터베이스에 접근하기 위한 로직과 비즈니스 로직을 분리하기 위해 사용한다.
간단하게, DB에 접속하여 데이터의 CRUD(생성, 읽기, 갱신, 삭제) 작업을 시행하는 클래스이다.
JSP 및 Servlet 페이지 내에 로직을 기술하여 사용할 수 있지만, 
코드의 간결화 및 모듈화, 유지보수 등의 목적을 위해 별도의 DAO 클래스를 생성하여 사용하는 것이 좋다.
*/

public class MemberDao  {
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context    ctx = new InitialContext();
			DataSource ds  = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn           = ds.getConnection();
		} catch (NamingException e) {
			// TODO: handle exception
			//e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	// insert Method 생성
	// parameter --> member
	// return --> int
	// preparedStatement
	public int insert(MemberDto member) throws SQLException {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		int    result = 0;
		String sql    = "insert into member1 values(? , ? , ? , sysdate)"; //oracle system date
		try {
			conn  = getConnection(); //3R Reuse
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1 , member.getId());//DTO저장된 값 받아 PreparedStatement에 저장
			pstmt.setString(2 , member.getPassword());
			pstmt.setString(3 , member.getName());
			result = pstmt.executeUpdate(); //sql실행 결과 result
					
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
}
