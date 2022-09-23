package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	private static BoardDao instance;
	private BoardDao() {};
	public static BoardDao getInstance() {
		if (instance == null) {
			instance = new BoardDao();
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context    ctx = new InitialContext();
			DataSource ds  = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public int getTotalCnt() throws SQLException {
		int    totCnt = 0;
		String sql    = "select count(*) from board";
		Connection conn  = null;
		Statement  stmt  = null;
		ResultSet  rs    = null;
		try {
			conn  = getConnection();
			stmt  = conn.createStatement();
			rs    = stmt.executeQuery(sql);
			if (rs.next()) totCnt = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("getTotalCnt e.getMessage() -> " + e.getMessage());
		} finally {
			if (rs   != null) rs.close(); 
			if (stmt != null) stmt.close(); 
			if (conn != null) conn.close(); 
		}
		return totCnt;
	}
	
	public List<Board> boardList(int startRow , int endRow) throws SQLException {
		List<Board> list = new ArrayList<Board>();
		String sql = "SELECT * FROM ( SELECT rownum rn , a.* FROM (select * from board order by ref desc,re_step) a)WHERE rn BETWEEN ? AND ?";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setEmail(rs.getString("email"));
				board.setReadcount(rs.getInt("readcount"));
				board.setIp(rs.getString("ip"));
				board.setRef(rs.getInt("ref"));
				//board.setRe_level(rs.getInt("re_step"));
				board.setRe_level(rs.getInt("re_level"));
				board.setRe_step(rs.getInt("re_step"));
				board.setReg_date(rs.getDate("reg_date"));
				list.add(board);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs    != null)  rs.close(); 
			if (pstmt != null)  pstmt.close(); 
			if (conn  != null)  conn.close(); 
		}
		return list;
	}
	
	public Board select(int num) {
		Board board = new Board();
		
		return board;
	}
}
