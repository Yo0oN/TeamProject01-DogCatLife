package DAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

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

	public ArrayList getUserData() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<ArrayList> list = new ArrayList<ArrayList>();
		ArrayList<Integer> joincountlist = new ArrayList<Integer>();
		ArrayList<Integer> leavecountlist = new ArrayList<Integer>();
		try {
			conn = dataSource.getConnection();

			// 가입자 수
			String sql = "";
			sql = "select cal.Days As Days, if(u.c is null, 0, u.c) as result from "
					+ "(SELECT a.Days FROM (SELECT curdate() - INTERVAL (a.a + (10 * b.a) + (100 * c.a)) DAY AS Days "
					+ "FROM (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS a "
					+ "CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS b "
					+ "CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS c "
					+ ") a WHERE a.Days >= curdate() - INTERVAL 6 DAY) cal left outer join " // 오늘부터 7일 전까지만 보이는 가상테이블
					+ "(select date_format(joindate, '%Y-%m-%d') j, count(*) c from user group by j) u "
					+ "on (u.j = cal.Days) order by cal.Days";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				joincountlist.add(rs.getInt(2));
			}

			list.add(joincountlist);
			// 탈퇴 수
			sql = "select cal.Days As Days, if(u.c is null, 0, u.c) as result from "
					+ "(SELECT a.Days FROM (SELECT curdate() - INTERVAL (a.a + (10 * b.a) + (100 * c.a)) DAY AS Days "
					+ "FROM (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS a "
					+ "CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS b "
					+ "CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS c) a "
					+ "WHERE a.Days >= curdate() - INTERVAL 6 DAY) cal left outer join "
					+ "(select date_format(date, '%Y-%m-%d') d, count(*) c from usersecession group by d) u "
					+ "on (u.d = cal.Days) order by cal.Days;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				leavecountlist.add(rs.getInt(2));
			}
			
			list.add(leavecountlist);
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
		return list;
	}

	public ArrayList getConData() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<ArrayList> list = new ArrayList<ArrayList>();
		ArrayList<Integer> todaycontents = new ArrayList<Integer>();
		ArrayList<Integer> todaycomments = new ArrayList<Integer>();
		try {
			conn = dataSource.getConnection();

			// 오늘 써진 글 수
			String sql = "";
			sql = "select cal.Days As Days, if(u.c is null, 0, u.c) as result from "
					+ "(SELECT a.Days FROM ( SELECT curdate() - INTERVAL (a.a + (10 * b.a) + (100 * c.a)) DAY AS Days FROM "
					+ "(SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS a "
					+ "CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS b "
					+ "CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS c "
					+ ") a WHERE a.Days >= curdate() - INTERVAL 7 DAY) cal left outer join "
					+ "(select date_format(wdate_ori, '%Y-%m-%d') d, count(*) c from board where pseq in(11, 12, 21, 22, 31) group by d ) u on (u.d = cal.Days) "
					+ "order by cal.Days";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				todaycontents.add(rs.getInt(2));
			}

			list.add(todaycontents);
			// 오늘 써진 댓글 수
			sql = "select cal.Days As Days, if(u.c is null, 0, u.c) as result from (SELECT a.Days FROM ( "
					+ "SELECT curdate() - INTERVAL (a.a + (10 * b.a) + (100 * c.a)) DAY AS Days FROM "
					+ "(SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS a "
					+ "CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS b "
					+ "CROSS JOIN (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) AS c "
					+ ") a WHERE a.Days >= curdate() - INTERVAL 7 DAY) cal left outer join "
					+ "(select date_format(cwdate_ori, '%Y-%m-%d') d, count(*) c from comment_board where seq in (select seq from board where pseq in(11, 12, 21, 22, 31)) group by d) u on (u.d = cal.Days) "
					+ "order by cal.Days";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				todaycomments.add(rs.getInt(2));
			}
			
			list.add(todaycomments);
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
		return list;
	}
}
