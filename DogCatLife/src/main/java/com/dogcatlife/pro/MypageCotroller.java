package com.dogcatlife.pro;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAOs.AlbumBoardDAO;
import DAOs.CommunityBoardDAO;
import DAOs.LoginDAO;
import DAOs.MypageDAO;
import TOs.BoardListsTO;
import TOs.BoardTO;
import TOs.UserTO;
import mail.CreateConfirmNumber;
import mail.MailSender;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MypageCotroller {
//	private String uploadPath = "C:\\Users\\kitcoop\\Desktop\\Git\\MyStudy2019.10\\webproject01\\DogCatLife\\src\\main\\webapp\\resources\\upload";
//	private String uploadPath = "/var/lib/tomcat8/webapps/DogCatLifeUpload";
	private String uploadPath = "D:\\MyFirstGit\\MyStudy2019.10\\webproject01\\DogCatLife\\src\\main\\webapp\\resources\\upload";
	
	@RequestMapping("/input_password.mysql")
	public ModelAndView mypage_input_password() {
		System.out.println("mypage_input_password컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/input_password");
		return modelAndView;
	}

	@RequestMapping("/input_password_ok.mysql")
	public ModelAndView mypage_input_password_ok(UserTO userTO) {
		System.out.println("mypage_input_password_ok컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/input_password_ok");

		int flag = new MypageDAO().mypage_input_password_ok(userTO);

		modelAndView.addObject("flag", flag);
		return modelAndView;
	}

	@RequestMapping("/myinfo.mysql")
	public ModelAndView myinfo(HttpServletRequest request) {
		System.out.println("myinfo 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/myinfo");
		HttpSession session = request.getSession();

		String mseq = (String) session.getAttribute("sess_mseq");

		UserTO userTO = new MypageDAO().myinfo(mseq);

		modelAndView.addObject("userTO", userTO);
		return modelAndView;
	}

	@RequestMapping("/myinfo_ok.mysql")
	public ModelAndView myinfo_ok(UserTO userTO) {
		System.out.println("myinfo_ok호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/myinfo_ok");

		int flag = new MypageDAO().myinfo_ok(userTO);

		modelAndView.addObject("flag", flag);
		return modelAndView;
	}

	@RequestMapping("/mycontents_list.mysql")
	public ModelAndView mycontents_list(HttpServletRequest request) {
		System.out.println("mycontents_list 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/mycontents_list");

		BoardListsTO boardListsTO = new BoardListsTO();

		HttpSession session = request.getSession();
		String mseq = (String) session.getAttribute("sess_mseq");
		boardListsTO.setMseq(mseq);

		String selected = request.getParameter("selected");
		if (selected == null) {
			selected = "0";
			boardListsTO.setPseq(Integer.parseInt(selected));
		} else {
			boardListsTO.setPseq(Integer.parseInt(selected));
		}

		String cpage = request.getParameter("cpage");
		if (cpage != null) {
			boardListsTO.setCpage(Integer.parseInt(cpage));
		}

		boardListsTO = new MypageDAO().mycontents_list(boardListsTO, selected);

		modelAndView.addObject("boardListsTO", boardListsTO);
		modelAndView.addObject("selected", selected);

		return modelAndView;
	}

	@RequestMapping("/mycomment_list.mysql")
	public ModelAndView mycomment_list(HttpServletRequest request) {
		System.out.println("mycomment_list 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/mycomment_list");

		BoardListsTO boardListsTO = new BoardListsTO();

		HttpSession session = request.getSession();
		String mseq = (String) session.getAttribute("sess_mseq");
		boardListsTO.setMseq(mseq);

		String selected = request.getParameter("selected");
		if (selected == null) {
			selected = "0";
			boardListsTO.setPseq(Integer.parseInt(selected));
		} else {
			boardListsTO.setPseq(Integer.parseInt(selected));
		}

		String cpage = request.getParameter("cpage");
		if (cpage != null) {
			boardListsTO.setCpage(Integer.parseInt(cpage));
		}

		boardListsTO = new MypageDAO().mycomment_list(boardListsTO, selected);

		modelAndView.addObject("boardListsTO", boardListsTO);
		modelAndView.addObject("selected", selected);

		return modelAndView;
	}

	@RequestMapping("/password_change.mysql")
	public ModelAndView password_change() {
		System.out.println("password_change 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/password_change");
		return modelAndView;
	}
	
	@RequestMapping("/password_change_ok.mysql")
	public ModelAndView password_change_ok(HttpServletRequest request) {
		System.out.println("password_change_ok 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/password_change_ok");
		
		String mseq = request.getParameter("mseq");
		String password = request.getParameter("password");
		String newpassword = request.getParameter("newpassword");
		
		int flag = new MypageDAO().password_change_ok(password, newpassword, mseq);
		
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}

	@RequestMapping("/myquestion_list.mysql")
	public ModelAndView myquestion_list(HttpServletRequest request) {
		System.out.println("myquestion_list 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/myquestion_list");
		
		HttpSession session = request.getSession();
		BoardListsTO boardListsTO = new BoardListsTO();
		
		String mseq = (String) session.getAttribute("sess_mseq");
		String cpage = request.getParameter("cpage");
		if (cpage != null) {
			boardListsTO.setCpage(Integer.parseInt(cpage));
		}
		boardListsTO.setMseq(mseq);
		
		boardListsTO = new MypageDAO().myquestion_list(boardListsTO);
		
		modelAndView.addObject("boardListsTO", boardListsTO);
		return modelAndView;
	}

	@RequestMapping("/myquestion_write.mysql")
	public ModelAndView myquestion_write(BoardTO boardTO) {
		System.out.println("myquestion_write 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/myquestion_write");
		modelAndView.addObject("boardTO", boardTO);
		return modelAndView;
	}
	
	@RequestMapping("/myquestion_write_ok.mysql")
	public ModelAndView myquestion_write_ok(HttpServletRequest request) {
		System.out.println("myquestion_write_ok 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/myquestion_write_ok");

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
			boardTO.setMseq(multi.getParameter("mseq"));
			MypageDAO mypageDAO = new MypageDAO();

			int flag = mypageDAO.myquestionWriteOk(boardTO);

			modelAndView.addObject("flag", flag);
		} catch (IOException e) {
		}

		return modelAndView;
	}

	@RequestMapping("/myquestion_view.mysql")
	public ModelAndView myquestion_view(HttpServletRequest request) {
		System.out.println("myquestion_view 컨트롤러 호출");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/myquestion_view");

		String seq = request.getParameter("seq");
		String cpage = request.getParameter("cpage");
		BoardTO boardTO = new MypageDAO().myquestion_view(seq);

		modelAndView.addObject("boardTO", boardTO);
		modelAndView.addObject("cpage", cpage);

		return modelAndView;
	}
	
	@RequestMapping("/myquestion_answer.mysql")
	public ModelAndView myquesetion_answer(HttpServletRequest request) {
		System.out.println("myquestion_answer 컨트롤러 호출");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/myquestion_answer");

		MypageDAO mypageDAO = new MypageDAO();

		String aseq = request.getParameter("aseq");
		String cpage = request.getParameter("cpage");
		BoardTO boardTO = new MypageDAO().myquestion_answer(aseq);

		modelAndView.addObject("boardTO", boardTO);
		modelAndView.addObject("cpage", cpage);

		return modelAndView;
	}

	@RequestMapping("/myquestion_delete_ok.mysql")
	public ModelAndView myquestion_delete_ok(HttpServletRequest request) {
		System.out.println("myquestion_delete_ok 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/myquestion_delete_ok");
		
		String seq = request.getParameter("seq");
		
		int flag = new MypageDAO().myquestion_delete_ok(seq);

		modelAndView.addObject("flag", flag);
		
		return modelAndView;
	}
}
