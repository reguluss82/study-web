package oAjax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

// Singleton + DBCP
public class MemberDao {
	// Singleton --> Resource 절감
	private static MemberDao instance;
	// Default
	private MemberDao() {
	}
	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}
	
	// DBCP
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		
		try {
			Context    ctx = new InitialContext();
			DataSource ds  = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB"); // DataSource로 cast
			conn           = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	// confirm
	public int confirm(String id) throws SQLException {
		int result = 1;
		// member1 if 있면   1
		//            없으면 0
		String            sql   = "select id from member1 where id=?";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) result = 1;
			else result = 0;
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs    != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
}
