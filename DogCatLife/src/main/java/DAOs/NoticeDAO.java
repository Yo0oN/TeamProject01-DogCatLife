package DAOs;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import TOs.BoardListsTO;
import TOs.BoardTO;
import TOs.NoticeTO;

public class NoticeDAO {
	private DataSource dataSource = null;
//	private String uploadPath = "C:\\Users\\kitcoop\\Desktop\\Git\\MyStudy2019.10\\webproject01\\DogCatLife\\src\\main\\webapp\\resources\\upload";
	private String uploadPath = "/var/lib/tomcat8/webapps/DogCatLifeUpload";
	
	public NoticeDAO() {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mariadb");
		} catch (NamingException e) {
			System.out.println("[에러1] : " + e.getMessage());
		}
	}

	public ArrayList boardList(String qseq) {
		// 글목록이 담길곳
		ArrayList<NoticeTO> noticeLists= new ArrayList();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();

			// 글 목록 - pseq에 따라 게시판번호, 글번호, 제목, 작성자번호, 닉네임, 조회수, 댓글수, 작성일, 수정일, 작성한지 얼마나
			// 시간이흘렀는가를 한페이지에 보여줄 만큼만 가져온 후 seq로 내림차순
			String sql = "";
			if (qseq == null || qseq.equals("0") ) {
				sql = "select seq, kinds, qseq, content, filename, wdate, subject from questions order by qseq";
				pstmt = conn.prepareStatement(sql);
			} else {
				sql = "select seq, kinds, qseq, content, filename, wdate, subject from questions where qseq=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, qseq);
			}
			rs = pstmt.executeQuery();

			while (rs.next()) {
				NoticeTO noticeTO = new NoticeTO();

				noticeTO.setSeq(rs.getString("seq"));
				noticeTO.setKinds(rs.getString("kinds"));
				noticeTO.setQseq(rs.getString("Qseq"));
				noticeTO.setContent(rs.getString("content"));
				noticeTO.setSubject(rs.getString("subject"));
				noticeTO.setFilename(rs.getString("filename"));
				noticeTO.setWdate(rs.getString("wdate"));

				noticeLists.add(noticeTO);
			}
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
		return noticeLists;
	}
}