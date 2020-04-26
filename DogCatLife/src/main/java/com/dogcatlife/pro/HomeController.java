package com.dogcatlife.pro;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import DAOs.AlbumBoardDAO;
import DAOs.CommunityBoardDAO;
import TOs.BoardListsTO;
import TOs.BoardTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping({"/", "/main.mysql"})
	public ModelAndView main() {
		System.out.println("main 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("main");
		return modelAndView;
	}
	
	@RequestMapping("/adoption_board_view.mysql")
	public ModelAndView adoption_board_view() {
		System.out.println("adoption_board_view 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("adoption_board/adoption_board_view");
		return modelAndView;
	}
	
	@RequestMapping("/padoption_board_list.mysql")
	public ModelAndView padoption_board_list(HttpServletRequest request) {
		System.out.println("padoption_board_list 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("adoption_board/padoption_board_list");
		
		AlbumBoardDAO albumBoardDAO = new AlbumBoardDAO();
		BoardListsTO boardListsTO = new BoardListsTO();

		String cpage = request.getParameter("cpage");
		String pseq = request.getParameter("pseq");

		if (cpage != null) {
			boardListsTO.setCpage(Integer.parseInt(cpage));
		}
		boardListsTO.setPseq(Integer.parseInt(pseq));

		boardListsTO = albumBoardDAO.albumBoardList(boardListsTO);

		modelAndView.addObject("boardListsTO", boardListsTO);
		
		return modelAndView;
	}
	
	@RequestMapping("/padoption_board_view.mysql")
	public ModelAndView padoption_board_view(BoardTO boardTO) {
		System.out.println("padoption_board_view 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		AlbumBoardDAO albumBoardDAO = new AlbumBoardDAO();

		ArrayList<BoardTO> toLists = albumBoardDAO.albumBoardView(boardTO.getSeq());

		modelAndView.addObject("toLists", toLists);
		modelAndView.addObject("cpage", boardTO.getCpage());
		modelAndView.addObject("pseq", boardTO.getPseq());
		modelAndView.setViewName("adoption_board/padoption_board_view");
		return modelAndView;
	}
}
