package och12;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	// loginPro check method
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

	// confirmId 아이디 중복 체크 confirm method
	public int confirm(String id) throws SQLException {
		int result = 0;
		String sql = "select id from member2 where id=?";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) result = 1;
			else           result = 0;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs    != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
	// join data insert method
	public int insert(Member member) throws SQLException {
		int result = 0;
		String sql = "insert into member2 values(? , ? , ? , ? , ? , sysdate)";
		Connection        conn  = null;
		PreparedStatement pstmt = null;

		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1 , member.getId());
			pstmt.setString(2 , member.getPasswd());
			pstmt.setString(3 , member.getName());
			pstmt.setString(4 , member.getAddress());
			pstmt.setString(5 , member.getTel());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
	// joinPro3 img insert method
	public int insert3(Member member) throws SQLException {
		int result = 0;
		String sql = "insert into member2 values(? , ? , ? , ? , ? , sysdate , ?)";
		Connection        conn  = null;
		PreparedStatement pstmt = null;

		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1 , member.getId());
			pstmt.setString(2 , member.getPasswd());
			pstmt.setString(3 , member.getName());
			pstmt.setString(4 , member.getAddress());
			pstmt.setString(5 , member.getTel());
			pstmt.setString(6 , member.getImg_path());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
	// 회원명단 memberList list method
	public List<Member> list() throws SQLException {
		List<Member> list = new ArrayList<Member>(); // List 자식 ArrayList , List : interface 
		String sql = "select * from member2";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs    = pstmt.executeQuery();
			if (rs.next()) {
				do {
					Member member = new Member();
					member.setId      (rs.getString(1));
					member.setPasswd  (rs.getString(2));
					member.setName    (rs.getString(3));
					member.setAddress (rs.getString(4));
					member.setTel     (rs.getString(5));
					member.setReg_date(rs.getDate(6));
					list.add(member);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs    != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return list;
	}
	
	// 회원정보수정 select
	public Member select(String id) throws SQLException {
		Member member = new Member();
		String sql    = "select * from member2 where id=?";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setId      (rs.getString(1));
				member.setPasswd  (rs.getString(2));
				member.setName    (rs.getString(3));
				member.setAddress (rs.getString(4));
				member.setTel     (rs.getString(5));
				member.setReg_date(rs.getDate(6));
				member.setImg_path(rs.getString(7));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs    != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return member;
	}
	// updatePro 회원정보수정 update method
	public int update(Member member) throws SQLException {
		int result = 0;
		String sql = "update member2 set passwd = ? , name = ? , address = ? , tel = ?  where id=?";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1 , member.getPasswd());
			pstmt.setString(2 , member.getName());
			pstmt.setString(3 , member.getAddress());
			pstmt.setString(4 , member.getTel());
			pstmt.setString(5 , member.getId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
	// deletePro 회원정보삭제 delete method
	public int delete(String id , String passwd) throws SQLException {
		int result = 0;
		result = check(id , passwd);
		if (result != 1) return result;
		String sql = "delete from member2 where id=?";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1 , id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn  != null) conn.close();
		}
		return result;
	}
	
}
