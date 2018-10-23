package zaksim.login.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import zaksim.dto.ZakSimMember;
import zaksim.login.service.inter.ZakSimMemberService;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * 로그인 관련 Controller
 */
@Controller
public class LoginController {

	@Autowired ZakSimMemberService memberService;
	
	// 로그인
	@RequestMapping(value="/zaksim/login/login", method=RequestMethod.GET)
	public void loginPage() {
		
	}
	@RequestMapping(value="/zaksim/login/login", method=RequestMethod.POST)
	public String login(HttpSession session, ZakSimMember memberDto) {
		return null; // TODO 메인화면으로 리다이렉트"redirect:/zaksim/..."
	}
	
	// 로그아웃
	@RequestMapping(value="/zaksim/login/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return null; // TODO 메인화면으로 리다이렉트"redirect:/zaksim/..."
	}
	
	// 아이디 찾기
	@RequestMapping(value="/zaksim/login/findId", method=RequestMethod.GET)
	public void findIdPage() {
		
	}
	@RequestMapping(value="/zaksim/login/findId", method=RequestMethod.POST)
	public String findId(Model model) {
		return "redirect:/zaksim/login/login";
	}
	
	
	// 비밀번호 찾기
	@RequestMapping(value="/zaksim/login/findPw", method=RequestMethod.GET)
	public void findPwPage() {
		
	}
	@RequestMapping(value="/zaksim/login/findPw", method=RequestMethod.POST)
	public String findPw() {
		return "redirect:/zaksim/login/login";
	}
	
	// 회원가입
	@RequestMapping(value="/zaksim/login/join", method=RequestMethod.GET)
	public String joinPage() {
		return "zaksim/login/join";
	}
	@RequestMapping(value="/zaksim/login/join", method=RequestMethod.POST)
	public String join(ZakSimMember memberDto) {
		return "redirect:/zaksim/login/login";
	}
	// 회원가입 - 아이디 중복체크
	@RequestMapping(value="/zaksim/login/joinAjax", method=RequestMethod.POST)
	public void joinAjax(HttpServletResponse response) {
		
	}
}
