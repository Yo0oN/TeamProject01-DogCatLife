package com.dogcatlife.pro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	@RequestMapping({"/", "/admin_login.mysql"})
	public ModelAndView admin_login() {
		System.out.println("관리자 로그인 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_login");
		return modelAndView;
	}
	
	@RequestMapping("/admin_main.mysql")
	public ModelAndView admin_main() {
		System.out.println("관리자 main");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_main");
		return modelAndView;
	}
	
	@RequestMapping("/admin_contents.mysql")
	public ModelAndView admin_contents() {
		System.out.println("게시글");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_contents");
		return modelAndView;
	}
	
	@RequestMapping("/admin_comments.mysql")
	public ModelAndView admin_comments() {
		System.out.println("댓글");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_comments");
		return modelAndView;
	}
	
	@RequestMapping("/admin_user.mysql")
	public ModelAndView admin_user() {
		System.out.println("게시글");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_user");
		return modelAndView;
	}
	@RequestMapping("/admin_an.mysql")
	public ModelAndView admin_an() {
		System.out.println("게시글");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_an");
		return modelAndView;
	}
	@RequestMapping("/admin_qna.mysql")
	public ModelAndView admin_qna() {
		System.out.println("게시글");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_qna");
		return modelAndView;
	}
	@RequestMapping("/admin_questions.mysql")
	public ModelAndView admin_questions() {
		System.out.println("게시글");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/admin_questions");
		return modelAndView;
	}
}
