package zaksim.mypage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zaksim.dto.Board;
import zaksim.dto.Challenge;
import zaksim.dto.CommunityGroup;
import zaksim.dto.PStatistics;
import zaksim.dto.QnA;
import zaksim.dto.ZakSimMember;
import zaksim.mypage.service.MypageService;


@Controller
@RequestMapping(value="/zaksim/mypage")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired MypageService mypageService;
	
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String MypageMain(Model model, HttpSession session) {
		
		if((boolean)session.getAttribute("login") == false) {
			
	        return "redirect:/zaksim/login/login";
		}
	    else{
	    	int idx = (Integer)session.getAttribute("login_idx");
	    	ZakSimMember member = mypageService.memberInfo(idx);
	    	Challenge ingChal = mypageService.viewChallenge(idx);
	    	Challenge rate = mypageService.viewRate(ingChal.getIdx());
	    	PStatistics chal = mypageService.viewChalChart(idx);
	    	List<QnA> qnaList = mypageService.viewQnaList(idx);
	    	List<Board> boardList = mypageService.viewBoard(idx);
	    	List<CommunityGroup> groupList = mypageService.viewGroup(idx);
	    	
	        model.addAttribute("member", member);
	        model.addAttribute("ingChal", ingChal);
	        model.addAttribute("rate", rate);
	        model.addAttribute("chal", chal);
	        model.addAttribute("qnaList", qnaList);
	        model.addAttribute("boardList", boardList);
	        model.addAttribute("groupList", groupList);
	        
	        return "/zaksim/mypage/main";
	    }
	}

	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String MypageUpdate (Model model, HttpSession session) {
	    
		if((boolean)session.getAttribute("login") == false) {
			
	        return "redirect:/zaksim/main/home";
		}
	    else {
	        
	        return "/zaksim/mypage/update";
	    }

	}
	
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String MypageUpdateProcess(@RequestParam HashMap<String, Object> params) {
		logger.info((String)params.get("ID"));
		
		mypageService.updateMember(params); 

		return "redirect:/zaksim/mypage/main";
	}
	
	
	@RequestMapping(value="/groups", method=RequestMethod.GET)
	public void MypageGroups() {
		
	}
	
	
	@RequestMapping(value="/challenge", method=RequestMethod.GET)
	public void MypageChallenge() {
		
		
	}
	

	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String MypageDelete(String password, HttpServletRequest request) {
		logger.info(request.getParameter("passwordck"));
		
		password = request.getParameter("passwordck");
		
		mypageService.deleteMember(password);
		
		return "redirect:/zaksim/main/home";
	}
	
	
	@RequestMapping(value="/sign", method=RequestMethod.POST)
	public String MypageSign() {
				
		String result;
		
		result ="";
		
		return result;
	}
	
}
