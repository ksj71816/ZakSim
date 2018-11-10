package zaksim.mypage.controller;

import java.util.HashMap;

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
import org.springframework.web.servlet.ModelAndView;

import zaksim.dto.ZakSimMember;
import zaksim.mypage.controller.MypageController;
import zaksim.mypage.service.MypageService;


@Controller
@RequestMapping(value="/zaksim/mypage")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired MypageService mypageService;
	
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void MypageMain() {
		
	}

	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String MypageUpdate (Model model, HttpSession session) {
		logger.info((String) session.getAttribute("login_id"));
		
		String id = (String) session.getAttribute("login_id");
	        
		if(id == null) {
	        return "redirect:/zaksim/main/home";
		}
	    else{
	        model.addAllAttributes(mypageService.memberInfo(id));
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
