package com.dogcatlife.pro;

import java.io.IOException;
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
import DAOs.NoticeDAO;
import TOs.BoardListsTO;
import TOs.BoardTO;
import TOs.NoticeTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NoticeController {
	
	@RequestMapping("/noticelist.mysql")
	public ModelAndView noticelist(HttpServletRequest request) {
		System.out.println("고객센터 공지사항 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("qna_board/noticelist");

		CommunityBoardDAO communityBoardDAO = new CommunityBoardDAO();
		BoardListsTO boardListsTO = new BoardListsTO();

		String cpage = request.getParameter("cpage");
		String pseq = request.getParameter("pseq");
		
		if (cpage != null) {
			boardListsTO.setCpage(Integer.parseInt(cpage));
		}
		boardListsTO.setPseq(Integer.parseInt(pseq));

		boardListsTO = communityBoardDAO.boardList(boardListsTO);

		modelAndView.addObject("boardListsTO", boardListsTO);

		return modelAndView;
	}
	
	@RequestMapping("/noticeview.mysql")
	public ModelAndView noticeview(BoardTO boardTO) {
		System.out.println("고객센터 공지사항뷰 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("qna_board/noticeview");

		CommunityBoardDAO communityBoardDAO = new CommunityBoardDAO();

		ArrayList<BoardTO> toLists = communityBoardDAO.boardView(boardTO.getSeq());

		modelAndView.addObject("toLists", toLists);
		modelAndView.addObject("cpage", boardTO.getCpage());

		return modelAndView;
	}
	
	
	@RequestMapping("/faqlist.mysql")
	public ModelAndView question(HttpServletRequest request) {
		System.out.println("고객센터 FAQ 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("qna_board/faqlist");

		NoticeDAO noticeBoardDAO = new NoticeDAO();
		String qseq = request.getParameter("qseq");
		
		ArrayList<NoticeTO> noticeLists = new NoticeDAO().boardList(qseq);
		
		modelAndView.addObject("noticeLists", noticeLists);
		modelAndView.addObject("selected", qseq);

		return modelAndView;
	}
	
	@RequestMapping("/commonagree.mysql")
	public ModelAndView cmagree() {
		System.out.println("고객센터 이용약관동의 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("qna_board/commonagree");
		return modelAndView;
	}
	
	@RequestMapping("/commontext.mysql")
	public ModelAndView cmtext() {
		System.out.println("고객센터 개인정보 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("qna_board/commontext");
		return modelAndView;
	}
}
