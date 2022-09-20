package och12;

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
	private static MemberDao instance;
	private MemberDao() {
	}
	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}
	
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context    ctx  = new InitialContext();
			DataSource ds   = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public int check(String id , String passwd) throws SQLException {
		int result = 1;
		String sql = "select passwd from member2 where id=?";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//id 일치해야 조회가 되므로 id는 일치된 상태
				 String dbPasswd = rs.getString(1); // sql수행 결과 받아온 passwd
				 if (dbPasswd.equals(passwd)) result = 1; // select된 dbPasswd 와 form에서 받아온 passwd 비교
				 else result = 0;
			} else    result = -1;
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
