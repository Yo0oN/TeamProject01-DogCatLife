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

import TOs.BoardTO;

public class Test {
	private DataSource dataSource = null;

	public Test() {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mariadb");
		} catch (NamingException e) {
			System.out.println("[에러1] : " + e.getMessage());
		}
	}

	public void getData() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<BoardTO> toLists = new ArrayList<BoardTO>();

		try {
			conn = dataSource.getConnection();

			// 가입자 수
			String sql = "select count(joindate) from user where joindate=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "날짜");
			pstmt.executeQuery();
			// 탈퇴 수
			sql = "select count(date) from usersecession where date like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "날짜%");
			pstmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
	}
}
