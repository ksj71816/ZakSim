package zaksim.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import zaksim.admin.service.LoginService;
import zaksim.dto.ZakSimMember;

@Controller
@RequestMapping(value="/zaksim/admin")
public class AdminLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginController.class);
	
	@Autowired LoginService loginService;
	

	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginForm() {
		// 화면 연결		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Boolean> loginProcess(ZakSimMember member, HttpSession session, Model model) {
		logger.info(member.toString());
		
		HashMap<String, Boolean> map = new HashMap<>();
		
		 if(loginService.login(member)) {
			 System.out.println("true");
			 session.setAttribute("adminLogin", true);
			 
			 map.put("aLogin", true);
			 return map;
		 } else {
			 System.out.println("false");
			 map.put("aLogin", false);
			 return map;
		 }
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
//		logger.info("로그아웃");
//		session.setAttribute("adminLogin", false);
		session.invalidate();
		return "redirect:/zaksim/main/home";
	}
	
}
