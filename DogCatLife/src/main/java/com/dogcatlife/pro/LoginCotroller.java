package com.dogcatlife.pro;

import java.text.DateFormat;
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

import DAOs.LoginDAO;
import TOs.UserTO;
import mail.CreateConfirmNumber;
import mail.MailSender;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginCotroller {
	@RequestMapping("/login.mysql")
	public ModelAndView login() {
		System.out.println("login 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/login");
		return modelAndView;
	}
	
	@RequestMapping("/login_ok.mysql")
	public ModelAndView login_ok(UserTO userTO) {
		System.out.println("login_ok 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/login_ok");
		
		userTO = new LoginDAO().loginOk(userTO);
		modelAndView.addObject("userTO", userTO);
		
		return modelAndView;
	}
	
	@RequestMapping("/logout_ok.mysql")
	public ModelAndView logout_ok() {
		System.out.println("logout_ok 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/logout_ok");
		
		return modelAndView;
	}
	
	@RequestMapping("/join.mysql")
	public ModelAndView join() {
		System.out.println("join 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/join");
		return modelAndView;
	}
	
	@RequestMapping("/join_mail_confirm.mysql")
	public ModelAndView joinMailConfirm(HttpServletRequest request) {
		System.out.println("join_mail_confirm 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/join_mail_confirm");
		
		String useremail = request.getParameter("useremail");
		
		String confirmNumber = new CreateConfirmNumber().confirmNumber();
		
		String mailContent = "<html><head><body>인증번호는 '" + confirmNumber + "' 입니다.</body></head></html>";

		MailSender mailSender = new MailSender();
		
		int mailFlag = mailSender.sendMail(useremail, mailContent);
		
		// 메일이 성공적으로 보내졌다면 flag == 인증번호 아니라면 1,2,3중 하나가 간다.
		if (mailFlag == 0) {
			modelAndView.addObject("flag", confirmNumber);
			System.out.println(confirmNumber);
		} else {
			modelAndView.addObject("flag", mailFlag);
		}
		return modelAndView;
	}
	
	@RequestMapping("/join_used_mail.mysql")
	public ModelAndView joinUsedMail(HttpServletRequest request) {
		System.out.println("join_used_mail 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/join_used_mail");
		
		String useremail = request.getParameter("useremail");
		
		int flag = new LoginDAO().joinUsedMail(useremail);
		
		modelAndView.addObject("flag", flag);

		return modelAndView;
	}
	
	@RequestMapping("/join_id_confirm.mysql")
	public ModelAndView joinIDConfirm(HttpServletRequest request) {
		System.out.println("join_id_confirm 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/join_id_confirm");
		
		String userid = request.getParameter("userid");
		
		int flag = new LoginDAO().joinIDConfirm(userid);
		
		modelAndView.addObject("flag", flag);

		return modelAndView;
	}
	
	@RequestMapping("/join_ok.mysql")
	public ModelAndView join_ok(UserTO userTO) {
		System.out.println("join_ok 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/join_ok");
		
		int flag = new LoginDAO().joinOk(userTO);
		
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
	
	@RequestMapping("/find_id.mysql")
	public ModelAndView find_id() {
		System.out.println("find_id 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/find_id");
		return modelAndView;
	}
	
	@RequestMapping("/find_id_name_email_confirm.mysql")
	public ModelAndView find_id_name_email_confirm(HttpServletRequest request) {
		System.out.println("find_id_name_email_confirm 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/find_id_name_email_confirm");
		
		String username = request.getParameter("username");
		String useremail = request.getParameter("useremail");

		int flag = new LoginDAO().find_id_name_email_confirm(username, useremail);
		
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}

	@RequestMapping("/find_id_mail_confirm.mysql")
	public ModelAndView find_id_mail_confirm(HttpServletRequest request) {
		System.out.println("find_id_mail_confirm 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/find_id_mail_confirm");
		
		String useremail = request.getParameter("useremail");
		
		String confirmNumber = new CreateConfirmNumber().confirmNumber();
		
		String mailContent = "<html><head><body>인증번호는 '" + confirmNumber + "' 입니다.</body></head></html>";

		MailSender mailSender = new MailSender();
		
		int mailFlag = mailSender.sendMail(useremail, mailContent);
		
		// 메일이 성공적으로 보내졌다면 flag == 인증번호 아니라면 1,2,3중 하나가 간다.
		if (mailFlag == 0) {
			modelAndView.addObject("flag", confirmNumber);
			System.out.println(confirmNumber);
		} else {
			modelAndView.addObject("flag", mailFlag);
		}

		return modelAndView;
	}
	
	@RequestMapping("/find_id_show.mysql")
	public ModelAndView find_id_show(UserTO userTO) {
		System.out.println("find_id_show 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/find_id_show");
		
		String id = new LoginDAO().find_id_show(userTO);

		modelAndView.addObject("id", id);
		return modelAndView;
	}

	@RequestMapping("/find_password.mysql")
	public ModelAndView find_password() {
		System.out.println("find_password 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/find_password");
		return modelAndView;
	}
	
	@RequestMapping("/find_password_name_id_email_confirm.mysql")
	public ModelAndView find_password_name_id_email_confirm(HttpServletRequest request) {
		System.out.println("find_password_name_id_email_confirm 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/find_password_name_id_email_confirm");
		
		String username = request.getParameter("username");
		String userid = request.getParameter("userid");
		String useremail = request.getParameter("useremail");

		int flag = new LoginDAO().find_password_name_id_email_confirm(username, userid, useremail);
		
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}

	@RequestMapping("/find_password_mail_confirm.mysql")
	public ModelAndView find_password_mail_confirm(HttpServletRequest request) {
		System.out.println("find_id_mail_confirm 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/find_password_mail_confirm");
		
		String useremail = request.getParameter("useremail");
		
		String confirmNumber = new CreateConfirmNumber().confirmNumber();
		
		String mailContent = "<html><head><body>인증번호는 '" + confirmNumber + "' 입니다.</body></head></html>";

		MailSender mailSender = new MailSender();
		
		int mailFlag = mailSender.sendMail(useremail, mailContent);
		
		// 메일이 성공적으로 보내졌다면 flag == 인증번호 아니라면 1,2,3중 하나가 간다.
		if (mailFlag == 0) {
			modelAndView.addObject("flag", confirmNumber);
			System.out.println(confirmNumber);
		} else {
			modelAndView.addObject("flag", mailFlag);
		}

		return modelAndView;
	}
	
	@RequestMapping("/find_password_change.mysql")
	public ModelAndView find_password_change(UserTO userTO) {
		System.out.println("find_password_change 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/find_password_change");
		
		userTO = new LoginDAO().find_password_change(userTO);
		
		modelAndView.addObject("userTO", userTO);
		return modelAndView;
	}
	
	@RequestMapping("/find_password_change_ok.mysql")
	public ModelAndView find_password_change_ok(UserTO userTO) {
		System.out.println("find_password_change_ok 컨트롤러 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login/find_password_change_ok");
		
		int flag = new LoginDAO().find_password_change_ok(userTO);
		
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
}
