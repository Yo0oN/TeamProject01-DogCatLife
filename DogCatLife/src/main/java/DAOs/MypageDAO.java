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
import TOs.UserTO;
import mail.MailSender;

public class MypageDAO {
//	private String uploadPath = "C:\\Users\\kitcoop\\Desktop\\Git\\MyStudy2019.10\\webproject01\\DogCatLife\\src\\main\\webapp\\resources\\upload";
//	private String uploadPath = "/var/lib/tomcat8/webapps/DogCatLifeUpload";
	private String uploadPath = "D:\\MyFirstGit\\MyStudy2019.10\\webproject01\\DogCatLife\\src\\main\\webapp\\resources\\upload";
	private DataSource dataSource = null;
	
	public MypageDAO() {
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

	public int mypage_input_password_ok(UserTO userTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int flag = 1;
		try {
			conn = dataSource.getConnection();
			
			String sql = "select nickname from user where mseq=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userTO.getMseq());
			pstmt.setString(2, userTO.getPassword());
			
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

	public UserTO myinfo(String mseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		UserTO userTO = new UserTO();
		try {
			conn = dataSource.getConnection();

			String sql = "select email, name, nickname, phone from user where mseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mseq);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				userTO.setEmail(rs.getString("email"));
				userTO.setName(rs.getString("name"));
				userTO.setNickname(rs.getString("nickname"));
				userTO.setPhone(rs.getString("phone"));
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
	
	public int myinfo_ok(UserTO userTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;
		try {
			conn = dataSource.getConnection();
			
			String sql = "update user set nickname=?, phone=? where mseq=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userTO.getNickname());
			pstmt.setString(2, userTO.getPhone());
			pstmt.setString(3, userTO.getMseq());
			pstmt.setString(4, userTO.getPassword());
			
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
	
	public BoardListsTO mycontents_list(BoardListsTO boardListsTO, String selected) {
		// 현재페이지
		int cpage = boardListsTO.getCpage();
		// 한 페이지에 몇개 보이는지? 10개
		int recordPerPage = boardListsTO.getRecordPerPage();
		// 한블럭에 몇개들어가는지? (5개)
		int blockPerPage = boardListsTO.getBlockPerPage();
		// 총 글 수
		int totalRecord = boardListsTO.getTotalRecord();
		// 글목록이 담길곳
		ArrayList<BoardTO> boardLists = new ArrayList();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();

			String sql = "";
			// 글 수
			if (selected == null || selected.equals("") || selected.equals("0")) {
				sql = "select count('seq') totalRecord from board where mseq=?";
			} else {
				sql = "select count('seq') totalRecord from board where mseq=? and pseq=" + selected;
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardListsTO.getMseq());
			rs = pstmt.executeQuery();
			
			rs.next();
			totalRecord = rs.getInt("totalRecord");

			boardListsTO.setTotalRecord(totalRecord);
			
			// 총 페이지 수
			boardListsTO.setTotalPage(((totalRecord - 1) / recordPerPage) + 1);

			// 페이지에서 보이는 시작 글 번호
			int skip = (cpage - 1) * recordPerPage;
			
			if (selected == null || selected.equals("") || selected.equals("0")) {
				sql = "select seq, b.pseq, subject, wdate_ori, cmt, hit, pseq_kind from board b inner join board_kind bk on b.pseq=bk.pseq where b.mseq=? order by wdate_ori desc limit ?, ?";
			} else {
				sql = "select seq, b.pseq, subject, wdate_ori, cmt, hit, pseq_kind from board b inner join board_kind bk on b.pseq=bk.pseq where b.pseq=" + selected + " and b.mseq=? order by wdate_ori desc limit ?, ?";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardListsTO.getMseq());
			pstmt.setInt(2, skip);
			pstmt.setInt(3, recordPerPage);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardTO boardTO = new BoardTO();
				
				boardTO.setSeq(rs.getString("seq"));
				boardTO.setPseq(rs.getString("pseq"));
				boardTO.setSubject(rs.getString("subject"));
				boardTO.setWdate_ori(rs.getString("wdate_ori"));
				boardTO.setCmt(rs.getString("cmt"));
				boardTO.setHit(rs.getString("hit"));
				boardTO.setPseq_kind(rs.getString("pseq_kind"));
				
				boardLists.add(boardTO);
			}
			// 글 목록
			boardListsTO.setBoardLists(boardLists);
			// 블럭 시작번호
			boardListsTO.setStartBlock(((cpage - 1) / blockPerPage) * blockPerPage + 1);
			// 블럭 끝번호
			boardListsTO.setEndBlock(((cpage - 1) / blockPerPage) * blockPerPage + blockPerPage);

			if (boardListsTO.getEndBlock() >= boardListsTO.getTotalPage()) {
				boardListsTO.setEndBlock(boardListsTO.getTotalPage());
			}
		} catch(SQLException e) {
			System.out.println("[에러1] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
		}
	
		return boardListsTO;
	}

	public BoardListsTO mycomment_list(BoardListsTO boardListsTO, String selected) {
		// 현재페이지
		int cpage = boardListsTO.getCpage();
		// 한 페이지에 몇개 보이는지? 10개
		int recordPerPage = boardListsTO.getRecordPerPage();
		// 한블럭에 몇개들어가는지? (5개)
		int blockPerPage = boardListsTO.getBlockPerPage();
		// 총 글 수
		int totalRecord = boardListsTO.getTotalRecord();
		// 글목록이 담길곳
		ArrayList<BoardTO> boardLists = new ArrayList();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();

			String sql = "";
			// 글 수
			if (selected == null || selected.equals("") || selected.equals("0")) {
				sql = "select count('seq') totalRecord from comment_board where cmseq=?";
			} else {
				sql = "select count('cb.seq') totalRecord from comment_board cb inner join board b on cb.seq = b.seq inner join board_kind bk on b.pseq=bk.pseq where cmseq=? and b.pseq=" + selected;
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardListsTO.getMseq());
			rs = pstmt.executeQuery();
			
			rs.next();
			totalRecord = rs.getInt("totalRecord");

			boardListsTO.setTotalRecord(totalRecord);
			
			// 총 페이지 수
			boardListsTO.setTotalPage(((totalRecord - 1) / recordPerPage) + 1);

			// 페이지에서 보이는 시작 글 번호
			int skip = (cpage - 1) * recordPerPage;
			
			if (selected == null || selected.equals("") || selected.equals("0")) {
				sql = "select cb.seq, b.pseq, cseq, pseq_kind, cmseq, cwriter, comment, cwdate_ori "
						+ " from comment_board cb inner join board b on cb.seq = b.seq inner join board_kind bk"
						+ " on b.pseq=bk.pseq where cmseq=? order by wdate_ori desc limit ?, ?";
			} else {
				sql = "select cb.seq, b.pseq, cseq, pseq_kind, cmseq, cwriter, comment, cwdate_ori " + 
						"from comment_board cb inner join board b on cb.seq = b.seq inner join board_kind bk " + 
						"on b.pseq=bk.pseq where cmseq=? and b.pseq=" + selected + " order by wdate_ori desc limit ?, ?";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardListsTO.getMseq());
			pstmt.setInt(2, skip);
			pstmt.setInt(3, recordPerPage);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardTO boardTO = new BoardTO();
				
				boardTO.setSeq(rs.getString("seq"));
				boardTO.setPseq(rs.getString("pseq"));
				boardTO.setCseq(rs.getString("cseq"));
				boardTO.setPseq_kind(rs.getString("pseq_kind"));
				boardTO.setCmseq(rs.getString("cmseq"));
				boardTO.setCwriter(rs.getString("cwriter"));
				boardTO.setComment(rs.getString("comment"));
				boardTO.setCwdate_ori(rs.getString("cwdate_ori"));
				
				boardLists.add(boardTO);
			}
			// 글 목록
			boardListsTO.setBoardLists(boardLists);
			// 블럭 시작번호
			boardListsTO.setStartBlock(((cpage - 1) / blockPerPage) * blockPerPage + 1);
			// 블럭 끝번호
			boardListsTO.setEndBlock(((cpage - 1) / blockPerPage) * blockPerPage + blockPerPage);

			if (boardListsTO.getEndBlock() >= boardListsTO.getTotalPage()) {
				boardListsTO.setEndBlock(boardListsTO.getTotalPage());
			}
		} catch(SQLException e) {
			System.out.println("[에러1] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
		}
	
		return boardListsTO;
	}

	public int password_change_ok(String password, String newpassword, String mseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 2;
		try {
			conn = dataSource.getConnection();

			String sql = "update user set password=? where mseq=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newpassword);
			pstmt.setString(2, mseq);
			pstmt.setString(3, password);
			
			int result = pstmt.executeUpdate();
			
			if (result == 1) {
				flag = 0;
			} else {
				flag = 1;
			}
		} catch(SQLException e) {
			System.out.println("[에러1] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	
		return flag;
	}

	public BoardListsTO myquestion_list(BoardListsTO boardListsTO) {
		// 현재페이지
		int cpage = boardListsTO.getCpage();
		// 한 페이지에 몇개 보이는지? 10개
		int recordPerPage = boardListsTO.getRecordPerPage();
		// 한블럭에 몇개들어가는지? (5개)
		int blockPerPage = boardListsTO.getBlockPerPage();
		// 총 글 수
		int totalRecord = boardListsTO.getTotalRecord();
		// 글목록이 담길곳
		ArrayList<BoardTO> boardLists = new ArrayList();
		// 회원
		String mseq = boardListsTO.getMseq();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			
			// 총 글 수 totalRecord
			String sql = "select count('seq') totalRecord from personal_question where mseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mseq);
			rs = pstmt.executeQuery();
			
			rs.next();
			totalRecord = rs.getInt("totalRecord");
			boardListsTO.setTotalRecord(totalRecord);

			// 총 페이지 수
			boardListsTO.setTotalPage(((totalRecord - 1) / recordPerPage) + 1);

			// 페이지에서 보이는 시작 글 번호
			int skip = (cpage - 1) * recordPerPage;

			// 글 목록 - pseq에 따라 게시판번호, 글번호, 제목, 작성자번호, 닉네임, 조회수, 댓글수, 작성일, 수정일, 작성한지 얼마나
			// 시간이흘렀는가를 한페이지에 보여줄 만큼만 가져온 후 seq로 내림차순
			sql = "select seq, '' aseq, subject, content, wdate, 'q' pseq from personal_question where mseq=? " + 
					"UNION ALL " + 
					"select  a.seq, a.aseq, a.subject, a.content, a.wdate, 'a' pseq from personal_answers a " + 
					"inner join " + 
					"(select seq from personal_question where mseq=?) q " + 
					"on q.seq=a.seq " + 
					"order by seq desc, aseq";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mseq);
			pstmt.setString(2, mseq);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardTO boardTO = new BoardTO();

				boardTO.setSeq(rs.getString("seq"));
				boardTO.setAseq(rs.getString("aseq"));
				boardTO.setSubject(rs.getString("subject"));
				boardTO.setContent(rs.getString("content"));
				boardTO.setWdate_ori(rs.getString("wdate"));
				boardTO.setPseq(rs.getString("pseq"));

				boardLists.add(boardTO);
			}

			// 글 목록
			boardListsTO.setBoardLists(boardLists);
			// 블럭 시작번호
			boardListsTO.setStartBlock(((cpage - 1) / blockPerPage) * blockPerPage + 1);
			// 블럭 끝번호
			boardListsTO.setEndBlock(((cpage - 1) / blockPerPage) * blockPerPage + blockPerPage);

			if (boardListsTO.getEndBlock() >= boardListsTO.getTotalPage()) {
				boardListsTO.setEndBlock(boardListsTO.getTotalPage());
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
		return boardListsTO;
	}

	public int myquestionWriteOk(BoardTO boardTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;

		try {
			conn = dataSource.getConnection();
			String sql = "insert into personal_question values (0, ?, ?, ?, ?, now(), ?, ?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, boardTO.getMseq());
			pstmt.setString(2, boardTO.getWriter());
			pstmt.setString(3, boardTO.getSubject());
			pstmt.setString(4, boardTO.getContent());
			pstmt.setString(5, boardTO.getFilename_ori());
			pstmt.setString(6, boardTO.getFilename_new());

			int result = pstmt.executeUpdate();

			if (result == 1) {
				flag = 0;
			}
		} catch (SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
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

		return flag;
	}

	public BoardTO myquestion_view(String seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardTO boardTO = new BoardTO();
		try {
			conn = dataSource.getConnection();

			String sql = "select seq, subject, content, date_format(wdate,'%Y-%m-%d %H:%i:%s') wdate, filename_new, filename_ori from personal_question where seq=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardTO.setSeq(rs.getString("seq"));
				boardTO.setSubject(rs.getString("subject"));
				boardTO.setContent(rs.getString("content"));
				boardTO.setWdate_ori(rs.getString("wdate"));
				boardTO.setFilename_new(rs.getString("filename_new"));
				boardTO.setFilename_ori(rs.getString("filename_ori"));
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

		return boardTO;
	}
	
	public BoardTO myquestion_answer(String aseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardTO boardTO = new BoardTO();
		try {
			conn = dataSource.getConnection();
			// 게시물 가져오기
			String sql = "select seq, aseq, subject, content, date_format(wdate,'%Y-%m-%d %H:%i:%s') wdate, filename_new, filename_ori from personal_answers where aseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aseq);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardTO.setSeq(rs.getString("seq"));
				boardTO.setAseq(rs.getString("aseq"));
				boardTO.setSubject(rs.getString("subject"));
				boardTO.setContent(rs.getString("content"));
				boardTO.setWdate_ori(rs.getString("wdate"));
				boardTO.setFilename_new(rs.getString("filename_new"));
				boardTO.setFilename_ori(rs.getString("filename_ori"));
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

		return boardTO;
	}

	public int myquestion_delete_ok(String seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int flag = 2;

		try {
			conn = dataSource.getConnection();

			String sql = "select filename_new from personal_question where seq =?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, seq);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				String filename_new = rs.getString("filename_new");

				// 글 삭제
				sql = "delete from personal_question where seq=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seq);

				int result = pstmt.executeUpdate();
				
				// 삭제성공했으면 flag는 0, 아니면 1
				if (result == 1) {
					flag = 0;
					if (filename_new != null || !filename_new.equals("")) {
						// 만약 파일이 있다면 파일 삭제
						File file = new File(uploadPath + "\\" + filename_new);
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
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
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
		return flag;
	}
}