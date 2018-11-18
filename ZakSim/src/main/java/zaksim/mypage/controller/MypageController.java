package zaksim.mypage.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import zaksim.challenge.service.ChallengeInfoService;
import zaksim.community.service.CommunityListService;
import zaksim.dto.Board;
import zaksim.dto.Challenge;
import zaksim.dto.CommunityGroup;
import zaksim.dto.GroupKeyword;
import zaksim.dto.PStatistics;
import zaksim.dto.QnA;
import zaksim.dto.ZakSimMember;
import zaksim.mypage.service.MypageService;


@Controller
@RequestMapping(value="/zaksim/mypage")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired MypageService mypageService;
	@Autowired CommunityListService communityListService;
	@Autowired ChallengeInfoService chalinfosv;
	
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void MypageMain(Model model, HttpSession session) {
		
	    	int idx = (Integer)session.getAttribute("login_idx");
	    	
	    	int ingChalNum = mypageService.countIngChal(idx);
	    	
	    	if(ingChalNum > 0) {
	    		Challenge ingChal = mypageService.viewChallenge(idx);
	    		Challenge rate = mypageService.viewRate(ingChal.getIdx());	
	    		
	    		// 당일 인증 판별
	    		//최근 인증 날짜
	     		Board citnew=chalinfosv.getNewCitation(ingChal.getIdx());
	     		
	     		Date writeDate= new Date();// 날짜 비교 서비스 매개변수
	     		
	     		int citDate=0;	// 인증값 (0=당일인증,  0> 미인증)	// 비교값= 최근 인증날짜
	     		int chalDate=0; // 도전시작값 (0<= 도전자, 0> 대기자) // 비교값= 도전 시작날짜
	     		
	     		// 도전자 or 대기자 판별
	     		//인증 정보가 있을때 =board가 null이 아닐때		//null이면 에러
	     		if (citnew!=null){
	     			//board 테이블에서 최근 인증 날짜 가져오기
	     			writeDate=citnew.getWritten_date();
	     		
	     			// 날짜 비교 서비스 - 현재날짜와 최근 인증 날짜 비교
	     			citDate=chalinfosv.dateColculation(writeDate);

	     			//당일 인증자 or 미인증자 판별
	     			if(citDate==0) {		//당일 인증자
	     				// 도전자- 당일인증자 (인증 페이지 접근x)
	     				model.addAttribute("setcit", "stop");
	     			} else if(citDate>0) {	//당일 미인증자
	     				// 도전자-미인증자,최초인증자 (인증 페이지 접근ok)
	     				model.addAttribute("setcit", "do");
	     			}
	     		} else {		// 도전대기자 or 최초 인증자
	     			// 날짜 비교 - 현재 날짜와 도전 시작일 비교 ( 0> : 대기자, 0=< 최초인증자)
	     			chalDate=chalinfosv.dateColculation(ingChal.getStartDate());
	     			
	     			if(chalDate>=0) {
	     				// 도전 대기자 (인증 페이지 접근x)
	     				model.addAttribute("setcit", "do");
	     				
	     			}else{
	     				// 도전자-미인증자,최초인증자 (인증 페이지 접근ok)
	     				model.addAttribute("setcit", "do");
	     			}
	     		}
	    		
	    		model.addAttribute("ingChal", ingChal);
		        model.addAttribute("rate", rate);
	    	} else {
	    		model.addAttribute("ingChal", null);
		        model.addAttribute("rate", null);
	    	}
	    	PStatistics chal = mypageService.viewChalChart(idx);
	    	List<QnA> qnaList = mypageService.viewQnaList(idx);
	    	List<Board> boardList = mypageService.viewBoard(idx);
	    	List<CommunityGroup> groupList = mypageService.viewGroup(idx);
	    	List<GroupKeyword> keywordList = communityListService.keywordList();
	    	List<Challenge> endChalList = mypageService.viewEndChalList(idx);
	    	
	        
	        model.addAttribute("chal", chal);
	        model.addAttribute("qnaList", qnaList);
	        model.addAttribute("boardList", boardList);
	        model.addAttribute("groupList", groupList);
	        model.addAttribute("keywordList", keywordList);
	        model.addAttribute("endChalList", endChalList);

	}

	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void MypageUpdate (Model model, HttpSession session) {
		
		int idx = (Integer)session.getAttribute("login_idx");
    	ZakSimMember member = mypageService.memberInfo(idx);
    	
    	model.addAttribute("member", member);
	}
	
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String MypageUpdateProcess(HttpSession session, ZakSimMember member, String Cemail) {
		
//		System.out.println(member);
//		System.out.println("Cemail : " + Cemail);

		member.setIdx((Integer)session.getAttribute("login_idx"));
		
		if(Cemail != null && !Cemail.equals("")) {
			member.setEmail(Cemail);
			mypageService.updateMember(member);
		} else {
			mypageService.updateMember(member);
		}

		session.setAttribute("login_nick", member.getNick());
		
		return "redirect:/zaksim/mypage/main";
	}
	
	
	@RequestMapping(value="/pastChallenge", method=RequestMethod.GET)
	public void MypageGroups(Model model, int endChalIdx, HttpSession session) {
		
		Challenge endChal = mypageService.viewEndChallengeInfo(endChalIdx);
		List<Board> boardList = mypageService.viewMyPastChalBoard(endChalIdx);
		
		model.addAttribute("endChal", endChal);
		model.addAttribute("boardList", boardList);
		
	}
	
	
	@RequestMapping(value="/challenge", method=RequestMethod.GET)
	public void MypageChallenge(Model model, HttpSession session) {
		
		List<Board> boardList = mypageService.viewMyBoard((Integer)session.getAttribute("login_idx"));
		
		model.addAttribute("boardList", boardList);
		
	}
	

	@RequestMapping(value="/delete", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Boolean> MypageDelete(HttpSession session) {
		
		HashMap<String, Boolean> map = new HashMap<>();
		
		mypageService.changeGroupMember((Integer)session.getAttribute("login_idx"));
		mypageService.deleteMember((Integer)session.getAttribute("login_idx"));
		
		if((Boolean)session.getAttribute("adminLogin") != null && (Boolean)session.getAttribute("adminLogin")) {
			session.invalidate();
			session.setAttribute("adminLogin", true);
		} else {
			session.invalidate();
		}
		
		map.put("result", true);
		
		return map;
	}
	
	
	@RequestMapping(value="/checkPw", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Boolean> checkPw(HttpSession session,String password) {
		
		HashMap<String, Boolean> map = new HashMap<>();
		
		ZakSimMember member = new ZakSimMember();
		member.setIdx((Integer)session.getAttribute("login_idx"));
		member.setPassword(password);
		
		if(mypageService.checkPw(member)) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		
		return map;
	}
	
}
