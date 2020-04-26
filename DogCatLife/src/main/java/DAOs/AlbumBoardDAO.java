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

public class AlbumBoardDAO {
	private DataSource dataSource = null;
//	private String uploadPath = "C:\\Users\\kitcoop\\Desktop\\Git\\MyStudy2019.10\\webproject01\\DogCatLife\\src\\main\\webapp\\resources\\upload";
	private String uploadPath = "/var/lib/tomcat8/webapps/DogCatLifeUpload";
	
	public AlbumBoardDAO() {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mariadb");
		} catch (NamingException e) {
			System.out.println("[에러1] : " + e.getMessage());
		}
	}

	public int album_boardWriteOk(BoardTO boardTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;

		try {
			conn = dataSource.getConnection();
			String sql = "insert into board values (?,0,?,?,?,?,?,?,0,0,now(),now())";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, boardTO.getPseq());
			pstmt.setString(2, boardTO.getSubject());
			pstmt.setString(3, boardTO.getMseq());
			pstmt.setString(4, boardTO.getWriter());
			pstmt.setString(5, boardTO.getContent());
			pstmt.setString(6, boardTO.getFilename_ori());
			pstmt.setString(7, boardTO.getFilename_new());

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

	public BoardListsTO albumBoardList(BoardListsTO boardListsTO) {
		// 현재 게시판
		int pseq = boardListsTO.getPseq();
		// 현재페이지
		int cpage = boardListsTO.getCpage();
		// 한 페이지에 몇개 보이는지? 10개
		int recordPerPage = 15;
		// 한블럭에 몇개들어가는지? (5개)
		int blockPerPage = boardListsTO.getBlockPerPage();
		// 총 글 수
		int totalRecord = boardListsTO.getTotalRecord();
		// 글목록이 담길곳
		ArrayList<BoardTO> boardLists = new ArrayList();
		// 검색어
		String searchKeyWord = boardListsTO.getSearchKeyWord();
		String searchField= boardListsTO.getSearchField();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			
			// 총 글 수 totalRecord
			String sql="";
			if (searchKeyWord != null) {
				// 제목+내용검색
				if (searchField.equals("0")) {
					sql = "select count('seq') totalRecord from board where pseq=? and (subject like ? or content like ?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, pseq);
					pstmt.setString(2, "%" + searchKeyWord + "%");
					pstmt.setString(3, "%" + searchKeyWord + "%");
				} else if (searchField.equals("1")) {
					sql = "select count('seq') totalRecord from board where pseq=? and subject like ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, pseq);
					pstmt.setString(2, "%" + searchKeyWord + "%");
				} else if (searchField.equals("2")) {
					sql = "select count('seq') totalRecord from board where pseq=? and content like ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, pseq);
					pstmt.setString(2, "%" + searchKeyWord + "%");
				}
			} else {
				sql = "select count('seq') totalRecord from board where pseq=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pseq);
			}
			
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
			if (searchKeyWord != null) {
				// 제목+내용검색
				if (searchField.equals("0")) {
					sql = "select pseq, seq, subject, mseq, writer, content,hit, cmt, date_format(wdate_ori, '%Y-%m-%d %H:%i') wdate_ori, date_format(wdate_mod, '%Y-%m-%d %H:%i') wdate_mod, hour(timediff(now(), wdate_ori)) wgap, filename_new from board where pseq=? and (subject like ? or content like ?) order by seq desc limit ?, ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, pseq);
					pstmt.setString(2, "%" + searchKeyWord + "%");
					pstmt.setString(3, "%" + searchKeyWord + "%");
					pstmt.setInt(4, skip);
					pstmt.setInt(5, recordPerPage);
				} else if (searchField.equals("1")) {
					// 제목검색
					sql = "select pseq, seq, subject, mseq, writer, content,hit, cmt, date_format(wdate_ori, '%Y-%m-%d %H:%i') wdate_ori, date_format(wdate_mod, '%Y-%m-%d %H:%i') wdate_mod, hour(timediff(now(), wdate_ori)) wgap, filename_new from board where pseq=? and subject like ? order by seq desc limit ?, ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, pseq);
					pstmt.setString(2, "%" + searchKeyWord + "%");
					pstmt.setInt(3, skip);
					pstmt.setInt(4, recordPerPage);
				} else if (searchField.equals("2")) {
					// 내용검색
					sql = "select pseq, seq, subject, mseq, writer, content,hit, cmt, date_format(wdate_ori, '%Y-%m-%d %H:%i') wdate_ori, date_format(wdate_mod, '%Y-%m-%d %H:%i') wdate_mod, hour(timediff(now(), wdate_ori)) wgap, filename_new from board where pseq=? and content like ? order by seq desc limit ?, ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, pseq);
					pstmt.setString(2, "%" + searchKeyWord + "%");
					pstmt.setInt(3, skip);
					pstmt.setInt(4, recordPerPage);
				} 
			} else {
				sql = "select pseq, seq, subject, mseq, writer, content,hit, cmt, date_format(wdate_ori, '%Y-%m-%d %H:%i') wdate_ori, date_format(wdate_mod, '%Y-%m-%d %H:%i') wdate_mod, hour(timediff(now(), wdate_ori)) wgap, filename_new from board where pseq=? order by seq desc limit ?, ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pseq);
				pstmt.setInt(2, skip);
				pstmt.setInt(3, recordPerPage);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardTO boardTO = new BoardTO();

				boardTO.setSeq(rs.getString("seq"));
				boardTO.setPseq(rs.getString("pseq"));
				boardTO.setSubject(rs.getString("subject"));
				boardTO.setMseq(rs.getString("mseq"));
				boardTO.setWriter(rs.getString("writer"));
				boardTO.setHit(rs.getString("hit"));
				boardTO.setCmt(rs.getString("cmt"));
				boardTO.setWdate_ori(rs.getString("wdate_ori"));
				boardTO.setWdate_mod(rs.getString("wdate_mod"));
				boardTO.setWgap(rs.getInt("wgap"));
				boardTO.setFilename_new(rs.getString("filename_new"));

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

	public ArrayList<BoardTO> albumBoardView(String seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<BoardTO> toLists = new ArrayList<BoardTO>();

		try {
			conn = dataSource.getConnection();

			// 조회수 증가
			String sql = "update board set hit=hit+1 where seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);

			pstmt.executeUpdate();

			// 게시물 가져오기
			sql = "select pseq, seq, subject, mseq, writer, content, date_format(wdate_ori,'%Y-%m-%d %H:%i:%s') wdate_ori, date_format(wdate_mod,'%Y-%m-%d %H:%i:%s') wdate_mod, hit, filename_new from board  where seq = ?";
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

				toLists.add(boardTO);
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

				toLists.add(boardTO);
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

		return toLists;
	}

	public int album_Board_reply_ok(BoardTO boardTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;
		try {
			conn = dataSource.getConnection();

			// 댓글 작성
			String sql = "insert into comment_board values(?, 0, ?, ?, ?, now(), now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardTO.getSeq());
			pstmt.setString(2, boardTO.getCmseq());
			pstmt.setString(3, boardTO.getCwriter());
			pstmt.setString(4, boardTO.getComment());

			int result = pstmt.executeUpdate();

			if (result == 1) {
				flag = 0;
			}

		} catch (SQLException e) {
			System.out.println("error1 : " + e.getMessage());
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

	public BoardTO album_BoardModify(BoardTO boardTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();

			String sql = "select seq, writer, mseq, subject, content, filename_ori from board where seq = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, boardTO.getSeq());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardTO.setSeq(rs.getString("seq"));
				boardTO.setWriter(rs.getString("writer"));
				boardTO.setMseq(rs.getString("mseq"));
				boardTO.setSubject(rs.getString("subject"));
				boardTO.setContent(rs.getString("content"));
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

	public int album_BoardModifyOk(BoardTO boardTO) {
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
					File file = new File(uploadPath + "\\" + oldfilename);
					file.delete();
				}
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
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		return flag;
	}

	public int album_BoardDeleteOk(BoardTO boardTO) {
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
						File file = new File(uploadPath + "\\" + boardTO.getFilename_new());
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
	
	public int album_BoardCommentDeleteOk(BoardTO boardTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int flag = 1;

		try {
			conn = dataSource.getConnection();

			String sql = "delete from comment_board where cseq=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, boardTO.getCseq());

			int result = pstmt.executeUpdate();
			
			if (result == 1) {
				flag = 0;
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