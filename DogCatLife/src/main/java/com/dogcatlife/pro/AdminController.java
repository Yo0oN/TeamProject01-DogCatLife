package com.dogcatlife.pro;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAOs.AdminDAO;
import DAOs.Test;
import TOs.AdminsTO;
import TOs.BoardListsTO;
import TOs.BoardTO;
import TOs.QuestionsTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	//학원용
	//private String path = "L:\\Java\\workspace\\AdminDogCatLife\\src\\main\\webapp\\resources\\upload";
	//집용
	//private String path = "D:\\Java\\workspace\\AdminDogCatLife\\src\\main\\webapp\\resources\\upload";
	//배포용
	private String path = "/var/lib/tomcat8/webapps/DogCatLife/resources/upload";
	
	@RequestMapping({ "/", "/admin_login.mysql" })
	public ModelAndView admin_login() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_login");
		return modelAndView;
	}

	@RequestMapping({ "/", "/admin_login_ok.mysql" })
	public ModelAndView admin_login_ok(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();

		AdminsTO adminsTO = new AdminsTO();
		AdminDAO adminDAO = new AdminDAO();
		String id = request.getParameter("admin_id");
		String password = request.getParameter("admin_pw");
		adminsTO.setId(id);
		adminsTO.setPassword(password);
		int flag = adminDAO.loginOk(adminsTO);
		modelAndView.addObject("flag", flag);
		modelAndView.addObject("id", id);
		modelAndView.setViewName("admin/admin_login_ok");
		return modelAndView;
	}

	@RequestMapping("/admin_main.mysql")
	public ModelAndView admin_main(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_main");

		AdminDAO adminDAO = new AdminDAO();
		BoardListsTO boardListsTO = new BoardListsTO();
		
		modelAndView.addObject("boardListsTO", adminDAO.mainList(boardListsTO));
		
		modelAndView.addObject("graphLists2", adminDAO.getUserData());
		modelAndView.addObject("graphLists1", adminDAO.getConData());
		
		return modelAndView;
	}

	@RequestMapping("/admin_contents.mysql")
	public ModelAndView admin_contents(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_contents");

		BoardTO to = new BoardTO();
		AdminDAO adminDAO = new AdminDAO();
		BoardListsTO boardListsTO = new BoardListsTO();

		String cpage = request.getParameter("cpage");
		// String pseq = request.getParameter("pseq");

		if (cpage != null) {
			boardListsTO.setCpage(Integer.parseInt(cpage));
		}
		// boardListsTO.setPseq(Integer.parseInt(pseq));
		// 寃뚯떆�뙋 �빆紐�
		String codeopt = request.getParameter("codeopt");
		// �떆�옉�궇吏�
		String sdate = request.getParameter("sdate");
		// �걹�궇吏�
		String edate = request.getParameter("edate");
		// �궎�썙�뱶寃��깋 議곌굔
		String searchopt = request.getParameter("searchopt");
		// 寃��깋 �궎�썙�뱶
		String searchkey = request.getParameter("searchkey");

		// 寃뚯떆�뙋蹂� 議곌굔 �뾾�쓣�븣
		boolean o1 = codeopt.equals("1");
		// �궎�썙�뱶寃��깋 議곌굔 �뾾�쓣�븣
		boolean o2 = searchkey.equals("");
		// �벑濡앹씪 議곌굔 �뾾�쓣�븣
		boolean o3 = ((sdate.equals("")) && (edate.equals("")));

		// 寃뚯떆�뙋蹂꾩“嫄� X (1**)
		if (o1) {

			// 寃뚯떆�뙋蹂꾩“嫄� X �궎�썙�뱶寃��깋 X (11*)
			if (o2) {

				// 寃뚯떆�뙋蹂꾩“嫄� X �궎�썙�뱶寃��깋 X �벑濡앹씪議곌굔 X (111) / BoardList();
				if (o3) {
					modelAndView.addObject("boardLists", adminDAO.boardList(boardListsTO));
					System.out.println("111");
					// 寃뚯떆�뙋蹂꾩“嫄� X �궎�썙�뱶寃��깋 X �벑濡앹씪議곌굔 O (112) / BoardList( sdate , edate );
				} else {
					sdate += " 00:00:00";
					edate += " 23:59:59";
					modelAndView.addObject("boardLists", adminDAO.boardList(boardListsTO, sdate, edate));
					System.out.println("112");
				}
				// 寃뚯떆�뙋蹂꾨룄嫄� X �궎�썙�뱶寃��깋 O (12*)
			} else {
				searchkey = "%" + searchkey + "%";
				// 寃뚯떆�뙋蹂꾩“嫄� X �궎�썙�뱶寃��깋 O �벑濡앹씪議곌굔 X (121) / SearchContentsWithKey( searchopt
				// , searchkey );
				if (o3) {
					modelAndView.addObject("boardLists",
							adminDAO.searchContentsWithKey(boardListsTO, searchopt, searchkey));
					System.out.println("121");
					// 寃뚯떆�뙋蹂꾩“嫄� X �궎�썙�뱶寃��깋 O �벑濡앹씪議곌굔 O (122) / BoardList( searchopt ,
					// searchkey, sdate, edate );
				} else {
					sdate += " 00:00:00";
					edate += " 23:59:59";
					searchkey = "%" + searchkey + "%";
					modelAndView.addObject("boardLists",
							adminDAO.boardList(boardListsTO, searchopt, searchkey, sdate, edate));
					System.out.println("122");
				}
			}
			// 寃뚯떆�뙋蹂꾩“嫄� O (2**)
		} else {

			// 寃뚯떆�뙋蹂� 議곌굔 Setting
			if (codeopt.equals("2")) {
				to.setPseq("11");
			} else if (codeopt.equals("3")) {
				to.setPseq("12");
			} else if (codeopt.equals("4")) {
				to.setPseq("21");
			} else if (codeopt.equals("5")) {
				to.setPseq("22");
			} else if (codeopt.equals("6")) {
				to.setPseq("31");
			} else if (codeopt.equals("7")) {
				to.setPseq("32");
			}

			// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 X (21*)
			if (o2) {

				// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 X �벑濡앹씪議곌굔 X (211) / BoardList(pseq);
				if (o3) {
					modelAndView.addObject("boardLists", adminDAO.boardList(boardListsTO, to.getPseq()));
					System.out.println("211");
					// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 X �벑濡앹씪議곌굔 O (212) / BoardList( pseq , sdate , edate
					// );
				} else {
					sdate += " 00:00:00";
					edate += " 23:59:59";
					modelAndView.addObject("boardLists", adminDAO.boardList(boardListsTO, to.getPseq(), sdate, edate));
					System.out.println("212");
				}

				// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 O (22*)
			} else {
				// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 O �벑濡앹씪議곌굔 X (221) / SearchContentsWithKey( pseq ,
				// searchopt , searchkey );
				if (o3) {
					searchkey = "%" + searchkey + "%";
					modelAndView.addObject("boardLists",
							adminDAO.searchContentsWithKey(boardListsTO, to.getPseq(), searchopt, searchkey));
					System.out.println("221");
					// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 O �벑濡앹씪議곌굔 O (222) / BoardList( pseq , searchopt ,
					// searchkey , sdate , edate );
				} else {
					searchkey = "%" + searchkey + "%";
					sdate += " 00:00:00";
					edate += " 23:59:59";
					modelAndView.addObject("boardLists",
							adminDAO.boardList(boardListsTO, to.getPseq(), searchopt, searchkey, sdate, edate));
					System.out.println("222");
				}
			}
		}

		return modelAndView;
	}

	@RequestMapping("/admin_view.mysql")
	public ModelAndView admin_view(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_view");
		
		String seq = request.getParameter("seq");
		AdminDAO adminDAO = new AdminDAO();
		modelAndView.addObject("viewLists", adminDAO.boardView(seq));
		return modelAndView;
	}
	
	@RequestMapping("/admin_contents_modify.mysql")
	public ModelAndView admin_contents_modify(HttpServletRequest request) {
		System.out.println("관리자가 게시글 수정");
		ModelAndView modelAndView = new ModelAndView();

		String seq = request.getParameter("seq");

		AdminDAO adminDAO = new AdminDAO();	
		
		modelAndView.addObject("modifyLists", adminDAO.boardModify(seq));
		modelAndView.setViewName("admin/admin_contents_modify");
		return modelAndView;
	}
	
	@RequestMapping("/admin_contents_modify_ok.mysql")
	public ModelAndView admin_contents_modify_ok(HttpServletRequest request) {
		System.out.println("관리자가 게시글 수정");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_modify_ok");
		BoardTO boardTO = new BoardTO();
		String seq = "";
		String pseq = "";
		try {
			
			int filesize = 1024 * 1024 * 2;

			MultipartRequest multi = new MultipartRequest(request, path, filesize, "utf-8",
					new DefaultFileRenamePolicy());

			seq = multi.getParameter("seq");
			pseq = multi.getParameter("pseq");

			boardTO.setPseq(pseq);
			boardTO.setSeq(seq);
			boardTO.setSubject(multi.getParameter("subject"));
			boardTO.setContent(multi.getParameter("content"));
			System.out.println(multi.getParameter("content"));

			if (multi.getFile("upload") != null) {
				boardTO.setFilename_ori(multi.getOriginalFileName("upload"));
				boardTO.setFilename_new(multi.getFilesystemName("upload"));
			} else {
				boardTO.setFilename_ori("");
				boardTO.setFilename_new("");
			}

			int flag = new AdminDAO().boardModifyOk(boardTO);

			modelAndView.addObject("flag", flag);
			modelAndView.addObject("seq", Integer.parseInt(seq));

		} catch (IOException e) {}

		return modelAndView;
	}
	
	@RequestMapping("/admin_contents_delete.mysql")
	public ModelAndView admin_contents_delete(HttpServletRequest request) {
		System.out.println("寃뚯떆湲� �궘�젣");
		ModelAndView modelAndView = new ModelAndView();

		String seq = request.getParameter("seq");

		BoardTO boardTO = new BoardTO();
		boardTO.setSeq(seq);
		AdminDAO adminDAO = new AdminDAO();
		int flag = adminDAO.adminContentsDelete(boardTO);
		modelAndView.addObject("flag", flag);
		modelAndView.setViewName("admin/admin_contents_delete");
		return modelAndView;
	}

	@RequestMapping("/admin_contents_multidelete.mysql")
	public ModelAndView admin_contents_multidelete(HttpServletRequest request) {
		System.out.println("다중삭제");
		ModelAndView modelAndView = new ModelAndView();

		String seq = request.getParameter("seq");
		BoardTO boardTO = new BoardTO();
		boardTO.setSeq(seq);
		
		AdminDAO adminDAO = new AdminDAO(); 
		int flag = adminDAO.adminContentsMultiDelete(boardTO);
		modelAndView.addObject("flag",flag);
		modelAndView.setViewName("admin/admin_contents_multidelete"); 
		 
		return modelAndView;
	}

	// �뙎湲�
	@RequestMapping("/admin_comments.mysql")
	public ModelAndView admin_comments(HttpServletRequest request) {
		System.out.println("댓글");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_comments");
		BoardTO to = new BoardTO();
		AdminDAO adminDAO = new AdminDAO();
		BoardListsTO boardListsTO = new BoardListsTO();
		String cpage = request.getParameter("cpage");

		if (cpage != null) {
			boardListsTO.setCpage(Integer.parseInt(cpage));
		}
		// 寃뚯떆�뙋 �빆紐�
		String codeopt = request.getParameter("codeopt");
		// �떆�옉�궇吏�
		String sdate = request.getParameter("sdate");
		// �걹�궇吏�
		String edate = request.getParameter("edate");
		// �궎�썙�뱶寃��깋 議곌굔
		String searchopt = request.getParameter("searchopt");
		// 寃��깋 �궎�썙�뱶
		String searchkey = request.getParameter("searchkey");
		/*
		 * System.out.println(cpage); System.out.println(codeopt);
		 * System.out.println(sdate); System.out.println(edate);
		 * System.out.println(searchopt); System.out.println(searchkey);
		 */

		// 寃뚯떆�뙋蹂� 議곌굔 �뾾�쓣�븣
		boolean o1 = codeopt.equals("1");
		// �궎�썙�뱶寃��깋 議곌굔 �뾾�쓣�븣
		boolean o2 = searchkey.equals("");
		// �벑濡앹씪 議곌굔 �뾾�쓣�븣
		boolean o3 = ((sdate.equals("")) && (edate.equals("")));
		// 寃뚯떆�뙋蹂꾩“嫄� X (1**)
		if (o1) {

			// 寃뚯떆�뙋蹂꾩“嫄� X �궎�썙�뱶寃��깋 X (11*)
			if (o2) {

				// 寃뚯떆�뙋蹂꾩“嫄� X �궎�썙�뱶寃��깋 X �벑濡앹씪議곌굔 X (111) / CommentList();
				if (o3) {
					modelAndView.addObject("commentLists", adminDAO.commentList(boardListsTO));
					System.out.println("111");
					// 寃뚯떆�뙋蹂꾩“嫄� X �궎�썙�뱶寃��깋 X �벑濡앹씪議곌굔 O (112) / CommentList( sdate , edate );
				} else {
					sdate += " 00:00:00";
					edate += " 23:59:59";
					modelAndView.addObject("commentLists", adminDAO.commentList(boardListsTO, sdate, edate));
					System.out.println("112");
				}
				// 寃뚯떆�뙋蹂꾨룄嫄� X �궎�썙�뱶寃��깋 O (12*)
			} else {
				searchkey = "%" + searchkey + "%";
				// 寃뚯떆�뙋蹂꾩“嫄� X �궎�썙�뱶寃��깋 O �벑濡앹씪議곌굔 X (121) / SearchCommentsWithKey( searchopt
				// , searchkey );
				if (o3) {
					modelAndView.addObject("commentLists",
							adminDAO.searchCommentsWithKey(boardListsTO, searchopt, searchkey));
					System.out.println("121");
					// 寃뚯떆�뙋蹂꾩“嫄� X �궎�썙�뱶寃��깋 O �벑濡앹씪議곌굔 O (122) / CommentList( searchopt ,
					// searchkey, sdate, edate );
				} else {
					sdate += " 00:00:00";
					edate += " 23:59:59";
					searchkey = "%" + searchkey + "%";
					modelAndView.addObject("commentLists",
							adminDAO.commentList(boardListsTO, searchopt, searchkey, sdate, edate));
					System.out.println("122");
				}
			}
			// 寃뚯떆�뙋蹂꾩“嫄� O (2**)
		} else {

			// 寃뚯떆�뙋蹂� 議곌굔 Setting
			if (codeopt.equals("2")) {
				to.setPseq("11");
			} else if (codeopt.equals("3")) {
				to.setPseq("12");
			} else if (codeopt.equals("4")) {
				to.setPseq("21");
			} else if (codeopt.equals("5")) {
				to.setPseq("22");
			} else if (codeopt.equals("6")) {
				to.setPseq("31");
			} else if (codeopt.equals("7")) {
				to.setPseq("32");
			}

			// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 X (21*)
			if (o2) {

				// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 X �벑濡앹씪議곌굔 X (211) / CommentList(pseq);
				if (o3) {
					modelAndView.addObject("commentLists", adminDAO.commentList(boardListsTO, to.getPseq()));
					System.out.println("211");
					// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 X �벑濡앹씪議곌굔 O (212) / CommentList( pseq , sdate ,
					// edate );
				} else {
					sdate += " 00:00:00";
					edate += " 23:59:59";
					modelAndView.addObject("commentLists",
							adminDAO.commentList(boardListsTO, to.getPseq(), sdate, edate));
					System.out.println("212");
				}

				// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 O (22*)
			} else {
				// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 O �벑濡앹씪議곌굔 X (221) / SearchCommentsWithKey( pseq ,
				// searchopt , searchkey );
				if (o3) {
					searchkey = "%" + searchkey + "%";
					modelAndView.addObject("commentLists",
							adminDAO.searchCommentsWithKey(boardListsTO, to.getPseq(), searchopt, searchkey));
					System.out.println("221");
					// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 O �벑濡앹씪議곌굔 O (222) / CommentList( pseq , searchopt ,
					// searchkey , sdate , edate );
				} else {
					searchkey = "%" + searchkey + "%";
					sdate += " 00:00:00";
					edate += " 23:59:59";
					modelAndView.addObject("commentLists",
							adminDAO.commentList(boardListsTO, to.getPseq(), searchopt, searchkey, sdate, edate));
					System.out.println("222");
				}
			}
		}

		return modelAndView;
	}

	@RequestMapping("/admin_comments_modify.mysql")
	public ModelAndView admin_comments_modify(HttpServletRequest request) {
		System.out.println("관리자가 게시글 수정");
		ModelAndView modelAndView = new ModelAndView();

		String seq = request.getParameter("seq");
		String ccseq = request.getParameter("cseq");
		AdminDAO adminDAO = new AdminDAO();	
		
		modelAndView.addObject("modifyLists", adminDAO.boardModify(seq));
		modelAndView.addObject("ccseq", ccseq);
		modelAndView.setViewName("admin/admin_comments_modify");
		return modelAndView;
	}
	
	@RequestMapping("/admin_comments_modify_ok.mysql")
	public ModelAndView admin_comments_modify_ok(HttpServletRequest request) {
		System.out.println("관리자가 댓글 수정");
		
		ModelAndView modelAndView = new ModelAndView();
		
		String seq = "";
		String cseq = "";
		String cwdate_ori = "";
		String cwdate_mod = "";
		String comment = "";
		
		try {
			
			int filesize = 1024 * 1024 * 2;
			
			MultipartRequest multi = new MultipartRequest(request, path, filesize, "utf-8",
					new DefaultFileRenamePolicy());
			
			seq = multi.getParameter("seq");
			cseq = multi.getParameter("cseq");
			cwdate_ori = multi.getParameter("cwdate_ori");
			cwdate_mod = multi.getParameter("cwdate_mod");
			comment = multi.getParameter("comment");
			
			/*
			 * System.out.println(seq + "    SEQ"); System.out.println(cseq + "    CSEQ");
			 * System.out.println(cwdate_ori + "    CWDATE_ORI");
			 * System.out.println(cwdate_mod + "    CWDATE_MOD"); System.out.println(comment
			 * + "    COMMENT");
			 */
			
			BoardTO boardTO = new BoardTO();
			boardTO.setCseq(cseq);
			boardTO.setCwdate_ori(cwdate_ori);
			boardTO.setCwdate_mod(cwdate_mod);
			boardTO.setComment(comment);
			
			AdminDAO adminDAO = new AdminDAO();
			
			int flag = adminDAO.commentModifyOk(boardTO);
			
			modelAndView.addObject("seq", Integer.parseInt(seq));
			modelAndView.addObject("flag", flag);
			modelAndView.setViewName("admin/admin_modify_ok");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return modelAndView;
	}
	
	@RequestMapping("/admin_comments_delete.mysql")
	public ModelAndView admin_comments_delete(HttpServletRequest request) {
		System.out.println("寃뚯떆湲� �궘�젣");
		ModelAndView modelAndView = new ModelAndView();

		String cseq = request.getParameter("cseq");

		// System.out.println(seq+"SEQ");

		AdminDAO adminDAO = new AdminDAO();
		int flag = adminDAO.adminCommentsDelete(cseq);
		modelAndView.addObject("flag", flag);
		modelAndView.setViewName("admin/admin_comments_delete");
		return modelAndView;
	}

	@RequestMapping("/admin_comments_multidelete.mysql")
	public ModelAndView admin_comments_multidelete(HttpServletRequest request) {
		System.out.println("댓글 다중삭제");
		ModelAndView modelAndView = new ModelAndView();

		String cseq = request.getParameter("seq");
		//System.out.println(seq + "SEQ");
		
		AdminDAO adminDAO = new AdminDAO(); 
		int flag = adminDAO.adminCommentsMultiDelete(cseq);
		modelAndView.addObject("flag",flag);
		modelAndView.setViewName("admin/admin_comments_multidelete"); 
		 
		return modelAndView;
	}
	
	@RequestMapping("/admin_user.mysql")
	public ModelAndView admin_user(HttpServletRequest request) {
		System.out.println("회원 관리");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_user");
		// UserTO userTO = new UserTO();
		AdminDAO adminDAO = new AdminDAO();
		BoardListsTO userListsTO = new BoardListsTO();

		String cpage = request.getParameter("cpage");
		// String pseq = request.getParameter("pseq");

		if (cpage != null) {
			userListsTO.setCpage(Integer.parseInt(cpage));
		}
		// boardListsTO.setPseq(Integer.parseInt(pseq));

		String sdate = request.getParameter("sdate");
		// �걹�궇吏�
		String edate = request.getParameter("edate");
		// �궎�썙�뱶寃��깋 議곌굔
		String searchopt = request.getParameter("searchopt");
		// 寃��깋 �궎�썙�뱶
		String searchkey = request.getParameter("searchkey");

		// �궎�썙�뱶寃��깋 議곌굔 �뾾�쓣�븣
		boolean o1 = searchkey.equals("");
		// �벑濡앹씪 議곌굔 �뾾�쓣�븣
		boolean o2 = ((sdate.equals("")) && (edate.equals("")));

		if (o1) {
			if (o2) {

				modelAndView.addObject("userListsTO", adminDAO.userList(userListsTO));
				System.out.println("11");
			} else {
				sdate += " 00:00:00";
				edate += " 23:59:59";
				modelAndView.addObject("userListsTO", adminDAO.userList(userListsTO, sdate, edate));
				System.out.println("12");
			}
		} else {
			searchkey = "%" + searchkey + "%";

			if (o2) {
				modelAndView.addObject("userListsTO", adminDAO.searchUsersWithKey(userListsTO, searchopt, searchkey));
				System.out.println("21");
			} else {
				sdate += " 00:00:00";
				edate += " 23:59:59";
				modelAndView.addObject("userListsTO",
						adminDAO.userList(userListsTO, searchopt, searchkey, sdate, edate));
				System.out.println("22");
			}
		}

		return modelAndView;
	}

	@RequestMapping("/admin_users_delete.mysql")
	public ModelAndView admin_users_delete(HttpServletRequest request) {
		System.out.println("寃뚯떆湲� �궘�젣");
		ModelAndView modelAndView = new ModelAndView();

		String mseq = request.getParameter("mseq");

		AdminDAO adminDAO = new AdminDAO();
		int flag = adminDAO.adminUsersDelete(mseq);
		modelAndView.addObject("flag", flag);
		modelAndView.setViewName("admin/admin_users_delete");
		return modelAndView;
	}
	
	@RequestMapping("/admin_users_multidelete.mysql")
	public ModelAndView admin_users_multidelete(HttpServletRequest request) {
		System.out.println("댓글 다중삭제");
		ModelAndView modelAndView = new ModelAndView();

		String mseq = request.getParameter("seq");
		//System.out.println(seq + "SEQ");
		
		AdminDAO adminDAO = new AdminDAO(); 
		int flag = adminDAO.adminCommentsMultiDelete(mseq);
		modelAndView.addObject("flag",flag);
		modelAndView.setViewName("admin/admin_users_multidelete"); 
		 
		return modelAndView;
	}

	@RequestMapping("/admin_an.mysql")
	public ModelAndView admin_an(HttpServletRequest request) {
		System.out.println("공지사항");
		ModelAndView modelAndView = new ModelAndView();
		AdminDAO adminDAO = new AdminDAO();
		BoardListsTO anListsTO = new BoardListsTO();
		
		modelAndView.addObject("anListsTO", adminDAO.anList(anListsTO));
		modelAndView.setViewName("admin/admin_an");

		BoardTO to = new BoardTO();

		String cpage = request.getParameter("cpage");
		// String pseq = request.getParameter("pseq");

		if (cpage != null) {
			anListsTO.setCpage(Integer.parseInt(cpage));
		}
		// boardListsTO.setPseq(Integer.parseInt(pseq));

		String sdate = request.getParameter("sdate");
		// �걹�궇吏�
		String edate = request.getParameter("edate");
		// �궎�썙�뱶寃��깋 議곌굔
		String searchopt = request.getParameter("searchopt");
		// 寃��깋 �궎�썙�뱶
		String searchkey = request.getParameter("searchkey");

				
		boolean o1 = ((sdate.equals("")) && (edate.equals("")));
		boolean o2 = searchkey.equals("");

		if (o1) {

			if (o2) {
				modelAndView.addObject("anListsTO", adminDAO.anList(anListsTO));
				System.out.println("11");
			} else {
				searchkey = "%" + searchkey + "%";
				modelAndView.addObject("anListsTO",
						adminDAO.searchAnsWithKey(anListsTO, searchopt, searchkey));
				System.out.println("12");
			}
			
		} else {
				sdate += " 00:00:00";
				edate += " 23:59:59";
			if(o2) {
				modelAndView.addObject("anListsTO", adminDAO.anList(anListsTO, sdate, edate));
				System.out.println("21");
			} else {					
				searchkey = "%" + searchkey + "%";
				modelAndView.addObject("anListsTO",
					adminDAO.anList(anListsTO, searchopt, searchkey, sdate, edate));
				System.out.println("22");
				
			}
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/admin_an_write.mysql")
	public ModelAndView admin_an_write(HttpServletRequest request) {
		System.out.println("관리자가 게시글 수정");
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("admin/admin_an_write");
		return modelAndView;
	}
	
	@RequestMapping("/admin_an_write_ok.mysql")
	public ModelAndView admin_an_write_ok(HttpServletRequest request) {
		System.out.println("관리자가 공지사항 쓰기");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_an_write_ok");
		BoardTO boardTO = new BoardTO();
		
		try {
			
			int filesize = 1024 * 1024 * 2;

			MultipartRequest multi = new MultipartRequest(request, path, filesize, "utf-8",
					new DefaultFileRenamePolicy());
			
			boardTO.setSubject(multi.getParameter("subject"));
			boardTO.setContent(multi.getParameter("content"));

			if (multi.getFile("upload") != null) {
				boardTO.setFilename_ori(multi.getOriginalFileName("upload"));
				boardTO.setFilename_new(multi.getFilesystemName("upload"));
			} else {
				boardTO.setFilename_ori("");
				boardTO.setFilename_new("");
			}

			int flag = new AdminDAO().anWriteOk(boardTO);

			modelAndView.addObject("flag", flag);

		} catch (IOException e) {}

		return modelAndView;
	}
	
	@RequestMapping("/admin_an_delete.mysql")
	public ModelAndView admin_an_delete(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();

		String seq = request.getParameter("seq");
		BoardTO boardTO = new BoardTO();
		boardTO.setSeq(seq);
		
		AdminDAO adminDAO = new AdminDAO(); 
		int flag = adminDAO.adminAnDelete(boardTO);
		modelAndView.addObject("flag",flag);
		modelAndView.setViewName("admin/admin_an_delete"); 
		 
		return modelAndView;
	}
	
	@RequestMapping("/admin_an_multidelete.mysql")
	public ModelAndView admin_an_multidelete(HttpServletRequest request) {
		System.out.println("공지사항 다중삭제");
		ModelAndView modelAndView = new ModelAndView();

		String seq = request.getParameter("seq");
		BoardTO boardTO = new BoardTO();
		boardTO.setSeq(seq);
		
		AdminDAO adminDAO = new AdminDAO();
		int flag = adminDAO.adminAnMultiDelete(boardTO);
		modelAndView.addObject("flag",flag);
		modelAndView.setViewName("admin/admin_an_multidelete"); 
		 
		return modelAndView;
	}

	@RequestMapping("/admin_qna.mysql")
	public ModelAndView admin_qna(HttpServletRequest request) {
		System.out.println("1:1문의");
		ModelAndView modelAndView = new ModelAndView();
		
		BoardTO to = new BoardTO();		
		AdminDAO adminDAO = new AdminDAO();
		BoardListsTO qnaListsTO = new BoardListsTO();
		
		String cpage = request.getParameter("cpage");
		
		if (cpage != null) {
			qnaListsTO.setCpage(Integer.parseInt(cpage));
		}
		
		// 寃뚯떆�뙋 �빆紐�
		String codeopt = request.getParameter("codeopt");
		// �떆�옉�궇吏�
		String sdate = request.getParameter("sdate");
		// �걹�궇吏�
		String edate = request.getParameter("edate");
		// �궎�썙�뱶寃��깋 議곌굔
		String searchopt = request.getParameter("searchopt");
		// 寃��깋 �궎�썙�뱶
		String searchkey = request.getParameter("searchkey");
		
		
		boolean o1 = codeopt.equals("flag");
		
		boolean o2 = (sdate.equals("")) && (edate.equals(""));
		
		boolean o3 = searchkey.equals("");
		
		if (o1) {

			if (o2) {

				if (o3) {
					modelAndView.addObject("qnaListsTO", adminDAO.qnAList(qnaListsTO));
					System.out.println("111");
					
				} else {
					searchkey = "%" + searchkey + "%";
					modelAndView.addObject("qnaListsTO", adminDAO.searchQnAWithKey(qnaListsTO, searchopt, searchkey));
					System.out.println("112");
				}

			} else {
				
				sdate += " 00:00:00";
				edate += " 23:59:59";
				
				if (o3) {
					modelAndView.addObject("qnaListsTO",
							adminDAO.qnAList(qnaListsTO, sdate, edate));
					System.out.println("121");

				} else {
					searchkey = "%" + searchkey + "%";
					modelAndView.addObject("qnaListsTO",
							adminDAO.qnAList(qnaListsTO, searchopt, searchkey, sdate, edate));
					System.out.println("122");
				}
			}

		} else {

			// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 X (21*)
			if (o2) {

				// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 X �벑濡앹씪議곌굔 X (211) / BoardList(pseq);
				if (o3) {
					modelAndView.addObject("qnaListsTO", adminDAO.qnAList(qnaListsTO, codeopt));
					System.out.println("211");
					// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 X �벑濡앹씪議곌굔 O (212) / BoardList( pseq , sdate , edate
					// );
				} else {
					searchkey = "%" + searchkey + "%";					
					modelAndView.addObject("qnaListsTO", adminDAO.searchQnAWithKey(qnaListsTO, codeopt, searchopt, searchkey));
					System.out.println("212");
				}

				// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 O (22*)
			} else {
				sdate += " 00:00:00";
				edate += " 23:59:59";
				
				if (o3) {

					modelAndView.addObject("qnaListsTO",
							adminDAO.qnAList(qnaListsTO, codeopt, sdate, edate));
					System.out.println("221");
					// 寃뚯떆�뙋蹂꾩“嫄� O �궎�썙�뱶寃��깋 O �벑濡앹씪議곌굔 O (222) / BoardList( pseq , searchopt ,
					// searchkey , sdate , edate );
				} else {
					searchkey = "%" + searchkey + "%";
					modelAndView.addObject("qnaListsTO",
							adminDAO.qnAList(qnaListsTO, codeopt, searchopt, searchkey, sdate, edate));
					System.out.println("222");
				}
			}
		}
		
		modelAndView.setViewName("admin/admin_qna");
		return modelAndView;
	}
	
	@RequestMapping("/admin_qna_view.mysql")
	public ModelAndView admin_qna_view(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_qna_view");
		
		String seq = request.getParameter("seq");
		AdminDAO adminDAO = new AdminDAO();
		modelAndView.addObject("qLists", adminDAO.qnaview(seq));
		return modelAndView;
	}
	
	@RequestMapping("/admin_qna_delete.mysql")
	public ModelAndView admin_qna_delete(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();

		String seq = request.getParameter("seq");		
		
		AdminDAO adminDAO = new AdminDAO(); 
		int flag = adminDAO.qnaDelete(seq);
		modelAndView.addObject("flag",flag);
		modelAndView.setViewName("admin/admin_qna_delete");
		 
		return modelAndView;
	}
	
	@RequestMapping("/admin_qna_multidelete.mysql")
	public ModelAndView admin_qna_multidelete(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();

		String seq = request.getParameter("seq");		
		
		AdminDAO adminDAO = new AdminDAO(); 
		int flag = adminDAO.qnaMultiDelete(seq);
		modelAndView.addObject("flag",flag);
		modelAndView.setViewName("admin/admin_qna_multidelete");
		 
		return modelAndView;
	}
	
	@RequestMapping("/admin_qna_modify.mysql")
	public ModelAndView admin_qna_modify(HttpServletRequest request) {
		System.out.println("관리자가 답변 수정");
		ModelAndView modelAndView = new ModelAndView();
		//String cpage = request.getParameter("cpage");
		String aseq = request.getParameter("aseq");
		AdminDAO adminDAO = new AdminDAO();
		
		modelAndView.addObject("qLists", adminDAO.qnaModify(aseq));
		modelAndView.setViewName("admin/admin_qna_modify");
		return modelAndView;
	}
	
	@RequestMapping("/admin_qna_modify_ok.mysql")
	public ModelAndView admin_qna_modify_ok(HttpServletRequest request) {
		System.out.println("관리자가 게시글 수정");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_qna_modify_ok");
		BoardTO boardTO = new BoardTO();
		String seq = "";
		String aseq = "";
		try {
			
			int filesize = 1024 * 1024 * 2;

			MultipartRequest multi = new MultipartRequest(request, path, filesize, "utf-8",
					new DefaultFileRenamePolicy());

			seq = multi.getParameter("seq");
			aseq = multi.getParameter("aseq");
			//aseq 를 mseq에 저장
			boardTO.setMseq(aseq);
			boardTO.setSeq(seq);
			boardTO.setSubject(multi.getParameter("subject"));
			boardTO.setContent(multi.getParameter("content"));
			System.out.println(multi.getParameter("content"));

			if (multi.getFile("upload") != null) {
				boardTO.setFilename_ori(multi.getOriginalFileName("upload"));
				boardTO.setFilename_new(multi.getFilesystemName("upload"));
			} else {
				boardTO.setFilename_ori("");
				boardTO.setFilename_new("");
			}

			int flag = new AdminDAO().qnaModifyOk(boardTO);

			modelAndView.addObject("flag", flag);
			modelAndView.addObject("aseq", Integer.parseInt(aseq));

		} catch (IOException e) {}

		return modelAndView;
	}
	
	@RequestMapping("/admin_qna_reply.mysql")
	public ModelAndView admin_qna_reply(HttpServletRequest request) {
		System.out.println("관리자가 답변 작성");
		ModelAndView modelAndView = new ModelAndView();	
		String seq = request.getParameter("seq");
		
		modelAndView.addObject("seq", seq);
		modelAndView.setViewName("admin/admin_qna_reply");
		return modelAndView;
	}
	
	@RequestMapping("/admin_qna_reply_ok.mysql")
	public ModelAndView admin_qna_reply_ok(HttpServletRequest request) {
		System.out.println("관리자가 1:1문의 답변 쓰기");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_qna_reply_ok");
		BoardTO boardTO = new BoardTO();
		
		try {
			
			int filesize = 1024 * 1024 * 2;

			MultipartRequest multi = new MultipartRequest(request, path, filesize, "utf-8",
					new DefaultFileRenamePolicy());
			String seq = multi.getParameter("seq");
			boardTO.setSeq(seq);
			boardTO.setSubject(multi.getParameter("subject"));
			boardTO.setContent(multi.getParameter("content"));

			if (multi.getFile("upload") != null) {
				boardTO.setFilename_ori(multi.getOriginalFileName("upload"));
				boardTO.setFilename_new(multi.getFilesystemName("upload"));
			} else {
				boardTO.setFilename_ori("");
				boardTO.setFilename_new("");
			}

			int flag = new AdminDAO().qnaReplyOk(boardTO);

			modelAndView.addObject("flag", flag);

		} catch (IOException e) {}

		return modelAndView;
	}

	@RequestMapping("/admin_questions.mysql")
	public ModelAndView admin_questions(HttpServletRequest request) {
		System.out.println("자주묻는 질문");
		ModelAndView modelAndView = new ModelAndView();
		
		AdminDAO adminDAO = new AdminDAO();
		BoardListsTO qListsTO = new BoardListsTO();

		String cpage = request.getParameter("cpage");

		if (cpage != null) {
			qListsTO.setCpage(Integer.parseInt(cpage));
		}
		
		String searchopt = request.getParameter("searchopt");
		// 寃��깋 �궎�썙�뱶
		String searchkey = request.getParameter("searchkey");		
		
		boolean o1 = searchkey.equals("");

		if (o1) {
			modelAndView.addObject("qListsTO", adminDAO.questionsList(qListsTO));
		}else {
			searchkey = "%" + searchkey + "%";
			modelAndView.addObject("qListsTO", adminDAO.questionsList(qListsTO,searchopt,searchkey));
		}
		
		modelAndView.setViewName("admin/admin_questions");
		
		return modelAndView;
	}
	
	@RequestMapping("/admin_questions_view.mysql")
	public ModelAndView admin_questions_view(HttpServletRequest request) {
		System.out.println("자주묻는 질문");
		ModelAndView modelAndView = new ModelAndView();
		
		AdminDAO adminDAO = new AdminDAO();

		String cpage = request.getParameter("cpage");
		String seq = request.getParameter("seq");
		
		modelAndView.setViewName("admin/admin_questions_view");
		modelAndView.addObject("qLists",adminDAO.questionsView(seq));
		modelAndView.addObject("cpage",cpage);
		return modelAndView;
	}
	
	@RequestMapping("/admin_questions_write.mysql")
	public ModelAndView admin_questions_write(HttpServletRequest request) {
		System.out.println("관리자가 자주묻는질문 쓰기");
		ModelAndView modelAndView = new ModelAndView();
		String cpage = request.getParameter("cpage");
		
		modelAndView.addObject("cpage",cpage);
		modelAndView.setViewName("admin/admin_questions_write");
		return modelAndView;
	}
	
	@RequestMapping("/admin_questions_write_ok.mysql")
	public ModelAndView admin_questions_write_ok(HttpServletRequest request) {
		System.out.println("관리자가 자주묻는질문 쓰기");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_questions_write_ok");
		QuestionsTO qTO = new QuestionsTO();
		
		try {
			
			int filesize = 1024 * 1024 * 2;

			MultipartRequest multi = new MultipartRequest(request, path, filesize, "utf-8",
					new DefaultFileRenamePolicy());
			String kinds = multi.getParameter("searchopt");
			if(kinds.equals("hompage")) {
				kinds = "홈페이지";
				qTO.setQseq("1");
			}else if(kinds.equals("join")) {
				kinds = "회원가입";
				qTO.setQseq("2");
			}
			qTO.setKinds(kinds);
			qTO.setSubject(multi.getParameter("subject"));
			qTO.setContent(multi.getParameter("content"));

			if (multi.getFile("upload") != null) {
				//qTO.setFilename(multi.getOriginalFileName("upload"));
				qTO.setFilename(multi.getFilesystemName("upload"));
			} else {
				//qTO.setFilename("");
				qTO.setFilename("");
			}

			int flag = new AdminDAO().questionsWriteOk(qTO);

			modelAndView.addObject("flag", flag);

		} catch (IOException e) {}

		return modelAndView;
	}
	
	@RequestMapping("/admin_questions_modify.mysql")
	public ModelAndView admin_questions_modify(HttpServletRequest request) {
		System.out.println("관리자가 게시글 수정");
		ModelAndView modelAndView = new ModelAndView();

		String cpage = request.getParameter("cpage");
		String seq = request.getParameter("seq");
		
		AdminDAO adminDAO = new AdminDAO();	
		
		modelAndView.addObject("cpage", cpage);
		modelAndView.addObject("qLists", adminDAO.questionModify(seq));
		modelAndView.setViewName("admin/admin_questions_modify");
		return modelAndView;
	}
	
	@RequestMapping("/admin_questions_modify_ok.mysql")
	public ModelAndView admin_questions_modify_ok(HttpServletRequest request) {
		System.out.println("관리자가 게시글 수정");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_questions_modify_ok");
		QuestionsTO qTO = new QuestionsTO();
		String seq = "";
		String qseq = "";
		try {
			
			int filesize = 1024 * 1024 * 2;

			MultipartRequest multi = new MultipartRequest(request, path, filesize, "utf-8",
					new DefaultFileRenamePolicy());

			seq = multi.getParameter("seq");
			qseq = multi.getParameter("qseq");

			qTO.setQseq(qseq);
			qTO.setSeq(seq);
			qTO.setSubject(multi.getParameter("subject"));
			qTO.setContent(multi.getParameter("content"));

			if (multi.getFile("upload") != null) {
				//qTO.setFilename(multi.getOriginalFileName("upload"));
				qTO.setFilename(multi.getFilesystemName("upload"));
			} else {
				//qTO.setFilename("");
				qTO.setFilename("");
			}

			int flag = new AdminDAO().questionsModifyOk(qTO);

			modelAndView.addObject("flag", flag);
			modelAndView.addObject("seq", Integer.parseInt(seq));

		} catch (IOException e) {}

		return modelAndView;
	}
	
	@RequestMapping("/admin_questions_delete.mysql")
	public ModelAndView admin_questions_delete(HttpServletRequest request) {
		System.out.println("자주묻는질문 삭제");
		ModelAndView modelAndView = new ModelAndView();

		String seq = request.getParameter("seq");
		
		AdminDAO adminDAO = new AdminDAO();
		int flag = adminDAO.questionsDelete(seq);
		modelAndView.addObject("flag", flag);
		modelAndView.setViewName("admin/admin_questions_delete");
		return modelAndView;
	}
	
	@RequestMapping("/admin_questions_multidelete.mysql")
	public ModelAndView admin_questions_multidelete(HttpServletRequest request) {
		System.out.println("자주묻는 질문 다중삭제");
		ModelAndView modelAndView = new ModelAndView();

		String seq = request.getParameter("seq");
		
		AdminDAO adminDAO = new AdminDAO(); 
		int flag = adminDAO.questionsMultiDelete(seq);
		modelAndView.addObject("flag",flag);
		modelAndView.setViewName("admin/admin_questions_multidelete"); 
		 
		return modelAndView;
	}
	
	@RequestMapping("/admin_adoptions_write.mysql")
	public ModelAndView admin_adoptions_write(HttpServletRequest request) {
		System.out.println("관리자가 입양가능아이들 등록");
		ModelAndView modelAndView = new ModelAndView();
		String cpage = request.getParameter("cpage");
		
		modelAndView.addObject("cpage",cpage);
		modelAndView.setViewName("admin/admin_adoptions_write");
		return modelAndView;
	}
	
	@RequestMapping("/admin_adoptions_write_ok.mysql")
	public ModelAndView admin_adoptions_write_ok(HttpServletRequest request) {
		System.out.println("관리자가 입양가능아이들 등록");
		ModelAndView modelAndView = new ModelAndView();		
		BoardTO boardTO = new BoardTO();
		
		int flag = 2;
		
		try {
			
			int filesize = 1024 * 1024 * 2;

			MultipartRequest multi = new MultipartRequest(request, path, filesize, "utf-8",
					new DefaultFileRenamePolicy());
					
			
			boardTO.setSubject(multi.getParameter("subject"));
			boardTO.setContent(multi.getParameter("content"));

			if (multi.getFile("upload") != null) {
				boardTO.setFilename_ori(multi.getOriginalFileName("upload"));
				boardTO.setFilename_new(multi.getFilesystemName("upload"));
			} else {
				boardTO.setFilename_ori("");
				boardTO.setFilename_new("");
			}

			flag = new AdminDAO().adoptionWriteOk(boardTO);

		} catch (IOException e) {}
		
		modelAndView.setViewName("admin/admin_adoptions_write_ok");
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
}
