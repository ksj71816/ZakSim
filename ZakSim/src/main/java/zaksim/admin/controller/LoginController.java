package zaksim.admin.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import zaksim.admin.service.LoginService;
import zaksim.dto.ZakSimMember;

@Controller
@RequestMapping(value="/zaksim/admin")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired LoginService loginService;
	
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginForm() {
		// 화면 연결		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginProcess(ZakSimMember member, HttpSession session) {
		logger.info(member.toString());
		
		 if(loginService.login(member)) {
			 // 세션에 정보 입력		
			 logger.info("로그인 성공");
			 session.setAttribute("adminLogin", true);
			 return "redirect:/zaksim/admin/member";
		 } else {
//			 로그인 실패
			 logger.info("로그인 실패");
			 return "";
		 }
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		session.setAttribute("adminLogin", false);
		return "redirect:/zaksim/login";
	}
	
}
