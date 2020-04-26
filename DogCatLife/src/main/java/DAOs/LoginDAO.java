package DAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import TOs.UserTO;
import mail.MailSender;

public class LoginDAO {
	private DataSource dataSource = null;
	
	public LoginDAO() {
		// TODO Auto-generated constructor stub
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource)envCtx.lookup("jdbc/mariadb");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		}
	}

	public UserTO loginOk(UserTO userTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		userTO.setFlag("1");
		try {
			conn = dataSource.getConnection();
			
			String sql = "select mseq, nickname from user where id=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userTO.getId());
			pstmt.setString(2, userTO.getPassword());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userTO.setMseq(rs.getString("mseq"));
				userTO.setNickname(rs.getString("nickname"));
				userTO.setFlag("0");
			}
		} catch(SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
		}
	
		return userTO;
	}

	public int joinUsedMail(String useremail) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int flag = 1;
		try {
			conn = dataSource.getConnection();

			String sql = "select email from user where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, useremail);
			rs = pstmt.executeQuery();

			// 중복되는 메일확인
			if (!rs.next()) {
				flag = 0;
			}
		} catch(SQLException e) {
			System.out.println("[에러1] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
		}
	
		return flag;
	}
	
	public int joinIDConfirm(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int flag = 1;
		try {
			conn = dataSource.getConnection();

			String sql = "select id from user where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			// 중복되는 id가 없다면 flag == 0
			if (!rs.next()) {
				flag = 0;
			}
		} catch(SQLException e) {
			System.out.println("[에러1] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
		}
	
		return flag;
	}

	public int joinOk(UserTO userTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;
		try {
			conn = dataSource.getConnection();
			
			String sql = "insert into user values (0,?,?,?,?,?,?,now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userTO.getId());
			pstmt.setString(2, userTO.getNickname());
			pstmt.setString(3, userTO.getPassword());
			pstmt.setString(4, userTO.getName());
			pstmt.setString(5, userTO.getPhone());
			pstmt.setString(6, userTO.getEmail());
			
			
			int result = pstmt.executeUpdate();
			if(result == 1) {
				flag = 0;
			}
		} catch(SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	
		return flag;
	}

	public int find_id_name_email_confirm(String username, String useremail) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int flag = 1;
		try {
			conn = dataSource.getConnection();
			
			String sql = "select mseq from user where name=? and email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, useremail);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = 0;
			}
		} catch(SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
		}
	
		return flag;
	}
	
	public String find_id_show(UserTO userTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();
			
			String sql = "select id from user where name=? and email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userTO.getName());
			pstmt.setString(2, userTO.getEmail());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userTO.setId(rs.getString("id"));
			}
		} catch(SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
		}
	
		return userTO.getId();
	}
	
	public int find_password_name_id_email_confirm(String username,String userid, String useremail) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int flag = 1;
		try {
			conn = dataSource.getConnection();
			
			String sql = "select mseq from user where name=? and id=? and email=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, userid);
			pstmt.setString(3, useremail);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = 0;
			}
		} catch(SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
		}
	
		return flag;
	}

	public UserTO find_password_change(UserTO userTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();

			String sql = "select mseq from user where name=? and id=? and email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userTO.getName());
			pstmt.setString(2, userTO.getId());
			pstmt.setString(3, userTO.getEmail());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userTO.setMseq(rs.getString("mseq"));
			}
		} catch(SQLException e) {
			System.out.println("[에러1] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
		}
	
		return userTO;
	}

	public int find_password_change_ok(UserTO userTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;
		try {
			conn = dataSource.getConnection();

			String sql = "update user set password=? where mseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userTO.getPassword());
			pstmt.setString(2, userTO.getMseq());
			
			int result = pstmt.executeUpdate();
			
			if (result == 1) {
				flag = 0;
			}
		} catch(SQLException e) {
			System.out.println("[에러1] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	
		return flag;
	}
}