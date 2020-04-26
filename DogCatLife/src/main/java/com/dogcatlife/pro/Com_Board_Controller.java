package com.dogcatlife.pro;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAOs.CommunityBoardDAO;
import TOs.BoardListsTO;
import TOs.BoardTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Com_Board_Controller {
//	private String uploadPath = "C:\\Users\\kitcoop\\Desktop\\Git\\MyStudy2019.10\\webproject01\\DogCatLife\\src\\main\\webapp\\resources\\upload";
//	private String uploadPath = "/var/lib/tomcat8/webapps/DogCatLifeUpload";
	private String uploadPath = "D:/MyFirstGit/MyStudy2019.10/webproject01/DogCatLife/src/main/webapp/resources/upload";
	@RequestMapping("/com_board_list.mysql")
	public ModelAndView com_board_list(HttpServletRequest request) {
		System.out.println("com_board_list 컨트롤러 호출");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community_board/com_board_list");

		CommunityBoardDAO communityBoardDAO = new CommunityBoardDAO();
		BoardListsTO boardListsTO = new BoardListsTO();

		String cpage = request.getParameter("cpage");
		String pseq = request.getParameter("pseq");
		String searchKeyWord;
		String searchField;

		if (cpage != null) {
			boardListsTO.setCpage(Integer.parseInt(cpage));
		}
		
		if (request.getParameter("searchKeyWord") != null && request.getParameter("searchField") != null) {
			try {
				boardListsTO.setSearchKeyWord(URLDecoder.decode(request.getParameter("searchKeyWord"),"utf-8"));
			} catch (UnsupportedEncodingException e) {
				System.out.println("error : " + e.getMessage());
			}
			boardListsTO.setSearchField(request.getParameter("searchField"));
		}
		
		boardListsTO.setPseq(Integer.parseInt(pseq));

		boardListsTO = communityBoardDAO.boardList(boardListsTO);

		modelAndView.addObject("boardListsTO", boardListsTO);

		return modelAndView;
	}

	@RequestMapping("/com_board_view.mysql")
	public ModelAndView com_board_view(BoardTO boardTO) {
		System.out.println("com_board_view 컨트롤러 호출");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community_board/com_board_view");

		CommunityBoardDAO communityBoardDAO = new CommunityBoardDAO();

		ArrayList<BoardTO> toLists = communityBoardDAO.boardView(boardTO.getSeq());

		modelAndView.addObject("toLists", toLists);
		modelAndView.addObject("cpage", boardTO.getCpage());

		return modelAndView;
	}

	@RequestMapping("/com_board_comment_ok.mysql")
	public ModelAndView board_reply_ok(BoardTO boardTO) {
		System.out.println("com_board_comment_ok 컨트롤러 호출");

		System.out.println(boardTO.getComment());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community_board/com_board_comment_ok");

		CommunityBoardDAO communityBoardDAO = new CommunityBoardDAO();
		String cpage = boardTO.getCpage();
		String seq = boardTO.getSeq();
		int flag = communityBoardDAO.board_reply_ok(boardTO);

		// 댓글 작성 성공시 flag == 0, 실패시 1
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("cpage", cpage);
		modelAndView.addObject("pseq", boardTO.getPseq());
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}

	@RequestMapping("/com_board_modify.mysql")
	public ModelAndView com_board_modify(BoardTO boardTO) {
		System.out.println("com_board_modify 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community_board/com_board_modify");
	
		boardTO = new CommunityBoardDAO().boardModify(boardTO);

		modelAndView.addObject("boardTO", boardTO);

		return modelAndView;
	}

	@RequestMapping("/com_board_modify_ok.mysql")
	public ModelAndView com_board_modify_ok(HttpServletRequest request) {
		System.out.println("com_board_modify_ok 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community_board/com_board_modify_ok");

		BoardTO boardTO = new BoardTO();

		try {
			String path = uploadPath;
			int filesize = 1024 * 1024 * 2;

			MultipartRequest multi = new MultipartRequest(request, path, filesize, "utf-8",
					new DefaultFileRenamePolicy());

			String cpage = multi.getParameter("cpage");
			String seq = multi.getParameter("seq");
			String pseq = multi.getParameter("pseq");

			boardTO.setPseq(pseq);
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

			int flag = new CommunityBoardDAO().boardModifyOk(boardTO);

			modelAndView.addObject("flag", flag);
			modelAndView.addObject("cpage", cpage);
			modelAndView.addObject("seq", seq);
			modelAndView.addObject("pseq", pseq);

		} catch (IOException e) {
		}

		return modelAndView;
	}

	@RequestMapping("/com_board_write.mysql")
	public ModelAndView com_board_write(BoardTO boardTO) {
		System.out.println("com_board_write 컨트롤러 호출");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community_board/com_board_write");

		modelAndView.addObject("boardTO", boardTO);
		 
		return modelAndView;
	}

	@RequestMapping("/com_board_write_ok.mysql")
	public ModelAndView com_board_write_ok(HttpServletRequest request) {
		System.out.println("com_board_write_ok 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community_board/com_board_write_ok");

		BoardTO boardTO = new BoardTO();

		try {
			String path = uploadPath;
			int filesize = 1024 * 1024 * 2;
			String utf8 = "utf-8";

			MultipartRequest multi = new MultipartRequest(request, path, filesize, utf8,
					new DefaultFileRenamePolicy());

			if (multi.getFile("upload") != null) {
				boardTO.setFilename_ori(multi.getOriginalFileName("upload"));
				boardTO.setFilename_new(multi.getFilesystemName("upload"));
			} else {
				boardTO.setFilename_new("");
				boardTO.setFilename_ori("");
			}

			boardTO.setSubject(multi.getParameter("subject"));
			boardTO.setWriter(multi.getParameter("writer"));
			boardTO.setContent(multi.getParameter("content"));
			boardTO.setPseq(multi.getParameter("pseq"));
			boardTO.setMseq(multi.getParameter("mseq"));
			CommunityBoardDAO communityBoardDAO = new CommunityBoardDAO();

			int flag = communityBoardDAO.boardWriteOk(boardTO);

			modelAndView.addObject("flag", flag);
			modelAndView.addObject("pseq", multi.getParameter("pseq"));
		} catch (IOException e) {
		}

		return modelAndView;
	}

	@RequestMapping("/com_board_delete_ok.mysql")
	public ModelAndView com_board_delete_ok(BoardTO boardTO) {
		System.out.println("com_board_delete_ok 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community_board/com_board_delete_ok");

		String pseq = boardTO.getPseq();

		CommunityBoardDAO communityBoardDAO = new CommunityBoardDAO();

		int flag = communityBoardDAO.boardDeleteOk(boardTO);

		modelAndView.addObject("flag", flag);
		modelAndView.addObject("pseq", pseq);

		return modelAndView;
	}
	
	@RequestMapping("/com_board_comment_modify.mysql")
	public ModelAndView com_board_comment_modify(BoardTO boardTO) {
		System.out.println("com_board_comment_modify 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community_board/com_board_comment_modify");
		CommunityBoardDAO communityBoardDAO = new CommunityBoardDAO();

		return modelAndView;
	}
	
	@RequestMapping("/com_board_comment_delete_ok.mysql")
	public ModelAndView com_board_comment_delete_ok(BoardTO boardTO) {
		System.out.println("com_board_comment_delete_ok 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("community_board/com_board_comment_delete_ok");

		CommunityBoardDAO communityBoardDAO = new CommunityBoardDAO();
		int flag = communityBoardDAO.boardCommentDeleteOk(boardTO);

		modelAndView.addObject("flag", flag);
		modelAndView.addObject("boardTO", boardTO);

		return modelAndView;
	}
}
