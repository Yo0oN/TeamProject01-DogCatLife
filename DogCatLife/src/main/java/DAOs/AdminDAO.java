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

import TOs.AdminsTO;
import TOs.BoardListsTO;
import TOs.BoardTO;
import TOs.PersonalATO;
import TOs.PersonalQTO;
import TOs.QuestionsTO;
import TOs.UserTO;

public class AdminDAO {
	private DataSource dataSource = null;
	//학원용
	//private String path = "L:\\Java\\workspace\\AdminDogCatLife\\src\\main\\webapp\\resources\\upload";
	//집용
	//private String path = "D:\\Java\\workspace\\AdminDogCatLife\\src\\main\\webapp\\resources\\upload";
	//배포용
	private String path = "/var/lib/tomcat8/webapps/DogCatLife/resources/upload";
	
	public AdminDAO() {
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
	
	public BoardListsTO mainList( BoardListsTO boardListsTO ) {
		
		ArrayList<BoardTO> boardLists = new ArrayList<BoardTO>();
		ArrayList<BoardTO> commentLists = new ArrayList<BoardTO>();
		ArrayList<PersonalQTO> qnaLists = new ArrayList<PersonalQTO>();
		ArrayList<UserTO> userLists = new ArrayList<UserTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select seq, subject, pseq_kind, wdate_ori " + 
					"from board b inner join board_kind bk " + 
					"on b.pseq=bk.pseq and b.pseq!='41' and b.pseq!='42' order by wdate_ori desc limit 0, 6;";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			int i=1;
			//게시글
			while(rs.next()) {
				
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setPseq_kind(rs.getString("pseq_kind"));
				to.setWdate_ori(rs.getString("wdate_ori"));
				boardLists.add(to);
			}
			
			boardListsTO.setBoardLists(boardLists);
			
						
			//댓글
			sql = "select cb.seq seq, cseq, pseq_kind, comment, cwdate_ori "
					+ "from comment_board cb inner join board b On cb.seq = b.seq "
					+ "inner join board_kind bk On b.pseq = bk.pseq order by cwdate_ori desc limit 0, 6";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				to.setCseq(rs.getString("cseq"));
				to.setComment(rs.getString("comment"));
				to.setPseq_kind(rs.getString("pseq_kind"));
				to.setCwdate_ori(rs.getString("cwdate_ori"));
				commentLists.add(to);
			}
			
			boardListsTO.setCommentLists(commentLists);
						
			//1:1질문 
			sql = "select seq, mseq, nickname, subject, content, wdate from personal_question order by wdate desc limit 0, 8";
			pstmt = conn.prepareStatement(sql);
			 
			rs = pstmt.executeQuery();
			  
			while(rs.next()) {
				
				PersonalQTO to = new PersonalQTO();
				
				to.setSeq(rs.getString("seq"));
				to.setMseq(rs.getString("mseq"));
				to.setNickname(rs.getString("nickname"));
				to.setSubject(rs.getString("subject"));
				to.setContent(rs.getString("content"));
				to.setWdate(rs.getString("wdate"));
				 
				qnaLists.add(to); 
			 
			}
			 
			 boardListsTO.setQnLists(qnaLists);
			 
			
			//회원
			sql = "select mseq, id, nickname, name, phone, email, joindate from user order by joindate desc limit 0, 4";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				
				UserTO to = new UserTO();
				to.setMseq(rs.getString("mseq"));
				to.setId(rs.getString("id"));
				to.setNickname(rs.getString("nickname"));
				to.setName(rs.getString("name"));
				to.setPhone(rs.getString("phone"));
				to.setEmail(rs.getString("email"));
				to.setJoindate(rs.getString("joindate"));
				
				userLists.add(to);
			}
			
			boardListsTO.setUserLists(userLists);
			
			//오늘작성된 게시글 개수			
			sql = "select subject, wdate_ori from board where wdate_ori between concat(curdate(),' 00:00:00') and concat(curdate(),' 23:59:59') order by wdate_ori desc;";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int boardToday=0;
			
			while(rs.next()) {
				
				boardToday++;
			}
			boardListsTO.setBoardToday(boardToday);			
			
			//오늘작성된 댓글 개수			
			sql = "select comment, cwdate_ori from comment_board where cwdate_ori between concat(curdate(),' 00:00:00') and concat(curdate(),' 23:59:59') order by cwdate_ori desc limit 0, 6";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int commentToday=0;
			
			while(rs.next()) {
								
				commentToday++;
			}
			
			boardListsTO.setCommentToday(commentToday);
			
			//오늘가입한 회원 수		
			sql = "select id, joindate from user where joindate between concat(curdate(),' 00:00:00') and concat(curdate(),' 23:59:59') order by joindate desc";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int userToday=0;
			
			while(rs.next()) {
				UserTO to = new UserTO();
				
				userToday++;
			}
			
			boardListsTO.setUserToday(userToday);
			
			//오늘 탈퇴한 회원
			int count = 0;
			sql = "select date from usersecession where date between concat(curdate(),' 00:00:00') and concat(curdate(), ' 23:59:59')";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				count++;
			}
			
			boardListsTO.setUserSecession(count);
			
			//총 탈퇴한 회원
			
			sql = "select count('mseq') mseq from usersecession";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				boardListsTO.setTotalSecession(rs.getInt("mseq"));
			}
			
			//총게시글			
			sql = "select count('seq') seq from board where pseq!='41' and pseq!='42'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) { boardListsTO.setTotalBoard(rs.getInt("seq")); }
			
			//총코멘트
			sql = "select count('cseq') cseq from comment_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) { boardListsTO.setTotalComment(rs.getInt("cseq")); }
			
			//총회원
			sql = "select count('mseq') mseq from user";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) { boardListsTO.setTotalUser(rs.getInt("mseq")); }
			
		} catch(SQLException e) {
			System.out.println("[에러1] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return boardListsTO;
	}
	
	public BoardListsTO userList(BoardListsTO userListsTO) {
		ArrayList<UserTO> userLists = new ArrayList<UserTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select mseq, id, nickname, name, phone, email, joindate from user order by mseq desc";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				UserTO to = new UserTO();
				to.setMseq(rs.getString("mseq"));
				to.setId(rs.getString("id"));
				to.setNickname(rs.getString("nickname"));
				to.setName(rs.getString("name"));
				to.setPhone(rs.getString("phone"));
				to.setEmail(rs.getString("email"));
				to.setJoindate(rs.getString("joindate"));
				
				userLists.add(to);
			}
			
			userListsTO.setUserLists(userLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return userListsTO;
	}
	
	public BoardListsTO userList(BoardListsTO userListsTO, String sdate, String edate) {
		
		ArrayList<UserTO> userLists = new ArrayList<UserTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select mseq, id, nickname, name, phone, email, joindate from user where joindate between ? and ? order by mseq desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sdate);
			pstmt.setString(2, edate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserTO to = new UserTO();
				to.setMseq(rs.getString("mseq"));
				to.setId(rs.getString("id"));
				to.setNickname(rs.getString("nickname"));
				to.setName(rs.getString("name"));
				to.setPhone(rs.getString("phone"));
				to.setEmail(rs.getString("email"));
				to.setJoindate(rs.getString("joindate"));
				
				userLists.add(to);
			}
			
			userListsTO.setUserLists(userLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return userListsTO;
	}
	
	public BoardListsTO userList(BoardListsTO userListsTO, String searchopt, String searchkey, String sdate, String edate) {
		
		ArrayList<UserTO> userLists = new ArrayList<UserTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dataSource.getConnection();
			
			if(searchopt.equals("id")) {
				sql = "select mseq, id, nickname, name, phone, email, joindate from user where id like ? and joindate between ? and ? order by mseq desc";
			}else if(searchopt.equals("name")) {
				sql = "select mseq, id, nickname, name, phone, email, joindate from user where name like ? and joindate between ? and ? order by mseq desc";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchkey);
			pstmt.setString(2, sdate);
			pstmt.setString(3, edate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserTO to = new UserTO();
				to.setMseq(rs.getString("mseq"));
				to.setId(rs.getString("id"));
				to.setNickname(rs.getString("nickname"));
				to.setName(rs.getString("name"));
				to.setPhone(rs.getString("phone"));
				to.setEmail(rs.getString("email"));
				to.setJoindate(rs.getString("joindate"));
				
				userLists.add(to);
			}
			
			userListsTO.setUserLists(userLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return userListsTO;
	}
	
	public BoardListsTO searchUsersWithKey(BoardListsTO userListsTO, String searchopt, String searchkey) {
		
		ArrayList<UserTO> userLists = new ArrayList<UserTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dataSource.getConnection();
			System.out.println(searchopt+"DAO");
			System.out.println(searchkey+"DAO");
			if(searchopt.equals("id")) {
				sql = "select mseq, id, nickname, name, phone, email, joindate from user where id like ? order by mseq desc";
			}else if(searchopt.equals("name")) {				
				sql = "select mseq, id, nickname, name, phone, email, joindate from user where name like ? order by mseq desc";
			}		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchkey);
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				UserTO to = new UserTO();
				to.setMseq(rs.getString("mseq"));
				to.setId(rs.getString("id"));
				to.setNickname(rs.getString("nickname"));
				to.setName(rs.getString("name"));
				to.setPhone(rs.getString("phone"));
				to.setEmail(rs.getString("email"));
				to.setJoindate(rs.getString("joindate"));
				
				userLists.add(to);
			}
			
			userListsTO.setUserLists(userLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return userListsTO;
	}
	
	public int adminUsersDelete(String mseq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 2;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "delete from comment_board where cmseq=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mseq);
			pstmt.executeUpdate();
			
			sql = "delete from board where mseq=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mseq);
			pstmt.executeUpdate();
			
			sql = "delete from personal_answers where seq=(select seq from personal_question where mseq=?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mseq);
			pstmt.executeUpdate();
			
			sql = "delete from personal_question where mseq=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mseq);
			pstmt.executeUpdate();
			
			sql = "insert from usersecession values(?,now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mseq);
			pstmt.executeUpdate();
			
			sql = "delete from user where mseq=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mseq);
				
			int result = pstmt.executeUpdate();
			if(result == 0) {
				flag = 1;
			} else if(result == 1) {
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
	
	public int adminUsersMultiDelete(String mseq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
		
		try {
			conn = dataSource.getConnection();
			String[] seqarr = mseq.split(",");
			for(int i=0; i<seqarr.length;i++) {
				
				String sql = "delete from comment_board where cmseq=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seqarr[i]);
				pstmt.executeUpdate();
				
				sql = "delete from board where mseq=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seqarr[i]);
				pstmt.executeUpdate();
				
				sql = "delete from personal_answers where seq=(select seq from personal_question where mseq=?) ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seqarr[i]);
				pstmt.executeUpdate();
				
				sql = "delete from personal_question where mseq=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seqarr[i]);
				pstmt.executeUpdate();
				
				sql = "insert from usersecession values(?,now())";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seqarr[i]);
				pstmt.executeUpdate();
				
				sql = "delete from user where mseq=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seqarr[i]);
					
				int result = pstmt.executeUpdate();
				
				flag += result;
			}
		} catch(SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return flag;
}
	//議곌굔 X
	public BoardListsTO boardList(BoardListsTO boardListsTO) {
		
		// 湲�紐⑸줉�씠 �떞湲멸납
		ArrayList<BoardTO> boardLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori from board where pseq!='41' and pseq!='42' order by seq desc";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				to.setPseq(rs.getString("pseq"));
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setMseq(rs.getString("mseq"));
				to.setWriter(rs.getString("writer"));
				to.setContent(rs.getString("content"));
				to.setHit(rs.getString("hit"));
				to.setWdate_ori(rs.getString("wdate_ori"));
				boardLists.add(to);
			}
			
			boardListsTO.setBoardLists(boardLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return boardListsTO;
	}
	//寃뚯떆�뙋蹂�
	public BoardListsTO boardList(BoardListsTO boardListsTO,String pseq) {
		
		ArrayList<BoardTO> boardLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq=? order by seq desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				to.setPseq(rs.getString("pseq"));
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setMseq(rs.getString("mseq"));
				to.setWriter(rs.getString("writer"));
				to.setContent(rs.getString("content"));
				to.setHit(rs.getString("hit"));
				to.setWdate_ori(rs.getString("wdate_ori"));
				boardLists.add(to);
			}
			
			boardListsTO.setBoardLists(boardLists);
						
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return boardListsTO;
	}
	//�벑濡앹씪蹂�
	public BoardListsTO boardList(BoardListsTO boardListsTO, String sdate, String edate) {
		
		ArrayList<BoardTO> boardLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq!='41' and pseq!='42' and wdate_ori between ? and ? order by seq desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sdate);
			pstmt.setString(2, edate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				to.setPseq(rs.getString("pseq"));
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setMseq(rs.getString("mseq"));
				to.setWriter(rs.getString("writer"));
				to.setContent(rs.getString("content"));
				to.setHit(rs.getString("hit"));
				to.setWdate_ori(rs.getString("wdate_ori"));
				boardLists.add(to);
			}
			
			boardListsTO.setBoardLists(boardLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return boardListsTO;
	}
	//寃뚯떆�뙋蹂� , �벑濡앹씪蹂�
	public BoardListsTO boardList(BoardListsTO boardListsTO, String pseq, String sdate, String edate) {
		
		ArrayList<BoardTO> boardLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq=? and wdate_ori between ? and ? order by seq desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pseq);
			pstmt.setString(2, sdate);
			pstmt.setString(3, edate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				to.setPseq(rs.getString("pseq"));
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setMseq(rs.getString("mseq"));
				to.setWriter(rs.getString("writer"));
				to.setContent(rs.getString("content"));
				to.setHit(rs.getString("hit"));
				to.setWdate_ori(rs.getString("wdate_ori"));
				boardLists.add(to);
			}
			
			boardListsTO.setBoardLists(boardLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return boardListsTO;
	}
	//�벑濡앹씪蹂� , �궎�썙�뱶寃��깋
	public BoardListsTO boardList(BoardListsTO boardListsTO, String searchopt, String searchkey, String sdate, String edate) {
		
		ArrayList<BoardTO> boardLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dataSource.getConnection();
			
			if(searchopt.equals("subject")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq!='41' and pseq!='42' and subject like ? and wdate_ori between ? and ? order by seq desc";
			}else if(searchopt.equals("content")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq!='41' and pseq!='42' and content like ? and wdate_ori between ? and ? order by seq desc";
			}else if(searchopt.equals("writer")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq!='41' and pseq!='42' and writer like ? and wdate_ori between ? and ? order by seq desc";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchkey);
			pstmt.setString(2, sdate);
			pstmt.setString(3, edate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				to.setPseq(rs.getString("pseq"));
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setMseq(rs.getString("mseq"));
				to.setWriter(rs.getString("writer"));
				to.setContent(rs.getString("content"));
				to.setHit(rs.getString("hit"));
				to.setWdate_ori(rs.getString("wdate_ori"));
				boardLists.add(to);
			}
			
			boardListsTO.setBoardLists(boardLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return boardListsTO;
	}
	//寃뚯떆�뙋蹂�, �벑濡앹씪蹂� , �궎�썙�뱶寃��깋
	public BoardListsTO boardList(BoardListsTO boardListsTO, String pseq, String searchopt, String searchkey, String sdate, String edate) {
		
		ArrayList<BoardTO> boardLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = dataSource.getConnection();
			
			if(searchopt.equals("subject")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq=? and subject like ? and wdate_ori between ? and ? order by seq desc";
			}else if(searchopt.equals("content")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq=? and content like ? and wdate_ori between ? and ? order by seq desc";
			}else if(searchopt.equals("writer")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq=? and writer like ? and wdate_ori between ? and ? order by seq desc";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pseq);
			pstmt.setString(2, searchkey);
			pstmt.setString(3, sdate);
			pstmt.setString(4, edate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				to.setPseq(rs.getString("pseq"));
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setMseq(rs.getString("mseq"));
				to.setWriter(rs.getString("writer"));
				to.setContent(rs.getString("content"));
				to.setHit(rs.getString("hit"));
				to.setWdate_ori(rs.getString("wdate_ori"));
				boardLists.add(to);
			}
			
			boardListsTO.setBoardLists(boardLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return boardListsTO;
	}
	//�궎�썙�뱶寃��깋
	public BoardListsTO searchContentsWithKey(BoardListsTO boardListsTO, String searchopt, String searchkey) {
		
		ArrayList<BoardTO> boardLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dataSource.getConnection();
			
			if(searchopt.equals("subject")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq!='41' and pseq!='42' and subject like ? order by seq desc";
			}else if(searchopt.equals("content")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq!='41' and pseq!='42' and content like ? order by seq desc";
			}else if(searchopt.equals("writer")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq!='41' and pseq!='42' and writer like ? order by seq desc";
			}			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchkey);
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				BoardTO to = new BoardTO();
				to.setPseq(rs.getString("pseq"));
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setMseq(rs.getString("mseq"));
				to.setWriter(rs.getString("writer"));
				to.setContent(rs.getString("content"));
				to.setHit(rs.getString("hit"));
				to.setWdate_ori(rs.getString("wdate_ori"));
				boardLists.add(to);
			}
			
			boardListsTO.setBoardLists(boardLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return boardListsTO;
	}
	//寃뚯떆�뙋蹂� �궎�썙�뱶寃��깋
	public BoardListsTO searchContentsWithKey(BoardListsTO boardListsTO, String pseq , String searchopt, String searchkey) {
			
		ArrayList<BoardTO> boardLists = new ArrayList<BoardTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dataSource.getConnection();
			
			if(searchopt.equals("subject")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq=? and subject like ? order by seq desc";
			}else if(searchopt.equals("content")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq=? and content like ? order by seq desc";
			}else if(searchopt.equals("writer")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq=? and writer like ? order by seq desc";
			}			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pseq);
			pstmt.setString(2, searchkey);
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				BoardTO to = new BoardTO();
				to.setPseq(rs.getString("pseq"));
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setMseq(rs.getString("mseq"));
				to.setWriter(rs.getString("writer"));
				to.setContent(rs.getString("content"));
				to.setHit(rs.getString("hit"));
				to.setWdate_ori(rs.getString("wdate_ori"));
				boardLists.add(to);
			}
			
			boardListsTO.setBoardLists(boardLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return boardListsTO;
	}
	
	public ArrayList<BoardTO> boardView(String seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<BoardTO> boardLists = new ArrayList<BoardTO>();

		try {
			conn = dataSource.getConnection();

			// 게시물 가져오기
			String sql = "select pseq, seq, subject, mseq, writer, content, date_format(wdate_ori,'%Y-%m-%d %H:%i:%s') wdate_ori, date_format(wdate_mod,'%Y-%m-%d %H:%i:%s') wdate_mod, hit, filename_new from board  where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				BoardTO boardTO = new BoardTO();

				boardTO.setPseq(rs.getString("pseq"));
				boardTO.setSeq(rs.getString("seq"));
				boardTO.setSubject(rs.getString("subject"));
				boardTO.setMseq(rs.getString("mseq"));
				boardTO.setWriter(rs.getString("writer"));
				boardTO.setContent(rs.getString("content"));
				boardTO.setWdate_ori(rs.getString("wdate_ori"));
				boardTO.setWdate_mod(rs.getString("wdate_mod"));
				boardTO.setHit(rs.getString("hit"));
				boardTO.setFilename_new(rs.getString("filename_new"));

				boardLists.add(boardTO);
			}

			// 댓글 가져오기
			sql = "select cseq, cmseq, cwriter, comment, date_format(cwdate_ori,'%Y-%m-%d %H:%i:%s') cwdate_ori, date_format(cwdate_mod,'%Y-%m-%d %H:%i:%s') cwdate_mod from comment_board where seq=? order by cseq";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, seq);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardTO boardTO = new BoardTO();

				boardTO.setCseq(rs.getString("cseq"));
				boardTO.setCmseq(rs.getString("cmseq"));
				boardTO.setCwriter(rs.getString("cwriter"));
				boardTO.setComment(rs.getString("comment"));
				boardTO.setCwdate_ori(rs.getString("cwdate_ori"));
				boardTO.setCwdate_mod(rs.getString("cwdate_mod"));

				boardLists.add(boardTO);
			}
		} catch (SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (rs != null)	try { rs.close(); } catch (SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try { conn.close(); } catch (SQLException e) {}
		}

		return boardLists;
	}
	
	public ArrayList<BoardTO> boardModify(String seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<BoardTO> boardLists = new ArrayList<BoardTO>();

		try {
			conn = dataSource.getConnection();

			// 게시물 가져오기
			String sql = "select pseq, seq, subject, mseq, writer, content, date_format(wdate_ori,'%Y-%m-%d %H:%i:%s') wdate_ori, date_format(wdate_mod,'%Y-%m-%d %H:%i:%s') wdate_mod, hit, filename_new from board  where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				BoardTO boardTO = new BoardTO();

				boardTO.setPseq(rs.getString("pseq"));
				boardTO.setSeq(rs.getString("seq"));
				boardTO.setSubject(rs.getString("subject"));
				boardTO.setMseq(rs.getString("mseq"));
				boardTO.setWriter(rs.getString("writer"));
				boardTO.setContent(rs.getString("content"));
				boardTO.setWdate_ori(rs.getString("wdate_ori"));
				boardTO.setWdate_mod(rs.getString("wdate_mod"));
				boardTO.setHit(rs.getString("hit"));
				boardTO.setFilename_new(rs.getString("filename_new"));

				boardLists.add(boardTO);
			}

			// 댓글 가져오기
			sql = "select cseq, cmseq, cwriter, comment, date_format(cwdate_ori,'%Y-%m-%d %H:%i:%s') cwdate_ori, date_format(cwdate_mod,'%Y-%m-%d %H:%i:%s') cwdate_mod from comment_board where seq=? order by cseq";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, seq);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardTO boardTO = new BoardTO();

				boardTO.setCseq(rs.getString("cseq"));
				boardTO.setCmseq(rs.getString("cmseq"));
				boardTO.setCwriter(rs.getString("cwriter"));
				boardTO.setComment(rs.getString("comment"));
				boardTO.setCwdate_ori(rs.getString("cwdate_ori"));
				boardTO.setCwdate_mod(rs.getString("cwdate_mod"));

				boardLists.add(boardTO);
			}
		} catch (SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try { conn.close(); } catch (SQLException e) {}
		}

		return boardLists;
	}
	
	public int boardModifyOk(BoardTO boardTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int flag = 1;
		String oldfilename = "";

		try {
			
			conn = dataSource.getConnection();

			String sql = "select filename_new from board where seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardTO.getSeq());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				oldfilename = rs.getString("filename_new");
			}

			// 파일이 바뀌지 않았다면 파일수정안함
			if (boardTO.getFilename_ori().equals("")) {
				sql = "update board set subject=?, content=? where seq=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, boardTO.getSubject());
				pstmt.setString(2, boardTO.getContent());
				pstmt.setString(3, boardTO.getSeq());

			} else {
				// 파일이 바뀌었다면 파일도 수정함
				sql = "update board set subject=?, content=?, filename_ori=?, filename_new=?, wdate_mod=now() where seq=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, boardTO.getSubject());
				pstmt.setString(2, boardTO.getContent());
				pstmt.setString(3, boardTO.getFilename_ori());
				pstmt.setString(4, boardTO.getFilename_new());
				pstmt.setString(5, boardTO.getSeq());
			}
			int result = pstmt.executeUpdate();

			if (result == 1) {
				flag = 0;
				if (!boardTO.getFilename_ori().equals("") && !oldfilename.equals("")) {
					File file = new File(path + "\\" + oldfilename);
					file.delete();
				}
			}

		} catch (SQLException e) {
			System.out.println("error : " + e.getMessage());
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException e) {}			
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try {	conn.close(); } catch (SQLException e) {}			
		}
		return flag;
	}
	
	public int adminContentsDelete(BoardTO boardTO) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag = 2;
		
		try {
			conn = dataSource.getConnection();

			String sql = "select filename_new from board where seq =?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, boardTO.getSeq());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				boardTO.setFilename_new(rs.getString("filename_new"));

				// 해당 글의 댓글먼저 삭제
				sql = "delete from comment_board where seq=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, boardTO.getSeq());
				pstmt.executeUpdate();

				// 글 삭제
				sql = "delete from board where seq=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, boardTO.getSeq());

				int result = pstmt.executeUpdate();
				
				// 삭제성공했으면 flag는 0, 아니면 1
				if (result == 1) {
					flag = 0;
					if (boardTO.getFilename_new() != null || boardTO.getFilename_new().equals("")) {
						// 만약 파일이 있다면 파일 삭제
						File file = new File(path + "\\" + boardTO.getFilename_new());
						file.delete();
					}
				} else if (result == 0) {
					flag = 1;
				}

			} else if (!rs.next()) {
				// 사진이름을 얻어오지못했다면 삭제불가능. 여기서 끝냄.
				flag = 2;
			}
		} catch (SQLException e) {
			System.out.println("error : " + e.getMessage());
		} finally {
			if (rs != null)  try {	rs.close(); } catch (SQLException e) {}	
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try { conn.close(); } catch (SQLException e) {}
		}
		return flag;	
	}
	
	public int adminContentsMultiDelete(BoardTO boardTO) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag = 0;
		try {
			String[] seqarr = boardTO.getSeq().split(",");
			
			conn = dataSource.getConnection();
			
			for(int i=0;i<seqarr.length;i++) {
				String sql = "select filename_new from board where seq =?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, seqarr[i]);

				rs = pstmt.executeQuery();
				if (rs.next()) {
					boardTO.setFilename_new(rs.getString("filename_new"));

					// 해당 글의 댓글먼저 삭제
					sql = "delete from comment_board where seq=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, seqarr[i]);
					pstmt.executeUpdate();

					// 글 삭제
					sql = "delete from board where seq=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, seqarr[i]);

					int result = pstmt.executeUpdate();
					
					// 삭제성공했으면 flag는 0, 아니면 1
					if (result == 1) {
						if (boardTO.getFilename_new() != null || boardTO.getFilename_new().equals("")) {
							// 만약 파일이 있다면 파일 삭제
							File file = new File(path + "\\" + boardTO.getFilename_new());
							file.delete();
						}
						flag+=result;
					} else if (result == 0) {
						flag += result;
					}				
				
				}
			}
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return flag;	
	}
	
	public BoardListsTO commentList(BoardListsTO commentListsTO) {

		ArrayList<BoardTO> commentLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select cb.seq, b.pseq, pseq_kind, cseq, cmseq, cwriter, comment, cwdate_ori "
					+ "from comment_board cb inner join board b On cb.seq = b.seq "
					+ "inner join board_kind bk On b.pseq = bk.pseq order by cseq desc";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				to.setPseq(rs.getString("pseq"));
				to.setPseq_kind(rs.getString("pseq_kind"));
				to.setCseq(rs.getString("cseq"));
				to.setCwriter(rs.getString("cwriter"));
				to.setComment(rs.getString("comment"));
				to.setCwdate_ori(rs.getString("cwdate_ori"));
				
				commentLists.add(to);
			}
			
			commentListsTO.setBoardLists(commentLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return commentListsTO;
	}
	
	public BoardListsTO commentList(BoardListsTO commentListsTO, String pseq) {
		
		ArrayList<BoardTO> commentLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select cb.seq, b.pseq, pseq_kind, cseq, cmseq, cwriter, comment, cwdate_ori "
					+ "from comment_board cb inner join board b On cb.seq = b.seq "
					+ "inner join board_kind bk On b.pseq = bk.pseq where b.pseq=? order by cseq desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				to.setPseq(rs.getString("pseq"));
				to.setPseq_kind(rs.getString("pseq_kind"));
				to.setCseq(rs.getString("cseq"));
				to.setCwriter(rs.getString("cwriter"));
				to.setComment(rs.getString("comment"));
				to.setCwdate_ori(rs.getString("cwdate_ori"));
				
				commentLists.add(to);
			}
			commentListsTO.setBoardLists(commentLists);
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return commentListsTO;
	}
	//�벑濡앹씪蹂�
	public BoardListsTO commentList(BoardListsTO commentListsTO, String sdate, String edate) {
		
		ArrayList<BoardTO> commentLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select cb.seq, b.pseq, pseq_kind, cseq, cmseq, cwriter, comment, cwdate_ori "
					+ "from comment_board cb inner join board b On cb.seq = b.seq "
					+ "inner join board_kind bk On b.pseq = bk.pseq where cwdate_ori between ? and ? order by cseq desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sdate);
			pstmt.setString(2, edate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				to.setPseq(rs.getString("pseq"));
				to.setPseq_kind(rs.getString("pseq_kind"));
				to.setCseq(rs.getString("cseq"));
				to.setCwriter(rs.getString("cwriter"));
				to.setComment(rs.getString("comment"));
				to.setCwdate_ori(rs.getString("cwdate_ori"));
				
				commentLists.add(to);
			}
			commentListsTO.setBoardLists(commentLists);
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return commentListsTO;
	}
	//寃뚯떆�뙋蹂� , �벑濡앹씪蹂�
	public BoardListsTO commentList(BoardListsTO commentListsTO, String pseq, String sdate, String edate) {
		
		ArrayList<BoardTO> commentLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select cb.seq, b.pseq, pseq_kind, cseq, cmseq, cwriter, comment, cwdate_ori "
					+ "from comment_board cb inner join board b On cb.seq = b.seq "
					+ "inner join board_kind bk On b.pseq = bk.pseq where b.pseq=? and cwdate_ori between ? and ? order by cseq desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pseq);
			pstmt.setString(2, sdate);
			pstmt.setString(3, edate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				to.setPseq(rs.getString("pseq"));
				to.setPseq_kind(rs.getString("pseq_kind"));
				to.setCseq(rs.getString("cseq"));
				to.setCwriter(rs.getString("cwriter"));
				to.setComment(rs.getString("comment"));
				to.setCwdate_ori(rs.getString("cwdate_ori"));
				
				commentLists.add(to);
			}
			commentListsTO.setBoardLists(commentLists);
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return commentListsTO;
	}
	//�벑濡앹씪蹂� , �궎�썙�뱶寃��깋
	public BoardListsTO commentList(BoardListsTO commentListsTO, String searchopt, String searchkey, String sdate, String edate) {
		
		ArrayList<BoardTO> commentLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dataSource.getConnection();
			
			if(searchopt.equals("comment")) {
				sql = "select cb.seq, b.pseq, pseq_kind, cseq, cmseq, cwriter, comment, cwdate_ori "
						+ "from comment_board cb inner join board b On cb.seq = b.seq "
						+ "inner join board_kind bk On b.pseq = bk.pseq where comment like ? and cwdate_ori between ? and ? order by cseq desc";
			}else if(searchopt.equals("cwriter")) {
				sql = "select cb.seq, b.pseq, pseq_kind, cseq, cmseq, cwriter, comment, cwdate_ori "
						+ "from comment_board cb inner join board b On cb.seq = b.seq "
						+ "inner join board_kind bk On b.pseq = bk.pseq where cwriter like ? and cwdate_ori between ? and ? order by cseq desc";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchkey);
			pstmt.setString(2, sdate);
			pstmt.setString(3, edate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				to.setPseq(rs.getString("pseq"));
				to.setPseq_kind(rs.getString("pseq_kind"));
				to.setCseq(rs.getString("cseq"));
				to.setCwriter(rs.getString("cwriter"));
				to.setComment(rs.getString("comment"));
				to.setCwdate_ori(rs.getString("cwdate_ori"));
				
				commentLists.add(to);
			}
			commentListsTO.setBoardLists(commentLists);
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return commentListsTO;
	}
	//寃뚯떆�뙋蹂�, �벑濡앹씪蹂� , �궎�썙�뱶寃��깋
	public BoardListsTO commentList(BoardListsTO commentListsTO, String pseq, String searchopt, String searchkey, String sdate, String edate) {
		
		ArrayList<BoardTO> commentLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = dataSource.getConnection();
			
			if(searchopt.equals("comment")) {
				sql = "select cb.seq, b.pseq, pseq_kind, cseq, cmseq, cwriter, comment, cwdate_ori "
						+ "from comment_board cb inner join board b On cb.seq = b.seq "
						+ "inner join board_kind bk On b.pseq = bk.pseq where b.pseq=? and comment like ? and cwdate_ori between ? and ? order by cseq desc";
			}else if(searchopt.equals("cwriter")) {
				sql = "select cb.seq, b.pseq, pseq_kind, cseq, cmseq, cwriter, comment, cwdate_ori "
						+ "from comment_board cb inner join board b On cb.seq = b.seq "
						+ "inner join board_kind bk On b.pseq = bk.pseq where b.pseq=? and cwriter like ? and cwdate_ori between ? and ? order by cseq desc";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pseq);
			pstmt.setString(2, searchkey);
			pstmt.setString(3, sdate);
			pstmt.setString(4, edate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				to.setPseq(rs.getString("pseq"));
				to.setPseq_kind(rs.getString("pseq_kind"));
				to.setCseq(rs.getString("cseq"));
				to.setCwriter(rs.getString("cwriter"));
				to.setComment(rs.getString("comment"));
				to.setCwdate_ori(rs.getString("cwdate_ori"));
				
				commentLists.add(to);
			}
			commentListsTO.setBoardLists(commentLists);
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return commentListsTO;
	}
	//�궎�썙�뱶寃��깋
	public BoardListsTO searchCommentsWithKey(BoardListsTO commentListsTO, String searchopt, String searchkey) {

		ArrayList<BoardTO> commentLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dataSource.getConnection();
			
			if(searchopt.equals("comment")) {
				sql = "select cb.seq, b.pseq, pseq_kind, cseq, cmseq, cwriter, comment, cwdate_ori "
						+ "from comment_board cb inner join board b On cb.seq = b.seq "
						+ "inner join board_kind bk On b.pseq = bk.pseq where comment like ? order by cseq desc";
			}else if(searchopt.equals("cwriter")) {
				sql = "select cb.seq, b.pseq, pseq_kind, cseq, cmseq, cwriter, comment, cwdate_ori "
						+ "from comment_board cb inner join board b On cb.seq = b.seq "
						+ "inner join board_kind bk On b.pseq = bk.pseq where cwriter like ? order by cseq desc";
			}			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchkey);
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				to.setPseq(rs.getString("pseq"));
				to.setPseq_kind(rs.getString("pseq_kind"));
				to.setCseq(rs.getString("cseq"));
				to.setCwriter(rs.getString("cwriter"));
				to.setComment(rs.getString("comment"));
				to.setCwdate_ori(rs.getString("cwdate_ori"));
				
				commentLists.add(to);
			}
			commentListsTO.setBoardLists(commentLists);
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return commentListsTO;
	}
	
	//寃뚯떆�뙋蹂� �궎�썙�뱶寃��깋
	public BoardListsTO searchCommentsWithKey(BoardListsTO commentListsTO, String pseq , String searchopt, String searchkey) {
		
		ArrayList<BoardTO> commentLists = new ArrayList<BoardTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dataSource.getConnection();
			
			if(searchopt.equals("comment")) {
				sql = "select cb.seq, b.pseq, pseq_kind, cseq, cmseq, cwriter, comment, cwdate_ori "
						+ "from comment_board cb inner join board b On cb.seq = b.seq "
						+ "inner join board_kind bk On b.pseq = bk.pseq where b.pseq=? and comment like ? order by cseq desc";
			}else if(searchopt.equals("cwriter")) {
				sql = "select cb.seq, b.pseq, pseq_kind, cseq, cmseq, cwriter, comment, cwdate_ori "
						+ "from comment_board cb inner join board b On cb.seq = b.seq "
						+ "inner join board_kind bk On b.pseq = bk.pseq where b.pseq=? and cwriter like ?  order by cseq desc";
			}			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pseq);
			pstmt.setString(2, searchkey);
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				to.setPseq(rs.getString("pseq"));
				to.setPseq_kind(rs.getString("pseq_kind"));
				to.setCseq(rs.getString("cseq"));
				to.setCwriter(rs.getString("cwriter"));
				to.setComment(rs.getString("comment"));
				to.setCwdate_ori(rs.getString("cwdate_ori"));
				
				commentLists.add(to);
			}
			commentListsTO.setBoardLists(commentLists);
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return commentListsTO;
	}

	public int commentModifyOk(BoardTO boardTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int flag = 2;

		try {
			conn = dataSource.getConnection();
			
			String cwdate_ori = boardTO.getCwdate_ori();
			String cwdate_mod = boardTO.getCwdate_mod();
			
			String sql = "";
			if(cwdate_ori.equals(cwdate_mod)) {
				sql = "update comment_board set comment=?, cwdate_mod=now() where cseq=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, boardTO.getComment());
				pstmt.setString(2, boardTO.getCseq());
			}else {
				sql = "update comment_board set comment=?, cwdate_ori=?, cwdate_mod=now() where cseq=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, boardTO.getComment());
				pstmt.setString(2, boardTO.getCwdate_mod());
				pstmt.setString(3, boardTO.getCseq());
			}

			int result = pstmt.executeUpdate();
			System.out.println(result+"결과물");
			if(result == 0) {
				flag = 1;
			}else {
				flag = 0;
			}
			
		} catch (SQLException e) {
			System.out.println("error : " + e.getMessage());
		} finally {
			if (rs != null) { try { rs.close(); } catch (SQLException e) {} }
			if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {} }
			if (conn != null) { try { conn.close(); } catch (SQLException e) {} }
		}
		return flag;
	}	

	public int adminCommentsDelete(String cseq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 2;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "delete from comment_board where cseq=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cseq);
			
			int result = pstmt.executeUpdate();
			if(result == 0) {
				flag = 1;
			} else if(result == 1) {
				flag = 0;
			}
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return flag;	
	}
	
	public int adminCommentsMultiDelete(String cseq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
		try {
			String[] seqarr = cseq.split(",");
			
			conn = dataSource.getConnection();
			
			for(int i=0;i<seqarr.length;i++) {
				String sql = "delete from comment_board where cseq=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seqarr[i]);
				
				int result = pstmt.executeUpdate();
				
				flag += result;
			}
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return flag;	
	}
	
	public int loginOk(AdminsTO adminsTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag = 2;
		
		try {
			conn = dataSource.getConnection();
			String id1 = adminsTO.getId();
			String password1 = adminsTO.getPassword();
			String id2 = "";
			String password2 = "";
			
			String sql = "select id, password from admins where id=? and password=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminsTO.getId());
			pstmt.setString(2, adminsTO.getPassword());
			
			rs = pstmt.executeQuery();
			
			 while(rs.next()) { 
				 AdminsTO to = new AdminsTO();
			 
				 id2=rs.getString("id");
				 password2 = rs.getString("password");
			 }
			 
			 if( id1.equals(id2) && password1.equals(password2)) {
				 flag = 0;
			 }else {
				 flag = 1;
			 }
			 
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return flag;	
	}
	
	/*
	 * public int AddAdmin() { int flag=0; return flag }
	 */
	public BoardListsTO anList(BoardListsTO anListsTO) {
		
		// 湲�紐⑸줉�씠 �떞湲멸납
		ArrayList<BoardTO> anLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori from board where pseq='41' order by seq desc";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				to.setPseq(rs.getString("pseq"));
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setMseq(rs.getString("mseq"));
				to.setWriter(rs.getString("writer"));
				to.setContent(rs.getString("content"));
				to.setHit(rs.getString("hit"));
				to.setWdate_ori(rs.getString("wdate_ori"));
				anLists.add(to);
			}
			
			anListsTO.setBoardLists(anLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return anListsTO;
	}
	
	public BoardListsTO anList(BoardListsTO boardListsTO, String sdate, String edate) {
		
		ArrayList<BoardTO> boardLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq='41' and wdate_ori between ? and ? order by seq desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sdate);
			pstmt.setString(2, edate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				to.setPseq(rs.getString("pseq"));
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setMseq(rs.getString("mseq"));
				to.setWriter(rs.getString("writer"));
				to.setContent(rs.getString("content"));
				to.setHit(rs.getString("hit"));
				to.setWdate_ori(rs.getString("wdate_ori"));
				boardLists.add(to);
			}
			
			boardListsTO.setBoardLists(boardLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return boardListsTO;
	}
	
	public BoardListsTO anList(BoardListsTO boardListsTO, String searchopt, String searchkey, String sdate, String edate) {
		
		ArrayList<BoardTO> boardLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dataSource.getConnection();
			
			if(searchopt.equals("subject")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq='41' and subject like ? and wdate_ori between ? and ? order by seq desc";
			}else if(searchopt.equals("content")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq='41' and content like ? and wdate_ori between ? and ? order by seq desc";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchkey);
			pstmt.setString(2, sdate);
			pstmt.setString(3, edate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				to.setPseq(rs.getString("pseq"));
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setMseq(rs.getString("mseq"));
				to.setWriter(rs.getString("writer"));
				to.setContent(rs.getString("content"));
				to.setHit(rs.getString("hit"));
				to.setWdate_ori(rs.getString("wdate_ori"));
				boardLists.add(to);
			}
			
			boardListsTO.setBoardLists(boardLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return boardListsTO;
	}
	
	public BoardListsTO searchAnsWithKey(BoardListsTO boardListsTO, String searchopt, String searchkey) {
		
		ArrayList<BoardTO> boardLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dataSource.getConnection();
			
			if(searchopt.equals("subject")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq='41' and subject like ? order by seq desc";
			}else if(searchopt.equals("content")) {
				sql = "select pseq, mseq, seq, subject, writer, content, hit, wdate_ori, wdate_mod from board where pseq='41' and content like ? order by seq desc";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchkey);
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				BoardTO to = new BoardTO();
				to.setPseq(rs.getString("pseq"));
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setMseq(rs.getString("mseq"));
				to.setWriter(rs.getString("writer"));
				to.setContent(rs.getString("content"));
				to.setHit(rs.getString("hit"));
				to.setWdate_ori(rs.getString("wdate_ori"));
				boardLists.add(to);
			}
			
			boardListsTO.setBoardLists(boardLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return boardListsTO;
	}
	
	public int anWriteOk(BoardTO boardTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;

		try {
			
			conn = dataSource.getConnection();

			String sql = "insert into board values ('41',0,?,'0','관리자',?,?,?,'0','0',now(),now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardTO.getSubject());
			pstmt.setString(2, boardTO.getContent());
			pstmt.setString(3, boardTO.getFilename_ori());
			pstmt.setString(4, boardTO.getFilename_new());


			int result = pstmt.executeUpdate();

			if (result == 1) {
				flag = 0;
				
			}else {
				flag=1;
			}

		} catch (SQLException e) {
			System.out.println("error : " + e.getMessage());
		} finally {			
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try {	conn.close(); } catch (SQLException e) {}			
		}
		return flag;
	}
	
	public int adminAnDelete(BoardTO boardTO) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag = 2;
		
		try {
			conn = dataSource.getConnection();

			String sql = "select filename_new from board where seq =?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, boardTO.getSeq());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				boardTO.setFilename_new(rs.getString("filename_new"));

				// 글 삭제
				sql = "delete from board where seq=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, boardTO.getSeq());

				int result = pstmt.executeUpdate();
				
				// 삭제성공했으면 flag는 0, 아니면 1
				if (result == 1) {
					flag = 0;
					if (boardTO.getFilename_new() != null || boardTO.getFilename_new().equals("")) {
						// 만약 파일이 있다면 파일 삭제
						File file = new File(path + "\\" + boardTO.getFilename_new());
						file.delete();
					}
				} else if (result == 0) {
					flag = 1;
				}

			} else if (!rs.next()) {
				// 사진이름을 얻어오지못했다면 삭제불가능. 여기서 끝냄.
				flag = 2;
			}
		} catch (SQLException e) {
			System.out.println("error : " + e.getMessage());
		} finally {
			if (rs != null)  try {	rs.close(); } catch (SQLException e) {}	
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try { conn.close(); } catch (SQLException e) {}
		}
		return flag;	
	}
	
	public int adminAnMultiDelete(BoardTO boardTO) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag = 0;
		try {
			String[] seqarr = boardTO.getSeq().split(",");
			
			conn = dataSource.getConnection();
			
			for(int i=0;i<seqarr.length;i++) {
				String sql = "select filename_new from board where seq =?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, seqarr[i]);

				rs = pstmt.executeQuery();
				if (rs.next()) {
					boardTO.setFilename_new(rs.getString("filename_new"));

					// 글 삭제
					sql = "delete from board where seq=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, seqarr[i]);

					int result = pstmt.executeUpdate();
					
					// 삭제성공했으면 flag는 0, 아니면 1
					if (result == 1) {
						if (boardTO.getFilename_new() != null || boardTO.getFilename_new().equals("")) {
							// 만약 파일이 있다면 파일 삭제
							File file = new File(path + "\\" + boardTO.getFilename_new());
							file.delete();
						}
						flag+=result;
					} else if (result == 0) {
						flag += result;
					}				
				
				}
			}
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return flag;	
	}
	
	public BoardListsTO todays(BoardListsTO qListsTO) {
		
		// 湲�紐⑸줉�씠 �떞湲멸납
		ArrayList<QuestionsTO> qLists = new ArrayList<QuestionsTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			conn = dataSource.getConnection();
			
			String sql = "select seq, subject, kinds, qseq, content, filename, wdate from questions order by seq desc";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QuestionsTO to = new QuestionsTO();
				
				to.setSeq(rs.getString("seq"));
				to.setQseq(rs.getString("qseq"));
				to.setKinds(rs.getString("kinds"));				
				to.setContent(rs.getString("content"));
				to.setSubject(rs.getString("subject"));
				to.setFilename(rs.getString("filename"));
				to.setWdate(rs.getString("wdate"));
				
				qLists.add(to);
			}
			
			qListsTO.setqLists(qLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return qListsTO;
	}
	
	public BoardListsTO questionsList(BoardListsTO qListsTO) {
		
		// 湲�紐⑸줉�씠 �떞湲멸납
		ArrayList<QuestionsTO> qLists = new ArrayList<QuestionsTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select seq, subject, kinds, qseq, content, filename, wdate from questions order by seq desc";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QuestionsTO to = new QuestionsTO();
				
				to.setSeq(rs.getString("seq"));
				to.setQseq(rs.getString("qseq"));
				to.setKinds(rs.getString("kinds"));				
				to.setContent(rs.getString("content"));
				to.setSubject(rs.getString("subject"));
				to.setFilename(rs.getString("filename"));
				to.setWdate(rs.getString("wdate"));
				
				qLists.add(to);
			}
			
			qListsTO.setqLists(qLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return qListsTO;
	}
	
	public BoardListsTO questionsList(BoardListsTO qListsTO, String searchopt, String searchkey) {
		
		ArrayList<QuestionsTO> qLists = new ArrayList<QuestionsTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dataSource.getConnection();
			
			if(searchopt.equals("subject")) {
				sql = "select seq, subject, kinds, qseq, content, filename, wdate from questions where subject like ? order by seq desc";
			}else if(searchopt.equals("content")) {
				sql = "select seq, subject, kinds, qseq, content, filename, wdate from questions where content like ? order by seq desc";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchkey);
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				QuestionsTO to = new QuestionsTO();
				to.setSeq(rs.getString("seq"));
				to.setQseq(rs.getString("qseq"));
				to.setKinds(rs.getString("kinds"));				
				to.setContent(rs.getString("content"));
				to.setSubject(rs.getString("subject"));
				to.setFilename(rs.getString("filename"));
				to.setWdate(rs.getString("wdate"));
				qLists.add(to);
			}
			
			qListsTO.setqLists(qLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return qListsTO;
	}
	
	public int questionsWriteOk(QuestionsTO qTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 2;

		try {
			
			conn = dataSource.getConnection();

			String sql = "insert into questions values ('0',?,?,?,?,?,now())";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, qTO.getKinds());
			pstmt.setString(2, qTO.getQseq());
			pstmt.setString(3, qTO.getSubject());
			pstmt.setString(4, qTO.getContent());
			pstmt.setString(5, qTO.getFilename());


			int result = pstmt.executeUpdate();

			if (result == 1) {
				flag = 0;
			}else {
				flag=1;
			}

		} catch (SQLException e) {
			System.out.println("error : " + e.getMessage());
		} finally {			
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try {	conn.close(); } catch (SQLException e) {}			
		}
		return flag;
	}
	
	public ArrayList<QuestionsTO> questionsView(String seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<QuestionsTO> qLists = new ArrayList<QuestionsTO>();

		try {
			conn = dataSource.getConnection();

			// 게시물 가져오기
			String sql = "select seq, kinds, qseq, subject, content, filename, date_format(wdate,'%Y-%m-%d %H:%i:%s') wdate from questions  where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				QuestionsTO to = new QuestionsTO();
				
				to.setSeq(rs.getString("seq"));
				to.setQseq(rs.getString("qseq"));
				to.setKinds(rs.getString("kinds"));				
				to.setContent(rs.getString("content"));
				to.setSubject(rs.getString("subject"));
				to.setFilename(rs.getString("filename"));
				to.setWdate(rs.getString("wdate"));
				
				qLists.add(to);
			}

		} catch (SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (rs != null)	try { rs.close(); } catch (SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try { conn.close(); } catch (SQLException e) {}
		}

		return qLists;
	}
	
	public ArrayList<QuestionsTO> questionModify(String seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<QuestionsTO> qLists = new ArrayList<QuestionsTO>();

		try {
			conn = dataSource.getConnection();

			// 게시물 가져오기
			String sql = "select seq, kinds, qseq, subject, content, filename, date_format(wdate,'%Y-%m-%d %H:%i:%s') wdate from questions where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				QuestionsTO to = new QuestionsTO();
				
				to.setSeq(rs.getString("seq"));
				to.setKinds(rs.getString("kinds"));
				to.setQseq(rs.getString("qseq"));
				to.setSubject(rs.getString("subject"));
				to.setContent(rs.getString("content"));
				to.setFilename(rs.getString("filename"));
				to.setWdate(rs.getString("wdate"));

				qLists.add(to);
			}
			
		} catch (SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try { conn.close(); } catch (SQLException e) {}
		}

		return qLists;
	}
	
	public int questionsModifyOk(QuestionsTO qTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int flag = 1;
		String oldfilename="";
		try {
			
			conn = dataSource.getConnection();

			String sql = "select filename from questions where seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qTO.getSeq());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				oldfilename = rs.getString("filename");
			}

			// 파일이 바뀌지 않았다면 파일수정안함
			if (qTO.getFilename().equals("")) {
				sql = "update questions set subject=?, content=? where seq=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, qTO.getSubject());
				pstmt.setString(2, qTO.getContent());
				pstmt.setString(3, qTO.getSeq());

			} else {
				// 파일이 바뀌었다면 파일도 수정함
				sql = "update questions set subject=?, content=?, filename=?, wdate=now() where seq=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, qTO.getSubject());
				pstmt.setString(2, qTO.getContent());
				pstmt.setString(3, qTO.getFilename());				
				pstmt.setString(4, qTO.getSeq());
			}
			int result = pstmt.executeUpdate();

			if (result == 1) {
				flag = 0;
				if (!qTO.getFilename().equals("") && !oldfilename.equals("")) {
					File file = new File(path + "\\" + oldfilename);
					file.delete();
				}
			}

		} catch (SQLException e) {
			System.out.println("error : " + e.getMessage());
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException e) {}			
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try {	conn.close(); } catch (SQLException e) {}			
		}
		return flag;
	}
	
	public int questionsDelete(String seq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 2;
		try {
			
			conn = dataSource.getConnection();
			
			
				String sql = "delete from questions where seq=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seq);
				
				int result = pstmt.executeUpdate();
				if(result == 1) {
					flag=0;
				}else {
					flag=1;
				}
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return flag;	
	}
	
	public int questionsMultiDelete(String seq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
		try {
			String[] seqarr = seq.split(",");
			
			conn = dataSource.getConnection();
			
			for(int i=0;i<seqarr.length;i++) {
				String sql = "delete from questions where seq=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seqarr[i]);
				
				int result = pstmt.executeUpdate();
				
				flag += result;
			}
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return flag;	
	}
	
	public BoardListsTO qnAList(BoardListsTO qnaListsTO) {
		
		ArrayList<BoardTO> qnaLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select seq, '' aseq, subject, content, wdate, 'q' pseq from personal_question UNION ALL select a.seq, a.aseq, a.subject, a.content, a.wdate, 'a' pseq from personal_answers a inner join (select seq from personal_question) q on q.seq=a.seq order by seq desc, aseq";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				//aseq 를 mseq에
				to.setMseq(rs.getString("aseq"));
				to.setSubject(rs.getString("subject"));			
				to.setContent(rs.getString("content"));
				to.setWdate_ori(rs.getString("wdate"));

				qnaLists.add(to);
			}
			
			qnaListsTO.setQnaLists(qnaLists);
			
		} catch(SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return qnaListsTO;
	}
	
	public BoardListsTO qnAList(BoardListsTO qnaListsTO,String pseq) {
		
		ArrayList<BoardTO> qnaLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql="";
			conn = dataSource.getConnection();
			if( pseq.equals("q") ) {
				sql = "select seq, '' aseq, subject, wdate from personal_question order by seq desc";
				
			}else if( pseq.equals("a") ) {
				sql = "select '' seq, aseq, subject, wdate from personal_answers order by aseq desc";
			}
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				//aseq 를 mseq에
				to.setMseq(rs.getString("aseq"));
				to.setSubject(rs.getString("subject"));			
				to.setWdate_ori(rs.getString("wdate"));
				
				qnaLists.add(to);
			}
			
			qnaListsTO.setQnaLists(qnaLists);
						
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return qnaListsTO;
	}
	//�벑濡앹씪蹂�
	public BoardListsTO qnAList(BoardListsTO qnaListsTO, String sdate, String edate) {
		
		ArrayList<BoardTO> qnaLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			 
			String sql = "select seq, '' aseq, subject, content, wdate, 'q' pseq from personal_question where wdate between ? and ? " + 
					"UNION ALL " + 
					"select a.seq, a.aseq, a.subject, a.content, a.wdate, 'a' pseq from personal_answers a inner join (select seq from personal_question) q on q.seq=a.seq and a.wdate between ? and ? order by seq desc, aseq";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sdate);
			pstmt.setString(2, edate);
			pstmt.setString(3, sdate);
			pstmt.setString(4, edate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				//aseq 를 mseq에
				to.setMseq(rs.getString("aseq"));
				to.setPseq(rs.getString("pseq"));
				to.setSubject(rs.getString("subject"));			
				to.setContent(rs.getString("content"));
				to.setWdate_ori(rs.getString("wdate"));
				
				qnaLists.add(to);
			}
			
			qnaListsTO.setQnaLists(qnaLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return qnaListsTO;
	}
	//寃뚯떆�뙋蹂� , �벑濡앹씪蹂�
	public BoardListsTO qnAList(BoardListsTO qnaListsTO, String pseq, String sdate, String edate) {
		
		ArrayList<BoardTO> qnaLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "";
			
			conn = dataSource.getConnection();			
		 
			if( pseq.equals("q") ) {
				sql = "select seq, '' aseq, subject, wdate from personal_question where wdate between ? and ? order by seq desc";
				
			}else if( pseq.equals("a") ) {
				sql = "select '' seq, aseq, subject, wdate from personal_answers where wdate between ? and ? order by aseq desc";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sdate);
			pstmt.setString(2, edate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				//aseq 를 mseq에
				to.setMseq(rs.getString("aseq"));
				to.setSubject(rs.getString("subject"));
				to.setWdate_ori(rs.getString("wdate"));
				
				qnaLists.add(to);
			}
			
			qnaListsTO.setQnaLists(qnaLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return qnaListsTO;
	}

	public BoardListsTO qnAList(BoardListsTO qnaListsTO, String searchopt, String searchkey, String sdate, String edate) {
		
		ArrayList<BoardTO> qnaLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dataSource.getConnection();
			
			if(searchopt.equals("subject")) {
				sql = "select seq, '' aseq, subject, content, wdate, 'q' pseq from personal_question where wdate between ? and ? and subject like ? " + 
						"UNION ALL " + 
						"select a.seq, a.aseq, a.subject, a.content, a.wdate, 'a' pseq from personal_answers a inner join (select seq from personal_question) q on q.seq=a.seq and a.wdate between ? and ? and a.subject like ? order by seq desc, aseq";
			}else if(searchopt.equals("content")) {
				sql = "select seq, '' aseq, subject, content, wdate, 'q' pseq from personal_question where wdate between ? and ? and content like ? " + 
						"UNION ALL " + 
						"select a.seq, a.aseq, a.subject, a.content, a.wdate, 'a' pseq from personal_answers a inner join (select seq from personal_question) q on q.seq=a.seq and a.wdate between ? and ? and a.content like ? order by seq desc, aseq";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sdate);
			pstmt.setString(2, edate);
			pstmt.setString(3, searchkey);
			pstmt.setString(4, sdate);
			pstmt.setString(5, edate);
			pstmt.setString(6, searchkey);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				//aseq 를 mseq에
				to.setMseq(rs.getString("aseq"));
				to.setSubject(rs.getString("subject"));			
				to.setWdate_ori(rs.getString("wdate"));
				
				qnaLists.add(to);
			}
			
			qnaListsTO.setQnaLists(qnaLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return qnaListsTO;
	}
	//寃뚯떆�뙋蹂�, �벑濡앹씪蹂� , �궎�썙�뱶寃��깋
	public BoardListsTO qnAList(BoardListsTO qnaListsTO, String pseq, String searchopt, String searchkey, String sdate, String edate) {
		
		ArrayList<BoardTO> qnaLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = dataSource.getConnection();
			
			if( pseq.equals("q") ) {
				if(searchopt.equals("subject")) {
					sql = "select seq, '' aseq, subject, wdate from personal_question where wdate between ? and ? and subject like ? order by seq desc";
				}else if(searchopt.equals("content")) {
					sql = "select seq, '' aseq, subject, wdate from personal_question where wdate between ? and ? and content like ? order by seq desc";
				}
			}else if( pseq.equals("a") ) {
				if(searchopt.equals("subject")) {
					sql = "select seq, aseq, subject, wdate from personal_answers where wdate between ? and ? and subject like ? order by aseq desc";
				}else if(searchopt.equals("content")) {
					sql = "select seq, aseq, subject, wdate from personal_answers where wdate between ? and ? and content like ? order by aseq desc";
				}
			}
						
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, sdate);
			pstmt.setString(2, edate);
			pstmt.setString(3, searchkey);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				//aseq 를 mseq에
				to.setMseq(rs.getString("aseq"));
				to.setSubject(rs.getString("subject"));			
				to.setWdate_ori(rs.getString("wdate"));
				
				qnaLists.add(to);
			}
			
			qnaListsTO.setQnaLists(qnaLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return qnaListsTO;
	}
	//�궎�썙�뱶寃��깋
	public BoardListsTO searchQnAWithKey(BoardListsTO qnaListsTO, String searchopt, String searchkey) {
		
		ArrayList<BoardTO> qnaLists = new ArrayList<BoardTO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dataSource.getConnection();
			
			if(searchopt.equals("subject")) {
				sql = "select seq, '' aseq, subject, content, wdate, 'q' pseq from personal_question where subject like ? " + 
						"UNION ALL " + 
						"select a.seq, a.aseq, a.subject, a.content, a.wdate, 'a' pseq from personal_answers a inner join (select seq from personal_question) q on q.seq=a.seq and a.subject like ? order by seq desc, aseq";
			}else if(searchopt.equals("content")) {
				sql = "select seq, '' aseq, subject, content, wdate, 'q' pseq from personal_question where content like ? " + 
						"UNION ALL " + 
						"select a.seq, a.aseq, a.subject, a.content, a.wdate, 'a' pseq from personal_answers a inner join (select seq from personal_question) q on q.seq=a.seq and a.content like ? order by seq desc, aseq";
			}			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchkey);
			pstmt.setString(2, searchkey);
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				//aseq 를 mseq에
				to.setMseq(rs.getString("aseq"));
				to.setSubject(rs.getString("subject"));	
				to.setWdate_ori(rs.getString("wdate"));
				
				qnaLists.add(to);
			}
			
			qnaListsTO.setQnaLists(qnaLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return qnaListsTO;
	}
	//寃뚯떆�뙋蹂� �궎�썙�뱶寃��깋
	public BoardListsTO searchQnAWithKey(BoardListsTO qnaListsTO, String pseq , String searchopt, String searchkey) {
			
		ArrayList<BoardTO> qnaLists = new ArrayList<BoardTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = dataSource.getConnection();
			
			if( pseq.equals("q") ) {
				if(searchopt.equals("subject")) {
					sql = "select seq, '' aseq, subject, wdate from personal_question where subject like ? order by seq desc";
				}else if(searchopt.equals("content")) {
					sql = "select seq, '' aseq, subject, wdate from personal_question where content like ? order by seq desc";
				}
			}else if( pseq.equals("a") ) {
				if(searchopt.equals("subject")) {
					sql = "select '' seq, aseq, subject, wdate from personal_answers where subject like ? order by aseq desc";
				}else if(searchopt.equals("content")) {
					sql = "select '' seq, aseq, subject, wdate from personal_answers where content like ? order by aseq desc";
				}
				
			}
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchkey);
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				//aseq 를 mseq에
				to.setMseq(rs.getString("aseq"));
				to.setSubject(rs.getString("subject"));			
				to.setWdate_ori(rs.getString("wdate"));
				
				qnaLists.add(to);
			}
			
			qnaListsTO.setQnaLists(qnaLists);
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}		
		return qnaListsTO;
	}
	
	public int qnaDelete(String seq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag = 2;
		int flagQnA = 0;
		try {
			
			conn = dataSource.getConnection();
			
			//질문인지 답변인지 확인
			String sql = "select seq from personal_question where seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);
				
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				flagQnA = 1;
			}
			//질문이 아닐시
			if(flagQnA == 0) {
				sql = "select aseq from personal_answers where aseq=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seq);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					flagQnA = 2;
				}
			}
			
			int result = 0;
			
			if(flagQnA == 1) {
				
				sql = "delete from personal_answers where seq=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seq);
				result = pstmt.executeUpdate();
				
				sql = "delete from personal_question where seq=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seq);
				
				result = pstmt.executeUpdate();
			}else if(flagQnA == 2){
				sql = "delete from personal_answers where aseq=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seq);
				
				result = pstmt.executeUpdate();
			}
			if(result == 1) {
				flag = 0;
			}else {
				flag = 1;
			}
			
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return flag;	
	}
	
	public int qnaMultiDelete(String seq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag = 0;
		int flagQnA = 0;
		try {
			String[] seqarr = seq.split(",");
			conn = dataSource.getConnection();
			for(int i =0; i<seqarr.length;i++) {
				
				//질문인지 답변인지 확인
				String sql = "select seq from personal_question where seq=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seq);
					
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					flagQnA = 1;
				}
				//질문이 아닐시
				if(flagQnA == 0) {
					sql = "select aseq  from personal_answers where aseq=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, seq);
					
					rs = pstmt.executeQuery();
					while(rs.next()) {
						flagQnA = 2;
					}
				}
				
				if(flagQnA == 1) {
					sql = "delete from personal_question where seq=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, seq);
					
					flag += pstmt.executeUpdate();
				}else if(flagQnA == 2){
					sql = "delete from personal_answers where aseq=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, seq);
					
					flag += pstmt.executeUpdate();
				}
				
			}
		} catch(SQLException e) {
			System.out.println("[�뿉�윭] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return flag;	
	}
	
	public ArrayList<BoardTO> qnaview(String seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<BoardTO> qLists = new ArrayList<BoardTO>();
		String sql = "";
		int flag = 0;
		try {
			conn = dataSource.getConnection();
			
			sql = "select seq from personal_question where seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);
			rs = pstmt.executeQuery();
			
			//질문인지 답변인지 확인
			while(rs.next()) {
				flag = 1;
			}
			
			//질문일때
			if( flag == 1) {
				sql = "select seq, mseq, subject, content, wdate, filename_new, filename_ori from personal_question where seq = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seq);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					BoardTO to = new BoardTO();
					
					to.setSeq(rs.getString("seq"));
					to.setMseq(rs.getString("mseq"));
					to.setSubject(rs.getString("subject"));
					to.setContent(rs.getString("content"));
					to.setFilename_new(rs.getString("filename_new"));
					to.setFilename_ori(rs.getString("filename_ori"));
					to.setWdate_ori(rs.getString("wdate"));
					to.setWdate_mod(rs.getString("wdate"));
					//질문일떄 1
					to.setHit("1");

					qLists.add(to);
				}
			//답변일때
			}else {
				// 게시물 가져오기
				sql = "select seq, aseq, subject, content, wdate, filename_new, filename_ori from personal_answers where aseq = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seq);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					BoardTO to = new BoardTO();
					
					to.setSeq(rs.getString("seq"));
					//aseq를 mseq에 저장
					to.setMseq(rs.getString("aseq"));
					to.setSubject(rs.getString("subject"));
					to.setContent(rs.getString("content"));
					to.setFilename_new(rs.getString("filename_new"));
					to.setFilename_ori(rs.getString("filename_ori"));
					to.setWdate_ori(rs.getString("wdate"));
					to.setWdate_mod(rs.getString("wdate"));
					//답변일때 2
					to.setHit("2");
					qLists.add(to);
				}
			}

			
		} catch (SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try { conn.close(); } catch (SQLException e) {}
		}

		return qLists;
	}
	
	public ArrayList<BoardTO> qnaModify(String aseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<BoardTO> qLists = new ArrayList<BoardTO>();

		try {
			conn = dataSource.getConnection();

			// 게시물 가져오기
			String sql = "select seq, aseq, subject, content, date_format(wdate,'%Y-%m-%d %H:%i:%s') wdate, filename_new, filename_ori from personal_answers where aseq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aseq);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				to.setMseq(rs.getString("aseq"));
				to.setSubject(rs.getString("subject"));
				to.setContent(rs.getString("content"));
				to.setFilename_new(rs.getString("filename_new"));
				to.setFilename_ori(rs.getString("filename_ori"));
				to.setWdate_ori(rs.getString("wdate"));
				to.setWdate_mod(rs.getString("wdate"));

				qLists.add(to);
			}
			
		} catch (SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try { conn.close(); } catch (SQLException e) {}
		}

		return qLists;
	}
	
	public int qnaModifyOk(BoardTO boardTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int flag = 1;
		String oldfilename = "";

		try {
			
			conn = dataSource.getConnection();

			String sql = "select filename_new from personal_answers where aseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardTO.getMseq());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				oldfilename = rs.getString("filename_new");
			}

			// 파일이 바뀌지 않았다면 파일수정안함
			if (boardTO.getFilename_ori().equals("")) {
				sql = "update personal_answers set subject=?, wdate=now(), content=? where aseq=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, boardTO.getSubject());
				pstmt.setString(2, boardTO.getContent());
				pstmt.setString(3, boardTO.getMseq());

			} else {
				// 파일이 바뀌었다면 파일도 수정함
				sql = "update personal_answers set subject=?, wdate=now(), content=?, filename_ori=?, filename_new=? where aseq=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, boardTO.getSubject());
				pstmt.setString(2, boardTO.getContent());
				pstmt.setString(3, boardTO.getFilename_ori());
				pstmt.setString(4, boardTO.getFilename_new());
				pstmt.setString(5, boardTO.getMseq());
			}
			int result = pstmt.executeUpdate();

			if (result == 1) {
				flag = 0;
				if (!boardTO.getFilename_ori().equals("") && !oldfilename.equals("")) {
					File file = new File(path + "\\" + oldfilename);
					file.delete();
				}
			}

		} catch (SQLException e) {
			System.out.println("error : " + e.getMessage());
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException e) {}			
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try {	conn.close(); } catch (SQLException e) {}			
		}
		return flag;
	}
	
	public int qnaReplyOk(BoardTO boardTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;

		try {
			
			conn = dataSource.getConnection();

			String sql = "insert into personal_answers values (0,?,?,?,now(),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardTO.getSeq());
			pstmt.setString(2, boardTO.getSubject());
			pstmt.setString(3, boardTO.getContent());
			pstmt.setString(4, boardTO.getFilename_ori());
			pstmt.setString(5, boardTO.getFilename_new());


			int result = pstmt.executeUpdate();

			if (result == 1) {
				flag = 0;
				
			}else {
				flag=1;
			}

		} catch (SQLException e) {
			System.out.println("error : " + e.getMessage());
		} finally {			
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try {	conn.close(); } catch (SQLException e) {}			
		}
		return flag;
	}
	
	public int adoptionWriteOk(BoardTO boardTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;

		try {
			
			conn = dataSource.getConnection();

			String sql = "insert into board values ('31',0,?,'0','관리자',?,?,?,'0','0',now(),now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardTO.getSubject());
			pstmt.setString(2, boardTO.getContent());
			pstmt.setString(3, boardTO.getFilename_ori());
			pstmt.setString(4, boardTO.getFilename_new());


			int result = pstmt.executeUpdate();

			if (result == 1) {
				flag = 0;
			}else {
				flag=1;
			}

		} catch (SQLException e) {
			System.out.println("error : " + e.getMessage());
		} finally {			
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
			if (conn != null) try {	conn.close(); } catch (SQLException e) {}			
		}
		return flag;
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