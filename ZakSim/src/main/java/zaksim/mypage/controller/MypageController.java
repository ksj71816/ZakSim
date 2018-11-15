package zaksim.mypage.controller;

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
	
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void MypageMain(Model model, HttpSession session) {
		
	    	int idx = (Integer)session.getAttribute("login_idx");
	    	Challenge ingChal = mypageService.viewChallenge(idx);
	    	Challenge rate = mypageService.viewRate(ingChal.getIdx());
	    	PStatistics chal = mypageService.viewChalChart(idx);
	    	List<QnA> qnaList = mypageService.viewQnaList(idx);
	    	List<Board> boardList = mypageService.viewBoard(idx);
	    	List<CommunityGroup> groupList = mypageService.viewGroup(idx);
	    	List<GroupKeyword> keywordList = communityListService.keywordList();
	    	List<Challenge> endChalList = mypageService.viewEndChalList(idx);
	    	
	        model.addAttribute("ingChal", ingChal);
	        model.addAttribute("rate", rate);
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
	
	
	@RequestMapping(value="/groups", method=RequestMethod.GET)
	public void MypageGroups() {
		
	}
	
	
	@RequestMapping(value="/challenge", method=RequestMethod.GET)
	public void MypageChallenge() {
		
		
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
