package zaksim.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import zaksim.dto.ZakSimMember;
import zaksim.login.service.ZakSimMemberService;

/*
 * 작성일 : 2018.10.18
 * 작성자 : 권미현
 */
/**
 * 로그인 관련 Controller
 */
@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired ZakSimMemberService memberService;
	
	// 로그인
	@RequestMapping(value="/zaksim/login/login", method=RequestMethod.GET)
	public void loginPage() {
		
	}
	@RequestMapping(value="/zaksim/login/login", method=RequestMethod.POST)
	public String login(HttpSession session, ZakSimMember memberDto) {
		logger.info(memberDto.getId() + " / " + memberDto.getPassword());
		
		if ( memberService.login(memberDto) ) {
			memberDto = memberService.memberInfo(memberDto);
			
//          로그인 후, 회원정보 가져오기 테스트 - 완료
//			logger.info(memberDto.getId().toString());
//			logger.info(memberDto.getNick().toString());
//			logger.info(memberDto.getMemberType());
			
			session.setAttribute("login", true);
			session.setAttribute("login_idx", memberDto.getIdx());
			session.setAttribute("login_memberType", memberDto.getMemberType());
			session.setAttribute("login_id", memberDto.getId());
			session.setAttribute("login_nick", memberDto.getNick());
			
			logger.info("로그인 완료!");
			
			return "redirect:/zaksim/main/home"; // 메인화면으로 리다이렉트
			
		} else {
			logger.info("로그인 실패! 아이디 혹은 비밀번호를 확인해주세요.");
			session.setAttribute("login", false);
			
			return "redirect:/zaksim/login/login"; // 로그인 실패시 로그인 화면으로 리다이렉트
		}
		
	}
	// 소셜 로그인_네이버
	@RequestMapping(value="/zaksim/login/naverLogin", method=RequestMethod.GET)
	public void naverLoginCallback() {
		
	}
	
	// 로그아웃
	@RequestMapping(value="/zaksim/login/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/zaksim/main/home"; // 메인화면으로 리다이렉트
	}
	
	// 아이디 찾기
	@RequestMapping(value="/zaksim/login/findId", method=RequestMethod.GET)
	public void findIdPage() {
		
	}
	@RequestMapping(value="/zaksim/login/findId", method=RequestMethod.POST
			, produces="application/json; charset=utf-8"/* 한글처리 */)
	@ResponseBody // ajax 쓰기 위한 방법(jackson-databind 라이브러리를 이용한 출력 방법)
	public Map<String, String> findId(String name, String email) {
		logger.info("데이터 제출");
		logger.info("이름 : " + name + " / 이메일 : " + email);
		
		String id = memberService.findId(name, email);		
		logger.info("찾은 ID : " + id);
		
		Map<String, String> map = new HashMap<>();
		map.put("findId", id);
		return map;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value="/zaksim/login/findPw", method=RequestMethod.GET)
	public void findPwPage() {
		
	}
	@RequestMapping(value="/zaksim/login/findPw", method=RequestMethod.POST
			, produces="application/json; charset=utf-8"/* 한글처리 */)
	@ResponseBody // ajax 쓰기 위한 방법(jackson-databind 라이브러리를 이용한 출력 방법)
	public Map<String, Object> findPw(String id, String name, String email) {
		logger.info("아이디 : " + id + " / 이름 : " + name + " / 이메일 : " + email);
		
		String pw = memberService.findPw(id, name, email);
		Map<String, Object> map = new HashMap<>();
		if ( pw != null ) {
			map.put("findPwResult", true); // 결과 반환(비밀번호 찾기 완료)
		} else {
			map.put("findPwResult", false); // 결과 반환(비밀번호 찾기 실패-정보 없음)
		}
		return map;
	}
	
	// 회원가입
	@RequestMapping(value="/zaksim/login/join", method=RequestMethod.GET)
	public void joinTermsPage() {
		
	}
	@RequestMapping(value="/zaksim/login/joinForm", method=RequestMethod.GET)
	public String joinPage() {
		return "zaksim/login/joinForm";
	}
	@RequestMapping(value="/zaksim/login/joinForm", method=RequestMethod.POST)
	public String join(ZakSimMember memberDto) {
		memberService.join(memberDto);
		
		return "redirect:/zaksim/login/login"; // TODO: 리다이렉트는 jsp 쪽에서 하자
	}
	// 회원가입 - 아이디 중복체크
	@RequestMapping(value="/zaksim/login/joinId", method=RequestMethod.POST
			, produces="application/json; charset=utf-8"/* 한글처리 */)
	@ResponseBody // ajax 쓰기 위한 방법(jackson-databind 라이브러리를 이용한 출력 방법)
	public Map<String, Object> joinId(String joinId) {
		logger.info("중복 체크할 ID : " + joinId);
		
		Map<String, Object> map = new HashMap<>();
		if (memberService.checkId(joinId)) {
			logger.info("사용 가능한 ID");
			map.put("uniqueId", true);
		} else {
			logger.info("이미 사용 중인 ID");
			map.put("uniqueId", false);
		}
		
		return map;
	}
	// 회원가입 - 닉네임 중복체크
	@RequestMapping(value="/zaksim/login/joinNick", method=RequestMethod.POST
			, produces="application/json; charset=utf-8"/* 한글처리 */)
	@ResponseBody // ajax 쓰기 위한 방법(jackson-databind 라이브러리를 이용한 출력 방법)
	public Map<String, Object> joinNick(String joinNick) {
		logger.info("중복 체크할 닉네임 : " + joinNick);
		
		Map<String, Object> map = new HashMap<>();
		if (memberService.checkNick(joinNick)) {
			logger.info("사용 가능한 닉네임");
			map.put("uniqueNick", true);
		} else {
			logger.info("이미 사용 중인 닉네임");
			map.put("uniqueNick", false);
		}
		
		return map;
	}
	// 회원가입 - 이메일 인증
	@RequestMapping(value="/zaksim/login/joinEmail", method=RequestMethod.POST
			, produces="application/json; charset=utf-8"/* 한글처리 */)
	@ResponseBody // ajax 쓰기 위한 방법(jackson-databind 라이브러리를 이용한 출력 방법)
	public Map<String, Object> joinEmail(String joinEmail) {
		logger.info("보낼 이메일 : " + joinEmail);
		
		Map<String, Object> map = new HashMap<>();
		
		String checkNum = memberService.authEmail(joinEmail);
		logger.info("인증번호 : " + checkNum);
		
		map.put("checkNum", checkNum);
		
		return map;
	}
}
